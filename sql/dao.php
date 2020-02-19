<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "beecommerce";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: <br/>" . $conn->connect_error);
} else {
  
}
?>
