<!DOCTYPE html>
<html>
<head>
    <title>Trang View</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <h1>Trang View</h1>

    <script>

        var orderSuccess = sessionStorage.getItem('ordersuccess');
        if (orderSuccess) {

            swal({
                title: "Order success",
                icon: "success",
                button: "OK"
            }).then(function() {
                sessionStorage.removeItem('ordersuccess');
            });
        }
    </script>
</body>
</html>