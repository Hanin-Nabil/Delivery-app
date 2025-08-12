<?php
include "../connect.php";
$userid =filterRequest("userid");
$productid =filterRequest("productid");
$stmt =$con->prepare("SELECT productview1.* , 1 as favorite, (product_price - (product_price * product_discount / 100 )) as productpricedisount FROM productview1 
INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=$userid
UNION ALL 
SELECT* , 0 as favorite, (product_price - (product_price * product_discount / 100 )) as productpricedisount FROM productview1
WHERE productview1.product_id NOT IN (SELECT productview1.product_id FROM productview1 INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=$userid ) ");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0){
    echo json_encode(array("status" => "success", "items" => $data));
} else {
    echo json_encode(array("status" => "failure not found"));
}


?>