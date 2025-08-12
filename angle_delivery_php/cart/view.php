<?php

include "../connect.php";

$userid = filterRequest("usersid");

//$data  = getAllData("cartview", "cart_userid = $userid", null, false);
$dat=$con->prepare("SELECT * FROM cartview WHERE cart_userid =$userid");
$data2 = $dat->fetchAll(PDO::FETCH_ASSOC);
$count  = $dat->rowCount();
if($count>0){
    $order = '0';
    $stmt = $con->prepare("SELECT SUM(productprice) as totalprice , count(countproduct) as totalcount  FROM cartview  
    WHERE  cart_userid =  $userid AND cart_order = 0
    GROUP BY cart_userid  ");
    
    $stmt->execute();
    
    
    $datacountprice = $stmt->fetch(PDO::FETCH_ASSOC);
    
    echo json_encode(array(
        "status" => "success",
        "countprice" =>  $datacountprice,
        "datacart" => $data,
    ));
}
else{
    echo json_encode(array(
        "status" => "failure",));
}

