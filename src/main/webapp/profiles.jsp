<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/10/2023
  Time: 8:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Profiles</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <link rel="stylesheet" href="profile.css"/>


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>




</head>
<style>
    .imgPlayer{
        width: 228px;
        height: 200px;
        background-image: url('${profiles.avatar}');
        background-size: cover;
    }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container" style="display: flex;
  padding-left: 140px;
  padding-top: 30px;
  background-color: white;
margin-top: 30px;
  margin-bottom: 30px;">
    <div class="col-md-3" style="width: 230px; border-radius: 10px 10px 10px 10px; height: 340px; border-width: 1px; border: 1px solid; border-color: gainsboro;overflow: hidden ">

        <div class="imgPlayer" ">
            <a href="#"
               style="position: relative; display: inline-block;">
                <img src=""
                     style="max-width: 100%; height: 200px;">
            </a>
        </div>
        <div class="activate">
            <div class="row-activate">
                <span>Active</span>
            </div>
            <div class="icon">
                <a href="https://www.facebook.com" target="_blank">
                    <i class="fa-brands fa-facebook fa-beat" style="color: #2a5eb2;"></i>
                </a>

            </div>
            <div class="datejoin">
                <span style="color: #898686">Join date: </span>

                <span>${profiles.joinDate}</span>

            </div>
        </div>

    </div>
    <div class="col-md-6" style="width: 600px;
         padding-left: 15px;
         padding-right: 15px;
         margin-left: 15px;
         margin-right: 15px;">
        <div class="row-name" style="height: 30px;  margin-bottom: 10px;">
            <span>${profiles.fullName}</span>

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
                <a href="">
                    <img src="${profiles.portrait}"style="max-width: 100%;height: 100px;">
                </a>
            </div>
            <div class="img-person"
                 style="width: 150px;
  height: 100px;
  float: left; overflow: hidden;">
                <a href="">
                    <img src="${profiles.portrait}"style="max-width: 100%;height: 100px;">
                </a>
            </div>
            <div class="img-person"
                 style="width: 150px;
  height: 100px;
  float: left; overflow: hidden;">
                <a href="">
                    <img src="${profiles.portrait}"style="max-width: 100%;height: 100px;">
                </a>
            </div>
        </div>
        <div class="profile-information">
            <p>${profiles.interest}</p>
            <p>${profiles.describeYourself}</p>
            <p>${profiles.regulations}</p>
        </div>
        <div class="row-donate" style="font-size: 20px">
            <b>Top Donate</b>
            <div class="top-donate" style="height: 200px; background-color: #faedeb">
                <div class="row-donate" style="height: 60px; background-color: #cccccc">

                </div>
            </div>
        </div>
        <div class="row-evaluate" style="font-size: 20px">
            <b>Đánh giá</b>
        </div>
        <div class="evaluate">
            <div class="row-evaluate" style="height: 100px; background-color: #cccccc">

            </div>
        </div>
    </div>
    </div>


    <div class="col-md-3" style="height: 250px; background-color: white; width: 230px;border-radius: 10px ; border-width: 1px; border: 1px solid; border-color: gainsboro">
        <div class="row-pricePlayer">
            ${profiles.view}
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
<jsp:include page="footer.jsp"></jsp:include>

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
