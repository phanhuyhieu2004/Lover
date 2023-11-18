<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/13/23
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <link rel="stylesheet" href="nav.css"/>
    <title>Đơn Thuê</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .hidden {
            display: none;
        }
        .container{
            width: 1200px;
            margin-left: 250px;
            margin-top: 50px;
        }
        .profile-dropdown-list-item a i {
            margin-right: 0.8rem;
            font-size: 1.1rem;
            width: 2.3rem;
            height: 2.3rem;
            background-color: deeppink;
            color: var(--white);
            line-height: 2.3rem;
            text-align: center;
            margin-right: 1rem;
            border-radius: 50%;
            transition: margin-right 0.3s;

        }
        .navbar-logo {
            cursor: pointer;


            max-height: 100%;
            max-width: 100%;
        }
    </style>
</head>
<body>
<div class="header">
    <nav class="navbar">
        <a href="home">
            <img src="Lover.png" class="navbar-logo" alt="logo"/>
        </a>

        <div class="wrap">
            <div class="search">
                <input type="text" class="searchTerm" placeholder="What are you looking for?">
                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>

        <ul class="navbar-list">
            <li><a href="home">Home</a></li>
            <li><a href="#">Videos</a></li>
            <li><a href="#">Rank</a></li>
            <li><a href="#">Community</a></li>
            <li><a href="#">About</a></li>
        </ul>
        <div class="profile-dropdown">
            <div onclick="toggle()" class="profile-dropdown-btn">
                <%--            Tạo một phần tử div với class CSS "profile-dropdown-btn". Đây là phần tử sẽ kích hoạt dropdown menu khi được nhấp vào. Sự kiện onclick được liên kết với hàm "toggle()" để thay đổi trạng thái của dropdown menu.--%>
                <div class="profile-img">
                    <i class="fa-solid fa-circle"></i>
                </div>


                <c:if test="${sessionScope.acc != null}">
        <span>
                ${sessionScope.acc.accountName}</span>
                </c:if>
                <%--Sử dụng thẻ <c:if> để kiểm tra điều kiện. Trong trường hợp này, kiểm tra xem biến "sessionScope.acc" có khác null hay không. Nếu điều kiện đúng, thẻ <span> được sử dụng để hiển thị nội dung là giá trị của "sessionScope.acc.accountName".--%>
            </div>

            <ul class="profile-dropdown-list">
                <li class="profile-dropdown-list-item">
                    <a href="profile">
                        <i class="fa-regular fa-user"></i>
                        Profile
                    </a>
                </li>


                <li class="profile-dropdown-list-item">
                    <a href="dashboard">
                        <i class="fa fa-cogs"></i>
                        Settings
                    </a>
                </li>

                <li class="profile-dropdown-list-item">
                    <a href="#">
                        <i class="fa-regular fa-circle-question"></i>
                        Help & Support
                    </a>
                </li>
                <hr/>
                <c:if test="${sessionScope.acc == null}">
                    <li class="profile-dropdown-list-item">
                        <a href="login">
                            <i class="fa fa-sign-in" aria-hidden="true"></i>
                            Login
                        </a>
                    </li>
                </c:if>
                <%--            kiểm tra xem biến "sessionScope.acc" có bằng null hay không. Nếu điều kiện đúng (tức là người dùng chưa đăng nhập), thẻ <li> được sử dụng để tạo một mục trong dropdown menu với class CSS "profile-dropdown-list-item".--%>
                <c:if test="${sessionScope.acc != null}">
                    <li class="profile-dropdown-list-item">
                        <a href="logout">
                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                            Log out
                        </a>
                    </li>
                </c:if>
                <%--            kiểm tra xem biến "sessionScope.acc" có khác null hay không. Nếu điều kiện đúng (tức là người dùng đã đăng nhập), thẻ <li> được sử dụng để tạo một mục trong dropdown menu với class CSS "profile-dropdown-list-item".--%>

            </ul>
        </div>
    </nav>
    <script>
        let profileDropdownList = document.querySelector(".profile-dropdown-list");
        // Lấy phần tử có class CSS "profile-dropdown-list" và gán cho biến profileDropdownList. Đoạn mã giả định rằng có một phần tử trong DOM có class này để thao tác với dropdown menu.
        let btn = document.querySelector(".profile-dropdown-btn");
        // Lấy phần tử có class CSS "profile-dropdown-btn" và gán cho biến btn. Đoạn mã giả định rằng có một phần tử trong DOM có class này để thao tác với nút kích hoạt dropdown menu.

        let classList = profileDropdownList.classList;
        // Lấy danh sách các lớp CSS của phần tử profileDropdownList và gán cho biến classList. Điều này cho phép thao tác với các lớp CSS của phần tử.

        const toggle = () => classList.toggle("active");
        // Định nghĩa một hàm toggle để thay đổi trạng thái của dropdown menu. Hàm này sử dụng phương thức classList.toggle để thêm hoặc xóa lớp CSS "active" từ classList của profileDropdownList. Lớp CSS "active" thường được sử dụng để hiển thị hoặc ẩn dropdown menu.

        window.addEventListener("click", function (e) {
            if (!btn.contains(e.target)) classList.remove("active");
        });
        // Đăng ký một trình nghe sự kiện "click" cho cửa sổ (window). Khi người dùng nhấp chuột bất kỳ đâu trên cửa sổ, chức năng được truyền vào sẽ được gọi. Dòng mã này kiểm tra xem phần tử được nhấp vào có chứa trong btn hay không. Nếu không, nghĩa là người dùng đã nhấp chuột bên ngoài dropdown menu, và lớp CSS "active" sẽ được xóa khỏi classList của profileDropdownList, ẩn dropdown menu.
    </script>
</div>
<div class="container">
<div class="head-page" style="display: flex; gap: 699px; padding-bottom: 15px">
    <span><b style="font-size: 25px">Rental application</b></span>
    <span><button style="width: 70px; height: 25px; margin-top: 10px"><a href="rentalList.jsp">Back</a></button></span>
</div>
<table style="font-size: 11px;">
    <tr>
        <th>Tên người thuê</th>
        <th>Địa chỉ</th>
        <th>Thời gian thuê (giờ)</th>
        <th>Thời gian bắt đầu</th>
        <th>Ngày</th>
        <th>Thành tiền</th>
        <th>Dịch vụ</th>
        <th>Trạng thái</th>
        <th>Phản hồi về người thuê</th>
        <th>Đơn</th>
    </tr>
    <tr>
        <td>Lan</td>
        <td>123 Đường ABC</td>
        <td>4</td>
        <td>09:00 - 13:00</td>
        <td>2023-11-13</td>
        <td>200,000</td>
        <td>Dọn nhà, Chở hàng</td>
        <td>Chờ phản hồi</td>
        <td>Đang chờ</td>
        <td><button id="confirm-btn-1" class="confirm-btn" data-order-id="1">Xác nhận</button></td>
    </tr>
</table>
    <div id="message"></div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $(".confirm-btn").click(function () {
            var orderId = $(this).data("order-id");

            $.ajax({
                url: "/confirm-order",
                method: "POST",
                data: { orderId: orderId },
                success: function (response) {
                    if (response.success) {
                        // Ẩn nút Xác nhận đã được nhấn
                        $("#confirm-btn-" + orderId).hide();

                        // Hiển thị thông báo
                       // $("#message").text("Người yêu mà bạn thuê đã xác nhận đơn rồi");
                    } else {
                        console.error("Lỗi khi xác nhận đơn");
                    }
                },
                error: function () {
                    console.error("Lỗi khi gửi yêu cầu xác nhận đơn");
                }
            });
        });
    });
</script>
</body>
</html>