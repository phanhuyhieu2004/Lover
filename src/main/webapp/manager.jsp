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
        margin-right: 30px;
        margin-left: 10px;
        border-image-slice: 80;
    }

    table td, th {
        padding: 0.2rem 0.8rem;
        border-bottom: 1px solid deeppink;
        border-right: 1px solid deeppink;
    }

    table th {
        font-size: 15px;
    }

    table td {
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
            <c:if test="${sessionScope.acc != null && sessionScope.acc.accountName == 'Admin' && sessionScope.acc.password == '12345' }">
                <a href="listAccount" class="active"> Account Manager</a>
            </c:if>
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
            <select id="tableSelect">
                <option selected value="0">List All</option>
                <option value="1">User List</option>
                <option value="2">Service List</option>
            </select>
            <button id="searchButton" class="search"><i class="fas fa-search"></i></button>
        </div>


        <div class="table info">
            <table id="userTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Surname</th>
                    <th>Name</th>
                    <th>Nick Name</th>
                    <th>Account Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>

                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách người dùng -->
                <c:forEach var="user" items="${listUser}">
                    <tr>
                        <td>${user.idAccount}</td>
                        <td>${user.surname}</td>
                        <td>${user.name}</td>
                        <td>${user.nickName}</td>
                        <td>${user.accountName}</td>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.identifyCard}</td>

                        <td>${user.status}</td>
                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách người dùng -->
                </tbody>
            </table>

            <!-- Bảng thứ hai -->
            <table id="serviceTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Surname</th>
                    <th>Name</th>
                    <th>Nick Name</th>
                    <th>Account Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>

                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách nhà cung cấp dịch vụ -->
                <c:forEach var="provider" items="${listServiceProviders}">
                    <tr>
                        <td>${provider.idAccount}</td>
                        <td>${provider.surname}</td>
                        <td>${provider.name}</td>
                        <td>${provider.nickName}</td>
                        <td>${provider.accountName}</td>
                        <td>${provider.email}</td>
                        <td>${provider.phoneNumber}</td>
                        <td>${provider.identifyCard}</td>

                        <td>${provider.status}</td>
                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <%--            bảng thứ 3--%>
            <table id="allTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Surname</th>
                    <th>Name</th>
                    <th>Nick Name</th>
                    <th>Account Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>

                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách nhà cung cấp dịch vụ -->
                <c:forEach var="all" items="${listAllAccount}">
                    <tr>
                        <td>${all.idAccount}</td>
                        <td>${all.surname}</td>
                        <td>${all.name}</td>
                        <td>${all.nickName}</td>
                        <td>${all.accountName}</td>
                        <td>${all.email}</td>
                        <td>${all.phoneNumber}</td>
                        <td>${all.identifyCard}</td>

                        <td>${all.status}</td>
                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var allTable = document.getElementById("allTable");
        var userTable = document.getElementById("userTable");
        var serviceTable = document.getElementById("serviceTable");

        if (allTable) {
            allTable.style.display = "table";
        }

        if (userTable) {
            userTable.style.display = "none";
        }

        if (serviceTable) {
            serviceTable.style.display = "none";
        }

        document.getElementById("searchButton").addEventListener("click", function () {
            var select = document.getElementById("tableSelect");
            var selectedIndex = select.selectedIndex;

            if (selectedIndex === 1) {
                userTable.style.display = "table";
                serviceTable.style.display = "none";
                allTable.style.display = "none";
            } else if (selectedIndex === 2) {
                serviceTable.style.display = "table";
                userTable.style.display = "none";
                allTable.style.display = "none";
            } else {
                allTable.style.display = "table";
                userTable.style.display = "none";
                serviceTable.style.display = "none";
            }
        });
    });
</script>
</body>
</html>
