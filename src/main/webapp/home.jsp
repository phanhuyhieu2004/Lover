<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lover</title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Sen:wght@700&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="reset.css">

    <link rel="stylesheet" href="common.css">

    <link rel="stylesheet" href="home.css"/>
    <link rel="stylesheet" href="slide.css"/>
    <link rel="stylesheet" href="homes.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
<style>
    .info {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 10px;
        gap: 60px;
        width: 200px;
    }

    .containers {
        margin-top: 30px;
        margin-bottom: 30px;
        display: flex;
        justify-content: space-between;
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;

        border: 1px solid hotpink;
        border-radius: 5px;

        margin-top: 30px;
        margin-right: auto;
        margin-left: auto;
    }

    .side_navbar {
        padding: 20px;
        display: flex;
        flex-direction: column;
        width: 300px;
        border-radius: 10px;
    }

    .side_navbar span {
        color: hotpink;
        margin: 10px;
        font-size: 15px;
    }

    .side_navbar a {
        display: flex;
        align-items: center;
        padding: 8px;
        font-weight: 500;
        font-size: 15px;
        color: #646464;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .side_navbar a img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
    }


    .grid-item {
        grid-column: span 1;
    }

    @media screen and (max-width: 767px) {
        .grid-item {
            grid-column: span 2;
        }
    }

    .imgPlayer img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .sticky-nav {
        position: sticky;
        top: 0;
        z-index: 100;
    }
</style>
<body>


<jsp:include page="Flower.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="containers">


    <nav class="sticky-nav" style="background: var(--primary)">
        <div class="side_navbar">
            <span class="game-category">Game Category</span>
            <a href="#">
                <img src="https://play-lh.googleusercontent.com/S3GPwY1-mc5876ZnMk65-VrG3Xlh1R8zgK-Q_LlnbjZ7llyyv0ZGWIlNnBM7LckMMzYy=w240-h480"
                     alt="Game"/>
                Arena of valor
            </a>
            <a href="#">
                <img src="https://playerduo-data.sgp1.cdn.digitaloceanspaces.com/production/game_avatars/715867c6-698f-411a-b4f9-1e9093130b60__38084d60-34d5-11ed-838c-b120e70abb59__game_avatars.jpg"
                     alt="Game"/>
                Call of Duty
            </a><a href="#">
            <img src="https://play-lh.googleusercontent.com/4RvFMe4VmXWyrruxkfGMSBR-hGYsz8X-CK5rW-667wDAU-zuaxePgm_sXW-9YI-MrY15=s48"
                 alt="Game"/>
            Free Fire
        </a><a href="#">
            <img src="https://play-lh.googleusercontent.com/GfWFn7AvHjD2ApE4aL6cATwxh0FBXZg6fqdHuswTWHDvx-j8yiYXkVXigmILVkvDe8Y=w240-h480"
                 alt="Game"/>
            PUBG
        </a><a href="#">
            <img src="https://playerduo-data.sgp1.cdn.digitaloceanspaces.com/production/game_avatars/715867c6-698f-411a-b4f9-1e9093130b60__5dd9f670-34d4-11ed-838c-b120e70abb59__game_avatars.jpg"
                 alt="Game"/>
            Valorant
        </a><a href="#">
            <img src="https://play-lh.googleusercontent.com/kravwTCiUyYnS_FDphgPbS-Jf6C4KIJlxx_YGaf0pWU7Y5v_VVoafce6QaJyu254a-k=s256"
                 alt="Game"/>
            Revelation: New World
        </a><a href="#">
            <img src="data:image/jpeg;base64,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"
                 alt="Game"/>
            Genshin Impact
        </a>
            <a href="#">
                <img src="https://playerduo-data.sgp1.cdn.digitaloceanspaces.com/production/game_avatars/715867c6-698f-411a-b4f9-1e9093130b60__4bb638e0-33f9-11ed-838c-b120e70abb59__game_avatars.jpg"
                     alt="Game"/>
                Sing
            </a><a href="#">
            <img src="https://playerduo.net/api/upload-service/game_avatars/715867c6-698f-411a-b4f9-1e9093130b60__95575640-37c4-11ed-838c-b120e70abb59__game_avatars.jpg"
                 alt="Game"/>
            Chat
        </a>
            <a href="#">
                <img src="https://playerduo.net/api/upload-service/game_avatars/715867c6-698f-411a-b4f9-1e9093130b60__d8d57300-37bc-11ed-838c-b120e70abb59__game_avatars.jpg"
                     alt="Game"/>
                Other
            </a>
        </div>
    </nav>

    <div class="main" style="width: 100%">
        <div class="slider">
            <div class="list">
                <div class="item">
                    <img src="img/1.jpg" alt="">
                </div>
                <div class="item">
                    <img src="img/2.jpg" alt="">
                </div>
                <div class="item">
                    <img src="img/3.jpg" alt="">
                </div>
                <div class="item">
                    <img src="img/4.jpg" alt="">
                </div>
                <div class="item">
                    <img src="img/5.jpg" alt="">
                </div>
            </div>
            <div class="buttons">
                <button id="prev"><</button>
                <button id="next">></button>
            </div>
            <ul class="dots">
                <li class="active"></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>

        <div>
            <div style="padding: 20px">
                <form action="search" method="post" class="search-home">
                    <select name="gender" class="custom-input btn btn-outline-danger" id="gender">
                        <option value="" ${gender == '' ? 'selected' : ''}>Gender</option>
                        <option value="Man" ${gender == 'Man' ? 'selected' : ''}>Man</option>
                        <option value="Women" ${gender == 'Women' ? 'selected' : ''}>Women</option>
                    </select>

                    <select name="ageCategory" class="custom-input btn btn-outline-danger" id="category">
                        <option value="" ${ageCategory == '' ? 'selected' : ''}>Age</option>
                        <option value="18-30" ${ageCategory == '18-30' ? 'selected' : ''}>18-30</option>
                        <option value="30-40" ${ageCategory == '30-40' ? 'selected' : ''}>30-40</option>
                    </select>

                    <select name="view" class="custom-input btn btn-outline-danger" id="view">
                        <option value="" ${view == '' ? 'selected' : ''}>View</option>
                        <option value="10" ${view == '10' ? 'selected' : ''}>5 - 10</option>
                        <option value="20" ${view == '20' ? 'selected' : ''}>5 - 20</option>
                        <option value="30" ${view == '30' ? 'selected' : ''}>5 - 30</option>
                        <option value="40" ${view == '40' ? 'selected' : ''}>5 - 40</option>
                        <option value="50" ${view == '50' ? 'selected' : ''}>5 - 50</option>
                        <option value="60" ${view == '60' ? 'selected' : ''}>5 - 60</option>
                        <option value="70" ${view == '70' ? 'selected' : ''}>5 - 70</option>
                        <option value="80" ${view == '80' ? 'selected' : ''}>5 - 80</option>
                        <option value="90" ${view == '90' ? 'selected' : ''}>5 - 90</option>
                        <option value="100" ${view == '100' ? 'selected' : ''}>5 - 100</option>
                        <option value="greater100" ${view == 'greater100' ? 'selected' : ''}> > 100k</option>
                    </select>

                    <input type="checkbox" name="online" class="custom-input btn-check" id="online"
                           autocomplete="off" ${online ? 'checked' : ''}>
                    <label class="custom-input btn btn-outline-danger online"
                           for="online" style="font-size: 15px">Online</label>

                    <select name="rentals" class="custom-input btn btn-outline-danger" id="price">
                        <option value="" ${rentals == '' ? 'selected' : ''}>Rentals</option>
                        <option value="10" ${rentals == '10' ? 'selected' : ''}>5.000 - 10.000</option>
                        <option value="20" ${rentals == '20' ? 'selected' : ''}>5.000 - 20.000</option>
                        <option value="30" ${rentals == '30' ? 'selected' : ''}>5.000 - 30.000</option>
                        <option value="40" ${rentals == '40' ? 'selected' : ''}>5.000 - 40.000</option>
                        <option value="50" ${rentals == '50' ? 'selected' : ''}>5.000 - 50.000</option>
                        <option value="60" ${rentals == '60' ? 'selected' : ''}>5.000 - 60.000</option>
                        <option value="70" ${rentals == '70' ? 'selected' : ''}>5.000 - 70.000</option>
                        <option value="80" ${rentals == '80' ? 'selected' : ''}>5.000 - 80.000</option>
                        <option value="90" ${rentals == '90' ? 'selected' : ''}>5.000 - 90.000</option>
                        <option value="100" ${rentals == '100' ? 'selected' : ''}>5.000 - 100.000</option>
                    </select>

                    <select name="city" class="custom-input btn btn-outline-danger" id="live">
                        <option value="" ${city == '' ? 'selected' : ''}>City</option>
                        <option value="Ha Noi" ${city == 'Ha Noi' ? 'selected' : ''}>Ha Noi</option>
                        <option value="Ho Chi Minh" ${city == 'Ho Chi Minh' ? 'selected' : ''}>Ho Chi Minh</option>
                        <option value="other" ${city == 'other' ? 'selected' : ''}>Other</option>
                    </select>

                    <input class="custom-input btn btn-outline-danger" type="text" id="nameplayer"
                           name="searchFullName" placeholder="Name/Url Player" value="${searchFullName}">

                    <button class="custom-input btn btn-outline-danger"
                            style="font-size: 15px;height: 50px; width: 110px; float: right;" type="submit"
                            value="search">
                        <i class="fa-solid fa-magnifying-glass fa-beat"></i>
                        Search
                    </button>
                </form>
            </div>
            <div class="content">
                <div class="front">
                    <b style="font-size: 2rem;color:hotpink">VIP PLAYERS</b>
                </div>
                <div class="player img1">
                    <div class="grid-container">
                        <c:forEach items="${listAccountDetail}" var="o">
                            <div class="grid-item">
                                <div class="box">
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="profile?aid=${o.account_id}"
                                           style="position: relative; display: inline-block;">
                                            <img src="${o.avatar} " class="avatar">
                                            <span class="price-player">${o.price}.000k/giờ</span>


                                        </a>
                                    </div>
                                    <div class="info-player">
                                        <div class="info"
                                        >
                                            <div class="namePlayer">
                                                <p>${o.fullName}</p>
                                            </div>
                                            <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                        </div>
                                        <div class="namePlayer" style="width: 190px; height: 23px;padding-left: 10px;">
                                            <p class="desc-player">${o.interest}</p>
                                        </div>
                                        <div class="imgUser"
                                             style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                            <div style="display: flex;">

                                            </div>
                                            <div class="star" style="color:yellow;">
                                                <i style="font-size: 20px" class="fa-solid fa-star fa-beat"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="front">
                    <b style="font-size: 2rem;color:hotpink">MOST RENTALS </b>
                </div>
                <div class="player img2"
                >
                    <div class="grid-container">
                        <c:forEach items="${listAccountRentals}" var="a">
                            <div class="grid-item">
                                <div class="box"
                                >
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="profile?aid=${a.account_id}"
                                           style="position: relative; display: inline-block;">
                                            <img src="${a.avatar}"
                                            >
                                            <span class="price-player">${a.price}.000k/giờ</span>

                                        </a>
                                    </div>
                                    <div class="info-player">
                                        <div class="info"
                                        >
                                            <div class="namePlayer">
                                                <p>${a.fullName}</p>
                                            </div>
                                            <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                        </div>
                                        <div class="namePlayer" style="width: 190px; height: 23px;padding-left: 10px;">
                                            <p class="desc-player">${a.interest}</p>
                                        </div>
                                        <div class="imgUser"
                                             style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                            <div style="display: flex;">

                                            </div>
                                            <div class="dollar" style="color:violet;">
                                                <i style="font-size: 20px"
                                                   class="fa-solid fa-circle-dollar-to-slot fa-beat"></i>

                                                <span><b style="color: #3f3a3a">${a.numberOfRentals}</b></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="front">
                    <b style="font-size: 2rem;color:hotpink">HOT PLAYERS</b>
                </div>
                <div class="player img3"
                >
                    <div class="grid-container">
                        <c:forEach items="${listAccountViews}" var="b">
                            <div class="grid-item">
                                <div class="box"
                                >
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="profile?aid=${b.account_id}"
                                           style="position: relative; display: inline-block;">
                                            <img src="${b.avatar}"
                                            >
                                            <span class="price-player">${b.price}.000k/giờ</span>

                                        </a>
                                    </div>
                                    <div class="info-player">
                                        <div class="info"
                                        >
                                            <div class="namePlayer">
                                                <p>${b.fullName}</p>
                                            </div>
                                            <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                        </div>
                                        <div class="namePlayer" style="width: 190px; height: 23px;padding-left: 10px;">
                                            <p class="desc-player">${b.interest}</p>
                                        </div>
                                        <div class="imgUser"
                                             style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                            <div style="display: flex;">

                                            </div>
                                            <div class="view" style="color:orangered;">
                                                <i style="font-size: 20px"
                                                   class="fa-solid fa-fire-flame-curved fa-beat"></i>

                                                <span><b style="color: #3f3a3a">${b.view}</b></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="front">
                    <b style="font-size: 2rem;color:hotpink">NEW PLAYERS </b>
                </div>
                <div class="player img4"
                >
                    <div class="grid-container">
                        <c:forEach items="${listNewAccount}" var="d">
                            <div class="grid-item">
                                <div class="box"
                                >
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="profile?aid=${d.account_id}"
                                           style="position: relative; display: inline-block;">
                                            <img src="${d.avatar}"
                                            >
                                            <span class="price-player">${d.price}.000k/giờ</span>

                                        </a>
                                    </div>
                                    <div class="info-player">
                                        <div class="info"
                                        >
                                            <div class="namePlayer">
                                                <p>${d.fullName}</p>
                                            </div>
                                            <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                        </div>
                                        <div class="namePlayer" style="width: 190px; height: 23px;padding-left: 10px;">
                                            <p class="desc-player">${d.interest}</p>
                                        </div>
                                        <div class="imgUser"
                                             style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                            <div style="display: flex;">

                                            </div>
                                            <div class="date" style="color:dodgerblue;">
                                                <i style="font-size: 20px"
                                                   class="fa-regular fa-calendar-days fa-beat"></i>

                                                <span><b style="color: #3f3a3a">${d.joinDate}</b></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <c:if test="${sessionScope.acc.accountDetail.gender == 'Women'}">
                    <div class="front">
                        <b style="font-size: 2rem;color:hotpink">MALE PLAYERS </b>
                    </div>
                    <div class="player img5"
                    >
                        <div class="grid-container">
                            <c:forEach items="${listManAccount}" var="boy">
                                <div class="grid-item">
                                    <div class="box"
                                    >
                                        <div class="imgPlayer" style="width: 210px; height: 200px;">
                                            <a href="profile?aid=${boy.account_id}"
                                               style="position: relative; display: inline-block;">
                                                <img src="${boy.avatar}"
                                                >
                                                <span class="price-player">${boy.price}.000k/giờ</span>

                                            </a>
                                        </div>
                                        <div class="info-player">
                                            <div class="info"
                                            >
                                                <div class="namePlayer">
                                                    <p>${boy.fullName}</p>
                                                </div>
                                                <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                            </div>
                                            <div class="namePlayer"
                                                 style="width: 190px; height: 23px;padding-left: 10px;">
                                                <p class="desc-player">${boy.interest}</p>
                                            </div>
                                            <div class="imgUser"
                                                 style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                                <div style="display: flex;">

                                                </div>
                                                <div class="boy" style="color:royalblue;">
                                                    <i style="font-size: 20px" class="fa-solid fa-person fa-beat"></i>

                                                    <span><b style="color: #3f3a3a">${boy.view}</b></span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.acc.accountDetail.gender == 'Man'}">
                    <div class="front">
                        <b style="font-size: 2rem;color:hotpink"> FEMALE PLAYERS </b>
                    </div>
                    <div class=" player img6"
                         >
                        <div class="grid-container">
                            <c:forEach items="${listWomenAccount}" var="girl">
                                <div class="grid-item">
                                    <div class="box"
                                    >
                                        <div class="imgPlayer" style="width: 210px; height: 200px;">
                                            <a href="profile?aid=${girl.account_id}"
                                               style="position: relative; display: inline-block;">
                                                <img src="${girl.avatar}"
                                                >
                                                <span class="price-player">${girl.price}.000k/giờ</span>

                                            </a>
                                        </div>
                                        <div class="info-player">
                                            <div class="info"
                                            >
                                                <div class="namePlayer">
                                                    <p>${girl.fullName}</p>
                                                </div>
                                                <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                            </div>
                                            <div class="namePlayer"
                                                 style="width: 190px; height: 23px;padding-left: 10px;">
                                                <p class="desc-player">${girl.interest}</p>
                                            </div>
                                            <div class="imgUser"
                                                 style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                                <div style="display: flex;">

                                                </div>
                                                <div class="girl" style="color:hotpink;">
                                                    <i style="font-size: 20px"
                                                       class="fa-solid fa-person-dress fa-beat"></i>


                                                    <span><b style="color: #3f3a3a">${girl.view}</b></span>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.acc.role.idRole != 1}">

                    <div class="front">
                        <b style="font-size: 2rem;color:hotpink"> PLAYERS AROUND YOU </b>
                    </div>
                    <div class=" player img6"
                         >
                        <div class="grid-container">
                            <c:choose>
                                <%--                                kiểm tra xem danh sách listAddressAccount có rỗng hay không.,nếu rỗng thì hiển thị thông báo--%>
                                <c:when test="${empty listAddressAccount}">
                                    <p style="text-align: center;">There are no other players around you!</p>
                                </c:when>
                                <c:otherwise>
                                    <%--                                trường hợp mặc định, được thực thi khi không  nào thỏa mãn điều kiện,nếu cos giaáị trithì sẽ lấy các bản ghi trong list ra--%>
                                    <c:forEach items="${listAddressAccount}" var="address">
                                        <div class="grid-item">
                                            <div class="box"
                                            >
                                                <div class="imgPlayer" style="width: 210px; height: 200px;">
                                                    <a href="profile?aid=${address.account_id}"
                                                       style="position: relative; display: inline-block;">
                                                        <img src="${address.avatar}"
                                                        >
                                                        <span class="price-player">${address.price}.000k/giờ</span>

                                                    </a>
                                                </div>
                                                <div class="info-player">
                                                    <div class="info"
                                                    >
                                                        <div class="namePlayer">
                                                            <p>${address.fullName}</p>
                                                        </div>
                                                        <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                                    </div>
                                                    <div class="namePlayer"
                                                         style="width: 190px; height: 23px;padding-left: 10px;">
                                                        <p class="desc-player">${address.interest}</p>
                                                    </div>
                                                    <div class="imgUser"
                                                         style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                                        <div style="display: flex;">

                                                        </div>
                                                        <div class="address" style="color:limegreen;">
                                                            <i style="font-size: 20px"class="fa-solid fa-location-dot fa-beat"></i>

                                                            <span><b style="color: #3f3a3a">${address.view}</b></span>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
    <div class="icon-chat">
        <i class="fa-regular fa-comment"></i>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script>
    let slider = document.querySelector('.slider .list');
    let items = document.querySelectorAll('.slider .list .item');
    let next = document.getElementById('next');
    let prev = document.getElementById('prev');
    let dots = document.querySelectorAll('.slider .dots li');

    let lengthItems = items.length - 1;
    let active = 0;
    next.onclick = function () {
        active = active + 1 <= lengthItems ? active + 1 : 0;
        reloadSlider();
    }
    prev.onclick = function () {
        active = active - 1 >= 0 ? active - 1 : lengthItems;
        reloadSlider();
    }
    let refreshInterval = setInterval(() => {
        next.click()
    }, 3000);

    function reloadSlider() {
        slider.style.left = -items[active].offsetLeft + 'px';
        //
        let last_active_dot = document.querySelector('.slider .dots li.active');
        last_active_dot.classList.remove('active');
        dots[active].classList.add('active');

        clearInterval(refreshInterval);
        refreshInterval = setInterval(() => {
            next.click()
        }, 3000);


    }

    dots.forEach((li, key) => {
        li.addEventListener('click', () => {
            active = key;
            reloadSlider();
        })
    })
    window.onresize = function (event) {
        reloadSlider();
    };

</script>
<script src="home.js"></script>
<script src="content.js"></script>
<script src="icon.js"></script>
</body>
</html>
