<?php
include "../connect.php";
// include "../functions.php";
// $userid =$_POST["userid"];
// $productid =$_POST["itemsid"]
$userid =filterRequest("usersid");
$productid =filterRequest("itemsid");
$data =array("cart_userid" => $userid,"cart_productid"=> $productid);
//echo json_encode($data);

getData4("cart","cart_userid =$userid AND cart_productid= $productid AND cart_order = 0",null,false);
 insertData2("cart", $data);
//     // $data =array(
//     //     "cart_userid" =>$userid,
//     //     "cart_productid"=>$productid,
//     // );
//     // insertData("cart",$data);
// if($count > 0 ){
//     printfailure("Cart already available  $count");
   
// } else{

    
  
//     insertData2("cart", $data);
// }

// $stmt = $con->prepare("SELECT * FROM `cart` WHERE cart_userid =$userid  AND cart_productid= $productid ");
// $stmt->execute();
// $count =$stmt->rowCount();

// if($count > 0 ){
//     printfailure("Cart already available  $count");
   
// } else{

//     insertData2("cart", $data);
// }
?>
 