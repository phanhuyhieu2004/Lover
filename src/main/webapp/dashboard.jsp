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

    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="manager.css">
</head>
<style>

    .container{
        margin-top: 40px;
        margin-bottom: 40px;
        display: flex;
        justify-content: space-between;
    }
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
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav style="background-color: #FFE4E1">

        <div class="side_navbar">
            <a href="dashboard" class="active">  <i class="fa-solid fa-grip"></i><span class="menu-text">Dashboard</span></a>

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">
                <a href="list"><i class="fa-solid fa-list"></i><span class="menu-text">Manager</span></a>
            </c:if>

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="serviceProviderInformation"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information</span></a>
            </c:if>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 3}">

                <a href="userInformation"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information</span></a>
            </c:if>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="serviceCategory" > <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Service category</span></a>
            </c:if>

            <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
            <a href="#"><i class="fa-solid fa-envelope"></i><span class="menu-text">Email</span></a>
            <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
            <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>
            <a href="#"><i class="fa-solid fa-globe"></i><span class="menu-text">Connect</span></a>
            <a href="#"><i class="fa-solid fa-chart-simple"></i><span class="menu-text">Statistical</span></a>
            <a href="#"><i class="fa-solid fa-users-slash"></i><span class="menu-text">Blacklist</span></a>
        </div>
    </nav>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>