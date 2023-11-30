<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Block</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        .main-body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 70vh;
        }

        .icon {
            font-size: 10rem;
        }

        .message {
            margin-top: 1rem;
            font-size: 2rem;
        }
    </style>
</head>
<body style="background: white">

<jsp:include page="Flower.jsp"></jsp:include>
<%--<jsp:include page="header.jsp"></jsp:include>--%>
<%--GIAO DIỆN TRANG CHẶN TÀI KHOẢN--%>
<div class="container" style="margin-top: 100px;">
    <div class="main-body">
        <div class="icon">
            <i class="fa-solid fa-user-slash fa-beat" ></i>
        </div>
        <h1 class="message">Sorry, your account has been blocked !!!</h1>
    </div>
</div>

<%--<jsp:include page="footer.jsp"></jsp:include>--%>

</body>
</html>