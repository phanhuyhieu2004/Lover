<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/6/2023
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Service</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link rel="stylesheet" href="service.css"/>
    <link rel="stylesheet" href="manager.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


</head>
<style>
    .menu-text {
        margin-left: 10px;
    }


    .containers h1 {
        font-size: 20px;
        line-height: 30px;
        margin-top: 15px;
        margin-bottom: 10px;
        text-align: center;
        position: relative;
    }

    .container {
        margin-top: 40px;
        margin-bottom: 40px;
        display: flex;
        justify-content: space-between;
        z-index: 0;

    }

    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 200px;
    }

    .profile-dropdown-list {
        position: absolute;
        top: 68px;
        width: 220px;
        right: 0;
        background-color: var(--white);
        border-radius: 10px;
        max-height: 0;
        overflow: hidden;
        box-shadow: var(--shadow);
        transition: max-height 0.5s;
        z-index: 1;
    }

    .containers {

        background-color: white;
        margin-right: 80px;

        border-radius: 10px;
    }
    .alert-success {
        background-color: forestgreen;
        margin: 10px;
        border-radius: 10px;
        color: white;
    }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container">
    <nav style="background-color: white">

        <div class="side_navbar">

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">
                <a href="listAccount" ><i class="fa-solid fa-list"></i><span class="menu-text">Manager</span></a>
                <a href="status">Status Manager</a>
            </c:if>

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="serviceProviderInformation"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information Service Provider</span></a>
            </c:if>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 3}">

                <a href="userInformation"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information User</span></a>
            </c:if>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="service" class="active"> <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Services</span></a>
            </c:if>

            <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
            <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
            <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>

        </div>
    </nav>
    <div class="containers">
        <form  action="service" method="post">
        <div class="services[]">
        <h1>Choose the services you want to provide</h1>
            <center> <p class=" alert-success" style="color: white" >${messSuccess}</p></center>

            <div class="row">
            <label>
                <input type="checkbox" name="services[]" value="family"/>
                <div class="icon-box">
                    <i class="fa-solid fa-house-chimney-window fa-beat"></i>
                    <span>Introduce yourself to your family</span>
                </div>
            </label>
            <label>
                <input type="checkbox" name="services[]" value="friends"/>
                <div class="icon-box" style="color: white">
                    <i class="fa-solid fa-people-roof fa-beat"></i> <span>Introduce your friends</span>
                </div>
            </label>
            <label>
                <input type="checkbox" name="services[]" value="travel"/>
                <div class="icon-box">
                    <i class="fa-solid fa-route fa-beat"></i> <span> Travel together with a group of friends </span>
                </div>
            </label>
            <label>
                <input type="checkbox" name="services[]" value="together"/>
                <div class="icon-box">
                    <i class="fa-solid fa-play fa-beat"></i> <span>Go out together</span>
                </div>
            </label>

            <label>
                <input type="checkbox"  name="services[]" value="birthday"/>
                <div class="icon-box" style="color:white">
                    <i class="fa-solid fa-cake-candles fa-beat"></i> <span>Attend birthday</span>
                </div>
            </label>

            <label>
                <input type="checkbox" name="services[]" value="online"/>
                <div class="icon-box">
                    <i class="fa-solid fa-comment-slash fa-beat"></i> <span>Chat offline</span>
                </div>
            </label>
            <label>
                <input type="checkbox"  name="services[]" value="offline"/>
                <div class="icon-box">
                    <i class="fa-regular fa-comments fa-beat"></i>
                    <span>Chat online</span>
                </div>
            </label>
            <label>
                <input type="checkbox" name="services[]" value="Tet"/>
                <div class="icon-box">
                    <i class="fa-regular fa-face-smile-wink fa-beat"></i> <span>Go in Tet holiday</span>
                </div>
            </label>
            <label>
                <input type="checkbox"  name="services[]" value="holidays"/>
                <div class="icon-box">
                    <i class="fa fa-gamepad" aria-hidden="true"></i>
                    <span>Going out on holidays</span>
                </div>
            </label>


        </div>
        <h1>Free service</h1>
        <div class="row">
            <label>
                <input type="checkbox"  name="services[]" value="hand"/>
                <div class="icon-box">
                    <i class="fa-solid fa-handshake-simple fa-beat"></i> <span>    Hold hand</span>
                </div>
            </label>
            <label>
                <input type="checkbox" name="services[]" value="love"/>
                <div class="icon-box">
                    <i class="fa-brands fa-gratipay fa-beat-fade"></i>
                    <span> Say love</span>
                </div>
            </label>
            <label>
                <input type="checkbox"   name="services[]" value="eyes"/>
                <div class="icon-box">
                    <i class="fa-solid fa-eye fa-beat"></i> <span> Look at your eyes </span>
                </div>
            </label>
        </div>
        <h1>Extended services</h1>
        <div class="row">
            <label>
                <input type="checkbox"  name="services[]" value="song"/>
                <div class="icon-box">
                    <i class="fa-solid fa-music fa-beat"></i> <span>   Song</span>
                </div>
            </label>
            <label>
                <input type="checkbox"  name="services[]" value="kiss"/>
                <div class="icon-box">
                    <i class="fa-solid fa-face-kiss fa-beat"></i> <span> Kiss hands</span>
                </div>
            </label>
            <label>
                <input type="checkbox" name="services[]" value="hug"/>
                <div class="icon-box">
                    <i class="fa-solid fa-hand-holding-heart fa-beat"></i> <span> Hug </span>
                </div>
            </label>
            <label>
                <input type="checkbox"  name="services[]" value="childish"/>
                <div class="icon-box">
                    <i class="fa-solid fa-baby fa-beat"></i>
                    <span>    Childish</span>
                </div>
            </label>

            <label>
                <input type="checkbox" name="services[]" value="intimate"/>
                <div class="icon-box">
                    <i class="fa-regular fa-face-kiss-wink-heart fa-beat"></i>
                    <span>    Intimate gesture</span>
                </div>
            </label>
            <label>
                <input type="checkbox"  name="services[]" value="movie"/>
                <div class="icon-box">
                    <i class="fa-solid fa-film fa-beat"></i>                    <span>     Watch a movie </span>
                </div>
            </label>

        </div>
        </div>
        <div class="price">
            <p style="font-size: 20px">You want to add other services:</p>
            <input type="text" placeholder="Enter the service you want to offer here "style="font-size: 14px">
        </div>
        <div style="text-align: center">
            <input type="submit" value="Register">

        </div>
        </form>
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
