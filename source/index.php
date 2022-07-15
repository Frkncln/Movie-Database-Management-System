


<html>




<head>
    <title>Login to Movie Management System</title>
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
  <body style="background-color:blue;">
    <nav  style="background-color:cyan;"class="navbar navbar-default" role="navigation">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div style="background-color:cyan;" class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a   class="navbar-brand" href="index.php">Refresh</a>
      </div>

      
    </nav>

    <main class="container">
      <h1>Login to Movie Management System</h1>

      <form role="form" action="authent.php" method="post">

        <div class="form-group">
          <label for="username">Username</label>
          <input name="username" type="text" class="form-control" id="username" placeholder="Enter User name">
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input name="password" type="integer" class="form-control" id="password" placeholder="Enter Password">
        </div>

        
	

        <input type="submit" class="btn btn-default">
      </form>
    </main>
   

 
    





  </body>

  
</html>
