<?php
include "../connect.php";
$username =filterRequest("username");
$password =sha1($_POST["password"]);
//$password =sha1("password");
$email =filterRequest("email");
$phone =filterRequest("phone");
$verfiycode =rand(10000,99999);  



$stmt = $con->prepare("SELECT * FROM `users` WHERE `user_email` = ? OR `user_phone` =? ");
$stmt->execute(array($email ,$phone));
$count =$stmt->rowCount();

if($count > 0 ){
    printfailure("Phone or Email already available  $count");
   
} else{

    $data = array(
        "user_name" =>$username,
        "user_password" =>$password,
        "user_email" =>$email,
        "user_phone" =>$phone,
        "user_verfiycode" =>$verfiycode,   //تخزبن

    );
   // sendEmail($email , "Verify Code Ecommerce","Verify Code $verfiycode");
    insertData2("users", $data);

    
}
?>

