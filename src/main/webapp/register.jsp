<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 10/20/23
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Đăng ký</title>
</head>
<body>
<h2>Đăng ký</h2>
<form action="register" method="post">
  Tên: <input type="text" name="username"><br>
  Email: <input type="text" name="email"><br>
  Mật khẩu: <input type="password" name="password"><br>
  <input type="submit" value="Đăng ký">
</form>
</body>
</html>
