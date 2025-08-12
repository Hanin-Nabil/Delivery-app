<?php
include "../connect.php";
$categoriersid =filterRequest("id") ;
//getAllData("categoriersview","categoriers_id=$categoriersid");


$userid =filterRequest("userid");

$stmt =$con->prepare("SELECT productview1.* , 1 as favorite FROM productview1 
INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=$userid
WHERE categoriers_id=$categoriersid
UNION ALL 
SELECT* , 0 as favorite FROM productview1 WHERE
WHERE categoriers_id=$categoriersid
AND  product_id != (SELECT productview1.product_id FROM productview1 
INNER JOIN favorite ON favorite.favorite_productid = productview1.product_id AND favorite.favorite_userid=$userid )");



$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count  = $stmt->rowCount();
if ($count > 0){
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure not found"));
}


?>