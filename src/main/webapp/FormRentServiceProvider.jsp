<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/21/23
  Time: 8:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thuê người cung cấp dịch vụ</title>
</head>
<style>
    .container {
        margin-left: 450px;
        width: 500px;
        margin-bottom: 10px;
        margin-right: 350px;
        padding: 25px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 0 10px hotpink;
    }

    .row-title {
        width: 100%;
        height: 30px;
        border-bottom: 1px solid darkgray;
    }

    h2 {
        text-align: center;
    }

    .close-button {
        position: absolute;
        top: 10px;
        width: 25px;
        height: 25px;
        border: none;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 480px;
        background-color: white;

    }
    .modal-body{
        padding-top: 20px;
    }

    .form-row {
        display: flex;
        padding: 17px;
    }

    .name-sp {
        margin-left: 250px;
    }
    .div-6 {
        flex: 6;
    }

    .div-4 {
        flex: 4;
    }
    .surplus-button {
        background-color: deeppink;
        border: 1px solid pink;
    }
    #message {
        width: 600px;
        height: 70px;
    }
    .modal-footer {
        width: 100%;
        height: 30px;
        border-top: 1px solid darkgray;
    }


</style>
<body>
<div class="container">
    <div class="row-title">
        <div id="thong-bao"></div>
        <button id="closeButton" class="close-button">x</button>
        <h2>Thuê Player</h2>
    </div>
    <div class="modal-body">
        <div class="form-row">
            <div class="div-6">
                <label>Player:</label>
            </div>
            <div class="div-4">
                <span id="name">Linh</span>
            </div>
        </div>
        <div class="form-row">
            <div class="div-6">
                <label>Thời gian muốn thuê:</label>
            </div>
            <div class="div-4">
                <select id="hour-select" style="width: 80px">
                    <option value="1">1 giờ</option>
                    <option value="2">2 giờ</option>
                    <option value="3">3 giờ</option>
                    <option value="4">4 giờ</option>
                    <option value="5">5 giờ</option>
                    <option value="6">6 giờ</option>
                    <option value="7">7 giờ</option>
                    <option value="8">8 giờ</option>
                    <option value="9">9 giờ</option>
                    <option value="10">10 giờ</option>
                    <option value="11">11 giờ</option>
                    <option value="12">12 giờ</option>
                    <option value="13">13 giờ</option>
                    <option value="14">14 giờ</option>
                    <option value="15">15 giờ</option>
                    <option value="16">16 giờ</option>
                    <option value="17">17 giờ</option>
                    <option value="18">18 giờ</option>
                    <option value="19">19 giờ</option>
                    <option value="20">20 giờ</option>
                    <option value="21">21 giờ</option>
                    <option value="22">22 giờ</option>
                    <option value="23">23 giờ</option>
                    <option value="24">24 giờ</option>

                    <!-- Thêm các tùy chọn giờ khác ở đây -->
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="div-6">
                <label>Chi phí:</label>
            </div>
            <div class="div-4">
                <span id="price">80.000 </span>
            </div>
        </div>
        <div class="form-row">
            <div class="div-6">
                <label>Số dư hiện tại:</label>
            </div>
            <div class="div-4">
                <span id="surplus" style="color: deeppink">0 đ</span>

                <button class="surplus-button" onclick="toggleBankList()">+</button>
<%--                <ul id="bank-list">--%>
<%--                    <li>Ngân hàng A</li>--%>
<%--                    <li>Ngân hàng B</li>--%>
<%--                    <li>Ngân hàng C</li>--%>
<%--                    <!-- Thêm các ngân hàng khác ở đây -->--%>
<%--                </ul>--%>
            </div>
        </div>
        <div class="form-row">
            <textarea placeholder="Type a message..." id="message" name="messageToSp" required></textarea>
        </div>
    </div>
    <div class="modal-footer" >
        <button type="submit" value="rent" style=" width: 60px;
        height: 30px;
        font-size: 15px;
        margin-top: 10px;
        float: right;
        text-align: center;
        background-color: deeppink;
        border: 1px solid deeppink;
        margin-right: 7px;">Thuê</button>


    </div>
    <script>
        var closeButton = document.getElementById("closeButton");
        closeButton.addEventListener("click", function () {
            // Thoát khỏi trang
            window.location.href = "about:blank";
        });
    </script>
    <script>
        function toggleBankList() {
            var bankList = document.getElementById("bank-list");
            if (bankList.style.display === "none") {
                bankList.style.display = "block";
            } else {
                bankList.style.display = "none";
            }
        }
    </script>
</div>
</body>
</html>
