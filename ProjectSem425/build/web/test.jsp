<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
</head>
<body>
    <h1>Cart</h1>

    <div id="cart-items">
    </div>

    <script>
        var cart = JSON.parse(sessionStorage.getItem("cart")) || [];

        var cartItemsDiv = document.getElementById("cart-items");
        cart.forEach(function (product) {
            var productId = product.productId;
            var productName = product.productName;
            var productPrice = product.productPrice;
            var productImage = product.productImage;
            var productDiv = document.createElement("div");
            productDiv.innerHTML = "<img src='" + productImage + "' alt='Product Image'>" +
                "<h3>" + productName + "</h3>" +
                "<p>Price: " + productPrice + "</p>";
            cartItemsDiv.appendChild(productDiv);
        });
    </script>
</body>
</html>