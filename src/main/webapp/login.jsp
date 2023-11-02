<%--  User: hieuh--%>
<%--  Date: 10/26/2023--%>
<%--  Time: 12:06 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
    .alert-warning {
    color: red
        /*margin: 5px;*/
        /*border-radius: 5px;*/
    }
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">
    <div class="form-container login-container">
        <form class="form-signin" action="/login" method="post">

            <h1>Login</h1>
            <p class=" alert-warning"><b>${mess}</b></p>

            <form method="post" action="/login">
                <input name="account" type="text" placeholder="Username">
                <input name="pass" type="password" placeholder="Password">
                <div class="content">

                    <div class="signup-link">
                        If you not a member
                        <a href="register" style="font-size:medium ; color: #4bb6b7">Create Account</a>
                    </div>

                </div>
                <button>Login</button>
                <span>or use your account</span>
                <div class="socials">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-github"></i></a>

                </div>

            </form>


        </form>
    </div>
</div>

</body>
</html>