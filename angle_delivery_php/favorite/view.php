<?php
include"../connect.php";

$id =filterRequest("id");


getAllData("myfavorite","favorite_userid = ? ", array($id));
//getAllData("myfavorite",null,null);

?>