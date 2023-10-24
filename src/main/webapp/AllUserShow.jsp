<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: gabyg
  Date: 10/24/2023
  Time: 12:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Show All Users</title>
</head>
<body>
<main>
    <h1>List User  </h1>

    <div class="table">
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Status</th>
                <th>Role</th>
            </tr>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td>${user.idUser}</td>
                    <td>${user.userName}</td>
                    <td>${user.password}</td>
                    <td>${user.email}</td>
                    <td>${user.phoneNumber}</td>
                    <td>${user.status}</td>
                    <td>${user.getIdRole()}</td>
                    <td><a href="home?action=block&id=${user.idUser}"><i class="bi bi-ban"></i></a></td>

                </tr>
            </c:forEach>
            <td><a href="${pageContext.request.contextPath}/show?action=ccdv&id=${user.idRole}">CCVD</a></td>
        </table>
    </div>
</main>
</body>
</html>
