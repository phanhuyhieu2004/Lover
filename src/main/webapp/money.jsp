<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/23/23
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Nạp tiên</title>

    <script src="https://kit.fontawesome.com/74cf7057a9.js" crossorigin="anonymous"></script>
</head>
D
<style>
    .modal2 {
        margin: 0 auto;
        width: 500px;
        height: 460px;
        padding: 25px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 0 10px hotpink;

    }

    .row-content {
        width: 100%;
        height: 30px;
        border-bottom: 1px solid darkgray;
    }

    h2 {
        text-align: center;
    }

    .close-modal {
        float: right;
        top: 10px;
        right: 40px;
        width: 25px;
        height: 25px;
        border: none;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        background-color: white;
    }

    .transfer {
        margin-top: 15px;
        margin-left: 50px;
        height: 40px;
        width: 80%;
    }

    b {
        padding-left: 5px;
    }

    .footer {
        margin-top: 20px;
        width: 100%;
        height: 30px;
        border-top: 1px solid darkgray;
    }
</style>
<body>
<div id="two-modal">
    <div id="modal-table2" class="modal2">
        <div class="row-content">
            <button id="close" onclick="closeModal2" class="close-modal">x</button>
            <h2>Deposit money into lovers</h2>
        </div>
        <div class="content">
            <button class="transfer"><i class="fa-solid fa-building-columns"></i><b>Chuyển khoản qua ngân hàng <b
                    style="color: red">(Khuyến nghị)</b></b></button>
            <button class="transfer"><i class="fa-regular fa-credit-card"></i><b>Thanh toán trực tiếp qua Internet
                Banking </b></button>
            <button class="transfer"><i class="fa-regular fa-qrcode"></i><b>Thanh toán trực tiếp qua QR Code</b>
            </button>
            <button class="transfer"><i class="fa-solid fa-wallet"></i><b>Nạp tiền vào ví điện tử </b></button>
            <button class="transfer"><i class="fa-solid fa-p" style="color: #fa0000;"></i><b>Nạp tiền bằng thẻ cào
                Player Code </b></button>
            <button class="transfer"><i class="fa-solid fa-m" style="color: #fe1b01;"></i><b>Nạp tiền bằng thẻ cào
                điện </b></button>
        </div>
        <div class="footer">
            <button type="submit" value="close" onclick="closeModal2()" style="width: 60px;
        height: 30px;
        font-size: 15px;
        margin-top: 20px;
        float: right;
        text-align: center;
        margin-right: 15px;">Đóng
            </button>
        </div>
    </div>
</div>
<script>
    function openModal2() {
        document.getElementById("two-modal").style.display = "block";
    }

    function closeModal2() {
        document.getElementById("two-modal").style.display = "none";
    }
</script>
</body>
</html>
