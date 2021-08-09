<?php
include('connection.php');
$name = $_POST['r_name'];
$age = $_POST['r_age'];

$gMale = $_POST['r_male'];
$gFemale = $_POST['r_female'];

$gender_value = "";

if($gMale == null){
    $gender_value = $gFemale;
} else $gender_value = $gMale;

$blood_type =$_POST['r_blood'];


$email_id= $_POST ['r_email'];
$contact_number= $_POST['r_phonenum'];
$ID= $_POST['r_ID'];
$HospitalID= $_POST['r_hospital'];

$PersonDonor=$_POST['r_DOrR1'];
$PersonPatient=$_POST['r_DOrR2'];
$DorB="";

if($PersonDonor == null){
  $DorB = $PersonPatient;
} else $DorB = $PersonDonor;


if ( $DorB== $_POST['r_DOrR1']){


$sql = 
"INSERT INTO [dbo].[Donor]
           ([name]
           ,[age]
           ,[gender], [donor_id] ,
            [blood_type],
            [contact_number] ,
            [email_id] ,
            [location_name],
            [area_name] ,
            [city] ,  
            [hospital_id])
     VALUES
           ('$name'
           ,$age
           ,'$gender_value',)"}
           else {
           $sql = 
"INSERT INTO [dbo].[patient]
           ([name]
           ,[age]
           ,[gender], [donor_id] ,
            [blood_type],
            [contact_number] ,
            [email_id] ,
            [location_name],
            [area_name] ,
            [city] ,  
            [hospital_id])
     VALUES
           ('$name'
           ,$age
           ,'$gender_value')"}
           ;

$result = sqlsrv_query($conn,$sql);



if($result){
    echo "Input Success.";
    
  }
  else{
    echo "ERROR".sqlsrv_errors();
  }




?>