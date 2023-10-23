<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>

    <title>User Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="manager.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
    <nav>
        <div class="side_navbar">
            <span>Main Menu</span>
            <a href="#" class="active">User Manager</a>
            <a href="serviceProducer.jsp">Service Provider</a>
            <a href="#">Profile</a>
            <a href="#">My Account</a>
            <a href="#">Account</a>
            <div class="links">
                <span>Connect</span>
                <a href="#">Facebook</a>
                <a href="#">Zalo</a>
                <a href="#">Instagram</a>
            </div>
        </div>
    </nav>
    <div class="main-body">


        <div class="search-filter">
            <select>
                <option selected value="0">Status</option>
                <option value="1">Active</option>
                <option value="2">Inactive</option>
                <option value="3">Block</option>
            </select>
            <button class="search"><i class="fas fa-search"></i></button>
        </div>


        <div class="table info">

            <table>
                <thead>
                <tr>
                    <th>#</th>
                    <th>Dates</th>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Ammount</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>2, Aug, 2022</td>
                    <td>Sam Tonny</td>
                    <td>Premimum</td>
                    <td>$2000.00</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>29, July, 2022</td>

                    <td>Code Info</td>
                    <td>Silver</td>
                    <td>$5,000.00</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>15, July, 2022</td>

                    <td>Jhon David</td>
                    <td>Startup</td>
                    <td>$3000.00</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>5, July, 2022</td>
                    <td>Salina Gomiz</td>
                    <td>Premimum</td>
                    <td>$7000.00</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>29, June, 2022</td>
                    <td>Gomiz</td>
                    <td>Gold</td>
                    <td>$4000.00</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>28, June, 2022</td>
                    <td>Elyana Jhon</td>
                    <td>Premimum</td>
                    <td>$2000.00</td>
                </tr>
                </tbody>
            </table>


        </div>
    </div>
</div>
</body>
</html>
