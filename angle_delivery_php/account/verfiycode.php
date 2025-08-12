<?php 

include "../connect.php" ;

$email  = filterRequest("email") ; 

$verfiy = filterRequest("verifycode") ; 

$stmt = $con->prepare("SELECT * FROM users WHERE user_email =? AND user_verfiycode =? ") ; 
 
$stmt->execute(array($email,$verfiy)) ; 

$count = $stmt->rowCount() ; 

if ($count > 0) {
 
    $data = array("user_approve" => "1") ; 

    updateData("users" , $data , "user_email = '$email'");

}else {
    
 printFailure("verifycode not Correct") ; 

}
?>