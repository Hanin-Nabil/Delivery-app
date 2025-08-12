<?php
include "../connect.php";
$productid =filterRequest("id");
deleteData("favorite","favorite_id=$productid");
?>