<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/1/2024
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="common.css">


    <link rel="stylesheet" href="information.css">

</head>
<style>

    .alert-success {
        background-color: forestgreen;
        margin: 10px;
        border-radius: 10px;
        color: white;
    }

    .information {
        width: 600px;

        margin: 30px auto;

        padding: 25px;
        background-color: #fff;
        border-radius: 10px;
    }

    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 220px;
    }

    select {
        margin-bottom: 0px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
    }


    .menu-text {
        margin-left: 10px;
    }

    label.required span {
        color: red;
    }

    p span.required {
        color: red;
    }

    input[type="submit"] {
        width: 50%;
        padding: 15px;
        background-color: hotpink;
        color: #fff;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 1.8rem;
        outline: none;
        transition: background-color 0.3s ease-in-out;
    }

    .sticky-nav {
        position: sticky;
        top: 0;
        z-index: 100;
    }

    .heading-money {
        font-size: 2rem;
        font-weight: 700;
        padding: 20px;
        text-align: center;
    }

    .moneyDenomination ~ select {
        display: block;
        padding: 10px;
        margin: 20px;
        background: white;
        border: 1px solid pink;
        border-radius: 999px;
    }

    @media (max-width: 767.98px) {
        .moneyDenomination ~ select,input {
          font-size: 1rem;
        }

        .heading-money {
            font-size: 1.5rem;
            font-weight: 700;
            padding: 20px;
            text-align: center;
        }

        .moneyDenomination {
            font-size: 1rem;
        }
    }
</style>
<body style="background: white">

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container-information">
    <jsp:include page="dashboard.jsp"></jsp:include>

    <div class="information">

        <h2 class="heading-money">Deposit money into your account </h2>
        <div style="display: flex;
  flex-direction: column;">
            <form action="addMoney" method="post">
                <label for="moneyDenomination" class="moneyDenomination">Choose currency denomination:</label>
                <select id="moneyDenomination" name="moneyDenomination">
                    <option value="0">--Choose denomination--</option>
                    <option value="10000">10,000 VND</option>
                    <option value="20000">20,000 VND</option>
                    <option value="50000">50,000 VND</option>
                    <option value="100000">100,000 VND</option>
                    <option value="200000">200,000 VND</option>
                    <option value="500000">500,000 VND</option>
                </select>

                <input type="submit" value="Deposit money">
            </form>

        </div>
        <p style="padding: 20px;"> Current balance: ${accountDetail.depositMoney} VND</p>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
