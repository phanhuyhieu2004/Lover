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

    <link rel="stylesheet" href="home.css"/>
    <link rel="stylesheet" href="slide.css"/>
    <link rel="stylesheet" href="homes.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
<style>

    .containers {
        margin-top: 30px;
        margin-bottom: 30px;
        display: flex;
        justify-content: space-between;
    }

    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 200px;
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


    .grid-container {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-gap: 20px;
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
</style>
<body>


<jsp:include page="Flower.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="containers">
    <nav>

        <nav>
            <div class="side_navbar">
                <span>Game Category</span>
                <c:forEach var="i" begin="1" end="10">
                    <a href="#">
                        <img src="https://play-lh.googleusercontent.com/Msw_2aCxfjPxvKXlRLNz82pDmLwbyqVM8qLgty0uiavOzexo2QFwx0OaZ7rzs49-pA=s64"
                             alt="Game"/>
                        Game
                    </a>
                </c:forEach>
            </div>
        </nav>
    </nav>
    <div class="main">
        <div class="slider">
            <div class="list">
                <div class="item">
                    <img src="anhgame1.jpg" alt="">
                </div>
                <div class="item">
                    <img src="anhgame2.jpg" alt="">
                </div>
                <div class="item">
                    <img src="Amongst-all-the-first-works-of-the-nimble-MMorPG-is-the-book-Summoners-War.png" alt="">
                </div>
                <div class="item">
                    <img src="anhgame3.jpg" alt="">
                </div>
                <div class="item">
                    <img src="anhgame4.jpg" alt="">
                </div>
                <div class="item">
                    <img src="anhgame5.jpg" alt="">
                </div>
                <div class="item">
                    <img src="anhgame6.webp" alt="">
                </div>
                <div class="item">
                    <img src="anggame7.jpg" alt="">
                </div>
                <div class="item">
                    <img src="anhgame8.jpg" alt="">
                </div>
                <div class="item">
                    <img src="laplace-m-vung-dat-gio-01-06-2021-0.png" alt="">
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
        <div class="container" style=" max-width: 1000px;">
            <div class="header">
                <select class="custom-input btn btn-outline-danger" id="gender">
                    <option value="gender">Gender</option>
                    <option value="male">Man</option>
                    <option value="female">Women</option>
                </select>

                <select class="custom-input btn btn-outline-danger" id="category">
                    <option value="category">Age</option>
                    <option value="new">18-30</option>
                    <option value="hot">30-40</option>
                </select>

                <select class="custom-input btn btn-outline-danger" id="view">
                    <option value="price">View</option>
                    <option value="10">5 - 10</option>
                    <option value="20">5 - 20</option>
                    <option value="30">5 - 30</option>
                    <option value="40">5 - 40</option>
                    <option value="50">5 - 50</option>
                    <option value="60">5 - 60</option>
                    <option value="70">5 - 70</option>
                    <option value="80">5 - 80</option>
                    <option value="90">5 - 90</option>
                    <option value="100">5 - 100</option>
                    <option value="100">> 100k</option>
                </select>

                <input type="checkbox" class="custom-input btn-check" id="online" autocomplete="off">
                <label class="custom-input btn btn-outline-danger" style="width: 100px;
  height: 50px;
  font-size: 15px;
  padding: 10px;
  text-align: center;" for="online">Online</label>

                <select class="custom-input btn btn-outline-danger" id="price">
                    <option value="price">Rentals</option>
                    <option value="10">5.000 - 10.000</option>
                    <option value="20">5.000 - 20.000</option>
                    <option value="30">5.000 - 30.000</option>
                    <option value="40">5.000 - 40.000</option>
                    <option value="50">5.000 - 50.000</option>
                    <option value="60">5.000 - 60.000</option>
                    <option value="70">5.000 - 70.000</option>
                    <option value="80">5.000 - 80.000</option>
                    <option value="90">5.000 - 90.000</option>
                    <option value="100">5.000 - 100.000</option>
                </select>

                <select class="custom-input btn btn-outline-danger" id="live">
                    <option value="live">City</option>
                    <option value="Ha Noi">Ha Noi</option>
                    <option value="Ho Chi Minh">Ho Chi Minh</option>
                    <option value="other">Other</option>
                </select>

                <input class="custom-input btn btn-outline-danger" type="text" id="nameplayer"
                       placeholder="Name/Url Player">


                <button class="custom-input btn btn-outline-danger"
                        style="font-sizegi3: 15px;height: 50px; width: 110px; float: right;" type="submit" value="search">
                    <i class="fa-solid fa-magnifying-glass fa-beat"></i>
                    Search
                </button>
            </div>
            <div class="content">
                <div class="front">
                    <b style="font-size: 20px;color:deeppink">VIP PLAYERS</b>
                </div>
                <div class="img1"
                     style="width: 100% ;height: 650px; background-color: pink;margin-top: 20px;padding-top: 30px;padding-left: 10px;padding-right: 20px;border-radius: 10px">
                    <div class="grid-container">
                        <c:forEach items="${listAccountDetail}" var="o">
                            <div class="grid-item">
                                <div class="box"
                                     style="width: 210px; height: 280px; background-color: white;float: left;margin-left: 15px;  border-radius: 10px; overflow: hidden;">
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="/project?action=add&id="
                                           style="position: relative; display: inline-block;">
                                            <img src="${o.avatar}"
                                            >
                                            <button type="button" value="display"
                                                    style="position: absolute; bottom: 10px; right: 10px; width: 90px; height: 28px; border-radius: 15px/15px; background-color: lightpink;">${o.price}$/h
                                            </button>
                                        </a>
                                    </div>
                                    <div class="info"
                                         style="display: flex; justify-content: space-between; align-items: center; padding: 0 10px;">
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
                                        <p>${o.interest}</p>
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
                        </c:forEach>
                    </div>
                </div>
                <div class="front">
                    <b style="font-size: 20px;color:deeppink">MOST RENTALS </b>
                </div>
                <div class="img2"
                     style="width: 100% ;height: 940px; background-color: pink;margin-top: 20px;padding-top: 30px;padding-left: 10px;padding-right: 20px;border-radius: 10px">
                    <div class="grid-container">
                        <c:forEach items="${listAccountRentals}" var="a">
                            <div class="grid-item">
                                <div class="box"
                                     style="width: 210px; height: 280px; background-color: white;float: left;margin-left: 15px;  border-radius: 10px; overflow: hidden;">
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="/project?action=add&id="
                                           style="position: relative; display: inline-block;">
                                            <img src="${a.avatar}"
                                            >
                                            <button type="button" value="display"
                                                    style="position: absolute; bottom: 10px; right: 10px; width: 90px; height: 28px; border-radius: 15px/15px; background-color: lightpink;">${a.price}$/h
                                            </button>
                                        </a>
                                    </div>
                                    <div class="info"
                                         style="display: flex; justify-content: space-between; align-items: center; padding: 0 10px;">
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
                                        <p>${a.interest}</p>
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
                        </c:forEach>
                    </div>
                </div>
                <div class="front">
                    <b style="font-size: 20px;color:deeppink">HOT PLAYERS</b>
                </div>
                <div class="img3"
                     style="width: 100% ;height: 650px; background-color: pink;margin-top: 20px;padding-top: 30px;padding-left: 10px;padding-right: 20px;border-radius: 10px">
                    <div class="grid-container">
                        <c:forEach items="${listAccountViews}" var="b">
                            <div class="grid-item">
                                <div class="box"
                                     style="width: 210px; height: 280px; background-color: white;float: left;margin-left: 15px;  border-radius: 10px; overflow: hidden;">
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="/project?action=add&id="
                                           style="position: relative; display: inline-block;">
                                            <img src="${b.avatar}"
                                            >
                                            <button type="button" value="display"
                                                    style="position: absolute; bottom: 10px; right: 10px; width: 90px; height: 28px; border-radius: 15px/15px; background-color: lightpink;">${b.price}$/h
                                            </button>
                                        </a>
                                    </div>
                                    <div class="info"
                                         style="display: flex; justify-content: space-between; align-items: center; padding: 0 10px;">
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
                                        <p>${b.interest}</p>
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
                        </c:forEach>
                    </div>
                </div>
                <div class="front">
                    <b style="font-size: 20px;color:deeppink">NEW ACCOUNT </b>
                </div>
                <div class="img4"
                     style="width: 100% ;height: 940px; background-color: pink;margin-top: 20px;padding-top: 30px;padding-left: 10px;padding-right: 20px;border-radius: 10px">
                    <div class="grid-container">
                        <c:forEach items="${listNewAccount}" var="d">
                            <div class="grid-item">
                                <div class="box"
                                     style="width: 210px; height: 280px; background-color: white;float: left;margin-left: 15px;  border-radius: 10px; overflow: hidden;">
                                    <div class="imgPlayer" style="width: 210px; height: 200px;">
                                        <a href="/project?action=add&id="
                                           style="position: relative; display: inline-block;">
                                            <img src="${d.avatar}"
                                            >
                                            <button type="button" value="display"
                                                    style="position: absolute; bottom: 10px; right: 10px; width: 90px; height: 28px; border-radius: 15px/15px; background-color: lightpink;">${d.price}$/h
                                            </button>
                                        </a>
                                    </div>
                                    <div class="info"
                                         style="display: flex; justify-content: space-between; align-items: center; padding: 0 10px;">
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
                                        <p>${d.interest}</p>
                                    </div>
                                    <div class="imgUser"
                                         style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                        <div style="display: flex;">

                                        </div>
                                        <div class="date" style="color:dodgerblue;">
                                            <i style="font-size: 20px" class="fa-regular fa-calendar-days fa-beat"></i>

                                            <span><b style="color: #3f3a3a">${d.joinDate}</b></span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
                <c:if test="${sessionScope.acc.accountDetail.gender == 'Women'}">
                    <div class="front">
                        <b style="font-size: 20px;color:deeppink">MAN PLAYERS </b>
                    </div>
                    <div class="img5"
                         style="width: 100% ;height: 940px; background-color: pink;margin-top: 20px;padding-top: 30px;padding-left: 10px;padding-right: 20px;border-radius: 10px">
                        <div class="grid-container">
                            <c:forEach items="${listManAccount}" var="boy">
                                <div class="grid-item">
                                    <div class="box"
                                         style="width: 210px; height: 280px; background-color: white;float: left;margin-left: 15px;  border-radius: 10px; overflow: hidden;">
                                        <div class="imgPlayer" style="width: 210px; height: 200px;">
                                            <a href="/project?action=add&id="
                                               style="position: relative; display: inline-block;">
                                                <img src="${boy.avatar}"
                                                >
                                                <button type="button" value="display"
                                                        style="position: absolute; bottom: 10px; right: 10px; width: 90px; height: 28px; border-radius: 15px/15px; background-color: lightpink;">${boy.price}$/h
                                                </button>
                                            </a>
                                        </div>
                                        <div class="info"
                                             style="display: flex; justify-content: space-between; align-items: center; padding: 0 10px;">
                                            <div class="namePlayer">
                                                <p>${boy.fullName}</p>
                                            </div>
                                            <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                        </div>
                                        <div class="namePlayer" style="width: 190px; height: 23px;padding-left: 10px;">
                                            <p>${boy.interest}</p>
                                        </div>
                                        <div class="imgUser"
                                             style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                            <div style="display: flex;">

                                            </div>
                                            <div class="boy" style="color:royalblue;">
                                                <i style="font-size: 20px" class="fa-solid fa-person fa-beat"></i>


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
                        <b style="font-size: 20px;color:deeppink"> WOMEN PLAYERS </b>
                    </div>
                    <div class="img6"
                         style="width: 100% ;height: 940px; background-color: pink;margin-top: 20px;padding-top: 30px;padding-left: 10px;padding-right: 20px;border-radius: 10px">
                        <div class="grid-container">
                            <c:forEach items="${listWomenAccount}" var="girl">
                                <div class="grid-item">
                                    <div class="box"
                                         style="width: 210px; height: 280px; background-color: white;float: left;margin-left: 15px;  border-radius: 10px; overflow: hidden;">
                                        <div class="imgPlayer" style="width: 210px; height: 200px;">
                                            <a href="/project?action=add&id="
                                               style="position: relative; display: inline-block;">
                                                <img src="${girl.avatar}"
                                                >
                                                <button type="button" value="display"
                                                        style="position: absolute; bottom: 10px; right: 10px; width: 90px; height: 28px; border-radius: 15px/15px; background-color: lightpink;">${girl.price}$/h
                                                </button>
                                            </a>
                                        </div>
                                        <div class="info"
                                             style="display: flex; justify-content: space-between; align-items: center; padding: 0 10px;">
                                            <div class="namePlayer">
                                                <p>${girl.fullName}</p>
                                            </div>
                                            <span class="dot" style="width: 8px;
  height: 8px;
  background-color: limegreen;
  border-radius: 50%;
  display: inline-block;"></span>
                                        </div>
                                        <div class="namePlayer" style="width: 190px; height: 23px;padding-left: 10px;">
                                            <p>${girl.interest}</p>
                                        </div>
                                        <div class="imgUser"
                                             style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                            <div style="display: flex;">

                                            </div>
                                            <div class="girl" style="color:hotpink;">
                                                <i style="font-size: 20px" class="fa-solid fa-person-dress fa-beat"></i>


                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
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
