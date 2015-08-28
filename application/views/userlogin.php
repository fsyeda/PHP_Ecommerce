<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script>
    $(document).ready(function(){
        $("button.registerbutton").click(function(){
            $('.register').toggle();
            event.stopPropagation();
        });
    });
  </script>
  <style type="text/css">
  body { 
   width:100%; 
   height:100%; 
   background:url('/assets/bg1.jpg') no-repeat;
  }
  .register {
    display: none;
  }
  .error{
    color: red;
  }
  .success{
    color: green;
  }
  .pullRight {
    max-width: 330px;
    margin: 0 auto;
    float:right;
  }

  </style>
</head>
<body>
  <div class ="container">
    <div class="row">
      <div class="col-lg-10">
        <div class="pullRight">
          <h1>Welcome! </h1>
          <form class="form-signin" action="/main/login_user" method="post">
            <h2 class="form-signin-heading">Please sign in</h2>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="" name="password">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me"> Remember me
              </label>
            </div>
            <input class="btn btn-primary btn-block" type="submit" value="Sign in">
          </form>
          <div class="error">
            <?php  
              if ($this->session->flashdata('login_errors')) {
                echo $this->session->flashdata('login_errors');
            } ?>
          </div>

          <button class="registerbutton btn btn-primary btn-info" style="width:100%">Register here</button>
            <div class="register">
              <h2>Register</h2>
              <form action="/main/register" method="post">
                <p>
                  <label>First Name:</label>
                  <input type="text" name="first_name">
                </p>
                <p>
                  <label>Last Name:</label>
                  <input type="text" name="last_name">
                </p>
                <p>
                  <label>Email: </label>
                  <input type="email" name="email">
                </p>
                <p>
                  <label>Password: </label>
                  <input type="password" name="password">
                </p>
                <p>
                  <label>Confirm Password:</label>
                  <input type="password" name="confirm_password">
                </p>
                <input type="submit" value="Register" class="btn btn-info"><br>
              </form>
            </div>
            <div class="error">
              <?php  
                if ($this->session->flashdata('registration_errors')) {
                  echo $this->session->flashdata('registration_errors');
                } ?>
            </div>  
            <div class="success">
              <?php  
                if ($this->session->flashdata('Successful')) {
                  echo $this->session->flashdata('Successful');
                }
              ?>
            </div>
            <form class="form-signin" action="/main/login_user" method="post" style="margin-top:40px">
            <label for="inputEmail" class="sr-only">Email address</label>
              <input name="email" value="guest@gmail.com" type="hidden" id="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
            <label for="inputPassword" class="sr-only">Password</label>
              <input id="inputPassword" value="password123" type="hidden" class="form-control" placeholder="Password" required="" name="password">
              <input class="btn btn-lg btn-success btn-block" type="submit" value="Guest Login"> 
          </form>
        </div>
      </div>
    </div>  
  </div>  
</body>
</html>