<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/20/2023
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Register Service</title>
    <link rel="stylesheet" href="information.css"/>
    <link rel="stylesheet" href="manager.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>


</head>
<style>
    .alert-success {
        background-color: forestgreen;
        margin: 10px;
        border-radius: 10px;
        color: white;
    }
    .container{
        margin-top: 40px;
        margin-bottom: 40px;
        display: flex;
        justify-content: space-between;
    }
    .containers {
        width: 500px;

        margin-top: auto;
        margin-bottom:10px;
        margin-right: 350px;
        padding: 25px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px hotpink;
    }
    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 200px;
    }
    select{
        margin-bottom: 0px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
    }
    .form-group label {
        display: block;
        margin-bottom: 10px;

        font-weight: 700;
        font-size: 20px;
    }
    .menu-text {
        margin-left: 10px;
    }
    label.required span {
        color: red;
    }
    p span.required {
        color: red;
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
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav style="background-color: #FFE4E1">

        <div class="side_navbar">

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">
                <a href="listAccount" ><i class="fa-solid fa-list"></i><span class="menu-text">Manager</span></a>
                <a href="status">Status Manager</a>
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
                        class="menu-text">Service Catalog</span></a>
            </c:if>

            <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
            <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
            <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>
        </div>
    </nav>
    <div class="containers">

        <h2>Register service</h2>
        <form  action="registerService" method="post" >
            <div class="form-group" style="margin-right: 0px">
                <label for="name">Service catalog:</label>
                <input type="text" id="category" name="#" value="Tên của các danh mục đã chọn cho dịch vụ" readonly>
            </div>
            <div class="form-group"style="margin-right:0px">
                <label for="name" class="required">Name service(<span>*</span>):</label>
                <input type="text" id="name" name="fullName" required>
            </div>


            <div class="form-group"style="margin-right: 0px">
                <label for="price"class="required">Price(<span>*</span>):</label>
                <input type="text" id="price" name="price"  placeholder="hourly price" required>
            </div>

            <div style="text-align: center" class="form-group">
                <input type="submit" value="Post service">
            </div>
            <center>
                <p>Fields marked with (<span class="required">*</span>) are required to be entered</p>
            </center>        </form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
