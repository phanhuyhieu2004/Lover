<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/2/2023
  Time: 1:49 PM
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
    .block-btn {
        background-color: #cf3a35; /* Màu đỏ */
        border: none;
        border-radius: 5px;
        color: #fff; /* Màu chữ trắng */
        font-size: 10px;
        font-weight: bold;
        padding: 8px 16px;
        text-transform: uppercase; /* Chữ in hoa */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* Đổ bóng */
        transition: all 0.3s ease; /* Hiệu ứng chuyển động */

    }

    .block-btn:hover {
        background-color: #e74b48; /* Màu đỏ sáng */
        cursor: pointer;
        box-shadow: 0 4px 9px rgba(0, 0, 0, 0.5); /* Hiệu ứng đổ bóng lớn hơn */
    }

    table {
        background: papayawhip;
        padding: 1rem;
        text-align: left;

        border: 5px solid deeppink;
        width: 500px;
        height: 70%;
        margin-right: 40px;
        margin-left: 30px;

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



    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 200px;
    }
    .container{
        margin-top: 40px;
        margin-bottom: 40px;
        display: flex;
        justify-content: space-between;
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

            <c:if test="${sessionScope.acc != null && sessionScope.acc.accountName == 'Admin' && sessionScope.acc.password == '12345' }">
                <a href="listAccount"><i class="fa-solid fa-list"></i><span
                        class="menu-text">Manager</span></a>

                <a href="status" class="active">Status Manager</a>

            </c:if>
            <c:if test="${sessionScope.acc.accountName != 'Admin' }">

                <a href="information"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information</span></a>
            </c:if>
            <c:if test="${sessionScope.acc.accountName != 'Admin' }">

                <a href="service" > <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Services</span></a>
            </c:if>
            <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
            <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
            <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>
        </div>
    </nav>
    <div class="main-body" style="margin-right: 130px">

        <center><p>You can filter the list and account status here</p></center>
        <div class="search-filter">
            <select id="tableSelect">

                <option selected value="0">Active List</option>
                <option value="1">Block List</option>
                <option value="2"> Inactive List</option>
                <option value="3">Vip List</option>
            </select>

            <button id="searchButton" class="search"><i class="fas fa-search"></i></button>
        </div>


        <div class="table info">
            <table id="allActive">
                <thead>
                <tr>
                    <th>STT</th>

                    <th>Nick Name</th>
                    <th>Account Name</th>
                    <th style="text-align: center">Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>

                    <th>Status</th>


                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="active" items="${listAccountActive}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>

                        <td>${active.nickName}</td>
                        <td>${active.accountName}</td>
                        <td>${active.email}</td>
                        <td>${active.phoneNumber}</td>
                        <td>${active.identifyCard}</td>

                        <td >${active.status}</td>

                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <table id="allBlock">
                <thead>
                <tr>
                    <th>STT</th>

                    <th>Nick Name</th>
                    <th>Account Name</th>
                    <th style="text-align: center">Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>

                    <th>Status</th>


                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="block" items="${listAccountBlock}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>

                        <td>${block.nickName}</td>
                        <td>${block.accountName}</td>
                        <td>${block.email}</td>
                        <td>${block.phoneNumber}</td>
                        <td>${block.identifyCard}</td>

                        <td >${block.status}</td>

                    </tr>

                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <table id="allInactive">
                <thead>
                <tr>
                    <th>STT</th>

                    <th>Nick Name</th>
                    <th>Account Name</th>
                    <th style="text-align: center">Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>

                    <th>Status</th>

                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="inactive" items="${listAccountInactive}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>

                        <td>${inactive.nickName}</td>
                        <td>${inactive.accountName}</td>
                        <td>${inactive.email}</td>
                        <td>${inactive.phoneNumber}</td>
                        <td>${inactive.identifyCard}</td>
                        <td>${inactive.status}</td>


                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <table id="allVip">
                <thead>
                <tr>
                    <th>STT</th>

                    <th>Nick Name</th>
                    <th>Account Name</th>
                    <th style="text-align: center">Email</th>
                    <th>Phone Number</th>
                    <th>Identify Card</th>
                    <th>Role</th>

                    <th>Status</th>


                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="vip" items="${listAccountVip}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${vip.nickName}</td>
                        <td>${vip.accountName}</td>
                        <td>${vip.email}</td>
                        <td>${vip.phoneNumber}</td>
                        <td>${vip.identifyCard}</td>
                        <td>Service Providers</td>


                        <td >${vip.status}</td>

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
        var activeTable = document.getElementById("allActive"); // Thêm biến activeTable
        var blockTable = document.getElementById("allBlock"); // Thêm biến blockTable
        var inactiveTable = document.getElementById("allInactive"); // Thêm biến inactiveTable
        var vipTable = document.getElementById("allVip"); // Thêm biến vipTable

        // - Lấy tham chiếu đến phần tử có các ID  trong DOM và lưu trữ trong các biến.


        if (activeTable) {
            activeTable.style.display = "table";
        }
        if (blockTable) {
            blockTable.style.display = "none";
        }
        if (inactiveTable) {
            inactiveTable.style.display = "none";
        }
        if (vipTable) {
            vipTable.style.display = "none";
        }
        document.getElementById("searchButton").addEventListener("click", function () {
            // Đăng ký một trình lắng nghe sự kiện "click" trên phần tử có ID là "searchButton". Khi sự kiện này xảy ra (người dùng nhấp vào nút tìm kiếm), hàm callback được thực thi.
            var select = document.getElementById("tableSelect");
            // Lấy tham chiếu đến phần tử <select> có ID là "tableSelect" trong DOM và lưu trữ trong biến select.
            var selectedIndex = select.selectedIndex;
            // Lấy chỉ mục (index) của lựa chọn được chọn hiện tại trong phần tử <select> và lưu trữ trong biến selectedIndex.

            if (selectedIndex === 1) {
                blockTable.style.display = "table";

                activeTable.style.display = "none";
                inactiveTable.style.display = "none";
                vipTable.style.display = "none";

            } else if (selectedIndex === 2) {
                inactiveTable.style.display = "table";

                activeTable.style.display = "none";
                blockTable.style.display = "none";
                vipTable.style.display = "none";
            } else if (selectedIndex === 3) {
                vipTable.style.display = "table";

                activeTable.style.display = "none";
                blockTable.style.display = "none";
                inactiveTable.style.display = "none";


            } else {
                activeTable.style.display = "table";
                blockTable.style.display = "none";
                inactiveTable.style.display = "none";
                vipTable.style.display = "none";

            }
        });
    });

</script>
</body>
</html>

