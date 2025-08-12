<?php
include "../connect.php";
// add.php

if (isset($_POST['userid']) && isset($_POST['itemsid'])) {
    $userId = $_POST['userid'];
    $itemId = $_POST['itemsid'];

    $data =array( "favorite_userid" => $userId,"favorite_productid"=> $itemId);

    json_encode(array("status" => $data ));
    // Check if the user_id and item_id are ready
    // Execute your logic here

    // If not ready, insert the user_id and item_id into the cart table
    // Perform the necessary database operations

    // Prepare and execute the query to check if the user_id and item_id already exist in the cart table
    $checkQuery = "SELECT * FROM cart WHERE cart_userid = $userId AND cart_productid = $itemId";
    $checkResult = $con->prepare($checkQuery);

    if ($checkResult->num_rows > 0) {
        // The user_id and item_id already exist in the cart table
        // Handle the case accordingly
        echo "User ID and Item ID already exist in the cart table.";
    } else {
        // The user_id and item_id do not exist in the cart table
        // Insert the user_id and item_id into the cart table
        $insertQuery = "INSERT INTO cart (cart_userid , cart_productid) VALUES ($userId, $itemId)";
        if ($conn->query($insertQuery) === TRUE) {
            // Insertion successful
            echo "User ID and Item ID inserted into the cart table.";
        } else {
            // Error occurred while inserting
            echo "Error: " . $insertQuery . "<br>" . $conn->error;
        }
    }

    // Close the database connection
    $conn->close();
} else {
    // Handle the case where user_id or item_id is missing
    echo "User ID or Item ID is missing.";
}
?>