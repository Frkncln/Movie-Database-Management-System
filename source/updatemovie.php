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
      <h1>Update Movie's Release Year</h1>

      <form role="form" action="update_movieResult.php" method="post">

        <div class="form-group">
          <label for="mname">Movie Name</label>
          <input name="mname" type="text" class="form-control" id="mname" placeholder="Title">
        </div>


        <div class="form-group">
          <label for="ryear">New Release Year</label>
          <input name="ryear" type="integer" class="form-control" id="ryear" placeholder="New Release Year">
        </div>

        


        <input type="submit" class="btn btn-default">
      </form>
    </main>
   
  </body>
</html>