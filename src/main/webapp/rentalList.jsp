<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/15/2023
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Danh sách đơn thuê</title>
    <link rel="stylesheet" href="rentalList.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <link rel="stylesheet" href="nav.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
    .container{
        width: 1000px;
        margin-left: 250px;
        margin-top: 50px;
    }
    .row-menu{
        display: flex;
        gap: 398px;
        padding-top: 20px;
    }
    .detail-table a {
        text-decoration: none;
        color: black;
    }
    .profile-dropdown-list-item a i {
        margin-right: 0.8rem;
        font-size: 1.1rem;
        width: 2.3rem;
        height: 2.3rem;
        background-color: deeppink;
        color: var(--white);
        line-height: 2.3rem;
        text-align: center;
        margin-right: 1rem;
        border-radius: 50%;
        transition: margin-right 0.3s;

    }

    .navbar-logo {
        cursor: pointer;


        max-height: 100%;
        max-width: 100%;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 20px;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    .hidden {
        display: none;
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
<div class="container">
    <div class="head-page" style="padding-bottom: 15px">
        <span><b style="font-size: 25px">List of rental applications</b></span>
    </div>
    <table class="detail-table" style="font-size: 12px;">
        <tr>
            <th>STT</th>
            <th>Tên người thuê</th>
            <th>Dịch vụ</th>
            <th>Chi tiết</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Loan</td>
            <td>Dọn nhà, Chở hàng</td>
            <td><button><a href="detailRentalApplication.jsp">Xem chi tiết</a></button></td>
        </tr>
    </table>
</div>
</body>
</html>
