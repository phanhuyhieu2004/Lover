<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/17/23
  Time: 1:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title> Đăng ký dịch vụ cung cấp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="rentalList.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <link rel="stylesheet" href="nav.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
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

    .container {
        margin-left: 450px;
        width: 500px;
        margin-bottom: 10px;
        margin-right: 350px;
        padding: 25px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 0 10px hotpink;
    }

    h2 {
        text-align: center;
    }

    .row {
        display: flex;
        justify-content: space-between;
    }

    .image-square {
        width: 150px;
        height: 150px;
        border: 2px solid deeppink;
        margin-right: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
    }

    .image-square img {
        max-width: 100%;
        max-height: 100%;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-group input[type="text"],
    .form-group textarea {
        width: 100%;
        padding: 5px;
        border: 2px solid pink;
        border-radius: 5px;
    }

    .form-group textarea {
        height: 100px;
    }

    input[type="submit"] {
        width: 50%;
        padding: 15px;
        background-color: deeppink;
        color: #fff;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 18px;
        outline: none;
        transition: background-color 0.3s ease-in-out;
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
    <h2>Register service</h2>
    <div class="form-group">
        <label for="name">Name service:</label>
        <input type="text" id="name" name="name" required>
    </div>
    <div class="img-service">
        <div class="row-name" style="padding-bottom: 5px">
            <b>Illustration:</b>
        </div>
        <div class="row">
            <div id="image-square-1" class="image-square">
                <span>Chọn ảnh</span>
            </div>

            <div id="image-square-2" class="image-square">
                <span>Chọn ảnh</span>
            </div>

            <div id="image-square-3" class="image-square">
                <span>Chọn ảnh</span>
            </div>
        </div>
        <input type="file" id="image-input" accept="image/*" style="display: none;">
    </div>

    <div class="form-group">
        <label for="price" style="padding-top: 15px">Price:</label>
        <input type="text" id="price" name="price" required>
    </div>

    <div class="form-group">
        <label for="policy">Regulations:</label>
        <textarea id="policy" name="policy" required></textarea>
    </div>

    <div style="text-align: center" class="form-group">
        <input type="submit" value="Post service">
    </div>

</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const imageSquares = document.querySelectorAll('.image-square');
        const imageInput = document.getElementById('image-input');

        imageSquares.forEach(function (square) {
            square.addEventListener('click', function () {
                imageInput.click();
                imageInput.onchange = function () {
                    const file = imageInput.files[0];
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        const imageUrl = e.target.result;
                        const image = document.createElement('img');
                        image.src = imageUrl;
                        image.alt = 'Ảnh';

                        square.innerHTML = '';
                        square.appendChild(image);
                    };

                    reader.readAsDataURL(file);
                };
            });
        });
    });
</script>
</body>
</html>
