<?php
include "../connect.php";
$search =filterRequest("search");

getAllData("productview1" ,"product-name LIKE '%$search%' OR product_name_ar LIKE '%$search%'");