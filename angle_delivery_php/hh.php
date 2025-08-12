<?php
include "../connect.php";
$email = filterRequest('email');
$verifyCode = filterRequest('verifycode');

$stmt = $con->prepare("SELECT * FROM users WHERE user_email= ? and user_verfiycode =? ");
$stmt->execute(array($email, $verifyCode));
$count = $stmt->rowCount();
if ($count > 0) {
   // $queryData = $stmt->fetch(PDO::FETCH_ASSOC);
    $data = array("user_approve" => "1"
    );
    $is_updated = updateData("users", $data, "user_email='$email'", false);
     if ($is_updated > 0) {
        echo json_encode(array("status" => "success", "data" => $queryData, "message" => "verified success"));
     } else {
        echo json_encode(array("status" => "used_before", "message" => "this verified had been used before"));
    }
} else {
    jsonStatusMessage("fail", "the verification code is wrong");
}
