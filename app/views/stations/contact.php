<?php
// database connection code
// $con = mysqli_connect('localhost', 'database_user', 'database_password','database');

$con = mysqli_connect('localhost', 'root', 'rootroot','valetbike_development');

// get the post records
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$email = $_POST['email'];
$userName = $_POST['userName'];
$password = $_POST['password'];

// database insert SQL code
//$sql = "INSERT INTO `tbl_contact` (`Id`, `fldName`, `fldEmail`, `fldPhone`, `fldMessage`) VALUES ('0', '$txtName', '$txtEmail', '$txtPhone', '$txtMessage')";
$sql = "INSERT INTO `users` (`Id`, `firstName`, `lastName`, `email`, `userName`, `password`) VALUES ('0', '$firstName', '$lastName', '$email', '$userName', `$password`)";

// insert in database 
$rs = mysqli_query($con, $sql);

if($rs)
{
	echo "User Records Inserted";
}

?>