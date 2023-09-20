window.onload = function () {
    var cart = getCart();
    updateCartUI(cart);
};

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

function addToCart(event) {
    event.preventDefault();
    var form = event.target.closest("form");
    var productId = form.querySelector("#productId").value;
    var productName = form.querySelector("#productName").value;
    var productPrice = form.querySelector("#productPrice").value;
    var productImage = form.querySelector("#productImage").value;
    var productRam = form.querySelector("#productRam").value;
    var productStorage = form.querySelector("#productStorage").value;
    var productColor = form.querySelector("#productColor").value;
    var cart = JSON.parse(sessionStorage.getItem('cart')) || [];

    var productExists = false;
    for (var i = 0; i < cart.length; i++) {
        if (cart[i].id === productId) {
            cart[i].quantity += 1;
            productExists = true;
            break;
        }
    }
    if (!productExists) {
        cart.push({
            id: productId,
            name: productName,
            price: productPrice,
            image: productImage,
            ram: productRam,
            storage: productStorage,
            color: productColor,
            quantity: 1
        });
    }
    sessionStorage.setItem('cart', JSON.stringify(cart));

    updateCartUI(cart);

    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: productName + ' added to cart!',
        timer: 2000,
        timerProgressBar: true,
        showConfirmButton: true,
    });
}

function updateCartUI(cart) {
    var cartItemsContainer = document.getElementById('cartItems');
    var cartItemCountElement = document.getElementById('cartItemCount');
    var cartSelectedItems = document.getElementById('cartSelectedItems');
    var cartSubtotal = document.getElementById('cartSubtotal');

    var cartItemCount = 0;
    var selectedItemsCount = 0;
    var subtotal = 0;

    // Clear the cart items container
    while (cartItemsContainer.firstChild) {
        cartItemsContainer.removeChild(cartItemsContainer.firstChild);
    }

    // Iterate over each item in the cart
    for (var i = 0; i < cart.length; i++) {
        var item = cart[i];

        // Create the product widget
        var productWidget = document.createElement('div');
        productWidget.className = 'product-widget';

        // Create the product image element
        var productImageDiv = document.createElement('div');
        productImageDiv.className = 'product-img';
        var productImage = document.createElement('img');
        productImage.src = item.image;
        productImageDiv.appendChild(productImage);

        // Create the product body element
        var productBodyDiv = document.createElement('div');
        productBodyDiv.className = 'product-body';
        var productName = document.createElement('h3');
        productName.className = 'product-name';
        var productNameLink = document.createElement('a');
        productNameLink.href = 'product.jsp?id=' + item.id;
        productNameLink.textContent = item.name;
        productName.appendChild(productNameLink);
        var productInfor = document.createElement('h6');
        productInfor.textContent = item.ram + "/" + item.storage + " - " + item.color;
        var productPrice = document.createElement('h4');
        productPrice.className = 'product-price';
        var productQty = document.createElement('span');
        productQty.className = 'qty';
        productQty.textContent = item.quantity + 'x';
        var productPriceValue = document.createElement('span');
        productPriceValue.textContent = '$' + item.price;
        productPrice.appendChild(productQty);
        productPrice.appendChild(productPriceValue);

        // Create the delete button
        var deleteButton = document.createElement('button');
        deleteButton.className = 'delete';
        var deleteIcon = document.createElement('i');
        deleteIcon.className = 'fa fa-close';
        deleteButton.appendChild(deleteIcon);
        deleteButton.addEventListener('click', createDeleteHandler(item));

        // Append elements to the product widget
        productWidget.appendChild(productImageDiv);
        productWidget.appendChild(productBodyDiv);
        productBodyDiv.appendChild(productName);
        productBodyDiv.appendChild(productInfor);
        productBodyDiv.appendChild(productPrice);
        productWidget.appendChild(deleteButton);

        // Append the product widget to the cart items container
        cartItemsContainer.appendChild(productWidget);

        // Update item count and subtotal
        cartItemCount += item.quantity;
        selectedItemsCount++;
        subtotal += item.quantity * item.price;
    }

    // Update the UI with the updated values
    cartItemCountElement.textContent = cartItemCount;
    cartSelectedItems.textContent = selectedItemsCount + ' Item(s) selected';
    cartSubtotal.textContent = 'SUBTOTAL: $' + subtotal;
}

function createDeleteHandler(item) {
    return function () {
        Swal.fire({
            title: 'Delete',
            text: 'Are you sure?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
        }).then((result) => {
            if (result.isConfirmed) {
                removeFromCart(item);
                updateCartUI(getCart());
                Swal.fire({
                    title: 'Item cleared',
                    text: 'Your item has been cleared.',
                    icon: 'success',
                    timer: 2000,
                    timerProgressBar: true,
                    showConfirmButton: true,
                });
            }
        });
    };
}

function createDeleteHandler1(item) {
    return function () {
        Swal.fire({
            title: 'Delete',
            text: 'Are you sure?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
        }).then((result) => {
            if (result.isConfirmed) {
                removeFromCart1(item);
                updateCartUI(getCart());
                Swal.fire({
                    title: 'Item cleared',
                    text: 'Your item has been cleared.',
                    icon: 'success',
                    timer: 2000,
                    timerProgressBar: true,
                    showConfirmButton: true,
                });
            }
        });
    };
}

function removeFromCart(item) {
    var cart = getCart();
    var index = -1;

    // Find the index of the item in the cart
    for (var i = 0; i < cart.length; i++) {
        if (cart[i].id === item.id) {
            index = i;
            break;
        }
    }

    // Remove the item from the cart if found
    if (index !== -1) {
        cart.splice(index, 1);
        sessionStorage.setItem('cart', JSON.stringify(cart));
    }
}

function removeFromCart1(index) {
    cart.splice(index, 1);
    sessionStorage.setItem('cart', JSON.stringify(cart));
    updateCart();
    updateCartUI(getCart())
}

function getCart() {
    return JSON.parse(sessionStorage.getItem('cart')) || [];
}
var cart = JSON.parse(sessionStorage.getItem('cart')) || [];
var cartItemsElement = document.getElementById('cartItems1');
var totalPriceElement = document.getElementById('totalPrice1');

function updateCart() {
    cartItemsElement.innerHTML = '';
    var totalAmount = 0;

    for (var i = 0; i < cart.length; i++) {
        var product = cart[i];

        var row = document.createElement('tr');

        var imageCell = document.createElement('td');
        var imageElement = document.createElement('img');
        imageElement.src = product.image;
        imageElement.alt = product.name;
        imageElement.style.width = '50px';
        imageElement.style.height = '50px';
        imageCell.appendChild(imageElement);
        row.appendChild(imageCell);

        var productNameCell = document.createElement('td');
        productNameCell.className = 'product-name-cell';
        productNameCell.innerHTML = '<a href="product.jsp?id=' + product.id + '">' + product.name + '</a>';
        row.appendChild(productNameCell);

        var ramCell = document.createElement('td');
        ramCell.className = 'text-center';
        ramCell.textContent = product.ram;
        row.appendChild(ramCell);

        var storageCell = document.createElement('td');
        storageCell.className = 'text-center';
        storageCell.textContent = product.storage;
        row.appendChild(storageCell);

        var colorCell = document.createElement('td');
        colorCell.className = 'text-center';
        colorCell.textContent = product.color;
        row.appendChild(colorCell);

        var quantityCell = document.createElement('td');
        var quantityWrapper = document.createElement('div');
        quantityWrapper.className = 'quantity-wrapper';

        var decreaseButton = document.createElement('button');
        decreaseButton.textContent = '-';
        decreaseButton.addEventListener('click', createQuantityChangeHandler(i, -1));
        quantityWrapper.appendChild(decreaseButton);

        var quantityText = document.createElement('span');
        quantityText.textContent = product.quantity;
        quantityWrapper.appendChild(quantityText);

        var increaseButton = document.createElement('button');
        increaseButton.textContent = '+';
        increaseButton.addEventListener('click', createQuantityChangeHandler(i, 1));
        quantityWrapper.appendChild(increaseButton);

        quantityCell.appendChild(quantityWrapper);
        row.appendChild(quantityCell);

        var priceCell = document.createElement('td');
        priceCell.className = 'text-center';
        priceCell.textContent = '$' + product.price;
        row.appendChild(priceCell);

        var actionCell = document.createElement('td');
        actionCell.className = 'text-right';
        var deleteButton = document.createElement('button');
        deleteButton.textContent = 'Delete';
        deleteButton.addEventListener('click', createDeleteHandler(i));
        deleteButton.addEventListener('click', createDeleteHandler1(i));
        actionCell.appendChild(deleteButton);
        row.appendChild(actionCell);

        cartItemsElement.appendChild(row);

        totalAmount += product.price * product.quantity;
    }

    totalPriceElement.textContent = '$' + totalAmount.toFixed(2);
    if (cart.length > 0) {
        var clearBtnElement = document.getElementById('clearBtn');
        var clearCartButton = document.createElement('button');
        clearCartButton.textContent = 'Clear Cart';
        clearCartButton.id = 'clearCartButton';
        clearCartButton.classList.add('right-align');
        clearCartButton.addEventListener('click', createClearHandler());
        clearBtnElement.appendChild(clearCartButton);
    }
}

function createClearHandler() {
    return function () {
        Swal.fire({
            title: 'Delete',
            text: 'Are you sure you want to clear the cart?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
        }).then((result) => {
            if (result.isConfirmed) {
                clearCart();
                updateCart();
                updateCartUI(getCart())
                var clearCartButton = document.getElementById('clearCartButton');
                var clearBtnElement = document.getElementById('clearBtn');
                clearBtnElement.removeChild(clearCartButton);
                Swal.fire({
                    title: 'Cart cleared',
                    text: 'Your cart has been cleared.',
                    icon: 'success',
                    timer: 2000,
                    timerProgressBar: true,
                    showConfirmButton: true,
                });
            }
        });
    };
}

function clearCart() {
    cart = [];
    sessionStorage.removeItem('cart');
}

function createQuantityChangeHandler(index, change) {
    return function () {
        changeProductQuantity(index, change);
    };
}

function changeProductQuantity(index, change) {
    var product = cart[index];
    product.quantity += change;
    if (product.quantity < 1) {
        product.quantity = 1;
    }
    sessionStorage.setItem('cart', JSON.stringify(cart));
    updateCart();
    updateCartUI(getCart());
}

document.querySelector('#logoutLink').addEventListener('click', function () {
    cart = [];
    sessionStorage.removeItem('cart');
});

updateCart();
