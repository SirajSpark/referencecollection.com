/* Theme resolution lives in the inline <head> script, so it runs before paint. */

const contact = document.getElementById('contact'),
    contact_details = document.querySelector('.contact_details');

if (contact != undefined) {
    contact.addEventListener('click', () => {
        contact_details.classList.toggle('show_contact');
    });
}