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
    .listPage {
        padding: 10px;
        text-align: center;
        list-style: none;
    }

    .listPage li {
        background-color: #ffffffBD;
        padding: 20px;
        display: inline-block;
        margin: 0 10px;
        cursor: pointer;
    }

    .listPage .active {
        background-color: #B192EF;
        color: #fff;
    }

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

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;

        border: 1px solid deeppink;
        border-radius: 5px;

        margin-top: 30px;
        margin-right: auto;
        margin-left: auto;
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

    .sticky-nav {
        position: sticky;
        top: 0;
        z-index: 100;
    }
</style>
<body style="background: white">


<jsp:include page="Flower.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="containers">


    <nav class="sticky-nav">
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
                    <img src="Angry-Birds-se-bi-xoa-khoi-CH-Play-vao-ngay-23-thang-2.jpg" alt="">
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
                <form action="search" method="post">
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
                    <input class="custom-input btn btn-outline-danger" type="text" id="nameplayer" name="searchFullName"
                           placeholder="Name/Url Player" value="${searchFullName}">
                    <button class="custom-input btn btn-outline-danger"
                            style="font-size: 15px;height: 50px; width: 110px; float: right;" type="submit"
                            value="search">
                        <i class="fa-solid fa-magnifying-glass fa-beat"></i>
                        Search
                    </button>
                </form>

            </div>
            <div class="content">

                <div class="img1"
                     style="width: 100% ;height:950px; background-color: white;margin-top: 20px;padding-top: 30px;padding-left: 10px;padding-right: 20px;border-radius: 10px">
                    <div class="grid-container">
                        <c:choose>
                        <c:when test="${empty listAccountDetail}">
                            <p style="text-align: center;">Player name not found</p>
                        </c:when>
                        <c:otherwise>
                                <c:forEach items="${listAccountDetail}" var="o">
                                    <div class="grid-item">
                                        <div class="box"
                                             style="width: 210px; height: 280px; background-color: white;float: left;margin-left: 15px;  border-radius: 10px; overflow: hidden;">
                                            <div class="imgPlayer" style="width: 210px; height: 200px;">
                                                <a href="profile?aid=${o.account_id}"
                                                   style="position: relative; display: inline-block;">
                                                    <img src="${o.avatar}"
                                                    >
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
                                            <div class="namePlayer"
                                                 style="width: 190px; height: 23px;padding-left: 10px;">
                                                <p>${o.interest}</p>
                                            </div>
                                            <div class="imgUser"
                                                 style="width: 190px; height: 25px; display: flex; justify-content: space-between;">
                                                <div style="display: flex;">

                                                </div>
                                                <div class="star" style="color:forestgreen;">
                                                    <i style="font-size: 20px"
                                                       class="fa-solid fa-magnifying-glass fa-beat"></i>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </c:forEach>
                        </c:otherwise>
                        </c:choose>
                    </div>
                </div>


            </div>
        </div>
        <ul class="listPage">

        </ul>
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
<script src="pagination.js"></script>
<script src="content.js"></script>
<script src="icon.js"></script>
</body>
</html>
