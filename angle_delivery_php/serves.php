<?php
include "connect.php";
$data=getAllData("serves",null,null,false );
echo json_encode(array("serves"=>$data));

?>