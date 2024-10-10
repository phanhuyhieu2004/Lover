<%--  User: hieuh--%>
<%--  Date: 10/26/2023--%>
<%--  Time: 12:06 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lover </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" type="image/png"
          href="https://cdn.alongwalk.info/vn/wp-content/uploads/2023/04/19040211/89-hinh-anh-hoa-cam-tu-cau-dep-nhieu-mau-sac-day-suc-song1681826531.jpg">
    <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="manifest" href="favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- embed fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Sen:wght@700&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="reset.css">

    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="login.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
    a:hover {
        color: pink;
    }
.btn-social{

    display: flex;
    justify-content: center;
    align-items: center;
    width: 32px;
    height: 32px;

}
    .alert-warning {
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

    .socials a {
        text-decoration: none;
        color: hotpink;
        padding: 10px;
        border-radius: 50%;
        margin: 10px;
        transition: transform 0.2s ease; /* Thêm hiệu ứng dịch chuyển */

    }


    .content input {
        accent-color: hotpink;
        width: 12px;
        height: 12px;
    }

    form .signup-link a:hover {
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
    <form class="form-signin" action="login" method="post">

        <h1>Login
        </h1>
        <p class=" alert-warning" style="color: white;width: 100%">${mess}</p>
        <p class=" alert-success">${messSuccess}</p>
        <form>
            <input name="account" type="text" placeholder="Account name">
            <input name="pass" type="password" placeholder="Password">
            <div class="content">

                <div class="signup-link ">If you not a member ? <a href="register" style="color: hotpink"
                                                                   class="register-link">Create account</a>
                </div>

            </div>
            <button class="btn btn-login">Login</button>
            <span>or use your account</span>
            <div class="socials">
                <a href="#" class="btn-social" style="background-color: #4267B2;

  color: white;"><i class="fa fa-facebook"></i></a>
                <a href="#" class="btn-social" style="background-color: #1DA1F2;
  color: white;
  border: black;"><i class="fa fa-twitter"></i></a>
                <a href="#" class="btn-social" style="background-color: black;
  color: white;
 "><i class="fa fa-github"></i></a>

            </div>
        </form>


    </form>
</div>

</body>

</html>