<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 12:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Manager Service Producer</title>
    <title>User Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="manager.css">
</head>
<style>
    table {
        background: papayawhip;
        padding: 1rem;
        text-align: left;

        border: 5px solid deeppink;
        width: 80%;
        height: 70%;
        margin-right: 30px ;
        margin-left: 10px;
        border-image-slice: 80;
    }
    table td, th{
        padding: 0.2rem 0.8rem;
        border-bottom: 1px solid deeppink;
        border-right: 1px solid deeppink;
    }
    table th{
        font-size: 15px;
    }
    table td{
        font-size: 15px;
    }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>


<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav>
        <div class="side_navbar">
            <span>Main Menu</span>
            <a href="listUser" >User Manager</a>
            <a href="listServiceProviders"class="active">Service Provider</a>
            <a href="#">Profile</a>
            <a href="#">My Account</a>
            <a href="#">Account</a>
            <div class="links">
                <span>Connect</span>
                <a href="#">Facebook</a>
                <a href="#">Zalo</a>
                <a href="#">Instagram</a>
            </div>
        </div>
    </nav>
    <div class="main-body" style="margin-right: 130px">

        <div class="search-filter">
            <select>
                <option selected value="0">Status</option>
                <option value="1">Active</option>
                <option value="2">Inactive</option>
                <option value="3">Block</option>
                <option value="4">VIP</option>
            </select>
            <button class="search"><i class="fas fa-search"></i></button>
        </div>


        <div class="table info" >
            <table >
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Account Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>
                    <th>Surname</th>
                    <th>Name</th>
                    <th>Nick Name</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ CSDL -->
                <c:forEach var="b" items="${listServiceProviders}">
                    <tr>
                        <td>${b.idAccount}</td>
                        <td>${b.accountName}</td>
                        <td>${b.email}</td>
                        <td>${b.phoneNumber}</td>
                        <td>${b.identifyCard}</td>
                        <td>${b.surname}</td>
                        <td>${b.name}</td>
                        <td>${b.nickName}</td>
                        <td>${b.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
