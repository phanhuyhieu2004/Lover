<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 11/6/2023
  Time: 2:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lover</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>


    <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="manifest" href="favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400&family=Sen:wght@700&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="reset.css">

    <link rel="stylesheet" href="common.css">

    <link rel="stylesheet" href="service.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<style>

    .alert-success {
        background-color: forestgreen;
        margin: 10px;
        border-radius: 10px;
        color: white;
    }

</style>
<body style="background: white">

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container-list">
    <jsp:include page="dashboard.jsp"></jsp:include>
    <div class="main-body">
        <form  action="serviceCategory" method="post">
            <div class="services[]">
                <h1 class="service-heading">Choose service catalog you want to provide</h1>
                <center> <p class=" alert-success" style="color: white" >${messSuccess}</p></center>

                <div class="row">
                    <label>
                        <input type="checkbox" name="services[]" value="family"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-house-chimney-window fa-beat"></i>
                            <span>Introduce yourself to your family</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox" name="services[]" value="friends"/>
                        <div class="icon-box" style="color: white">
                            <i class="fa-solid fa-people-roof fa-beat"></i> <span>Introduce your friends</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox" name="services[]" value="travel"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-route fa-beat"></i> <span> Travel together with a group of friends </span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox" name="services[]" value="together"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-play fa-beat"></i> <span>Go out together</span>
                        </div>
                    </label>

                    <label>
                        <input type="checkbox"  name="services[]" value="birthday"/>
                        <div class="icon-box" style="color:white">
                            <i class="fa-solid fa-cake-candles fa-beat"></i> <span>Attend birthday</span>
                        </div>
                    </label>

                    <label>
                        <input type="checkbox" name="services[]" value="online"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-comment-slash fa-beat"></i> <span>Chat offline</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox"  name="services[]" value="offline"/>
                        <div class="icon-box">
                            <i class="fa-regular fa-comments fa-beat"></i>
                            <span>Chat online</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox" name="services[]" value="Tet"/>
                        <div class="icon-box">
                            <i class="fa-regular fa-face-smile-wink fa-beat"></i> <span>Go in Tet holiday</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox"  name="services[]" value="holidays"/>
                        <div class="icon-box">
                            <i class="fa fa-gamepad" aria-hidden="true"></i>
                            <span>Going out on holidays</span>
                        </div>
                    </label>




                    <label>
                        <input type="checkbox"  name="services[]" value="hand"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-handshake-simple fa-beat"></i> <span>    Hold hand</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox" name="services[]" value="love"/>
                        <div class="icon-box">
                            <i class="fa-brands fa-gratipay fa-beat-fade"></i>
                            <span> Say love</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox"   name="services[]" value="eyes"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-eye fa-beat"></i> <span> Look at your eyes </span>
                        </div>
                    </label>



                    <label>
                        <input type="checkbox"  name="services[]" value="song"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-music fa-beat"></i> <span>   Song</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox"  name="services[]" value="kiss"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-face-kiss fa-beat"></i> <span> Kiss hands</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox" name="services[]" value="hug"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-hand-holding-heart fa-beat"></i> <span> Hug </span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox"  name="services[]" value="childish"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-baby fa-beat"></i>
                            <span>    Childish</span>
                        </div>
                    </label>

                    <label>
                        <input type="checkbox" name="services[]" value="intimate"/>
                        <div class="icon-box">
                            <i class="fa-regular fa-face-kiss-wink-heart fa-beat"></i>
                            <span>    Intimate gesture</span>
                        </div>
                    </label>
                    <label>
                        <input type="checkbox"  name="services[]" value="movie"/>
                        <div class="icon-box">
                            <i class="fa-solid fa-film fa-beat"></i>                    <span>     Watch a movie </span>
                        </div>
                    </label>


            </div>

            <div style="text-align: center">
                <input type="submit" value="Catalog registration">

            </div>
            </div>
        </form>
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>