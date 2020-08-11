<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Weather Forecasting Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
    body {font-family: Arial, Helvetica, sans-serif;
    background-image: url(hero-bg.jpg);
    background-repeat: no-repeat;
    background-position: center;
   background-attachment: fixed;
    background-size: cover;
  }
    
    /* Full-width input fields */
    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 15px;
      margin: 8px 0;
      
      
    }

    label{
      color: rgb(0, 0, 0);
    }
    
    
    /* Set a style for all buttons */
    button {
      position : relative;
      padding: 12px 12px;
      margin: 10px 0;
      left:80px;
      border: none;
      cursor: pointer;
      width:60%;
      
    }
    
    button:hover {
      opacity: 0.8;
    }
    
    /* Extra styles for the cancel button */
    .cancelbtn {
      width: auto;
      padding: 10px 18px;
      background-color: #f44336;
    }
    
    /* Center the image and position the close button */
    .imgcontainer {
      text-align: center;
      margin: 24px 0 12px 0;
      position: relative;
      top : 100px;
    }
    
    .container {
      padding: 12px;
      width: 400px;
     position :relative;
     top: 100px;
    }
   .heading h1{
     padding-top: 5vw;
     font-size: 5vw;
     text-align: center;
     color: rgba(0, 0, 0, 0.5);
     
   }
   .container1 {
      padding: 12px;
      width: 400px;
     position: relative;
     align : center;
     left : 500px;
    }
   .heading h1{
     padding-top: 5vw;
     font-size: 5vw;
     text-align: center;
     color: rgba(0, 0, 0, 0.5);
     
   }
    
   /*h1{
      font-size: 10rem;
      text-align: center;
      font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
      color: rgb(0, 0, 0);
      text-shadow: 2px 2px 5px rgb(255, 255, 255);
      
    }*/
    .thumbnail{
      background-color: rgba(0,0,0,0.9);
    }
   .nav{
    position: relative;
  overflow: hidden;

  text-align: center;

}
    .navbar{
    background-color: #000080;
}
    /* The Close Button (x) */
    .close {
      position: absolute;
      right: 25px;
      top: 0;
      color:rgb(255, 255, 255);
      font-size: 35px;
      font-weight: bold;
    }
    
    .close:hover,
    .close:focus {
      color: red;
      cursor: pointer;
    }
    span.psw {
      float: right;
      padding-top: 16px;
    }
    span.admin{
      float:left;
      padding-top: 16px;
      }
    img {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

    
    
    /* The Modal (background) */
    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      padding-top: 60px;
    }
    
  
    
    
    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
      span.psw {
         display: block;
         float: none;
      }
      
    </style>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="index.jsp"><b></b></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Weather Forecasting</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" onclick="document.getElementById('id02').style.display='block'" style="width:auto;"> Sign Up</a></li>	
    </ul>
    
  </div>
</nav>
  

<div id="id03">
  
  <form  action="Login" method="post"`>
    <div class="imgcontainer">
      
        <p><h3 style="position: relative; top: 10px;text-align: center;"><b>LOGIN</b></h3></p>
    </div>

    <div class="container">
      <label for="uname"><b>Username</b></label>
      <input type="text" placeholder="Enter Username" name="uname" required>
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>
      <button type="submit">Login</button><br>
	  <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label><br>
      
      <span class="psw"> <a href="forgot.jsp">Forgot password?</a></span>
    </div>
  </form>
</div>
<div  id="id02" class="modal" >
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content" action="UserServlet" method="post">
  
    <div class="container1">
      <h3 style="color: rgb(0, 0, 255);"><b>Sign Up</b></h3>
      <p style="color: rgb(, 0, 255);">Create an account</p>
      <hr>
      <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>

	  <label for="firstname"><b>First Name</b></label>
      <input type="text" placeholder="First Name" name="firstname" required>

	  <label for="lastname"><b>Last Name</b></label>
      <input type="text" placeholder="Enter Username" name="lastname" required>
		
      <label for="city"><b>City</b></label>
      <input type="text" placeholder="City" name="city" required>
      
      <label for="state"><b>State</b></label>
      <input type="text" placeholder="State" name="state" required>
   
      <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
      </label>

      <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

      <div class="clearfix">
        <button type="submit" class="signupbtn">Sign Up</button>
      </div>
    </div>
  </form>
</div>



</body>
</html>