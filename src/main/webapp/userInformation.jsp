<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Information User</title>
    <link rel="stylesheet" href="information.css"/>
    <link rel="stylesheet" href="manager.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>


</head>
<style>
    .form-row {
        display: flex;
    }

    .form-group {
        flex: 1;
        margin-right: 10px;
    }

    .form-group:last-child {
        margin-right: 0;
    }

    h2 {
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        font-size: 20px;
    }
    .form-group input[type="text"],
    .form-group input[type="date"],
    .form-group select {
        width: 100%;
        height: 40px;
        padding: 5px;
        border-radius: 10px;
        border:  solid pink;
        box-sizing: border-box;
        font-size: 18px;
        outline: none;
        transition: border-color 0.3s ease-in-out;
    }

    .form-group input[type="text"]:focus,
    .form-group input[type="date"]:focus,
    .form-group select:focus {
        border-color: pink;
    }

    .form-group input[type="text"]:-webkit-autofill,
    .form-group input[type="date"]:-webkit-autofill,
    .form-group select:-webkit-autofill {
        box-shadow: 0 0 0 30px pink inset !important;
        -webkit-box-shadow: 0 0 0 30px pink inset !important;
    }


    input[type="submit"]:hover {
        background-color: mediumvioletred;
    }



    .form-group input[type="file"],
    .form-group textarea {
        width: 100%;
        height: 80px;

        padding: 15px;

        border:  solid pink;
        box-sizing: border-box;
        font-size: 18px;
        outline: none;
        resize: vertical;
    }
    .form-group input[type="file"] {
        display: none;
    }

    .image-box {
        width: 200px;
        height: 100px;
        margin: 10px;
        position: relative;
        display: inline-block;
        cursor: pointer;

        border: 2px solid deeppink; /* Change the border color as desired */
        transition: transform 0.2s ease-in-out;
    }

    .image-box:hover {
        transform: scale(1.05);
    }

    .image-box img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        cursor: pointer;
    }

    .image-box input[type=file] {
        width: 100%;
        height: 100%;
        opacity: 0;
        position: absolute;
        top: 0;
        left: 0;
        cursor: pointer;
    }
    .image-box {
        position: relative;
    }


    .row {
        display: flex;
        justify-content: space-between;
    }

    @media (max-width: 768px) {
        .container {
            max-width: 90%;
        }

    }
    .alert-success {
        background-color: forestgreen;
        margin: 10px;
        border-radius: 10px;
        color: white;
    }
    .container{
        margin-top: 40px;
        margin-bottom: 40px;
        display: flex;
        justify-content: space-between;
    }
    label.required span {
        color: red;
    }
    p span.required {
        color: red;
    }
    .containers {
        width: 500px;

        margin-top: auto;
        margin-bottom:10px;
        margin-right: 350px;
        padding: 25px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px hotpink;
    }
    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 210px;
    }
    select{
        margin-bottom: 0px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
    }
    .form-group label {
        display: block;
        margin-bottom: 10px;

        font-weight: 700;
        font-size: 20px;
    }
    .menu-text {
        margin-left: 10px;
    }

    input[type="submit"] {
        width: 50%;
        padding: 15px;
        background-color: deeppink;
        color: #fff;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 18px;
        outline: none;
        transition: background-color 0.3s ease-in-out;
    }
    .sticky-nav {
        position: sticky;
        top: 0;
        z-index: 100;
    }
</style>
<body style="background: white">

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav class="sticky-nav" style="background-color: #FFE4E1;height: 100%;";>


    <div class="side_navbar">
            <a href="dashboard">  <i class="fa-solid fa-grip"></i><span class="menu-text">Dashboard</span></a>

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 1}">
                <a href="listAccount" ><i class="fa-solid fa-list"></i><span class="menu-text">Manager</span></a>
                <a href="status">Status Manager</a>
            </c:if>

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="serviceProviderInformation"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information</span></a>
            </c:if>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 3}">

                <a href="userInformation"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information</span></a>
            </c:if>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="serviceCategory" > <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Service category</span></a>
            </c:if>
            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <a href="serviceList" > <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Service List</span></a>
            </c:if>
            <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
            <a href="#"><i class="fa-solid fa-envelope"></i><span class="menu-text">Email</span></a>
            <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
            <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>
            <a href="#"><i class="fa-solid fa-globe"></i><span class="menu-text">Connect</span></a>
            <a href="#"><i class="fa-solid fa-chart-simple"></i><span class="menu-text">Statistical</span></a>
            <a href="#"><i class="fa-solid fa-users-slash"></i><span class="menu-text">Blacklist</span></a>
        </div>
    </nav>
    <div class="containers">

        <h2>Personal information</h2>
        <center> <p class=" alert-success" style="color: white" >${messSuccess}</p></center>
        <form  action="#" method="post" enctype="multipart/form-data">
            <div class="form-group"style="margin-right:0px">
                <label for="name" class="required">Full name(<span>*</span>):</label>
                <input type="text"  value="${accountDetail.fullName}" id="name" name="fullName" required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="dob" class="required">Date of birth(<span>*</span>):</label>
                    <input type="date"value="${accountDetail.dateOfBirth}" id="dob" name="dateOfBirth" required>
                </div>
                <div class="form-group"  >
                    <label for="gender"class="required">Gender(<span>*</span>):</label>
                    <select id="gender" name="gender" required style="background-color: white">
                        <option value="">Choose gender</option>
                        <option value="Man" ${accountDetail.gender == 'Man' ? 'selected' : ''}>Man</option>
                        <option value="Women" ${accountDetail.gender == 'Women' ? 'selected' : ''}>Women</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="city"class="required">City(<span>*</span>):</label>

                    <input type="text" value="${accountDetail.city}"id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="nationality"class="required">Nationality(<span>*</span>):</label>
                    <input type="text" value="${accountDetail.nationality}"id="nationality" name="nationality" required>
                </div>
            </div>


            <label for="file1">Avatar:</label>
            <div class="image-box" style="width: 130px">
                <img id="avatar-image" src="${accountDetail.avatar}">
                <input type="file" name="image" id="file1" onchange="previewImage(this, '${accountDetail.avatar}')">
            </div>
            <p>Click on the squares to select photos from your device </p>








            <div class="form-group"style="margin-right:0px">
                <label for="interests">Interest:</label>
                <textarea id="interests" name="interest" required>${accountDetail.interest}</textarea>
            </div>


            <div class="form-group"style="margin-right:0px">
                <label for="facebook">Facebook:</label>
                <input type="text"value="${accountDetail.facebook}" id="facebook" name="facebook">
            </div>
            <div class="form-group">
                <label for="dob"class="required">Join date(<span>*</span>):</label>
                <input type="date" value="${accountDetail.joinDate}"id="dob1" name="joinDate" required>
            </div>



            <div style="text-align: center" class="form-group">
                <input type="submit" value="Update information">
            </div>
            <center>
                <p>Fields marked with (<span class="required">*</span>) are required to be entered</p>
            </center>          </form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>
    function previewImage(input, imageName) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const img = input.previousElementSibling;
            img.src = e.target.result;
        }

        if (input.files && input.files[0]) {
            reader.readAsDataURL(input.files[0]);
        } else {
            const img = input.previousElementSibling;
            img.src = imageName; // Gán đường dẫn ảnh từ cơ sở dữ liệu vào thuộc tính src của thẻ <img>
        }
    }
</script>
</body>
</html>