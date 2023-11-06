<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/3/23
  Time: 1:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Giao diện trang cá nhân</title>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <link rel="stylesheet" href="profileInterface.css"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container" style="max-width: 1000px; padding-top: 30px">
    <div class="row">
        <div class="col-md-3">
            <div class="img1" style="width: 100% ; height: 320px; background-color: #f2d5d5 ">
<%--                            <c:forEach var="list" items="${listServiceProvider}">--%>
                <div class="box" style="width: 210px; height: 200px ; background-color: #cccccc; margin-left: 8px; float: left">
                    <a href="/project?action=add&id=${list.getId()}">
                        <img src="${list.getImg()}">
                    </a>
                    <h2>${list.getName()}</h2>
                    <h2>${list.getDescribe()}</h2>
                </div>
<%--                            </c:forEach>--%>
        </div>
    </div>
        <div class="col-md-6">
            <div class="row-name" style="height: 30px; background-color: #cccccc;">
<%--                <c:forEach var="list" items="${listServiceProvider}">--%>
<%--                    <p>${list.getName()}</p>--%>
<%--                </c:forEach>--%>
                <button style="float: right" id="followButton" onclick="toggleFollow()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-person-heart" viewBox="0 0 16 16">
                        <path d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"/>
                    </svg>
                    Theo dõi</button>
            </div>
            <div class="row" style="height: 40px">
                <div class="col"><b>Số người theo dõi</b></div>
                <div class="col"><b>Đã được thuê</b></div>
                <div class="col"><b>Tỷ lệ hoàn thành</b></div>
                <div class="col"><b>Tình trạng thiết bị</b> </div>
            </div>
            <div class="name-game">
                <button class="name">
                    <b style="text-align: center"><c:out value="${listServiceProviders.name}"/></b>
                </button>
            </div>
            <div class="content">
                <div class="row-information">
                    <b>Thông tin</b>
                </div>
                <div class="profile-img">
<%--                    <c:forEach var="list" items="${listServiceProvider}">--%>
                        <div class="img-profile" style="width: 90px; height: 100px ; background-color: #cccccc ; margin-left: 10px; float: left">
                            <a href="/project?action=add&id=${list.getId()}">
                                            <img src="${list.getImg()}">
                            </a>
                        </div>
<%--                    </c:forEach>--%>
                </div>
                <div class="profile-information">
                        <c:forEach var="list" items="${listServiceProvider}">
                            <p>${list.getName()}</p>
                        </c:forEach>
                </div>
                <div class="row-donate" style="font-size: 20px">
                    <b>Top Donate</b>
                    <div class="top-donate" style="height: 200px; background-color: #faedeb">
                        <div class="row-donate" style="height: 60px; background-color: #cccccc">
<%--                            <c:forEach var="list" items="${listServiceProvider}">--%>
<%--                                <p>${list.getName()}</p>--%>
<%--                            </c:forEach>--%>
                        </div>
                    </div>
                </div>
                <div class="row-evaluate" style="font-size: 20px">
                    <b>Đánh giá</b>
                </div>
                <div class="evaluate">
                    <div class="row-evaluate" style="height: 100px; background-color: #cccccc">
<%--                        <c:forEach var="list" items="${listServiceProvider}">--%>
<%--                            <p>${list.getName()}</p>--%>
<%--                        </c:forEach>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3" style="height: 225px; background-color: #f2d5d5">
            <div class="row-pricePlayer">
<%--                <c:forEach var="list" items="${listServiceProvider}">--%>
<%--                    <p>${list.getName()}</p>--%>
<%--                </c:forEach>--%>
            </div>
            <div class="evaluate-col3">
<%--                <c:forEach var="list" items="${listServiceProvider}">--%>
<%--                    <p>${list.getName()}</p>--%>
<%--                </c:forEach>--%>
            </div>
            <div class="service-player">
                <div class="button-rent">
                    <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: #cccccc; width: 230px; font-size: 15px">
                        <b>THUÊ</b></button>
                </div>
                <div class="button-donate">
                    <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: #cccccc; width: 230px; font-size: 15px">
                        <b>DONATE</b></button>
                </div>
                <div class="button-message">
                    <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: #cccccc; width: 230px; font-size: 15px">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-heart-fill" viewBox="0 0 16 16">
                            <path d="M2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2Zm6 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
                        </svg>
                        <b>CHAT</b></button>
                </div>
            </div>
        </div>
</div>
</div>
<script>
    function toggleFollow() {
        var button = document.getElementById("followButton");
        if (button.classList.contains("cancel")) {
            button.classList.remove("cancel");
            button.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-person-heart" viewBox="0 0 16 16">
                        <path d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"/>
                    </svg>Theo dõi`;
        } else {
            button.classList.add("cancel");
            button.innerHTML = "Hủy theo dõi";
        }
    }
</script>
</body>
</html>
