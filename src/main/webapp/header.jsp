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
    <title>Lover</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <link rel="icon" type="image/png" href="https://cdn.alongwalk.info/vn/wp-content/uploads/2023/04/19040211/89-hinh-anh-hoa-cam-tu-cau-dep-nhieu-mau-sac-day-suc-song1681826531.jpg">
    <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="manifest" href="favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Sen:wght@700&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="reset.css">

    <link rel="stylesheet" href="common.css">

    <link rel="stylesheet" href="nav.css"/>
</head>
<style>

    .profile-dropdown-list-item a i {
        margin-right: 0.8rem;
        font-size: 1.1rem;
        width: 2.3rem;
        height: 2.3rem;
        background-color: hotpink;
        color: var(--white);
        line-height: 2.3rem;
        text-align: center;
        border-radius: 50%;
        transition: margin-right 0.3s;

    }
    .navbar-logo {
        cursor: pointer;

        max-width: 100px;
        width: 100px;
    }
    .profile-img {
        position: relative;
        width: 3rem;
        height: 3rem;
        border-radius: 50%;
        border: 0.1rem solid white;
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

</style>
<body style="background: white">
<header >
    <div class="container">
        <nav class="navbar">

            <c:if test="${sessionScope.acc != null}">

                <a href="home">
                    <img src="./favicon/snapedit_1728473669221.png" class="navbar-logo" alt="logo"/>
                </a>
            </c:if>
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

                    <c:choose>
                        <c:when test="${sessionScope.acc.accountDetail.avatar != null && !sessionScope.acc.accountDetail.avatar.isEmpty()}">
                            <div class="profile-img" style="background: url('${sessionScope.acc.accountDetail.avatar}'); background-size: cover;">
                                <i class="fa-solid fa-circle"></i>

                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="profile-img" style="background: url('https://cdn-icons-png.flaticon.com/512/9703/9703596.png'); background-size: cover;">
                                <i class="fa-solid fa-circle"></i>

                            </div>
                        </c:otherwise>
                    </c:choose>



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
                    <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">

                        <li class="profile-dropdown-list-item">
                            <a href="list">
                                <i class="fa fa-cogs"></i>
                                Settings
                            </a>
                        </li>

                    </c:if>
                    <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                        <li class="profile-dropdown-list-item">
                            <a href="serviceProviderInformation">
                                <i class="fa fa-cogs"></i>
                                Settings
                            </a>
                        </li>
                        <li class="menu profile-dropdown-list-item">
                            <a href="serviceCategory">
                                <i class="fa-solid fa-bars"></i>
                                Service
                            </a>
                        </li>
                        <li class="menu profile-dropdown-list-item">
                            <a href="accountService">
                                <i class="fa-solid fa-list"></i>
                                My Service
                            </a>
                        </li>
                        <li class="menu profile-dropdown-list-item">
                            <a href="rentListAccount">
                                <i class="fa-solid fa-gears"></i>                                Tenant history
                            </a>
                        </li>

                    </c:if>
                    <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 3}">

                        <li class="profile-dropdown-list-item">
                            <a href="userInformation">
                                <i class="fa fa-cogs"></i>
                                Settings
                            </a>
                        </li>
                        <li class="menu profile-dropdown-list-item">
                            <a href="addMoney">
                                <i class="fa-solid fa-circle-dollar-to-slot"></i>
                                Deposit money
                            </a>
                        </li>
                        <li class="menu profile-dropdown-list-item">
                            <a href="rentalList">
                                <i class="fa-solid fa-gears"></i>
                                List of service providers

                            </a>
                        </li>

                    </c:if>

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
    </div>
</header>
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
