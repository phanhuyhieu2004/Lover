<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
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
    <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="manifest" href="favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Sen:wght@700&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="common.css">

    <link rel="stylesheet" href="manager.css">
    <link rel="stylesheet" href="homes.css"/>

</head>
<style>


    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 220px;

    }
    .menu-text {
        margin-left: 10px;
    }
</style>
<body style="background: white">

<nav style="background-color: pink;
  width: 250px;
  margin-top: 30px;" class="nav-dashboard">

    <div class="side_navbar">

        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">
            <a href="list"><i class="fa-solid fa-list"></i><span class="menu-text">Account management</span></a>
        </c:if>

        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

            <a href="serviceProviderInformation"><i class="fa-solid fa-circle-info"></i></i><span
                    class="menu-text">Personal information</span></a>
        </c:if>
        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 3}">

            <a href="userInformation"><i class="fa-solid fa-circle-info"></i></i><span
                    class="menu-text">Personal information</span></a>
        </c:if>
        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

            <a href="serviceCategory" > <i class="fa-solid fa-bars"></i> <span
                    class="menu-text">List of services</span></a>
        </c:if>
        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

            <a href="accountService"><i class="fa-solid fa-wallet"></i><span class="menu-text">My service</span></a>
        </c:if>

        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 3}">
        <a href="addMoney"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Deposit money</span></a>
        </c:if>
        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 3}">

        <a href="rentalList"><i class="fa-solid fa-globe"></i><span class="menu-text">Service provider history</span></a>
        </c:if>
        <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

        <a href="rentListAccount"><i class="fa-solid fa-chart-simple"></i><span class="menu-text">Tenant history</span></a>
        </c:if>

        <a href="#"><i class="fa-solid fa-users-slash"></i><span class="menu-text">Blacklist</span></a>
        <a href="#"><i class="fa-solid fa-envelope"></i><span class="menu-text">Mail</span></a>
        <a href="#"><i class="fa-solid fa-bell"></i><span class="menu-text">Notification</span></a>
        <a href="#"><i class="fa-solid fa-heart"></i><span class="menu-text">Favourite</span></a>
        <a href="#"><i class="fa-solid fa-chart-simple"></i><span class="menu-text">Statistical</span></a>

    </div>
</nav>


</body>
</html>