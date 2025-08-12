<?php
include "../connect.php";
$userid =filterRequest("userid");
$productid =filterRequest("productid");
//deleteData2("favorite","favorite_userid=? AND favorite_productid=?",array($userid,$productid));
deleteData("favorite" , "favorite_userid = $userid AND favorite_productid = $productid") ; 
?>