<?php
include "../connect.php";
$userid =filterRequest("usersid");
$productid =filterRequest("itemsid");
deleteData("cart","cart_id ='(SELECT * FROM cart WHERE cart_userid = $userid  AND cart_productid = $productid AND cart_order = 0 LIMIT 1 )'");
?>