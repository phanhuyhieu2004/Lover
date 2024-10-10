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
    <link rel="stylesheet" href="homes.css"/>
</head>

<body style="background: white">
<jsp:include page="Flower.jsp"></jsp:include>

<jsp:include page="header.jsp"></jsp:include>
<div class="container-list" style="display: flex;">
    <jsp:include page="dashboard.jsp"></jsp:include>

    <div class="main-body">
        <div class="search-title"><p>You can filter the list and search by account name here</p></div>

        <div class="search-filter">
            <form class="search-list" id="filterForm" action="list" method="POST">

                <select id="statusFilter" name="status" class="search__filter--list">
                    <option value="">Status List</option>
                    <option value="Active" ${status == 'Active'? 'selected' :''}>Active List</option>
                    <option value="Block" ${status == 'Block'? 'selected' :''}>Block List</option>
                    <option value="InActive" ${status == 'InActive'? 'selected' :''}>InActive List</option>
                    <option value="VIP" ${status == 'VIP'? 'selected' :''}>VIP List</option>
                </select>

                <select id="roleFilter" name="role" class="search__filter--list">
                    <option value="">Roles List</option>
                    <option value="serviceProviders"  ${role == 'serviceProviders'? 'selected' :''}>Service Providers
                    </option>
                    <option value="account"  ${role == 'account'? 'selected' :''}>All Account List</option>
                    <option value="user" ${role == 'user'? 'selected' :''}>User List</option>
                </select>

                <input class="search__filter--list" type="text" id="nameSearch" name="nameSearch"
                       value="${accountName}" placeholder="Account Name" style="width: 150px;;">

                <button id="searchButton" type="submit" class="search"><i class="fas fa-search"></i></button>
            </form>
        </div>


        <div class="table-info">
            <c:choose>
                <c:when test="${not empty error}">
                    <b class="alert-warning">${error}</b>
                </c:when>
                <c:when test="${empty listAccount}">
                    <center>
                        <b class="alert-warning" style="text-align: center;">Player name not found</b>
                    </center>
                </c:when>
                <c:otherwise>
                    <table class="styled-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Nick name</th>
                            <th>Account name</th>
                            <th>Email</th>
                            <th>Phone number</th>
                            <th>Identify card</th>
                            <th>Status</th>
                            <th>Block</th>
                        </tr>
                        </thead>
                        <tbody id="tableBody">
                        <c:forEach var="list" items="${listAccount}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${list.nickName}</td>
                                <td>${list.accountName}</td>
                                <td>${list.email}</td>
                                <td>${list.phoneNumber}</td>
                                <td>${list.identifyCard}</td>
                                <td id="status_${list.idAccount}" class="status-account">${list.status}</td>
                                <td>
                                    <button class="block-btn" style="padding: 10px;
  border: none;
  border-radius: 10px;background: pink" onclick="blockAccount('${list.idAccount}')">Block
                                    </button>
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
    let limit = 10;
    let list = document.querySelectorAll('#tableBody tr');

    function loadItem() {
        let beginGet = limit * (thisPage - 1);
        let endGet = limit * thisPage - 1;

        list.forEach((item, key) => {
            if (key >= beginGet && key <= endGet) {
                item.style.display = 'table-row';
            } else {
                item.style.display = 'none';
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


    // Truyền tham số là id của tài khocần chặn đã lấy ở trên
    function blockAccount(id) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'BlockAccountServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // Xử lý dữ liệu trả về nếu cần

                // Cập nhật trạng thái của cột "status" thành "block"
                var statusCell = document.getElementById(`status_${id}`);
                if (statusCell) {
                    statusCell.textContent = 'block';
                }

                // Tải lại trang
                location.reload();
            }
        };
        xhr.onerror = function () {
            console.error('Error blocking account.');
        };
        xhr.send('id=' + id);
        // Gửi yêu cầu POST với nội dung là 'id=' + id, trong đó id là giá trị của tham số "id". Lập tức gửi yêu cầu chặn tài khoản với ID tương ứng sang bên servlet có đường dẫn là 'BlockAccountServlet'
    }
</script>


</body>
</html>

