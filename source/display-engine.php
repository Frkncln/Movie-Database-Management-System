<?php
function display_query($Query, $Result_Type) {
	$sqlcon=mysqli_connect("localhost","root","cel78en","moviedbv4");
		
	// Check connection
	if ($sqlcon -> connect_errno) {
	  echo "Failed to connect to MySQL: " . $sqlcon -> connect_error;
	  exit();
	}



	//display the query
	//echo "<div class='panel panel-default'><div class='panel-body'>" . $Query . "</div></div>";
	
	//query the database
	$result = mysqli_query($sqlcon, $Query);

	if($result)
	{
	echo "\n";
	} else{
	echo "Failed";
	}

	echo "<table class='table'>";
	
	switch($Result_Type) {
		case "year_search": ///year by  movies 
			echo "<tr><th>Title</th> <th>Release Date</th> <th>Language</th> <th>Certification</th><th>Location</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("Title","Year","Language","Certification","Location"), $row);
			}
			break;

		case "actor":
			echo "<tr><th>First Name</th> <th>Last Name</th> <th>Shows</th> <th>Certification</th> <th>Experience Year</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("First_Name","Last_Name","Title","Certification","Experience"), $row);
			}
			break;

		case "Dire":
			echo "<tr><th>First Name</th> <th>Last Name</th> <th>Shows</th> <th>Direction Type</th> <th>Experience Year</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("First_Name","Last_Name","Title","Direction_Type","Experience"), $row);
			}
			break;


		case "ycoll":  //budget result
			echo "<tr><th>Movie</th> <th>Release Date</th> <th>Budget</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("Title","Year","Budget"), $row);
			}
			break;

		case "movie": //movie's actor result
			echo "<tr><th>Movie Name</th>  <th>First Name</th> <th>Last Name</th>  <th>Certification</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("Title","First_Name","Last_Name","Certification"), $row);
			}
			break;	

		

		
		case "actordetails":
			echo "<tr><th>First Name</th> <th>Last Name</th> <th>Date Of Birth</th> <th>Start Date</th> <th>Gender</th> <th>Experience Year</th> </tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("First_Name","Last_Name","DOB","StartDate","Gender","Experience"), $row);
			}
			break;


		case "dirdetails":
			echo "<tr><th>First Name</th> <th>Last Name</th> <th>Date Of Birth</th><th>Direction Type</th> <th>Gender</th> <th>Experience</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("First_Name","Last_Name","DOB","Direction_Type","Gender","Experience"), $row);
			}
			break;

		case "movdetails": // movie view
			echo "<tr><th>Movie</th> <th>Rating</th> <th>Certification</th> <th>Language</th>  <th>Released Year</th><th>Duration(Minute)</th><th>Budget</th> <th>Duration(Hour)</th> <th>Popularity Score</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("Title","Rating","Certification","Language","Year","Duration","Budget","Hour","Popularity"), $row);
			}
			break;


		case "tvdetails":
			echo "<tr><th>TV Show</th> <th>Rating</th>  <th>Air Channel</th> <th>Language</th> <th>Start Date</th><th>Certification</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("Title","Rating","Air_Channel","Language","Start_date","Certification"), $row);
			}
			break;
		
		case "rvwdetails":
			echo "<tr><th>Show Title</th> <th>User_Name</th> <th>Review Date</th> <th>Review Description</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("Title","User_Name","Review_Date","Review_Description"), $row);
			}
			break;

		case "genre":
			echo "<tr><th>Show Title</th> <th>Genre</th> <th>Rating</th> <th>Certification</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("Title","Name","Rating","Certification"), $row);
			}
			break;

		case "persondet":
			echo "<tr><th>First Name</th> <th>Last Name</th> <th>Date of Birth</th> <th>Gender</th></tr>";
			while($row = mysqli_fetch_array($result)) {
			        display_row(array("First_Name","Last_Name","DOB","Gender"), $row);
			}
			break;

		default:
			break;
	}
	echo "</table>";

	mysqli_close($sqlcon);
}

function display_row($fields, $row) {
	echo "<tr>";
	foreach ($fields as $field) {
		echo "<td>" . $row[$field] . "</td>";
  	}
  	echo "</tr>";
}
?>



	
