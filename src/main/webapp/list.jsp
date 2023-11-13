<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/11/2023
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="table info">
    <table id="userTable">
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
            <th style="text-align: center"></th>
        </tr>
        </thead>
        <tbody>
        <!-- Dữ liệu từ danh sách người dùng -->

        <c:forEach var="user" items="${listAccountDetail}" varStatus="loop">
        <tr>
            <td>${loop.index + 1}</td>

            <td>${user.fullName}</td>
            <td>${user.gender}</td>
            <td>${user.interest}</td>
            <td>${user.numberOfRentals}</td>


            </c:forEach>
            <!-- Kết thúc vòng lặp danh sách người dùng -->
        </tbody>
    </table>
   
    <!-- Bảng thứ hai -->


</div>
</body>
</html>
