<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Login / Registration </title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

</head>
<style>
    select {

        border: 0;
        outline: 0;
        font: inherit;

        width: 20em;
        height: 3em;
        padding: 0 4em 0 1em;


        border-radius: 0.25em;

    }

    .container {
        width: 900px;
        max-width: 200%;
        min-height: 700px;
    }

    .input-row {
        display: flex;
        gap: 10px; /* Khoảng cách giữa các input */
    }

    .input-row input {
        flex: 1; /* Để input chiếm phần bằng nhau trên hàng */
    }

     .alert.alert-warning {
         background-color: yellow;
         color: black;
     }

</style>
</style>
<body>
<jsp:include page="Flower.jsp"></jsp:include>

<div class="container" id="container">

    <div class="form-container register-container">
        <form id="signup-form" action="register" method="post">
            <div class="alert alert-successful" role="alert" style="background-color: limegreen;">${messSignUp}</div>
            <h1>Register hire.</h1>
            <div class="input-row">
                <input type="text" name="accountName" placeholder="UserName" required>
                <input type="password" name="password"
                       placeholder="Passwords " required
                       pattern="^.{6,15}$"
                       title="Please need to be between 6 and 15 characters long.">


            </div>
            <input type="email" id="email-input" placeholder="email@address.com" name="email" required/>
            <div class="input-row">
                <input type="tel" name="phoneNumber" placeholder="Phone Number" required>
                <input type="text" name="identifyCard" placeholder="Identify Card" required>
            </div>
            <div class="input-row">
                <input type="text" name="surname" placeholder="Surname" required>
                <input type="text" name="name" placeholder="Name" required>
            </div>
            <input type="text" name="nickName" placeholder="Nickname" required>
            <div class="role" style="display: flex">
                <label><input type="checkbox" name="role_service" value="2"> Service Provider</label>
                <label><input type="checkbox" name="role_user" value="3"> User</label>
            </div>
            <button type="submit" value="Save">Register</button>

        </form>

    </div>

    <div class="form-container login-container">
        <form class="form-signin" action="signin" method="post">

            <h1>Login hire.</h1>
            <div class="alert alert-warning" role="alert">${mess}</div>
            <form method="post" action="signin">
                <input name="account" type="text" placeholder="Account">
                <input name="pass" type="password" placeholder="Password">
                <div class="content">
                    <div class="checkbox">
                        <input type="checkbox" name="checkbox" id="checkbox">
                        <label>Remember me</label>
                    </div>
                    <div class="pass-link">
                        <a href="#">Forgot password?</a>
                    </div>
                </div>
                <button>Login</button>
            </form>

        </form>
    </div>

    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1 class="title">Hello <br> friends</h1>
                <p>if Yout have an account, login here and have fun</p>
                <button class="ghost" id="login">Login
                    <i class="lni lni-arrow-left login"></i>
                </button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1 class="title">Start yout <br> journy now</h1>
                <p>if you don't have an account yet, join us and start your journey.</p>
                <button class="ghost" id="register">Register
                    <i class="lni lni-arrow-right register"></i>
                </button>
            </div>
        </div>
    </div>

</div>

<script src="script.js"></script>

</body>
</html>