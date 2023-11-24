<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/24/23
  Time: 2:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <link rel="stylesheet" href="profile.css"/>


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>




</head>
<style>
    .imgPlayer{
        width: 228px;
        height: 200px;
        background-image: url('${profile.avatar}');
        background-size: cover;
    }
</style>
<style>
    #first-modal {
        padding-top: 20px;
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        justify-content: center;
        align-content: center;
        background-color: rgba(0, 0, 0, 0.6);
        display: none;
    }

    .modal {
        margin: 0 auto;
        width: 500px;
        height: 460px;
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
        width: 20px;
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
<style>
    #two-modal {
        padding-top: 20px;
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        justify-content: center;
        align-content: center;
        background-color: rgba(0, 0, 0, 0.6);
        display: none;
    }
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
        text-align: initial;
        padding-left: 30px;
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
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container" style="display: flex;
  padding-left: 140px;
  padding-top: 30px;
  background-color: white;
margin-top: 30px;
  margin-bottom: 30px;">
    <div class="col-md-3" style="width: 230px; border-radius: 10px 10px 10px 10px; height: 340px; border-width: 1px; border: 1px solid; border-color: gainsboro;overflow: hidden ">

        <div class="imgPlayer" >
            <a href="#"
               style="position: relative; display: inline-block;">
                <img src=""
                     style="max-width: 100%; height: 200px;">
            </a>
        </div>
        <div class="activate">
            <div class="row-activate">
                <span>Active</span>
            </div>
            <div class="icon">
                <a href="https://www.facebook.com" target="_blank">
                    <i class="fa-brands fa-facebook fa-beat" style="color: #2a5eb2;"></i>
                </a>

            </div>
            <div class="datejoin">
                <span style="color: #898686">Join date: </span>

                <span>${profile.joinDate}</span>

            </div>
        </div>

    </div>
    <div class="col-md-6" style="width: 600px;
         padding-left: 15px;
         padding-right: 15px;
         margin-left: 15px;
         margin-right: 15px;">
        <div class="row-name" style="height: 30px;  margin-bottom: 10px;">
            <span>${profile.fullName}</span>

            <button style="float: right" id="followButton" onclick="toggleFollow()">
                <i class="fa-solid fa-heart" style="color: #ffffff;padding-right: 5px;"></i>
                Follow
            </button>
        </div>
        <div class="internal">
            <div class="row-informationperson" style="font-size: 14px; display: flex; gap: 30px" >
                <b>Number of followers</b>
                <b>Already in use</b>
                <b>Complete fees</b>
                <b>Status device</b>

            </div>
            <div class="showrow" style="padding-bottom: 10px; display: flex; gap: 30px;padding-left: 70px;">
                <div class="numberperson">4545</div>
                <div class="numberperson">345</div>
                <div class="numberperson">3766</div>
                <div class="numberperson">
                    <i class="fa-solid fa-microphone" style="color: #fe9595;margin-left: 10px;"></i>
                    <i class="fa-solid fa-camera"style="color: #fe9595;padding-left: 5px;"></i>
                </div></div>
        </div>
        <div class="name-game" style="padding-right: 10px; padding-left: 20px; display: grid; grid-template-columns: repeat(4, 1fr); grid-gap: 10px; padding-bottom: 100px;;">
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <button class="name">
                <b style="text-align: center">o</b>
            </button>
            <!-- Add more buttons here -->
        </div>        <div class="content" style="padding-top: 10px">
        <div class="row-information">
            <b>Information</b>
        </div>
        <div class="person-img">
            <div class="img-person"
                 style="width: 150px;
  height: 100px;
  float: left; overflow: hidden;">
                <a href="">
                    <img src="${profile.portrait}"style="max-width: 100%;height: 100px;">
                </a>
            </div>
            <div class="img-person"
                 style="width: 150px;
  height: 100px;
  float: left; overflow: hidden;">
                <a href="">
                    <img src="${profile.portrait}"style="max-width: 100%;height: 100px;">
                </a>
            </div>
            <div class="img-person"
                 style="width: 150px;
  height: 100px;
  float: left; overflow: hidden;">
                <a href="">
                    <img src="${profile.portrait}"style="max-width: 100%;height: 100px;">
                </a>
            </div>
        </div>
        <div class="profile-information">
            <p>${profile.interest}</p>
            <p>${profile.describeYourself}</p>
            <p>${profile.regulations}</p>
        </div>
        <div class="row-donate" style="font-size: 20px">
            <b>Top Donate</b>
            <div class="top-donate" style="height: 200px; background-color: #faedeb">
                <div class="row-donate" style="height: 60px; background-color: #cccccc">

                </div>
            </div>
        </div>
        <div class="row-evaluate" style="font-size: 20px">
            <b>Đánh giá</b>
        </div>
        <div class="evaluate">
            <div class="row-evaluate" style="height: 100px; background-color: #cccccc">

            </div>
        </div>
    </div>
    </div>


    <div class="col-md-3" style="height: 250px; background-color: white; width: 230px;border-radius: 10px ; border-width: 1px; border: 1px solid; border-color: gainsboro">
        <div class="row-pricePlayer">
            ${profile.view}
        </div>
        <div class="evaluate-col3">
            <div class="starcmt" style="font-size: 14px; text-align: center">
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span><i class="fa-solid fa-star" style="color: #f2f542;"></i></span>
                <span style="font-size: 14px"> 175 Reviews</span>
            </div>

        </div>
        <div class="service-player">
            <div class="button-rent" style="padding-left: 5px">
                <button type="submit" value="search" onclick="openModal()" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: pink; width: 220px; font-size: 15px; border-width: 1px">
                    <b>RENT</b></button>
            </div>
            <div class="button-donate" style="padding-left: 5px">
                <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: white; width: 220px; font-size: 15px; border-width: 1px">
                    <b>DONATE</b></button>
            </div>
            <div class="button-message" style="padding-left: 5px">
                <button type="submit" value="search" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: white; width: 220px; font-size: 15px; border-width: 1px">
                    <i class="fa-solid fa-message" style="color: #000000;"></i>
                    <b>CHAT</b>
                </button>
            </div>
        </div>
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>

<script>
    function toggleFollow() {
        var button = document.getElementById("followButton");
        if (button.classList.contains("cancel")) {
            button.classList.remove("cancel");
            button.innerHTML = `<i class="fa-solid fa-heart" style="color: #ffffff;"></i>Theo dõi`;
        } else {
            button.classList.add("cancel");
            button.innerHTML = "Hủy theo dõi";
        }
    }
</script>
</body>
<div id="first-modal">
    <div id="modal-table" class="modal ">
        <div class="row-title">
            <button id="closeButton" onclick="closeModal()" class="close-button">x</button>
            <h2>Rent player</h2>
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

                    <button class="surplus-button" onclick="openModal2()">+</button>
                </div>
            </div>
            <div class="form-row">
                <textarea placeholder="Type a message..." id="message" name="messageToSp" required></textarea>
            </div>
        </div>
        <div class="modal-footer" >
            <button type="submit" value="close" onclick="closeModal()" style="width: 60px;
        height: 30px;
        font-size: 15px;
        margin-top: 10px;
        float: right;
        text-align: center;
        margin-right: 15px;">Đóng</button>

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
            function openModal() {
                document.getElementById("first-modal").style.display = "block";
            }

            function closeModal() {
                document.getElementById("first-modal").style.display = "none";
            }
        </script>
    </div>
</div>
<div id="two-modal">
    <div id="modal-table2" class="modal2">
        <div class="row-content">
            <button id="close" onclick="closeModal2()" class="close-modal">x</button>
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
</html>
