<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/26/2023
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lover</title>
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
    <link rel="icon" type="image/png" href="https://cdn.alongwalk.info/vn/wp-content/uploads/2023/04/19040211/89-hinh-anh-hoa-cam-tu-cau-dep-nhieu-mau-sac-day-suc-song1681826531.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Sen:wght@700&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="reset.css">

    <link rel="stylesheet" href="common.css">

    <link rel="stylesheet" href="register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    .alert-warning {
        background-color: #ff0000;
        margin: 5px;
        border-radius: 5px;
        color: white;

    }


    .role{
        display: flex;
        justify-content: center;
        align-items: center;

    }
    .role input[type=radio] {
        margin-right: 10px;
    }
    .role label {
        margin-right: 10px;
    }
    a:hover {
        color: pink;
    }
    .content input {
        accent-color: hotpink;
        width: 12px;
        height: 12px;
    }
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">
<%--    một phần tử chứa các phần tử khác trong nội dung trang web.--%>

<%--        một phần tử chứa form đăng ký.--%>
        <form  action="register" method="post">
<%--            Khi người dùng gửi form, nó sẽ được gửi đến đường dẫn "signup" bằng phương thức POST.--%>
            <h1>Register </h1>
            <p class=" alert-warning" style="color: white" >${messWarning}</p>
<%--    chứa một biến ${messWarning},  chứa một thông báo cảnh báo--%>
<%--    ${} được sử dụng để đánh dấu một biểu thức hoặc một biến để thực hiện thay thế giá trị tương ứng vào trong chuỗi hoặc nội dung mã HTML.--%>


            <div class="input-row">
                <input type="text" name="accountName" placeholder="Account name" required>
                <input type="password" name="password"
                       placeholder="Password " required
                       pattern="^.{6,15}$"
                       title="Please need to be between 6 and 15 characters long.">
<%--                <input> mật khẩu  có một biểu thức chính quy (pattern="^.{6,15}$") và một tiêu đề (title) để hiển thị thông báo khi người dùng nhập sai định dạng.--%>


            </div>
            <input type="email" id="email-input" placeholder="Email@address.com" name="email" required/>
            <div class="input-row">
                <input type="tel" name="phoneNumber" placeholder="Phone number" required>
                <input type="text" name="identifyCard" placeholder="Identify card" required>
            </div>
            <div class="input-row">
                <input type="text" name="surname" placeholder="Surname" required>
                <input type="text" name="name" placeholder="Name" required>
            </div>
            <input type="text" name="nickName" placeholder="Nickname" required>
    Who do you want to be :
    <div class="role">
        <label>Service </label>
        <input type="radio" name="role" value="service" required>
        <label>User</label>
        <input type="radio" name="role" value="user" required>
    </div>


    <button class="btn btn-register" type="submit" value="Save">Register</button>
    <div class="signup-link" style="margin-bottom: 15px;padding: 10px 0;">Already have an account ? <a href="login"class="login-link" style="color: hotpink">Login
        now</a></div>
        </form>





</div>

</body>
</html>
