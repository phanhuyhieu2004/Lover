
<%--  User: hieuh--%>
<%--  Date: 10/26/2023--%>
<%--  Time: 12:06 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
.alert-warning{
    background-color: hotpink;
    margin:5px

}
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">
    <div class="form-container login-container">
        <form class="form-signin" action="/login" method="post">

            <h1>Login
            </h1>
            <p class=" alert-warning" style="color: white" >${mess}</p>

            <form method="post" action="/login">
                <input name="account" type="text" placeholder="Account Name">
                <input name="pass" type="password" placeholder="Password">
                <div class="content">

                    <div class="signup-link">Not a member?  <a href="signup">Create Account</a></div>

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
    </div></div>

</body>
</html>
