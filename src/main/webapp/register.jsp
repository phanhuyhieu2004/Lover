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
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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

    }
    .role input[type=radio] {
        margin-right: 10px;
    }
    .role label {
        margin-right: 10px;
    }
    button {
        position: relative;
        border-radius: 20px;
        border: 1px solid hotpink;
        background-color: hotpink;
        color: #fff;
        font-size: 15px;
        font-weight: 700;
        margin: 10px;
        padding: 12px 80px;
        letter-spacing: 1px;
        text-transform: capitalize;
        transition: 0.3s ease-in-out;
        cursor: pointer;
    }
    a:hover {
        color: pink;
    }
    .content input {
        accent-color: deeppink;
        width: 12px;
        height: 12px;
    }
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">
<%--    một phần tử chứa các phần tử khác trong nội dung trang web.--%>

    <div class="form-container register-container">
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
        <label>Service</label>
        <input type="radio" name="role" value="service" required>
        <label>User</label>
        <input type="radio" name="role" value="user" required>
    </div>


    <button type="submit" value="Save">Register</button>
    <div class="signup-link"style="margin-bottom: 15px;">Already have an account ? <a href="login" style="font-size: medium; color: deeppink">Login
        now</a></div>
        </form>

    </div>




</div>
</body>
</html>
