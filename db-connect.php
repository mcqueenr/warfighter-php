<?php

	$servername = "localhost";
	$username = "root";
	$password = "";
	$database = "dbo";
	$base_url = 'http://www.yetiprocessing.com';
	

	// Create connection
	//$conn = mysqli_connect($servername, $username, $password,$database);
	$conn = new mysqli($servername, $username, $password, $database);
	
	// Check connection
	if (!$conn)
	{
		die("Connection failed: " . mysqli_connect_error());
	}
?>