<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>

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
        .table-info {
            flex: 1 1 500px;
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
            <h2>List of my services</h2>
        </div>
        <div class="table-info">
            <c:choose>
                <c:when test="${not empty error}">
                    <b class="alert-warning">${error}</b>
                </c:when>
                <c:when test="${empty services}">
                    <center>
                        <b class="alert-warning" style="text-align: center;">There are no services available</b>
                    </center>
                </c:when>
                <c:otherwise>
                    <table class="styled-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Service</th>
                            <th>Action</th>

                        </tr>
                        </thead>
                        <tbody id="tableBody">
                        <c:forEach var="service" items="${services}" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>

                                <td>${service.serviceNameCategory}</td>

                                <td>

                                    <form action="removeService" method="POST" onsubmit="return confirmDelete()">
                                        <input type="hidden" name="serviceCategoryId"
                                               value="${service.idServiceCategory}"/>
                                        <button type="submit" class="btn block-btn">
                                            Delete
                                        </button>
                                    </form>

                                    <script>
                                        function confirmDelete() {
                                            return confirm('Do you want to delete?');
                                        }
                                    </script>

                                </td>
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

