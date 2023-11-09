<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/3/23
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Giao diện trang cá nhân</title>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <link rel="stylesheet" href="profileInterface.css"/>

    <script src="https://kit.fontawesome.com/74cf7057a9.js" crossorigin="anonymous"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <link rel="stylesheet" href="nav.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
    .navbar-logo {
        cursor: pointer;


        max-height: 100%;
        max-width: 100%;
    }
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        color: black;
    }
    /*content*/
    .footer{
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        text-align: center;
        background-color: pink;
        height: 70px;
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
        color: darkviolet;
        border: 1.1px solid darkviolet;
        padding: 5px;
        border-radius: 50%;
    }
    .socials a i{
        font-size: 1.1rem;
        width: 20px;
        transition: color .4s ease;
    }
    .socials a:hover i{
        color: red;
    }

</style>
<body>
<div class="header">
    <nav class="navbar">
        <a href="home">
            <img src="Lover.png" class="navbar-logo" alt="logo"/>
        </a>

        <div class="wrap">
            <div class="search">
                <input type="text" class="searchTerm" placeholder="What are you looking for?">
                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>

        <ul class="navbar-list">
            <li><a href="home">Home</a></li>
            <li><a href="#">Videos</a></li>
            <li><a href="#">Rank</a></li>
            <li><a href="#">Community</a></li>
            <li><a href="#">About</a></li>
        </ul>
        <div class="profile-dropdown">
            <div onclick="toggle()" class="profile-dropdown-btn">
                <div class="profile-img">
                    <i class="fa-solid fa-circle"></i>
                </div>


                <c:if test="${sessionScope.acc != null}">
        <span>
                ${sessionScope.acc.accountName}</span>
                </c:if>
            </div>

            <ul class="profile-dropdown-list">
                <li class="profile-dropdown-list-item">
                    <a href="#">
                        <i class="fa-regular fa-user"></i>
                        Edit Profile
                    </a>
                </li>

                <li class="profile-dropdown-list-item">
                    <a href="login">
                        <i class="fa fa-sign-in" aria-hidden="true"></i>
                        Login
                    </a>
                </li>


                <li class="profile-dropdown-list-item">
                    <a href="dashboard">
                        <i class="fa-solid fa-sliders"></i>
                        Settings
                    </a>
                </li>

                <li class="profile-dropdown-list-item">
                    <a href="#">
                        <i class="fa-regular fa-circle-question"></i>
                        Help & Support
                    </a>
                </li>
                <hr/>

                <li class="profile-dropdown-list-item">
                    <a href="logout">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        Log out
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <script>
        let profileDropdownList = document.querySelector(".profile-dropdown-list");
        let btn = document.querySelector(".profile-dropdown-btn");

        let classList = profileDropdownList.classList;

        const toggle = () => classList.toggle("active");

        window.addEventListener("click", function (e) {
            if (!btn.contains(e.target)) classList.remove("active");
        });
    </script>
</div>
<div class="container" style="display: flex; padding-left: 260px; padding-top: 30px; background-color: white">
        <div class="col-md-3" style="width: 230px; border-radius: 10px 10px 10px 10px; height: 320px; border-width: 1px; border: 1px solid; border-color: #3f3a3a ">
<%--            <div class="img1" style="width: 100% ; height: 320px; background-color: white ">--%>
                <%--                            <c:forEach var="list" items="${listServiceProvider}">--%>
                <div class="box" style="width: 217px; height: 200px ; background-color: #cccccc;margin-left: 5px">
                    <a href="/project?action=add&id=${list.getId()}">
                        <img src="${list.getImg()}">
                    </a>
                    <h2>${list.getName()}</h2>
                    <h2>${list.getDescribe()}</h2>
                </div>
                <%--          </c:forEach>--%>
                <div class="activate">
                    <div class="row-activate">
                        <span>Đang sẵn sàng</span>
                    </div>
                    <div class="icon">
                        <a href="https://www.facebook.com" target="_blank">
                            <i class="fa-brands fa-facebook" style="color: #2a5eb2;"></i>
                        </a>

                    </div>
                    <div class="datejoin">
                        <span style="color: #898686">NGÀY THAM GIA: </span>
                        <span>
                            <span>28/05/2023</span>
                        </span>
                    </div>
                </div>
<%--            </div>--%>
        </div>
        <div class="col-md-6" style="width: 450px; padding-left: 15px; padding-right: 15px">
            <div class="row-name" style="height: 30px; background-color: #cccccc; margin-bottom: 10px;">
                <span></span>
                <%--                <c:forEach var="list" items="${listServiceProvider}">--%>
                <%--                    <p>${list.getName()}</p>--%>
                <%--                </c:forEach>--%>
                <button style="float: right" id="followButton" onclick="toggleFollow()">
                    <i class="fa-solid fa-heart" style="color: #ffffff;"></i>
                    Theo dõi
                </button>
            </div>
            <div class="internal">
            <div class="row-informationperson" style="font-size: 10px; display: flex; gap: 30px" >
                <b>Số người theo dõi</b>
                <b>Đã được thuê</b>
                <b>Tỷ lệ hoàn thành</b>
                <b>Tình trạng thiết bị</b>

            </div>
            <div class="showrow" style="padding-bottom: 10px; display: flex; gap: 30px">
                <div class="numberperson"></div>
                <div class="numberperson"></div>
                <div class="numberperson"></div>
                <div class="numberperson"><i class="fa-solid fa-microphone" style="color: #fe9595;"></i></div>
            </div>
            </div>
            <div class="name-game">
                <button class="name">
                    <b style="text-align: center"><c:out value="${listServiceProviders.name}"/></b>
                </button>
            </div>
            <div class="content" style="padding-top: 10px">
                <div class="row-information">
                    <b>Thông tin</b>
                </div>
                <div class="person-img">
                    <%--                    <c:forEach var="list" items="${listServiceProvider}">--%>
                    <div class="img-person"
                         style="width: 90px; height: 100px ; background-color: #cccccc ; margin-left: 10px; float: left">
                        <a href="/project?action=add&id=${list.getId()}">
                            <img src="${list.getImg()}">
                        </a>
                    </div>
                    <%--                    </c:forEach>--%>
                </div>
                <div class="profile-information">
                    <c:forEach var="list" items="${listServiceProvider}">
                        <p>${list.getName()}</p>
                    </c:forEach>
                </div>
                <div class="row-donate" style="font-size: 20px; padding-top: 10px">
                    <b>Top Donate</b>
                    <div class="top-donate" style="height: 200px; background-color: #faedeb">
                        <div class="row-donate" style="height: 60px; background-color: #cccccc">
                            <%--                            <c:forEach var="list" items="${listServiceProvider}">--%>
                            <%--                                <p>${list.getName()}</p>--%>
                            <%--                            </c:forEach>--%>
                        </div>
                    </div>
                </div>
                <div class="row-evaluate" style="font-size: 20px; padding-top: 10px">
                    <b>Đánh giá</b>
                </div>
                <div class="evaluate">
                    <div class="row-evaluate" style="height: 100px; background-color: #cccccc">
                        <%--                        <c:forEach var="list" items="${listServiceProvider}">--%>
                        <%--                            <p>${list.getName()}</p>--%>
                        <%--                        </c:forEach>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3" style="height: 230px; background-color: white; width: 230px;border-radius: 10px 10px 10px 10px; border-color: #3f3a3a; border-width: 1px; border: 1px solid">
            <div class="row-pricePlayer">
                <%--                <c:forEach var="list" items="${listServiceProvider}">--%>
                <%--                    <p>${list.getName()}</p>--%>
                <%--                </c:forEach>--%>
            </div>
            <div class="evaluate-col3">
                <div class="starcmt" style="font-size: 14px; text-align: center">
                    <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                    <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                    <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                    <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                    <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                    <span style="font-size: 14px"> 175 Đánh giá</span>
                </div>
                <%--                <c:forEach var="list" items="${listServiceProvider}">--%>
                <%--                    <p>${list.getName()}</p>--%>
                <%--                </c:forEach>--%>
            </div>
            <div class="service-player">
                <div class="button-rent" style="padding-left: 5px">
                    <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: pink; width: 220px; font-size: 15px; border-width: 1px">
                        <b>THUÊ</b></button>
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
<div class="footer" style="background-color: #faedeb">
            <p>Lover - Loving connection</p>
            <ul class="socials" style="margin-bottom: 10px">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-github"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
            </ul>
</div>
</body>
</html>
