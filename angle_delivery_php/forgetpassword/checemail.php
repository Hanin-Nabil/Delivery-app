<?php
include "../connect.php";
$email =filterRequest("email");
$verfiycode =rand(10000,99999);  

    $stmt = $con->prepare("SELECT * FROM users WHERE user_email = ?");
    $stmt->execute(array($email));
    $count =$stmt->rowCount();
    result($count);

 //getData("users", "user_email = ? AND user_password =? AND user_approve=1",array($email ,$password));


 //بصفحة ال check عند ادخال الايميل برسله بكود تحقق جديد 
 if ($count>0){
   $data = array("user_verfiycode"=>$verfiycode );

     updateData("users",$data , "user_email='$email'",false);
    //sendEmail($email , "Verify Code Ecommerce","Verify Code $verfiycode");

 }
 ?>