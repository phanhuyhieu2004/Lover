<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/10/2023
  Time: 8:14 AM
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

    <link rel="stylesheet" href="rank.css" />
    <link rel="stylesheet" href="comment.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <link
            href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500&display=swap"
            rel="stylesheet"
    />


</head>

<style>
    .imgPlayer{
        width: 228px;
        height: 200px;
        background-image: url('${profiles.avatar}');
        background-size: cover;
    }
    .img-person1{
        background-image: url("${profiles.portrait}");
        width: 150px;
        height: 100px;
        float: left;
        background-size: cover;
        margin-right: 10px;

    }
    .img-person2{
        background-image: url("${profiles.portrait1}");
        width: 150px;
        height: 100px;
        float: left;
        background-size: cover;
        margin-right: 10px;
    }
    .img-person3{
        background-image: url("${profiles.portrait2}");
        width: 150px;
        height: 100px;
        float: left;
        background-size: cover;
        margin-right: 10px;
    }
    #first-modal {
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

    h3 {
        font-family: "Rubik", sans-serif;
        font-size: 1.3rem;
        color: #141a39;
        text-transform: uppercase;
        cursor: default;
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
    .nameProfile {
        width: 115px;
        height: 35px;
        border-radius: 20px/20px;
        background-color: hotpink;
        color: white;
    }
    .person-img {
        height: 100px;
        background-color: white;
    }

    .profile-information {
        height: 200px;
        padding-top: 10px;
        width: 514px;
        background-color: white;

    }
</style>
<body style="background: white">

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

                <span>${profiles.joinDate}</span>

            </div>
        </div>

    </div>
    <div class="col-md-6" style="width: 600px;
         padding-left: 15px;
         padding-right: 15px;
         margin-left: 15px;
         margin-right: 15px;
height: 1200px;">
        <div class="row-name" style="height: 30px;  margin-bottom: 10px;">
            <span>${profiles.fullName}</span>

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
            <button class="nameProfile">
                <b style="text-align: center">Game:30$</b>
            </button>
            <button class="nameProfile">
                <b style="text-align: center">Song:40$</b>
            </button>
            <button class="nameProfile">
                <b style="text-align: center">Chat:80$</b>
            </button>
            <button class="nameProfile">
                <b style="text-align: center">Entertainment:70$</b>
            </button>
            <button class="nameProfile">
                <b style="text-align: center">Dating:40$</b>
            </button>
            <button class="nameProfile">
                <b style="text-align: center">Other:100$</b>
            </button>
            <!-- Add more buttons here -->
        </div>        <div class="content" style="padding-top: 10px">
        <div class="row-information">
            <h3 style="margin-bottom: 20px;
  margin-left: 40px;">Information</h3>
        </div>
        <div class="person-img" style="margin-left: 50px;">
            <div class="img-person1"
            >
                <a href="">
                    <img src="">
                </a>
            </div>
            <div class="img-person2"
            >
                <a href="">
                    <img src="">
                </a>
            </div>
            <div class="img-person3"
            >
                <a href="">
                    <img src="">
                </a>
            </div>
        </div>
        <div class="profile-information" style="margin-left: 20px;">
            <p>${profiles.interest}</p>
            <p>${profiles.describeYourself}</p>
            <p>${profiles.regulations}</p>
        </div>
        <div class="row-donate" style="margin-left: 40px;">

            <div id="header">
                <h3 style="margin-right: 25px;">TOP DONATE</h3>
                <button class="share">
                    <i class="ph ph-share-network"></i>
                </button>
            </div>
            <div id="leaderboard">
                <div class="ribbon"></div>
                <table>
                    <tr>
                        <td class="number">1</td>
                        <td class="namePlayers">Minh Nguyen</td>
                        <td class="points">
                            300.000$<img class="gold-medal" src="https://github.com/malunaridev/Challenges-iCodeThis/blob/master/4-leaderboard/assets/gold-medal.png?raw=true" alt="gold medal"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="number">2</td>
                        <td class="namePlayers">Thuy Dieu</td>
                        <td class="points">280.000$</td>
                    </tr>
                    <tr>
                        <td class="number">3</td>
                        <td class="namePlayers">An Hai</td>
                        <td class="points">250.000$</td>
                    </tr>
                    <tr>
                        <td class="number">4</td>
                        <td class="namePlayers">Nguyen Diep</td>
                        <td class="points">200.000$</td>
                    </tr>
                    <tr>
                        <td class="number">5</td>
                        <td class="namePlayers">Kim Chi</td>
                        <td class="points">100.000$</td>
                    </tr>
                </table>

            </div>
        </div>

    </div>
    </div>


    <div class="col-md-3" style="height: 250px; background-color: white; width: 230px;border-radius: 10px ; border-width: 1px; border: 1px solid; border-color: gainsboro">
        <div class="row-pricePlayer">
            ${profiles.view}
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
                <button value="search" onclick="openModal()" style="height: 40px; margin-top: 10px; border-radius: 20px/20px; background-color: pink; width: 220px; font-size: 15px; border-width: 1px">
                    <b>RENT</b>
                </button>
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
<div class="comments-container">
    <h3>Comments</h3>

    <ul id="comments-list" class="comments-list">
        <li>
            <div class="comment-main-level">

                <div class="comment-avatar"><img src="https://i0.wp.com/hapigo.vn/wp-content/uploads/2022/12/Optimized-Optimized-30-Kieu-anh-chup-dang-nam-che-mat-ca-tinh-cho-chang-2.jpg?resize=1080%2C1080&ssl=1" alt=""></div>

                <div class="comment-box">
                    <div class="comment-head">
                        <h6 class="comment-name by-author"><i style="color: lightskyblue" class="fa-regular fa-gem fa-beat"></i><a href="#">Manh Phan</a></h6>
                        <span>20 minutes ago</span>
                        <i style="color: forestgreen" class="fa-solid fa-reply fa-beat"></i>
                        <i style="color: red"class="fa-solid fa-heart fa-beat"></i>
                    </div>
                    <div class="comment-content">
                        You are so beautiful and amazing, I am your big fan <i style="color: deeppink" class="fa-regular fa-face-grin-hearts fa-beat"></i>
                    </div>
                </div>
            </div>

            <ul class="comments-list reply-list">
                <li>

                    <div class="comment-avatar"><img src="https://cdn.eva.vn/upload/4-2021/images/2021-11-27/87073970_108112177446737_3349298592153075712_n-1638026726-1-width600height900.jpg" alt=""></div>

                    <div class="comment-box">
                        <div class="comment-head">
                            <h6 class="comment-name"><a href="#">Minh Nguyen</a></h6>
                            <span>10 minutes ago</span>
                            <i style="color: forestgreen" class="fa-solid fa-reply fa-beat"></i>
                            <i style="color: red"class="fa-solid fa-heart fa-beat"></i>
                        </div>
                        <div class="comment-content">
                            Have you ever hired this person's services?      <i style ="color: crimson"class="fa-regular fa-face-surprise fa-beat"></i>                  </div>
                    </div>
                </li>

                <li>

                    <div class="comment-avatar"><img src="https://i0.wp.com/hapigo.vn/wp-content/uploads/2022/12/Optimized-Optimized-30-Kieu-anh-chup-dang-nam-che-mat-ca-tinh-cho-chang-2.jpg?resize=1080%2C1080&ssl=1" alt=""></div>

                    <div class="comment-box">
                        <div class="comment-head">
                            <h6 class="comment-name by-author"><i style="color: lightskyblue" class="fa-regular fa-gem fa-beat"></i><a href="#">Manh Phan</a></h6>
                            <span>10 minutes ago</span>
                            <i style="color: forestgreen" class="fa-solid fa-reply fa-beat"></i>
                            <i style="color: red"class="fa-solid fa-heart fa-beat"></i>
                        </div>
                        <div class="comment-content">
                            Of course, I hired her to play games for hours      <i style="color: #2a5eb2" class="fa-solid fa-gamepad fa-beat"></i>                  </div>
                    </div>
                </li>
            </ul>
        </li>

        <li>
            <div class="comment-main-level">

                <div class="comment-avatar"><img src="https://sg.cdnki.com/dien-vien-nguyen-hoang-ngoc-huyen-sinh-nam-bao-nhieu---aHR0cHM6Ly92bm4taW1ncy1mLnZnY2xvdWQudm4vMjAyMS8xMC8yMi8xNS8xODU0MDA3MDgtMzYzMDA5NjMyMDQzMDMzNy05MTUyOTMyNDgwMTMwMDEwMDI5LW4uanBn.webp" alt=""></div>

                <div class="comment-box">
                    <div class="comment-head">
                        <h6 class="comment-name"><a href="#">Diep Nguyen</a></h6>
                        <span>10 minutes ago</span>
                        <i style="color: forestgreen" class="fa-solid fa-reply fa-beat"></i>
                        <i style="color: red"class="fa-solid fa-heart fa-beat"></i>
                    </div>
                    <div class="comment-content">
                        This is a cheerful, cute person who brings positive energy to everyone energy  <i style="color: red"class="fa-solid fa-fire fa-beat"></i>                  </div>
                </div>
            </div>
        </li><li>
        <div class="comment-main-level">

            <div class="comment-avatar"><img src="https://i.vietgiaitri.com/2020/8/28/nguyen-hoang-ngoc-huyen---hot-girl-ha-thanh-uoc-mo-tro-thanh-co-giao-nhung-lai-co-duyen-voi-dien-anh-b29-5192435.jpg" alt=""></div>

            <div class="comment-box">
                <div class="comment-head">
                    <h6 class="comment-name"><a href="#">Ngan Nguyen</a></h6>
                    <span>10 minutes ago</span>
                    <i style="color: forestgreen" class="fa-solid fa-reply fa-beat"></i>
                    <i style="color: red"class="fa-solid fa-heart fa-beat"></i>

                </div>
                <div class="comment-content">
                    I think you were born to be famous, you're so talented  <i style="color:orangered" class="fa-regular fa-sun fa-beat"></i>                  </div>
            </div>
        </div>
    </li>
    </ul>
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
                    <label>Time to rent:</label>
                </div>
                <div class="div-4">
                    <select id="hour-select" style="width: 80px">
                        <option value="1">one hour</option>
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
                    <label>Price:</label>
                </div>
                <div class="div-4">
                    <span id="price">80.000 </span>
                </div>
            </div>
            <div class="form-row">
                <div class="div-6">
                    <label>Current balance:</label>
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
        margin-right: 15px;">Close</button>

            <button type="submit" value="rent" style=" width: 60px;
        height: 30px;
        font-size: 15px;
        margin-top: 10px;
        float: right;
        text-align: center;
        background-color: deeppink;
        border: 1px solid deeppink;
        margin-right: 7px;">Rent</button>
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
<%--<div id="two-modal">--%>
<%--    <div id="modal-table2" class="modal2">--%>
<%--        <div class="row-content">--%>
<%--            <button id="close" onclick="closeModal2()" class="close-modal">x</button>--%>
<%--            <h2>Deposit money into lovers</h2>--%>
<%--        </div>--%>
<%--        <div class="content">--%>
<%--            <button class="transfer"><i class="fa-solid fa-building-columns"></i><b>Chuyển khoản qua ngân hàng <b--%>
<%--                    style="color: red">(Khuyến nghị)</b></b></button>--%>
<%--            <button class="transfer"><i class="fa-regular fa-credit-card"></i><b>Thanh toán trực tiếp qua Internet--%>
<%--                Banking </b></button>--%>
<%--            <button class="transfer"><i class="fa-regular fa-qrcode"></i><b>Thanh toán trực tiếp qua QR Code</b>--%>
<%--            </button>--%>
<%--            <button class="transfer"><i class="fa-solid fa-wallet"></i><b>Nạp tiền vào ví điện tử </b></button>--%>
<%--            <button class="transfer"><i class="fa-solid fa-p" style="color: #fa0000;"></i><b>Nạp tiền bằng thẻ cào--%>
<%--                Player Code </b></button>--%>
<%--            <button class="transfer"><i class="fa-solid fa-m" style="color: #fe1b01;"></i><b>Nạp tiền bằng thẻ cào--%>
<%--                điện </b></button>--%>
<%--        </div>--%>
<%--        <div class="footer">--%>
<%--            <button type="submit" value="close" onclick="closeModal2()" style="width: 60px;--%>
<%--        height: 30px;--%>
<%--        font-size: 15px;--%>
<%--        margin-top: 20px;--%>
<%--        float: right;--%>
<%--        text-align: center;--%>
<%--        margin-right: 15px;">Đóng--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script>
    function openModal2() {
        document.getElementById("two-modal").style.display = "block";
    }

    function closeModal2() {
        document.getElementById("two-modal").style.display = "none";
    }
</script>
</html>
