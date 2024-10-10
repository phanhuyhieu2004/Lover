<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/15/2023
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Danh sách người thuê</title>

    <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="favicon/android-icon-192x192.png">
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

    <link rel="stylesheet" href="manager.css">
    <style>
        .tooltip {
            position: relative;
            display: inline-block;
        }
        .table-info{
            flex: 1 1 500px;
        }
        .tooltip .tooltip-text {
            visibility: hidden;
            width: 120px;
            background-color: hotpink;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px 0;
            font-size: 1rem;
            position: absolute;
            z-index: 1;
        }

        .tooltip:hover .tooltip-text {
            visibility: visible;
        }
    </style>

</head>
<body style="background: white">
<jsp:include page="Flower.jsp"></jsp:include>

<jsp:include page="header.jsp"></jsp:include>
<div class="container-list" style="display: flex;">
    <jsp:include page="dashboard.jsp"></jsp:include>

    <div class="main-body">

        <div class="service-list heading">
            <h2>Tenant list</h2>
        </div>

        <div class="table-info">
            <c:choose>
                <c:when test="${not empty error}">
                    <b class="alert-warning">${error}</b>
                </c:when>
                <c:when test="${empty playerRentals}">
                    <center>
                        <b class="alert-warning" style="text-align: center;">There are no tenants!!!</b>
                    </center>
                </c:when>
                <c:otherwise>
                    <table class="styled-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Number of hours</th>
                            <th>Amount</th>
                            <th>Rental date</th>
                            <th>Lessee</th>

                        </tr>
                        </thead>
                        <tbody id="tableBody">
                        <c:forEach var="rental" items="${playerRentals}" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${rental.rentalHours}</td>
                                <td>${rental.totalAmount}</td>
                                <td>${rental.rentalDate}</td>
                                <td><a href="profile?aid=${rental.accountId}"><i class="fa-solid fa-circle-info tooltip"> <span
                                        class="tooltip-text">Information</span>
                                </i></a></td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="pagination">
            <ul class="listPage"></ul>

        </div>
    </div>


</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>

    let thisPage = 1;
    let limit = 5; // Số lượng dòng mỗi trang
    let list = document.querySelectorAll('#tableBody tr');

    function loadItem() {
        let beginGet = limit * (thisPage - 1);
        let endGet = limit * thisPage - 1;

        list.forEach((item, key) => {
            if (key >= beginGet && key <= endGet) {
                item.style.display = 'table-row'; // Hiện dòng
            } else {
                item.style.display = 'none'; // Ẩn dòng
            }
        });
        listPage();
    }

    function listPage() {
        let count = Math.ceil(list.length / limit);
        document.querySelector('.listPage').innerHTML = '';

        if (thisPage != 1) {
            let prev = document.createElement('li');
            prev.innerText = 'PREV';
            prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
            document.querySelector('.listPage').appendChild(prev);
        }

        for (let i = 1; i <= count; i++) {
            let newPage = document.createElement('li');
            newPage.innerText = i;
            if (i == thisPage) {
                newPage.classList.add('active');
            }
            newPage.setAttribute('onclick', "changePage(" + i + ")");
            document.querySelector('.listPage').appendChild(newPage);
        }

        if (thisPage != count) {
            let next = document.createElement('li');
            next.innerText = 'NEXT';
            next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
            document.querySelector('.listPage').appendChild(next);
        }
    }

    function changePage(i) {
        thisPage = i;
        loadItem();
    }

    // Gọi hàm khởi tạo
    loadItem();


</script>


</body>
</html>
