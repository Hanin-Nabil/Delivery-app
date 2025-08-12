<?php
include "../connect.php";
//include "../functions.php";
$userid =filterRequest("userid");
$productid =filterRequest("productid");


//insertData2("favorite",$data);
//echo  json_encode(array("status" => $data ));
//$count = getdata4("favorite","favorite_userid =$userid AND favorite_productid= $productid",null,true);
$stmt = $con->prepare("SELECT  * FROM favorite WHERE   favorite_userid =? AND favorite_productid= ? ");
$stmt->execute(array($userid,$productid));
$stmt->fetch(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();   
// $data =array(
    //     "cart_userid" =>$userid,
    //     "cart_productid"=>$productid,
    // );
    // insertData("cart",$data);
if($count > 0 ){
    printfailure("favorite already available  $count");
   
} else{
    $data2 =array("favorite_userid" => $userid,"favorite_productid"=> $productid );

    insertData2("favorite", $data2);
}


 ?>



