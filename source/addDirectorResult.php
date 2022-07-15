<!DOCTYPE html>
<html>
  <head>
    <title>Add data to Database</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://code.jquery.com/jquery-2.0.3.min.js" defer></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js" defer></script>
  </head>
  <body>
    <nav class="navbar navbar-default" role="navigation">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="adddataindex.php">Exit</a>
      </div>

     
    </nav>

    <main class="container">

    <?php
      require "query-engine.php";
      require "add-engine.php";

      //creating the query
     //$Query = query($_POST["return-type"], $_POST["param-type"], $_POST["param-value"]);
      //$Query = "SELECT * FROM person WHERE first_name = '" . $_POST["param-value"] . "';" ;
      $Query = "INSERT INTO Person (Gender, First_Name, Last_Name, Middle_Name, DOB) VALUES ('".$_POST["gender"]."','".$_POST["fname"]."','".$_POST["lname"]."',null,'".$_POST["bdate"]."');";
      $SubQuery = "INSERT INTO Director (Person_Id, Direction_Type, StartDate) VALUES ( (SELECT Person_Id FROM Person WHERE 
Gender = '".$_POST["gender"]."' AND
First_Name = '".$_POST["fname"]."' AND
Last_Name = '".$_POST["lname"]."' AND
DOB = '".$_POST["bdate"]."'),'".$_POST["drt"]."',".$_POST["sncyr"].");";
	$Result_Type="adddire";
       display_query($Query, $SubQuery,$Result_Type);
    ?> 

    </main>
   
  </body>
</html>


