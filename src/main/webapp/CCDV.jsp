<%--
  Created by IntelliJ IDEA.
  User: gabyg
  Date: 10/24/2023
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CCDV</title>
</head>
<body>
<main>
    <h1>List User  </h1>

    <div class="table">
        <table>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Identify Card</th>

            </tr>
            <c:forEach var="ccdv" items="${ccdv}">
                <tr>
                    <td>${ccdv.idUser}</td>
                    <td>${ccdv.userName}</td>
                    <td>${ccdv.email}</td>
                    <td>${ccdv.phoneNumber}</td>
                    <td>${ccdv.identifyCard}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
</main>
</body>
</html>
