/* Theme resolution lives in the inline <head> script, so it runs before paint. */

/* DROPDOWN */
function toggleDropdown() {
    const dropdown = document.getElementById("share");
    if (dropdown != null)
        dropdown.classList.toggle("show_dropdown");
}

window.onclick = function (event) {
    if (!event.target.matches('.header_share')) {
        const dropdown = document.getElementById("share");
        if (dropdown != null)
            if (dropdown.classList.contains('show_dropdown'))
                dropdown.classList.remove('show_dropdown');
    }
}

const contact = document.getElementById('contact'),
    contact_details = document.querySelector('.contact_details');

if (contact != undefined) {
    contact.addEventListener('click', () => {
        contact_details.classList.toggle('show_contact');
    });
}