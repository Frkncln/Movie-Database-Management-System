<?php
    
    require "query-engine.php";
    require "display-engine.php";
    session_start();
    $connect=mysqli_connect("localhost","root","cel78en","moviedbv4");
		
	// Check connection
	if ($connect -> connect_errno) {
	  echo "Failed to connect to MySQL: " . $connect -> connect_error;
	  exit();
	}
    $username = $_POST['username'];  
    $password = $_POST['password'];  
      
        //to prevent from mysqli injection  
        $username = stripcslashes($username);  
        $password = stripcslashes($password);  
        $username = mysqli_real_escape_string($connect, $username);  
        $password = mysqli_real_escape_string($connect, $password);  
      
        $sql = "select * from Users where User_Name = '$username' and Pswrd = '$password'";  
        $result = mysqli_query($connect, $sql);  
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);  
        $count = mysqli_num_rows($result);  
          
        if($count == 1){  

            //session_register("username");
            //$_SESSION['login_user'] = $myusername;
         
            header("location: loginpage.php");
            //echo "<h1><center> Login successful </center></h1>";  
        }  
        else{  
            echo "<h1> Login failed. Invalid username or password.</h1>";  
        }  
    ?>