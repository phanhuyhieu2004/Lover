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
    .block-btn {
        background-color: #cf3a35; /* Màu đỏ */
        border: none;
        border-radius: 5px;
        color: #fff; /* Màu chữ trắng */
        font-size: 14px;
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
        width: 50%;
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

    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 150px;

    }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav>

        <div class="side_navbar">
            <span> Menu</span>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.accountName == 'Admin' && sessionScope.acc.password == '12345' }">
                <a href="listAccount" class="active"> Manager</a>
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

<center><p>You can filter the list and account status here</p></center>
        <div class="search-filter">
            <select id="tableSelect">
                <option selected value="0">List All Account</option>
                <option value="1">User List</option>
                <option value="2">Service List</option>
                <option value="3">Active List</option>
                <option value="4">Block List</option>
                <option value="5"> Inactive List</option>
                <option value="6">Vip List</option>
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
                    <th>Block</th>
                </tr>
                </thead>
                <tbody>
                <!-- Dữ liệu từ danh sách tất cả account -->
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

                        <td id="status_${all.idAccount}">${all.status}</td>
                        <td>
                            <button class="block-btn" onclick="blockAccount('${all.idAccount}')">Block</button>
                        </td>
                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <table id="allActive">
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
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="active" items="${listAccountActive}">
                    <tr>
                        <td>${active.idAccount}</td>
                        <td>${active.surname}</td>
                        <td>${active.name}</td>
                        <td>${active.nickName}</td>
                        <td>${active.accountName}</td>
                        <td>${active.email}</td>
                        <td>${active.phoneNumber}</td>
                        <td>${active.identifyCard}</td>

                        <td>${active.status}</td>
                        </td>
                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <table id="allBlock">
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
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="block" items="${listAccountBlock}">
                    <tr>
                        <td>${block.idAccount}</td>
                        <td>${block.surname}</td>
                        <td>${block.name}</td>
                        <td>${block.nickName}</td>
                        <td>${block.accountName}</td>
                        <td>${block.email}</td>
                        <td>${block.phoneNumber}</td>
                        <td>${block.identifyCard}</td>

                        <td>${block.status}</td>
                        </td>
                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <table id="allInactive">
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
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="inactive" items="${listAccountInactive}">
                    <tr>
                        <td>${inactive.idAccount}</td>
                        <td>${inactive.surname}</td>
                        <td>${inactive.name}</td>
                        <td>${inactive.nickName}</td>
                        <td>${inactive.accountName}</td>
                        <td>${inactive.email}</td>
                        <td>${inactive.phoneNumber}</td>
                        <td>${inactive.identifyCard}</td>

                        <td>${inactive.status}</td>
                        </td>
                    </tr>
                </c:forEach>
                <!-- Kết thúc vòng lặp danh sách nhà cung cấp dịch vụ -->
                </tbody>
            </table>
            <table id="allVip">
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
                <!-- Dữ liệu từ danh sách tất cả account -->
                <c:forEach var="vip" items="${listAccountVip}">
                    <tr>
                        <td>${vip.idAccount}</td>
                        <td>${vip.surname}</td>
                        <td>${vip.name}</td>
                        <td>${vip.nickName}</td>
                        <td>${vip.accountName}</td>
                        <td>${vip.email}</td>
                        <td>${vip.phoneNumber}</td>
                        <td>${vip.identifyCard}</td>

                        <td>${vip.status}</td>
                        </td>
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
        var activeTable = document.getElementById("allActive"); // Thêm biến activeTable
        var blockTable = document.getElementById("allBlock"); // Thêm biến blockTable
        var inactiveTable = document.getElementById("allInactive"); // Thêm biến inactiveTable
        var vipTable = document.getElementById("allVip"); // Thêm biến vipTable

        // - Lấy tham chiếu đến phần tử có các ID  trong DOM và lưu trữ trong các biến.

        if (allTable) {
            allTable.style.display = "table";
        }
        // Kiểm tra xem phần tử allTable có tồn tại hay không. Nếu tồn tại, thiết lập kiểu hiển thị của nó thành "table" để hiển thị phần tử này trên trang.

        if (userTable) {
            userTable.style.display = "none";
        }
        // Kiểm tra xem phần tử userTable có tồn tại hay không. Nếu tồn tại, thiết lập kiểu hiển thị của nó thành "none" để ẩn phần tử này.

        if (serviceTable) {
            serviceTable.style.display = "none";
        }
        if (activeTable) {
            activeTable.style.display = "none";
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
                userTable.style.display = "table";
                serviceTable.style.display = "none";
                allTable.style.display = "none";
                activeTable.style.display = "none";
                blockTable.style.display = "none";
                inactiveTable.style.display = "none";
                vipTable.style.display = "none";
            } else if (selectedIndex === 2) {
                serviceTable.style.display = "table";
                userTable.style.display = "none";
                allTable.style.display = "none";
                activeTable.style.display = "none";
                blockTable.style.display = "none";
                inactiveTable.style.display = "none";
                vipTable.style.display = "none";
            } else if (selectedIndex === 3) {
                activeTable.style.display = "table";
                userTable.style.display = "none";
                serviceTable.style.display = "none";
                allTable.style.display = "none";
                blockTable.style.display = "none";
                inactiveTable.style.display = "none";
                vipTable.style.display = "none";
            } else if (selectedIndex === 4) {
                blockTable.style.display = "table";
                userTable.style.display = "none";
                serviceTable.style.display = "none";
                allTable.style.display = "none";
                activeTable.style.display = "none";
                inactiveTable.style.display = "none";
                vipTable.style.display = "none";
            } else if (selectedIndex === 5) {
                inactiveTable.style.display = "table";
                userTable.style.display = "none";
                serviceTable.style.display = "none";
                allTable.style.display = "none";
                activeTable.style.display = "none";
                blockTable.style.display = "none";
                vipTable.style.display = "none";
            } else if (selectedIndex === 6) {
                vipTable.style.display = "table";
                userTable.style.display = "none";
                serviceTable.style.display = "none";
                allTable.style.display = "none";
                activeTable.style.display = "none";
                blockTable.style.display = "none";
                inactiveTable.style.display = "none";
            } else {
                allTable.style.display = "table";
                userTable.style.display = "none";
                serviceTable.style.display = "none";
                activeTable.style.display = "none";
                blockTable.style.display = "none";
                inactiveTable.style.display = "none";
                vipTable.style.display = "none";
            }
        });
    });

    function blockAccount(id) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'BlockAccountServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // Xử lý dữ liệu trả về nếu cần

                // Cập nhật trạng thái của cột "status" thành "block"
                var statusCell = document.getElementById(`status_${id}`);
                if (statusCell) {
                    statusCell.textContent = 'block';
                }

                // Tải lại trang
                location.reload();
            }
        };
        xhr.onerror = function () {
            console.error('Error blocking account.');
        };
        xhr.send('id=' + id);
    }
</script>
</body>
</html>
