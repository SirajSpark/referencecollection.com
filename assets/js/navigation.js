const dark_mode = document.getElementById('dark_mode'),
    light_mode = document.getElementById('light_mode');

if (dark_mode != null)
    dark_mode.addEventListener('click', () => {
        localStorage.setItem("app-appearance", "dark");
        document.documentElement.setAttribute("app-appearance", "dark");
    });

if (light_mode != null)
    light_mode.addEventListener('click', () => {
        localStorage.setItem("app-appearance", "light");
        document.documentElement.setAttribute("app-appearance", "light");
    });

const scroll_top = document.getElementById('scroll_top');

if (scroll_top != null) {
    window.addEventListener('scroll', () => {
        scroll_top.style.display = window.scrollY <= 100 ? 'none' : 'flex';
    });

    scroll_top.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
}

const open_nav = document.getElementById('navigation_open'),
    close_nav = document.getElementById('navigation_close'),
    navigation_menu = document.getElementById('navigation_menu');

if (open_nav != null)
    open_nav.addEventListener('click', () => {
        navigation_menu.classList.add('show_nav');
    });

if (close_nav != null)
    close_nav.addEventListener('click', () => {
        navigation_menu.classList.remove('show_nav');
    });