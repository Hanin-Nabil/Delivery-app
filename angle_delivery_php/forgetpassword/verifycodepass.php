<?php
//-------------------for forgetpassword---------------------//

include "../connect.php";
$email =filterRequest("email"); //الايميل الخاص فيبه

$verfiycode=filterRequest ("verfiycode");//الي كتبه المستحدم

// نعما المفارنه
$stmt =$con->prepare("SELECT * FROM users WHERE user_email  = '$email' AND user_verfiycode =' $verfiycode'") ;
 $stmt->execute();

 $count =$stmt ->rowCount();
  result($count);
?>