<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/10/2023
  Time: 8:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <link rel="stylesheet" href="profile.css"/>

    <script src="https://kit.fontawesome.com/74cf7057a9.js" crossorigin="anonymous"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>



    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container" style="display: flex;
  padding-left: 140px;
  padding-top: 30px;
  background-color: white;">
    <div class="col-md-3" style="width: 230px; border-radius: 10px 10px 10px 10px; height: 340px; border-width: 1px; border: 1px solid; border-color: gainsboro;overflow: hidden ">

        <div class="imgPlayer" style="width: 228px; height: 200px;">
            <a href="/project?action=add&id=${list.getId()}"
               style="position: relative; display: inline-block;">
                <img src="laplace-m-vung-dat-gio-01-06-2021-0.png"
                     style="max-width: 100%; height: 200px;">
            </a>
        </div>
        <div class="activate">
            <div class="row-activate">
                <span>Active</span>
            </div>
            <div class="icon">
                <a href="https://www.facebook.com" target="_blank">
                    <i clas="fa-brands fa-facebook" style="color: #2a5eb2;"></i>
                </a>

            </div>
            <div class="datejoin">
                <span style="color: #898686">Join date: </span>
                <span>
                            <span>28/05/2023</span>
                        </span>
            </div>
        </div>

    </div>
    <div class="col-md-6" style="width: 600px;
         padding-left: 15px;
         padding-right: 15px;
         margin-left: 15px;
         margin-right: 15px;">
        <div class="row-name" style="height: 30px;  margin-bottom: 10px;">
            <span>h</span>

            <button style="float: right" id="followButton" onclick="toggleFollow()">
                <i class="fa-solid fa-heart" style="color: #ffffff;padding-right: 5px;"></i>
                Follow
            </button>
        </div>
        <div class="internal">
            <div class="row-informationperson" style="font-size: 14px; display: flex; gap: 30px" >
                <b>Number of followers</b>
                <b>Already in use</b>
                <b>Complete fees</b>
                <b>Status device</b>

            </div>
            <div class="showrow" style="padding-bottom: 10px; display: flex; gap: 30px;padding-left: 70px;">
                <div class="numberperson">4545</div>
                <div class="numberperson">345</div>
                <div class="numberperson">3766</div>
                <div class="numberperson">
                    <i class="fa-solid fa-microphone" style="color: #fe9595;margin-left: 10px;"></i>
                    <i class="fa-solid fa-camera"style="color: #fe9595;padding-left: 5px;"></i>
                </div></div>
        </div>
        <div class="name-game" style="padding-right: 10px; padding-left: 20px; display: grid; grid-template-columns: repeat(4, 1fr); grid-gap: 10px; padding-bottom: 100px;;">
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <!-- Add more buttons here -->
        </div>        <div class="content" style="padding-top: 10px">
        <div class="row-information">
            <b>Information</b>
        </div>
        <div class="person-img">
            <div class="img-person"
                 style="width: 150px;
  height: 100px;
  float: left; overflow: hidden;">
                <a href="/project?action=add&id=${list.getId()}">
                    <img src="laplace-m-vung-dat-gio-01-06-2021-0.png"style="max-width: 100%;height: 100px;">
                </a>
            </div>
        </div>
        <div class="profile-information">

        </div>

    </div>
    </div>
    <div class="col-md-3" style="height: 250px; background-color: white; width: 230px;border-radius: 10px ; border-width: 1px; border: 1px solid; border-color: gainsboro">
        <div class="row-pricePlayer">
            sd
        </div>
        <div class="evaluate-col3">
            <div class="starcmt" style="font-size: 14px; text-align: center">
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span style="font-size: 14px"> 175 Reviews</span>
            </div>

        </div>
        <div class="service-player">
            <div class="button-rent" style="padding-left: 5px">
                <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: pink; width: 220px; font-size: 15px; border-width: 1px">
                    <b>RENT</b></button>
            </div>
            <div class="button-donate" style="padding-left: 5px">
                <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: white; width: 220px; font-size: 15px; border-width: 1px">
                    <b>DONATE</b></button>
            </div>
            <div class="button-message" style="padding-left: 5px">
                <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: white; width: 220px; font-size: 15px; border-width: 1px">
                    <i class="fa-solid fa-message" style="color: #000000;"></i>
                    <b>CHAT</b>
                </button>
            </div>
        </div>
    </div>

</div>
<footer >
    <div class="footer">

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
<script>
    function toggleFollow() {
        var button = document.getElementById("followButton");
        if (button.classList.contains("cancel")) {
            button.classList.remove("cancel");
            button.innerHTML = `<i class="fa-solid fa-heart" style="color: #ffffff;"></i>Theo dõi`;
        } else {
            button.classList.add("cancel");
            button.innerHTML = "Hủy theo dõi";
        }
    }
</script>
</body>

</html>
