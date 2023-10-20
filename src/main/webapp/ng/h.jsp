<%--
  Created by IntelliJ IDEA.
  User: kaitp
  Date: 10/10/2023
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Double Slider Login / Registration Form</title>
  <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
  <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container" id="container">

  <div class="form-container register-container">
    <form action="">
      <h1>Register hire.</h1>
      <input type="text" placeholder="Name" name="name">
      <input type="email" placeholder="Email" name="email">
      <input type="password" placeholder="Password" password>
      <button type="submit">Register</button>
      <span>or use your account</span>
      <div class="social-container">
        <a href="#" class="social"><i class="lni lni-facebook-fill"></i></a>
        <a href="#" class="social"><i class="lni lni-google"></i></a>
        <a href="#" class="social"><i class="lni lni-linkedin-original"></i></a>
      </div>
    </form>
  </div>

  <div class="form-container login-container">
    <form action="#">
      <h1>Login hire.</h1>
      <form method="post" action="Login" name = "name">
      <input type="text" placeholder="User" name = "user">
      <input type="password" placeholder="Password" name = "password">
      <div class="content">
        <div class="checkbox">
          <input type="checkbox" name="checkbox" id="checkbox">
          <label>Remember me</label>
        </div>
        <div class="pass-link">
          <a href="#">Forgot password?</a>
        </div>
      </div>
      <button>Login</button>
      </form>
      <span>or use your account</span>
      <div class="social-container">
        <a href="#" class="social"><i class="lni lni-facebook-fill"></i></a>
        <a href="#" class="social"><i class="lni lni-google"></i></a>
        <a href="#" class="social"><i class="lni lni-linkedin-original"></i></a>
      </div>
    </form>
  </div>

  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1 class="title">Hello <br> friends</h1>
        <p>if Yout have an account, login here and have fun</p>
        <button class="ghost" id="login">Login
          <i class="lni lni-arrow-left login"></i>
        </button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1 class="title">Start yout <br> journy now</h1>
        <p>if you don't have an account yet, join us and start your journey.</p>
        <button class="ghost" id="register">Register
          <i class="lni lni-arrow-right register"></i>
        </button>
      </div>
    </div>
  </div>

</div>

<script src="script.js"></script>

</body>
</html>