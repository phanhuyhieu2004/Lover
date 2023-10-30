<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/26/2023
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    .alert-warning{
        background-color: hotpink;
        margin:5px

    }.alert-success{
         background-color: greenyellow;
         margin:5px

     }
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">

    <div class="form-container register-container">
        <form  action="signup" method="post">
            <h1>Register </h1>
            <p class=" alert-warning" style="color: white" >${messWarning}</p>
            <p class=" alert-success"  >${messSuccess}</p>

            <div class="input-row">
                <input type="text" name="accountName" placeholder="Account Name" required>
                <input type="password" name="password"
                       placeholder="Password " required
                       pattern="^.{6,15}$"
                       title="Please need to be between 6 and 15 characters long.">


            </div>
            <input type="email" id="email-input" placeholder="Email@address.com" name="email" required/>
            <div class="input-row">
                <input type="tel" name="phoneNumber" placeholder="Phone Number" required>
                <input type="text" name="identifyCard" placeholder="Identify Card" required>
            </div>
            <div class="input-row">
                <input type="text" name="surname" placeholder="Surname" required>
                <input type="text" name="name" placeholder="Name" required>
            </div>
            <input type="text" name="nickName" placeholder="Nickname" required>
            <div class="role" >
                <label><input type="checkbox" name="role_service" value="2"> Service </label>
                <label><input type="checkbox" name="role_user" value="3"> User</label>
            </div>
            <button type="submit" value="Save">Register</button>
            <div class="signup-link">Already have an account? <a href="login">Login now</a></div>

        </form>

    </div>

    <!--    <div class="form-container login-container">-->
    <!--        <form class="form-signin" action="signin" method="post">-->

    <!--            <h1>Login hire.</h1>-->
    <!--            <div class="alert alert-warning" role="alert"></div>-->
    <!--            <form method="post" action="signin">-->
    <!--                <input name="account" type="text" placeholder="Account">-->
    <!--                <input name="pass" type="password" placeholder="Password">-->
    <!--                <div class="content">-->
    <!--                    <div class="checkbox">-->
    <!--                        <input type="checkbox" name="checkbox" id="checkbox">-->
    <!--                        <label>Remember me</label>-->
    <!--                    </div>-->
    <!--                    <div class="pass-link">-->
    <!--                        <a href="#">Forgot password?</a>-->
    <!--                    </div>-->
    <!--                </div>-->
    <!--                <button>Login</button>-->
    <!--            </form>-->

    <!--        </form>-->
    <!--    </div>-->


</div>
</body>
</html>
