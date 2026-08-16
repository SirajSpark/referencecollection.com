### ReferenceCollection.com

### About

Code-based references for various programming languages, frameworks and tools designed to simplify your coding experience by providing practical and focused guides that are constantly updated and refined. 
All of these references are available directly in the [reference directory](./references) or at https://referencecollection.com/

### How it started

Over the course of my university studies and professional career, I've developed a habit whenever I start learning a new programming language: I’d create a reference file with the same extension as the language. In this file, I documented everything from basic syntax to advanced features, keeping everything organized so I can easily refresh my knowledge whenever I need to.

I put together this repository and this [website](https://referencecollection.com/) to share these reference guides with others and keep adding new ones in a consistent, easy-to-access format, hoping they’ll be useful for developers looking to quickly grasp key concepts and streamline their learning process.

I’m also working on training AI to help build even better guides. The goal is to make these resources even more useful and accessible for developers of all levels.

### Building the site

The website is a static site built from `references.json` and the templates in `website/`, then published to GitHub Pages by [`.github/workflows/pages.yml`](.github/workflows/pages.yml) on every push to `main`.

```
npm install
npm run build    # renders _site/
npm run serve    # builds, then previews on http://localhost:8080
```

`build.mjs` expands the reference card grid in `index.html`, injects the `website/` partials into their `<section>` placeholders, syntax-highlights each reference with Shiki, and writes a page per reference to `_site/references/<name>.html` along with `sitemap.xml`.

To add a reference: drop the file in [`references/`](./references) and add an entry to `references.json`.

### Contributing

Contributions are encouraged to help make this repository a valuable resource for developers of all levels. Whether it's fixing a typo, adding new references, or suggesting improvements, all contributions are greatly appreciated.