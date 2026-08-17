const searchInput = document.querySelector('#search_input');
const noResults = document.querySelector('#no_results');

if (searchInput) {
    /* 'search' covers Enter and the native clear button, 'input' covers typing.
       Both re-filter from the current value, so an empty box shows everything. */
    searchInput.addEventListener('search', instantSearch);
    searchInput.addEventListener('input', instantSearch);
}

function instantSearch() {
    const searchTerm = searchInput.value.toLowerCase();
    const cards = document.querySelectorAll('.language_card');
    let matches = 0;

    cards.forEach(item => {
        const title = item.querySelector('.language').textContent.toLowerCase();
        const isMatch = title.includes(searchTerm);
        item.style.display = isMatch ? '' : 'none';
        if (isMatch) matches++;
    });

    if (noResults) noResults.hidden = matches > 0;
}