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
        width: 200px;
        height:500px;
    }
    .menu-text {
        margin-left: 10px;
    }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav style="background-color: white">

        <div class="side_navbar">

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">
                <a href="listAccount"><i class="fa-solid fa-list"></i><span class="menu-text">Manager</span></a>
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

                <a href="service" > <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Services</span></a>
            </c:if>
            <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
            <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
            <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>
        </div>
    </nav>

</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
