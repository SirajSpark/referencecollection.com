const searchInput = document.querySelector('#search_input');

if (searchInput) {
    /* 'search' covers Enter and the native clear button, 'input' covers typing.
       Both re-filter from the current value, so an empty box shows everything. */
    searchInput.addEventListener('search', instantSearch);
    searchInput.addEventListener('input', instantSearch);
}

function instantSearch() {
    const searchTerm = searchInput.value.toLowerCase();
    const cards = document.querySelectorAll('.language_card');
    
    cards.forEach(item => {
        const title = item.querySelector('.language').textContent.toLowerCase();
        item.style.display = title.includes(searchTerm) ? '' : 'none';
    });
}