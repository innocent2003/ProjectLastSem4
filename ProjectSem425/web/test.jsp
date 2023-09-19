$(document).ready(function () {
    $('.product-thumb-imgs').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '.product-main-img',
        dots: false,
        focusOnSelect: true
    });

    $('.product-main-img').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.product-thumb-imgs'
    });

    $('.thumb-img').click(function () {
        var selectedImageSrc = $(this).find('img').attr('src');
        $('#selected-image').attr('src', selectedImageSrc);
    });
});
const productThumbs = document.querySelectorAll('.product-thumb');
let selectedThumbIndex = 0;
let isSlideRunning = false;

productThumbs.forEach((thumb, index) => {
    thumb.addEventListener('click', () => {
        productThumbs.forEach((thumb) => {
            thumb.classList.remove('selected');
        });
        thumb.classList.add('selected');
        selectedThumbIndex = index;
    });
});