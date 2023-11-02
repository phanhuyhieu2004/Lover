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
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" href="register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    .alert-warning {
        background-color: #ff0000;
        margin: 5px;
        border-radius: 5px;

    }

    .alert-success {
        background-color: #9bff00;
        margin: 5px;
        border-radius: 5px;
    }
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">
    <%--    một phần tử chứa các phần tử khác trong nội dung trang web.--%>

    <div class="form-container register-container">
        <%--        một phần tử chứa form đăng ký.--%>
        <form action="register" method="post">
            <%--            Khi người dùng gửi form, nó sẽ được gửi đến đường dẫn "signup" bằng phương thức POST.--%>
            <h1>Register </h1>
            <p class=" alert-warning" style="color: white">${messWarning}</p>
            <%--    chứa một biến ${messWarning}, được giả định là một biến được định nghĩa và chứa một thông báo cảnh báo--%>
            <%--    ${} được sử dụng để đánh dấu một biểu thức hoặc một biến để thực hiện thay thế giá trị tương ứng vào trong chuỗi hoặc nội dung mã HTML.--%>
            <a href="login" class=" alert-success">${messSuccess}</a>

            <div class="input-row">
                <input type="text" name="accountName" placeholder="Username" required>
                <input type="password" name="password"
                       placeholder="Password " required
                       pattern="^.{6,15}$"
                       title="Please need to be between 6 and 15 characters long.">
                <%--                <input> mật khẩu  có một biểu thức chính quy (pattern="^.{6,15}$") và một tiêu đề (title) để hiển thị thông báo khi người dùng nhập sai định dạng.--%>


            </div>
            <input type="email" id="email-input" placeholder="Email@address.com" name="email" required/>
            <div class="input-row">
                <input type="tel" name="phoneNumber" placeholder="Phone Number" required>
                <input type="text" name="identifyCard" placeholder="Identify Card" required>
            </div>
            <div class="input-row">
                <input type="text" name="surname" placeholder="Surname" required>
                <input type="text" name="name" placeholder="Name" required>
            </div>
            <input type="text" name="nickName" placeholder="Nickname" required>
            Who do you want to be
            <div class="role">
                <input type="radio" name="role" value="2" size="5"><div style="padding: 5px; padding-right: 15px; padding-left: 0px"><label>Service</label></div>
                <input type="radio" name="role" value="3"><div style="padding: 5px; padding-left: 0px"><label>User</label></div>
            </div>
            <button type="submit" value="Save">Register</button>
            <div class="signup-link">Already have an account? <a href="login" style="font-size: medium; color: #4bb6b7">Login
                now</a></div>

        </form>
    </div>


</div>
</body>
</html>
