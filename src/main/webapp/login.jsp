

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
</style>
<body>
<div class="container" id="container">

    <div class="form-container register-container">
        <form action="#">
            <h1>Register hire.</h1>
            <div class="input-row">
                <input type="text" name="name" placeholder="UserName" required>
                <input type="password" name="password" placeholder="Password" required>

            </div>
            <input type="email" name="email" placeholder="Email" required>
            <div class="input-row">
                <input type="tel" name="phoneNumber" placeholder="Phone Number" required>
                <input type="text" name="identifyCard" placeholder="Identify Card" required>
            </div>
            <div class="input-row">
                <input type="text" name="surname" placeholder="Surname" required>
                <input type="text" name="name" placeholder="Name" required>

            </div>
            <input type="text" name="nickName" placeholder="Nickname" required>
            <select>

                <option selected value="0">Who do you want to be?</option>
                <option value="1">User</option>
                <option value="2">Service provider</option>
            </select>
            <button>Register</button>

        </form>
    </div>

    <div class="form-container login-container">
        <form class="form-signin" action="login" method="post">

            <h1>Login hire.</h1>
            <form method="post" action="login">
                <input name="user"  type="text" placeholder="User">
                <input name="pass"  type="password" placeholder="Password">
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
