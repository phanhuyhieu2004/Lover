<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Block</title>

    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        .main-body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 60vh;
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
<body>

<jsp:include page="Flower.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="main-body">
        <div class="icon">
            <i class="fa-solid fa-user-slash fa-beat" ></i>
        </div>
        <h1 class="message">Sorry, your account has been blocked !!!</h1>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>