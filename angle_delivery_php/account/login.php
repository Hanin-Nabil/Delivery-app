<?php
include "../connect.php";
$email =filterRequest("email");
$password =sha1($_POST["password"]);
//$password =filterRequest(sha1("password"))
//$password =sha1("password");

getData("users", "user_password =? AND user_email = ? ",array($password,$email),true);
//echo json_ecode(array( "data" => $data))
 ?>