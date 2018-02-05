<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<?php 
   //Connecting to Redis server on localhost 
   $redis = new Redis(); 
   $redis->connect('redis', 6379); 
   echo "Connection to server sucessfully"; 
   //check whether server is running or not 
   echo "Server is running: ".$redis->ping();
  	//set the data in redis string 
   $redis->set("tutorial-name", "Redis tutorial");
   // Get the stored data and print it 
   echo "Stored string in redis:: " .$redis->get("tutorial-name");
?>
</br>
<?php
   // connect to mongodb
	
   $m = new MongoDB\Driver\Manager("mongodb://mongo:27017");

   echo "Connection to database successfully";
   // select a database
   $db = $m->mydb;
	
   echo "Database mydb selected";
?>
</body>
</html>