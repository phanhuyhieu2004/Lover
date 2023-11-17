<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/24/2023
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Footer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <!-- Stylesheet -->

</head>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;

    }
    footer{
        padding: 20px;
        bottom: 0;
        background: pink;
        height: auto;
        width: 100vw;
        padding: 20px 0 0 0;
    }
    /*content*/
    .footer{
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        text-align: center;
    }
    .footer p{
        margin: 10px auto;
        line-height: 28px;
        font-size: 14px;
    }
    /*social -media*/
    .socials{
        list-style: none;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 1rem 0 3rem 0;
    }
    .socials li{
        margin: 0 10px;
    }
    .socials a{
        text-decoration: none;


        padding: 5px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px; /* Đặt kích thước icon */
        height: 40px;
        transition: transform 0.2s ease; /* Thêm hiệu ứng dịch chuyển */
    }
    .socials a i{
        font-size: 1.4rem; /* Đặt kích thước icon */
        width: 20px;
        transition: color .4s ease;
    }
    .socials a:hover{
        transform: translateY(-5px); /* Dịch chuyển khi hover */
    }
    .socials a:hover i{
        color: deeppink;
    }
</style>
<body>
<footer style="margin-top: 30px",>
    <div class="footer"style="height: 100px;padding-top: 20px;">

        <p>&copy; 2023 Lover. All rights reserved.</p>
        <ul class="socials">
            <li><a href="#" style="background-color: white;
  border: black;
  color: blue;"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#" style="background-color: dodgerblue;
  color: white;
  border: black;"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#" style="background-color: white;
  color: black;
  border: black;"><i class="fa fa-github"></i></a></li>
            <li><a href="#" style="background-color: dodgerblue;
  color: white;
  border: black;"><i class="fa fa-linkedin-square"></i></a></li>
            <li><a href="#" style="background-color: white;
  color: violet;
  border: black;"><i class="fa fa-instagram"></i></a></li>
        </ul>

    </div>
</footer>

</body>
</html>
