<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/24/2023
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lover</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Stylesheet -->

</head>
<style>
    .footer{
        margin-top: 170px;
        background:pink;
        padding-top: 100px;
        font-family: "Open Sans",sans-serif;
    }

    .footer__top{
        display: grid;
        grid-template-columns: 1fr 0.4fr 0.4fr 1fr;
        column-gap: 78px;
    }
    .footer__desc{
        margin-top: 21px;
        font-size: 1.6rem;

        line-height: 1.75;
    }
    .footer__heading{
        color: #FFF;
        font-size: 1.6rem;
        font-style: normal;
        font-weight: 600;
        line-height: 1.75;
    }
    .footer__list{
        margin: 20px 0 28px;
    }
    .footer__link{
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 400;
        line-height: 1.86;
        color: black;
        text-decoration: none;
    }
    .footer__link:hover{
        text-decoration: underline;
    }
    .footer__item{
        margin-bottom: 10px;
    }
    .footer__social-btn{
        color: hotpink;
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background: #FFF;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: 0.25s;
    }
    .footer__social-btn:hover{
        color: #FFF;

        background: hotpink;

    }
    .footer__social{
        display: flex;
        margin: 20px 0 38px;
        column-gap: 10px;
    }
    .footer__form{
        display: flex;
        column-gap: 12px;
        margin-top: 10px;
    }
    .foot-form__input{
        width: 212px;
        height: 46px;
        border-radius: 4px;
        border: 1px solid #406181;
        background: transparent;
        outline: none;
        color: #fff;
    }
    .foot-form__input::placeholder{
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 400;
        line-height: 1.86;
    }
    .footer-form__submit{
        width: 108px;
        height: 46px;
        border-radius: 4px;
        background: hotpink;
        color: #fff;
        font-size: 1.4rem;

        line-height: 1.86;
        border: none;
    }
    .footer-form__submit:hover{
        cursor: pointer;
        opacity: 0.9;
    }
    .footer__copyright{
        border-top: 1px solid #406181;
    }
    .footer__copyright-text{
        text-align: center;
        padding: 28px 0 42px;
        font-size: 1.4rem;
        font-style: normal;
        font-weight: 400;
        line-height: 1.86;
    }
    /*PC*/
    @media (min-width: 992px) {

    }

    /*Máy tính bảng và đt*/
    @media (max-width: 991.98px) {
        .footer__top {
            grid-template-columns: 1fr 0.4fr;
        }
        .footer__copyright {
            margin-top: 20px;
        }
    }
    /*Máy tính bảng*/
    @media (min-width: 768px) and (max-width: 991.98px) {

    }
    /*Điện thoại*/
    @media (max-width: 767.98px) {
        .footer__top {
            grid-template-columns: 1fr;
        }

        .footer__copyright {
            margin-top: 30px;
        }
    }


</style>
<body>
<section class="footer">
    <div class="container">
        <!--    top footer-->
        <div class="footer__top">
            <!--      col 1-->
            <div class="footer__column footer-hidden-tablet">
                <a href=""> <img class="logo" src="./img/logo1.svg" alt="">
                </a>
                <p class="footer__desc">Lover is a website where people can interact, make friends, and chat with each other in a fun and relaxed spirit.</p>
            </div>
            <!--      col 2-->
            <div class="footer__column">
                <h3 class="footer__heading">Support</h3>
                <ul class="footer__list">
                    <li class="footer__item"><a class="footer__link" href="">Help center</a></li>
                    <li class="footer__item"><a class="footer__link" href="">Account information</a></li>
                    <li class="footer__item"><a class="footer__link" href="">About</a></li>
                    <li class="footer__item"><a class="footer__link" href="">Contact us</a></li>

                </ul>
                <h3 class="footer__heading">Support</h3>
                <ul class="footer__list">
                    <li class="footer__item"><a class="footer__link" href="">Help center</a></li>
                    <li class="footer__item"><a class="footer__link" href="">Account information</a></li>


                </ul>
            </div>
            <!--      col 3-->
            <div class="footer__column">
                <h3 class="footer__heading">Support</h3>
                <ul class="footer__list">
                    <li class="footer__item"><a class="footer__link" href="">Help center</a></li>
                    <li class="footer__item"><a class="footer__link" href="">Account information</a></li>


                </ul>
                <h3 class="footer__heading">Support</h3>
                <ul class="footer__list">
                    <li class="footer__item"><a class="footer__link" href="">Help center</a></li>


                </ul>

            </div>
            <div class="footer__column">
                <h3 class="footer__heading">Stay In Touch</h3>
                <div class="footer__social">
                    <a href="" class="footer__social-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="6" height="12" viewBox="0 0 6 12"
                             fill="none">
                            <path
                                    d="M3.98981 11.9358V6.0302H5.76473L6 3.9517H3.98981L3.9928 2.91132C3.9928 2.3692 4.0477 2.07885 4.87783 2.07885H5.98755V0H4.21224C2.07977 0 1.32931 1.00825 1.32931 2.70405V3.95186H0V6.03055H1.32931V11.8521C1.84718 11.9489 2.38257 12 2.93075 12C3.28487 12 3.63863 11.9786 3.98981 11.9358Z"
                                    fill="currentColor"/>
                        </svg>
                    </a>
                    <a href="" class="footer__social-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12"
                             fill="none">
                            <path
                                    d="M16 1.42062C15.405 1.66154 14.771 1.82123 14.11 1.89877C14.79 1.524 15.309 0.935077 15.553 0.225231C14.919 0.574154 14.219 0.820615 13.473 0.958154C12.871 0.366462 12.013 0 11.077 0C9.261 0 7.799 1.36062 7.799 3.02862C7.799 3.26862 7.821 3.49938 7.875 3.71908C5.148 3.59631 2.735 2.38985 1.114 0.552C0.831 1.00523 0.665 1.524 0.665 2.08246C0.665 3.13108 1.25 4.06062 2.122 4.59877C1.595 4.58954 1.078 4.44831 0.64 4.22585C0.64 4.23508 0.64 4.24708 0.64 4.25908C0.64 5.73046 1.777 6.95262 3.268 7.23415C3.001 7.30154 2.71 7.33385 2.408 7.33385C2.198 7.33385 1.986 7.32277 1.787 7.28215C2.212 8.48123 3.418 9.36277 4.852 9.39138C3.736 10.1972 2.319 10.6828 0.785 10.6828C0.516 10.6828 0.258 10.6717 0 10.6412C1.453 11.5062 3.175 12 5.032 12C11.068 12 14.368 7.38462 14.368 3.384C14.368 3.25015 14.363 3.12092 14.356 2.99262C15.007 2.56615 15.554 2.03354 16 1.42062Z"
                                    fill="currentColor"/>
                        </svg>
                    </a>
                    <a href="" class="footer__social-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="12" viewBox="0 0 13 12"
                             fill="none">
                            <path
                                    d="M0 1.39394C0 0.989891 0.146401 0.656558 0.439189 0.393939C0.731978 0.131309 1.11262 0 1.58108 0C2.04119 0 2.41344 0.129285 2.69788 0.387879C2.99066 0.654545 3.13707 1.00201 3.13707 1.4303C3.13707 1.81818 2.99486 2.14141 2.71042 2.4C2.41764 2.66667 2.03282 2.8 1.55598 2.8H1.54344C1.08333 2.8 0.711072 2.66667 0.426641 2.4C0.142209 2.13333 0 1.79798 0 1.39394ZM0.163127 12V3.90303H2.94884V12H0.163127ZM4.49228 12H7.27799V7.47879C7.27799 7.19595 7.31146 6.97777 7.37838 6.82424C7.49549 6.54949 7.67326 6.31716 7.91168 6.12727C8.1501 5.93737 8.44916 5.84242 8.80888 5.84242C9.74582 5.84242 10.2143 6.45252 10.2143 7.67273V12H13V7.35758C13 6.16161 12.7072 5.25455 12.1216 4.63636C11.536 4.01818 10.7622 3.70909 9.80019 3.70909C8.72104 3.70909 7.88031 4.15758 7.27799 5.05455V5.07879H7.26544L7.27799 5.05455V3.90303H4.49228C4.509 4.16161 4.51737 4.96565 4.51737 6.31515C4.51737 7.66464 4.509 9.55959 4.49228 12Z"
                                    fill="currentColor"/>
                        </svg>
                    </a>
                </div>
                <h3 class="footer__heading">Subscribe</h3>
                <p class="footer__desc">Subscribe our newsletter for the latest update of Lover</p>
                <form class="footer__form">
                    <input type="email" class="foot-form__input" placeholder="Enter you email...">
                    <button class="footer-form__submit">Subscribe</button>
                </form>
            </div>
        </div>
        <!--    copyright-->
        <div class="footer__copyright">
            <p class="footer__copyright-text">2024 Lover. Copyright and All rights reserved.</p>
        </div>
    </div>
</section>

</body>
</html>
