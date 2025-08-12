<?php
include "connect.php";
// $catid=filterRequest("productid");
// $userid=filterRequest("userid");
$data=getAllData("productview",null,null,false );
echo json_encode(array("items"=>$data));
// $data=getAllData("productview1",null,false );
// echo json_encode(array("items"=>$data));

// $alldata['status']="sucsses";
// $product = getAllData("productview","product_discount !=0 ",null,false);
// $alldata['items']= $product;
// echo json_encode($alldata);

?>