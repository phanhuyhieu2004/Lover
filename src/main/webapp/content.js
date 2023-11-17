var select = document.querySelector('#gender');
select.addEventListener('change', function (e) {
    if (select.options.selectedIndex !== 0) {
        select.classList.add("bg-red");
    } else {
        select.classList.remove("bg-red");
    }
});

var cate = document.querySelector('#category');
cate.addEventListener('change', function (e) {
    if (cate.options.selectedIndex !== 0) {
        cate.classList.add("bg-red");
    } else {
        cate.classList.remove("bg-red");
    }
});

var view = document.querySelector('#view');
view.addEventListener('change', function (e) {
    if (view.options.selectedIndex !== 0) {
        view.classList.add("bg-red");
    } else {
        view.classList.remove("bg-red");
    }
});

var price = document.querySelector('#price');
price.addEventListener('change', function (e) {
    if (price.options.selectedIndex !== 0) {
        price.classList.add("bg-red");
    } else {
        price.classList.remove("bg-red");
    }
});
var live = document.querySelector('#live');
price.addEventListener('change', function (e) {
    if (price.options.selectedIndex !== 0) {
        price.classList.add("bg-red");
    } else {
        price.classList.remove("bg-red");
    }
});

function search() {
    // Code to handle search functionality
}