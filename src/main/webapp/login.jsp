
<%--  User: hieuh--%>
<%--  Date: 10/26/2023--%>
<%--  Time: 12:06 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
    a:hover {
        color: pink;
    }
    .alert-warning{
        background-color: #ff0000;
        margin: 20px;
        border-radius: 5px;
        color: white;


    }
    .alert-success {
        background-color: forestgreen;
        margin: 5px;
        border-radius: 5px;
        color: white;
    }
    .socials a{
        text-decoration: none;
        color: hotpink;
        padding: 10px;
        border-radius: 50%;
        margin: 10px;
        transition: transform 0.2s ease; /* Thêm hiệu ứng dịch chuyển */

    }

    .container {
        background-color: #fff;
        border-radius: 25px;
        box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
        position: relative;
        overflow: hidden;

        width: 405px;
        max-width: 200%;
        min-height: 550px;
    }
    button {
        position: relative;
        border-radius: 20px;
        border: 1px solid hotpink;
        background-color: hotpink;
        color: #fff;
        font-size: 15px;
        font-weight: 700;
        margin: 10px;
        padding: 12px 80px;
        letter-spacing: 1px;
        text-transform: capitalize;
        transition: 0.3s ease-in-out;
        cursor: pointer;
    }
    .content input {
        accent-color: deeppink;
        width: 12px;
        height: 12px;
    }
    form .signup-link a:hover{
        text-decoration: underline;

    }
    a {
        color: #333;
        font-size: 15px;
        text-decoration: none;
        margin: 15px 0;
        transition: 0.3s ease-in-out;
    }
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">
    <div class="form-container login-container">
        <form class="form-signin" action="login" method="post"style="padding-left: 55px;">

            <h1>Login
            </h1>
            <p class=" alert-warning" style="color: white;width: 100%" >${mess}</p>
            <p  class=" alert-success">${messSuccess}</p>
            <form >
                <input name="account" type="text" placeholder="Account name">
                <input name="pass" type="password" placeholder="Password">
                <div class="content">

                    <div class="signup-link ">If you not a member ? <a href="register" style="color: deeppink" >Create account</a>
                    </div>

                </div>
                <button>Login</button>
                <span>or use your account</span>
                <div class="socials">
                    <a href="#" style="background-color: #4267B2;

  color: white;"><i class="fa fa-facebook"></i></a>
                    <a href="#" style="background-color: #1DA1F2;
  color: white;
  border: black;"><i class="fa fa-twitter"></i></a>
                    <a href="#" style="background-color: black;
  color: white;
 "><i class="fa fa-github"></i></a>

                </div>
            </form>


        </form>
    </div></div>

</body>

</html>