<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 10:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Header</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <link rel="stylesheet" href="nav.css"/>
</head>
<style>

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
    .profile-img {
        position: relative;
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        border: 0.1rem solid deeppink;
    }
    .navbar-list {
        list-style: none;
        display: flex;
        justify-content: center;
        padding: 0;
    }

    .navbar-list li {
        margin: 0 10px;
    }

    .navbar-list li a {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-decoration: none;
        transition: transform 0.2s ease;
        position: relative;
    }

    .navbar-list li a i {
     color: white;
        font-size: 20px;
        border-radius: 50%;
        padding: 10px;
        background-color: hotpink;
    }

    .navbar-list li a span {
        display: none;
        position: absolute;
        bottom: -20px;
        left: 50%;
        transform: translateX(-50%);
        background-color: #000;
        color: #fff;
        padding: 5px 10px;
        border-radius: 5px;
        font-size: 12px;
        white-space: nowrap;
    }

    .navbar-list li a:hover {
        transform: translateY(-5px);
    }

    .navbar-list li a:hover span {
        display: block;
    }
    body {
        height: 100vh;
        width: 100%;
    }
</style>
<body style="background: white">
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
        <li><a href="home" ><i class="fas fa-home"></i><span>Home</span></a></li>
        <li><a href="#" ><i class="fas fa-video"></i><span>Videos</span></a></li>
        <li><a href="#" ><i class="fas fa-trophy"></i><span>Rank</span></a></li>
        <li><a href="#"><i class="fas fa-users"></i><span>Community</span></a></li>
        <li><a href="#" ><i class="fas fa-info-circle"></i><span>About</span></a></li>
    </ul>
    <div class="profile-dropdown">
        <div onclick="toggle()" class="profile-dropdown-btn"style="height: 40px;">
<%--            Tạo một phần tử div với class CSS "profile-dropdown-btn". Đây là phần tử sẽ kích hoạt dropdown menu khi được nhấp vào. Sự kiện onclick được liên kết với hàm "toggle()" để thay đổi trạng thái của dropdown menu.--%>

    <div class="profile-img"style="background:url('${sessionScope.acc.accountDetail.avatar}'); background-size: cover;
           " >
        <i class="fa-solid fa-circle"></i>

    </div>

            <c:if test="${sessionScope.acc != null}">
        <span>
                ${sessionScope.acc.accountName}</span>
            </c:if>
<%--Sử dụng thẻ <c:if> để kiểm tra điều kiện. Trong trường hợp này, kiểm tra xem biến "sessionScope.acc" có khác null hay không. Nếu điều kiện đúng, thẻ <span> được sử dụng để hiển thị nội dung là giá trị của "sessionScope.acc.accountName".--%>
        </div>
        <ul class="profile-dropdown-list">
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole != 1}">
            <li class="profile-dropdown-list-item">
                <a href="profiles">
                    <i class="fa-regular fa-user"></i>
                     Profile
                </a>
            </li>
</c:if>

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

<%--            kiểm tra xem biến "sessionScope.acc" có khác null hay không. Nếu điều kiện đúng (tức là người dùng đã đăng nhập), thẻ <li> được sử dụng để tạo một mục trong dropdown menu với class CSS "profile-dropdown-list-item".--%>

        </ul>
</c:if>
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
</body>
</html>
