/*
 * Static site build.
 *
 * Renders the templates that used to be assembled at request time by the
 * Node server into plain HTML, so the site can be hosted on GitHub Pages:
 *
 *   _site/index.html              references.json expanded into the card grid
 *   _site/references/<slug>.html  each reference, syntax highlighted with Shiki
 *   _site/sitemap.xml             generated from references.json
 *   _site/assets, robots.txt, CNAME
 */

import { cp, mkdir, readFile, rm, writeFile } from 'node:fs/promises';
import { createReadStream, existsSync, statSync } from 'node:fs';
import { createServer } from 'node:http';
import { dirname, extname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { codeToHtml } from 'shiki';

const root = dirname(fileURLToPath(import.meta.url));
const out = join(root, '_site');
const site = 'https://referencecollection.com';

const read = (...p) => readFile(join(root, ...p), 'utf8');
const escape = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');

/* Page names match the URLs the old server served, e.g. docker_reference.sh.html */
const page = (ref) => `${ref.filename}.html`;

/* The server injected these partials into the empty <section> placeholders. */
async function injectPartials(html) {
    const partials = {
        navigation: await read('website', 'navigation.html'),
        footer: await read('website', 'footer.html'),
    };
    return html.replace(
        /<section id="(navigation|footer)"([^>]*)><\/section>/g,
        (_, id, attrs) => `<section id="${id}"${attrs}>\n${partials[id]}\n</section>`
    );
}

/* Expand the <!-- start_loop --> card template once per reference. */
function renderIndex(html, references) {
    const [before, rest] = splitOnce(html, '<!-- start_loop -->');
    const [card, after] = splitOnce(rest, '<!-- end_loop -->');

    /* Function replacements, so a `$&` in a title is inserted literally
       rather than being read as a replacement pattern. */
    const cards = references.map((ref) =>
        card
            .replace('ref_link', () => `references/${page(ref)}`)
            .replace('ref_title', () => escape(ref.title))
            .replace('<!-- new_tag -->', () => (ref.new ? '<span class="new_tag">new</span>' : ''))
    );

    return before + cards.join('') + after;
}

function splitOnce(text, marker) {
    const at = text.indexOf(marker);
    if (at === -1) throw new Error(`missing marker ${marker}`);
    return [text.slice(0, at), text.slice(at + marker.length)];
}

async function renderReference(template, ref) {
    const source = await read('references', ref.filename);
    const code = await codeToHtml(source, {
        lang: ref.language,
        themes: { light: 'github-light', dark: 'github-dark' },
        // Emit --shiki-light / --shiki-dark custom properties instead of a
        // single baked-in color; main.css picks one via [app-appearance].
        defaultColor: false,
    });

    const { title, description, keywords } = ref.meta;
    const url = `${site}/references/${page(ref)}`;
    const meta = {
        'meta_title': `<title>${escape(title)}</title>`,
        'meta_keywords': `<meta name="keywords" content="${escape(keywords)}">`,
        'meta_description': `<meta name="description" content="${escape(description)}">`,
        'meta_itemprop:title': `<meta itemprop="name" content="${escape(title)}" />`,
        'meta_itemprop:description': `<meta itemprop="description" content="${escape(description)}" />`,
        'meta_twitter:title': `<meta name="twitter:title" content="${escape(title)}">`,
        'meta_twitter:description': `<meta name="twitter:description" content="${escape(description)}">`,
        'meta_canonical': `<link rel="canonical" href="${url}">`,
        'meta_og:title': `<meta property="og:title" content="${escape(title)}" />`,
        'meta_og:description': `<meta property="og:description" content="${escape(description)}" />`,
        'meta_og:url': `<meta property="og:url" content="${url}" />`,
        'header_title': escape(ref.title),
        'meta_source_code': code,
    };

    /* hasOwn, not `in`: `in` would match inherited names, so a stray
       <!-- constructor --> comment would inject Object.prototype internals. */
    return template.replace(/<!-- ([\w:]+) -->/g, (whole, key) =>
        Object.hasOwn(meta, key) ? meta[key] : whole
    );
}

function renderSitemap(references) {
    const urls = [`${site}/`, ...references.map((r) => `${site}/references/${page(r)}`)];
    return [
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">',
        ...urls.map((loc) => `    <url><loc>${loc}</loc></url>`),
        '</urlset>',
        '',
    ].join('\n');
}

async function build() {
    const references = JSON.parse(await read('references.json'));

    await rm(out, { recursive: true, force: true });
    await mkdir(join(out, 'references'), { recursive: true });

    const index = await injectPartials(renderIndex(await read('index.html'), references));
    await writeFile(join(out, 'index.html'), index);

    const template = await injectPartials(await read('website', 'template.html'));
    for (const ref of references) {
        await writeFile(join(out, 'references', page(ref)), await renderReference(template, ref));
    }

    await writeFile(join(out, 'sitemap.xml'), renderSitemap(references));
    await cp(join(root, 'assets'), join(out, 'assets'), { recursive: true });
    for (const file of ['robots.txt', 'CNAME']) {
        await cp(join(root, file), join(out, file));
    }

    console.log(`built ${references.length + 1} pages into _site/`);
}

/* `npm run serve` — preview locally the way Pages serves: /foo resolves to foo.html. */
function serve(port = 8080) {
    const types = {
        '.html': 'text/html; charset=utf-8', '.css': 'text/css', '.js': 'text/javascript',
        '.json': 'application/json', '.xml': 'application/xml', '.svg': 'image/svg+xml',
        '.woff2': 'font/woff2', '.png': 'image/png', '.ico': 'image/x-icon',
    };
    createServer((req, res) => {
        const path = decodeURIComponent(req.url.split('?')[0]);
        const candidate = [path, `${path}.html`, join(path, 'index.html')]
            .map((p) => resolve(out, `.${p}`))
            .find((p) => p.startsWith(out) && existsSync(p) && statSync(p).isFile());
        if (!candidate) {
            res.writeHead(404, { 'Content-Type': 'text/plain' });
            return res.end('Not found');
        }
        res.writeHead(200, { 'Content-Type': types[extname(candidate)] ?? 'application/octet-stream' });
        createReadStream(candidate).pipe(res);
    }).listen(port, () => console.log(`http://localhost:${port}`));
}

await build();
if (process.argv.includes('--serve')) serve();
