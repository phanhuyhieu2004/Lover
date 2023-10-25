<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Header</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <link rel="stylesheet" href="nav.css"/>
</head>
<style>
    .navbar-logo {
        cursor: pointer;


        max-height: 100%;
        max-width: 100%;
    }
</style>
<body>
<nav class="navbar">
    <a href="home.jsp">
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
        <li><a href="home.jsp">Home</a></li>
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
                <a href="login.jsp">
                    <i class="fa fa-sign-in" aria-hidden="true"></i>
                    Login
                </a>
            </li>


            <li class="profile-dropdown-list-item">
                <a href="listUser">
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
</body>
</html>
