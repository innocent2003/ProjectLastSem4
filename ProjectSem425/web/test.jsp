<!DOCTYPE html>
<html>
    <head>
        <title>Cart</title>
    </head>
    <body>
        <h1>Cart</h1>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="cartItems">
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5"></td>
                    <td id="totalPrice"></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>

        <script>
            var cart = JSON.parse(sessionStorage.getItem('cart')) || [];
            var cartItemsElement = document.getElementById('cartItems');
            var totalPriceElement = document.getElementById('totalPrice');

            function updateCart() {
                cartItemsElement.innerHTML = '';
                var totalAmount = 0;

                for (var i = 0; i < cart.length; i++) {
                    var product = cart[i];

                    var row = document.createElement('tr');

                    var productIdCell = document.createElement('td');
                    productIdCell.textContent = product.id;
                    row.appendChild(productIdCell);

                    var imageCell = document.createElement('td');
                    var imageElement = document.createElement('img');
                    imageElement.src = product.image;
                    imageElement.alt = product.name;
                    imageCell.appendChild(imageElement);
                    row.appendChild(imageCell);

                    var productNameCell = document.createElement('td');
                    productNameCell.textContent = product.name;
                    row.appendChild(productNameCell);

                    var priceCell = document.createElement('td');
                    priceCell.textContent = '$' + product.price;
                    row.appendChild(priceCell);

                    var quantityCell = document.createElement('td');

                    var quantityContainer = document.createElement('div');
                    quantityContainer.className = 'quantity-container';

                    var decreaseButton = document.createElement('button');
                    decreaseButton.textContent = '-';
                    decreaseButton.addEventListener('click', (function (index) {
                        return function () {
                            decreaseQuantity(index);
                        };
                    })(i));
                    quantityContainer.appendChild(decreaseButton);

                    var quantityValue = document.createElement('span');
                    quantityValue.textContent = product.quantity;
                    quantityContainer.appendChild(quantityValue);

                    var increaseButton = document.createElement('button');
                    increaseButton.textContent = '+';
                    increaseButton.addEventListener('click', (function (index) {
                        return function () {
                            increaseQuantity(index);
                        };
                    })(i));
                    quantityContainer.appendChild(increaseButton);

                    quantityCell.appendChild(quantityContainer);
                    row.appendChild(quantityCell);

                    var totalCell = document.createElement('td');
                    var totalPrice = product.price * product.quantity;
                    totalCell.textContent = '$' + totalPrice;
                    row.appendChild(totalCell);

                    var actionCell = document.createElement('td');
                    var deleteButton = document.createElement('button');
                    deleteButton.textContent = 'Delete';
                    deleteButton.addEventListener('click', (function (index) {
                        return function () {
                            removeFromCart(index);
                        };
                    })(i));
                    actionCell.appendChild(deleteButton);
                    row.appendChild(actionCell);

                    cartItemsElement.appendChild(row);

                    totalAmount += totalPrice;
                }

                totalPriceElement.textContent = '$' + totalAmount.toFixed(2);
            }

            function decreaseQuantity(index) {
                if (cart[index].quantity > 1) {
                    cart[index].quantity--;
                    sessionStorage.setItem('cart', JSON.stringify(cart));
                    updateCart();
                }
            }

            function increaseQuantity(index) {
                cart[index].quantity++;
                sessionStorage.setItem('cart', JSON.stringify(cart));
                updateCart();
            }

            function removeFromCart(index) {
                var product = cart[index];
                var totalPrice = product.price * product.quantity;

                cart.splice(index, 1);
                sessionStorage.setItem('cart', JSON.stringify(cart));

                updateCart();
            }

            updateCart();
        </script>
    </body>
</html>