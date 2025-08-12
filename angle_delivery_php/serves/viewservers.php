<?php
include "../connect.php";
getAllData("serves");

$serves_image = imageUpload("myfile");
$ser_id = @(int)$_POST['serves_id'];


if($serves_image !="fail upload"){
   // $stmt =$con->prepare("SELECT  serves_image FROM serves ");
    $stmt =$con->prepare("update serves set serves_image ='$serves_image' where serves_id = $ser_id ");
    $isok=$stmt->execute();



    if($isok){
        echo json_encode(array("status"=>"success"));
    }else{
        echo json_encode(array("status"=>"fail"));

    }
}else{
    echo json_encode(array("status"=>"fail"));

}

//imageUpload("fail")
?>