<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>

    <title>User Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="manager.css">
    <link rel="stylesheet" href="homes.css"/>
</head>
<style>
    .menu-text {
        margin-left: 10px;
    }

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
        margin-right: 30px;
        margin-left: 10px;

    }
    table {
        width: 110%; /* Đảm bảo bảng chiếm toàn bộ kích thước của phần tử chứa nó */
        table-layout: fixed; /* Cố định kích thước cột */
    }
    table td, th {
        padding: 0.2rem 0.8rem;
        border-bottom: 1px solid deeppink;
        border-right: 1px solid deeppink;
    }
    table th,
    table td {
        width: 20%; /* Đặt kích thước cố định cho tất cả các cột (ở đây là 10%) */
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
        width: 210px;
    }

    .container {
        margin-top: 40px;
        margin-bottom: 40px;
        display: flex;
        justify-content: space-between;
    }
    .sticky-nav {
        position: sticky;
        top: 0;
        z-index: 100;
    }
    .sticky-row {
        position: sticky;
        top: 0;
        background-color: #fff;
    }
</style>
<body style="background: white">

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav class="sticky-nav" style="background-color: #FFE4E1;height: 100%;";>

        <div class="side_navbar">
            <a href="dashboard">  <i class="fa-solid fa-grip"></i><span class="menu-text">Dashboard</span></a>

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">
                <a href="list" class="active"><i class="fa-solid fa-list"></i><span class="menu-text">List manager</span></a>
                <a href="listStatus"><i class="fa-regular fa-rectangle-list"></i><span class="menu-text">Status manager</span></a>
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
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="serviceList" > <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Service List</span></a>
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
    <div class="main-body" style="margin-right: 130px">

        <center><p>You can filter the list and search by account name here</p></center>
        <div class="search-filter">
            <select id="tableSelect" name="optionList" onchange="display()">
                <%--                Giá trị của option này là "serviceProviders" và hiển thị trên giao diện là "Service List". "${select eq 'serviceProviders' ? 'selected': '' }" kiểm tra nếu giá trị của biến "select" bằng "serviceProviders" thì thêm thuộc tính "selected" vào option này, nghĩa là option này sẽ được chọn mặc định trong select.--%>
                    <option value="serviceProviders" data-display="serviceProviders" ${select eq 'serviceProviders' ? 'selected': '' } >Service List</option>

                <option value="account" data-display="account" ${select eq 'account' ? 'selected': '' } >All Account List</option>

                <option value="user" data-display="user" ${select eq 'user' ? 'selected': '' }>User List</option>
            </select>
                    <form action="searchAccount" method="post" style="display: flex;margin-left: 100px;">

                    <input class="custom-input btn btn-outline-danger" type="text" id="nameplayer" name="searchFullName"
                   placeholder="Account Name" value="${searchFullName}" style="border: 0.1rem solid deeppink;">
            <button id="searchButton" class="search" style="margin-top: 5px;"><i class="fas fa-search"></i></button>
                    </form>
            <%--            nhấp chuột vào nút sẽ gọi hàm "display()" của JS--%>
        </div><div class="table info">
<c:choose>
    <c:when test="${empty listAccountRole}">
        <p style="text-align: center;">The account's Account Name could not be found</p>
    </c:when>
    <c:otherwise>
        <table id="dynamicTable" style="margin-left: 15px;" >
            <thead>
            <tr class="sticky-row">
                <th style="text-align: center">STT</th>
                <th style="width: 40%;">Nick Name</th>
                <th style="width: 50%;text-align: center;">Account Name</th>
                <th style="text-align: center;width: 100%;">Email</th>
                <th style="width: 50%;text-align: center;">Phone Number</th>
                <th style="width: 50%;text-align: center;">Identify Card</th>
                <th style="width: 40%;">Status</th>
                <th  style="width: 65%;text-align: center;">Role</th>

                <th style="text-align: center;width: 50%">Block</th>
            </tr>
            </thead>
            <tbody>
            <!-- Dữ liệu từ danh sách nhà cung cấp dịch vụ hoặc danh sách người dùng -->
            <c:forEach var="list" items="${listAccountRole}" varStatus="loop">
                <tr>
                    <td>${loop.index + 1}</td>
                    <td>${list.nickName}</td>
                    <td>${list.accountName}</td>
                    <td>${list.email}</td>
                    <td>${list.phoneNumber}</td>
                    <td>${list.identifyCard}</td>
                    <td id="status_${list.idAccount}">${list.status}</td>
                    <td >${list.role.roleName}</td>
                    <td>
                        <button class="block-btn" style="margin-left: 10px;" onclick="blockAccount('${list.idAccount}')">Block</button>
                            <%--                            hàm JS "blockAccount()" sẽ được gọi và truyền giá trị của biến "list.idAccount" vào như một tham số.Cụ thể là khi bấm vào nút block thì sẽ lấy được id của tài khoản muốn block và xử lý trong hàm bên JS
                            --%>

                    </td>
                </tr>
            </c:forEach>

            </tbody>

        </table>
    </c:otherwise>
</c:choose>
    </div>


    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>


    document.addEventListener("DOMContentLoaded", function() {
        var select = document.getElementById("tableSelect");
        select.addEventListener("change", function() {
            var selectedValue = select.value;
            var url = "list?optionList=" + encodeURIComponent(selectedValue);
            window.location.href = url;
        });
    });

    // Truyền tham số là id của tài khocần chặn đã lấy ở trên
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
        // Gửi yêu cầu POST với nội dung là 'id=' + id, trong đó id là giá trị của tham số "id". Lập tức gửi yêu cầu chặn tài khoản với ID tương ứng sang bên servlet có đường dẫn là 'BlockAccountServlet'
    }
</script>


</body>
</html>
