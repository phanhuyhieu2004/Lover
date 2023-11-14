<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Information</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="information.css"/>
    <link rel="stylesheet" href="manager.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>


</head>
<style>
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
        width: 200px;
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
    </style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <nav style="background-color: white">

        <div class="side_navbar">

            <c:if test="${sessionScope.acc != null && sessionScope.acc.accountName == 'Admin' && sessionScope.acc.password == '12345' }">
                <a href="listAccount"><i class="fa-solid fa-list"></i><span class="menu-text">Manager</span></a>
            </c:if>

            <c:if test="${sessionScope.acc.accountName != 'Admin' }">

                <a href="information"class="active"><i class="fa-solid fa-circle-info"></i></i><span
                        class="menu-text">Information</span></a>
            </c:if>
            <c:if test="${sessionScope.acc.accountName != 'Admin' }">

                <a href="service"> <i class="fa-solid fa-bars"></i> <span
                        class="menu-text">Services</span></a>
            </c:if>
            <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
            <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
            <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>
        </div>
    </nav>
    <div class="containers">

        <h2>Personal information</h2>
       <center> <p class=" alert-success" style="color: white" >${messSuccess}</p></center>
        <form  action="information" method="post" enctype="multipart/form-data">
            <div class="form-group"style="margin-right:0px">
                <label for="name">Full name(*):</label>
                <input type="text" id="name" name="fullName" required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="dob">Date of birth(*):</label>
                    <input type="date" id="dob" name="dateOfBirth" required>
                </div>
                <div class="form-group"  >
                    <label for="gender">Gender(*):</label>
                    <select id="gender" name="gender" required style="background-color: white" >
                        <option value="">Choose gender</option>
                        <option value="Nam">Man</option>
                        <option value="Nữ">Women</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="city">City(*):</label>

                    <input type="text" id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="nationality">Nationality(*):</label>
                    <input type="text" id="nationality" name="nationality" required>
                </div>
            </div>


            <label for="file1">Avatar:</label>
            <div class="image-box" style="width: 130px">
                <img id="avatar-image" src="">

                <input type="file" name="image" id="file1" onchange="previewImage(this)">
            </div>
            <p>Click on the squares to select photos from your device </p>


            <!-- Remaining form fields... -->


            <label for="file2">Portrait:</label>
            <div class="row">
                <div class="image-box">
                    <img id="portrait-image1" src="">
                    <!--                    <div class="image-placeholder"><i class="fa-solid fa-camera"></i></div>-->
                    <input type="file" name="portrait" id="file2" onchange="previewImage(this)">
                </div>
                <div class="image-box">
                    <img id="portrait-image2" src="">
                    <!--                    <div class="image-placeholder"><i class="fa-solid fa-camera"></i></div>-->
                    <input type="file" name="portrait1" id="file3" onchange="previewImage(this)">
                </div>
                <div class="image-box">
                    <img id="portrait-image3" src="" >
                    <!--                    <div class="image-placeholder"><i class="fa-solid fa-camera"></i></div>-->
                    <input type="file"name="portrait2" id="file4" onchange="previewImage(this)">
                </div>

            </div>
            <p>Click on the squares to select photos from your device </p>

            <div class="form-row">
                <div class="form-group">
                    <label for="height">Height:</label>
                    <input type="text" id="height" name="height" required>
                </div>
                <div class="form-group">
                    <label for="weight">Weight:</label>
                    <input type="text" id="weight" name="weight" required>
                </div></div>
            <div class="form-group"style="margin-right:0px">
                <label for="interests">Interest:</label>
                <textarea id="interests" name="interest" required></textarea>
            </div>
            <div class="form-group"style="margin-right:0px">
                <label for="description">Describe yourself:</label>
                <textarea id="description" name="describeYourself" required></textarea>
            </div>
            <div class="form-group"style="margin-right:0px">
                <label for="requirements">Request to users:</label>
                <textarea id="requirements" name="requestWithUser"required></textarea>
            </div>
            <div class="form-group"style="margin-right:0px">
                <label for="facebook">Facebook:</label>
                <input type="text" id="facebook" name="facebook"required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="dob">Join date:</label>
                    <input type="date" id="dob1" name="joinDate" required>
                </div>
                <div class="form-group">
                   <label for="price">Price(*):</label>
                    <input type="text" id="price" name="price"  placeholder="hourly price" required>
                </div>

            </div>

            <div style="text-align: center" class="form-group">
                <input type="submit" value="Update information">
            </div>
            <center><p>Fields marked with (*) are required to be entered</p></center>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script>
    function previewImage(input) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const img = input.previousElementSibling;
            img.src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    }
</script>
</body>
</html>