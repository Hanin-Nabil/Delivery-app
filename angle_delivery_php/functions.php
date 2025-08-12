<?php

define("MB", 1048576);

function filterRequest($requestname)
{
  return htmlspecialchars(strip_tags($_POST[$requestname]));
}
//_____________________________________________________________//
function getAllData2($table, $where = null, $values = null)
{  
    global $con;
    $data = array();
    if ($where==null){
        $stmt = $con->prepare("SELECT  * FROM $table");

    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();

    if ($count > 0){
        echo json_encode(array("items" => $data));
    } else {
        echo json_encode(array("status" => "failure not found"));
    }
   // return $count;
   
}
//_____________________________________________________________//
function getAllData($table, $where = null, $values = null,$json =true)
{  
    global $con;
    $data = array();
    if ($where==null){
        $stmt = $con->prepare("SELECT  * FROM $table");

    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
   if($json==true){
    if ($count > 0){
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure not found"));
    }
    return $count;
   }else{
         if ($count>0){
        return  $data;
       // return array("status" => "success", "data" => $data)
         // echo json_encode(array("categories"=>$data));
       //echo json_encode("categories"=>$data)
       // json_encode(array("status" => "success", "data" => $data));
        }else{
            echo json_encode(array("status" => "failure not found"));
          // return  array("status" => "failure not found");
        }

   }
}
//_____________________________________________________________//
function getAllData4($table, $where = null, $values = null,$json =true)
{  
    global $con;
    $data = array();
    if ($where==null){
        $stmt = $con->prepare("SELECT  * FROM $table");

    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
   if($json==true){
    if ($count > 0){
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure not found"));
    }
    return $count;
   }else{
         if ($count>0){
        // return  $data;
        echo json_encode(array("categories"=>$data));
       //echo json_encode("categories"=>$data)
       //json_encode(array("status" => "success", "categories" => $data));
        }else{
            echo json_encode(array("status" => "failure not found"));

        }

   }
}
//---------------------------------------------------------
function getData4($table, $where = null, $values = null,$json =true)
 {  
    global $con;
    $data = array();
    if ($where==null){
        $stmt = $con->prepare("SELECT  * FROM $table");

    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if($json==true){
    if ($count > 0){
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure not found "));
      // return $count;
    }
   
}
return $count;
 }
//---------------------------------------------------------
function getData3($table, $where = null, $values = null,$json =true)
 {  
    global $con;
    $data = array();
    if ($where==null){
        $stmt = $con->prepare("SELECT  * FROM $table");

    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if($json==true){
    if ($count > 0){
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure not found "));
    }
   // return $count;
}else{
    if ($count>0){
       // return $data;
        echo json_ecode(array( "data" => $data));
       }else{
           echo json_encode(array("status" => "failure not found"));

       }


}
return $count;
 }
//---------------------------------------------------------
function getData($table, $where = null, $values = null,$json =true)
{  
    global $con;
    $data = array();
    if ($where==null){
        $stmt = $con->prepare("SELECT  * FROM $table");

    }else{
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
    }
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if($json==true){
    if ($count > 0){
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure not found "));
    }
    return $count;
}else{
    return $count;
    // if ($count>0){
    //     return $count;
    //    // return $data;
    //    }else{
    //        echo json_encode(array("status" => "failure not found"));

    //    }


}

}
function insertData3($table, $data, $json = true)
{
    global $con;
  
        foreach ($data as $field => $v)
            $ins[] = ':' . $field;
        $ins = implode(',', $ins);
        $fields = implode(',', array_keys($data));
        $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

        $stmt = $con->prepare($sql);
        foreach ($data as $f => $v) {
            $stmt->bindValue(':' . $f, $v);
        }
        $stmt->execute();
        $count = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" =>"success","data" => $data));
            } else {

                echo json_encode(array("status" => "failure", "message" => "fail insert"));
            }
        }
       // return $count;
   
}
function insertData2($table, $data, $json = true)
{
    global $con;
    try {
        foreach ($data as $field => $v)
            $ins[] = ':' . $field;
        $ins = implode(',', $ins);
        $fields = implode(',', array_keys($data));
        $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

        $stmt = $con->prepare($sql);
        foreach ($data as $f => $v) {
            $stmt->bindValue(':' . $f, $v);
        }
        $stmt->execute();
        $count = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" => "success", "message" => "done", "data" => $data));
            } else {

                echo json_encode(array("status" => "failure", "message" => "fail insert"));
            }
        }
       // return $count;
    } catch (PDOException $e) {
        echo json_encode(array("status" => "failureException", "message" => "$e"));
    }
}
function   jsonStatusMessage($status, $message = "none")
{
    echo     json_encode(array("status" => $status, "message" => $message));
}

//-------------------------------------------------------
function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    
    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        echo json_encode(array("status" => "success","data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }
  }
    return $count;
}
//---------------------------------------------------------

function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
    }
  // return $count;
}
//-----------------------------------------------------

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success","message" => "done"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    
    return $count;
}

function deleteData2($table, $where,$data=null, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute($data);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
   // return $count;
}
//----------------------------------------------------------------
function imageUpload($imageRequest)
{
  global $msgError;
  $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
  $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
  $imagesize  = $_FILES[$imageRequest]['size'];
  $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
  $strToArray = explode(".", $imagename);
  $ext        = end($strToArray);
  $ext        = strtolower($ext);

  if (!empty($imagename) && !in_array($ext, $allowExt)) {
    $msgError = "EXT";
  }
  if ($imagesize > 2 * MB) {
    $msgError = "size";
  }
  if (empty($msgError)) {
    move_uploaded_file($imagetmp,  "../upload/" . $imagename);
    return $imagename;
  } else {
    return "fail upload";
  }
}

//---------------------------------------------------------

function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

   
}

// --------------------------------------------------------------------
function printfailure($messag ="none"){
    echo json_encode(array("status"=>"failure","message "=>$messag));

}

function printsuccess($messag ="none"){
    echo json_encode(array("status"=>"success","message "=>$messag));

}

function result($count){
    if($count > 0) {
     printsuccess();
    }else{
    printfailure();
    }
}
//----------------------------------------------------------------------
function sendEmail ($to,$title,$body){
$header ="From : support@angledlivery.com" . "\n" ."cc: wealeagle1243@gmail.com" ;
     mail( $to,$title, $body, $header);

}
//----------------------------------------------------------------------
function sendGCM($title, $message, $topic, $pageid, $pagename)
{


    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key=' . "AAAAQl5V4d4:APA91bG3Mh6dwnzY_n4vHUBY0OV8GsML4eyzZNr_ykKQB-UsFoUr7GvVWFptIESyojCfSVsrXLptUJHgLWdWw9Caoc__vrDjzXZt91cYgl17Mvt0O_5fy3qYlr9XKjIiskVgWBTSvect",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}
//-------------------------------------------------------------------------