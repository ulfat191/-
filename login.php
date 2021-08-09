
<?php
include('connection.php');

$ID= $_POST['r_ID'];
$password = $_POST['r_pass'];
$sql = 
"INSERT INTO [dbo].[Log_in] ([ID],[password]) values ('$ID','$password')";
$result = sqlsrv_query($conn,$sql);



if($result){
    echo "Input Success.";
    
  }
  else{
    echo "ERROR".sqlsrv_errors();
  }




?>