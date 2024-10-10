<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lover</title>

    <link rel="apple-touch-icon" sizes="57x57" href="favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="manifest" href="favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="common.css">


    <link rel="stylesheet" href="information.css">

</head>
<style>

    .alert-success {
        background-color: forestgreen;
        margin: 10px;
        border-radius: 10px;
        color: white;
    }

    .information{
        width: 600px;

        margin: 30px auto;

        padding: 25px;
        background-color: #fff;
        border-radius: 10px;
    }

    .side_navbar {
        padding: 10px;
        display: flex;
        flex-direction: column;
        width: 220px;
    }

    select {
        margin-bottom: 0px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 0px;
    }


    .menu-text {
        margin-left: 10px;
    }

    label.required span {
        color: red;
    }

    p span.required {
        color: red;
    }

    input[type="submit"] {
        width: 50%;
        padding: 15px;
        background-color: hotpink;
        color: #fff;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 1.8rem;
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
<div class="container-information">
    <jsp:include page="dashboard.jsp"></jsp:include>

    <div class="information">

        <h2 class="information-heading">Information service provider</h2>
        <div id="successMessage" class=" alert-success" style="display: none;">

            <div>
                <p style="text-align: center">Update successful!</p>
            </div>
        </div>
        <form action="edit" method="post"
              enctype="multipart/form-data">
            <div class="form-group">
                <label for="name" class="required">Full name(<span>*</span>):</label>
                <input type="text" value="${accountDetail.fullName}" id="name" name="fullName" required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="dob" class="required">Date of birth(<span>*</span>):</label>
                    <input type="date" value="${accountDetail.dateOfBirth}" id="dob" name="dateOfBirth" required>
                </div>
                <div class="form-group">
                    <label for="genders" class="required">Gender(<span>*</span>):</label>
                    <select id="genders" name="gender" required style="background-color: white">
                        <option value="" disabled selected hidden>Select gender</option>
                        <option value="Man" ${accountDetail.gender == 'Man' ? 'selected' : ''}>Male</option>
                        <option value="Women" ${accountDetail.gender == 'Women' ? 'selected' : ''}>Female</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label for="city" class="required">City(<span>*</span>):</label>

                    <select id="city" name="city" required style="background-color: white">
                        <option value="" disabled selected hidden>Select city</option>
                        <option value="Ha Noi" ${accountDetail.city == 'Ha Noi' ? 'selected' : ''}>Ha Noi</option>
                        <option value="Ho Chi Minh" ${accountDetail.city == 'Ho Chi Minh' ? 'selected' : ''}>Ho Chi Minh</option>
                        <option value="Other" ${accountDetail.city == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="nationality" class="required">Nationality(<span>*</span>):</label>
                    <input type="text" value="${accountDetail.nationality}" id="nationality" name="nationality"
                           required>
                </div>
            </div>


            <div class="img-form"><label for="file1" class="img-label">Avatar(<span class="label-important">*</span>):</label>
                <div class="image-box" style="width: 160px;">
                    <img id="avatar-image" src="${accountDetail.avatar}">
                    <input type="file" name="image" id="file1" onchange="previewImage(this, '${accountDetail.avatar}')">
                </div>
                <p class="desc-form">Click on the squares to select photos from your device </p>


                <label for="file2" class="img-label">Portrait(<span class="label-important">*</span>):</label>
                <div class="row">
                    <div class="image-box">
                        <img id="portrait-image1" src="${accountDetail.portrait}">
                        <input type="file" name="portrait" id="file2"
                               onchange="previewImage(this, '${accountDetail.portrait}')">
                    </div>
                    <div class="image-box">
                        <img id="portrait-image2" src="${accountDetail.portrait1}">
                        <input type="file" name="portrait1" id="file3"
                               onchange="previewImage(this, '${accountDetail.portrait1}')">
                    </div>
                    <div class="image-box">
                        <img id="portrait-image3" src="${accountDetail.portrait2}">
                        <input type="file" name="portrait2" id="file4"
                               onchange="previewImage(this, '${accountDetail.portrait2}')">
                    </div>

                </div>
                <p class="desc-form">Click on the squares to select photos from your device </p></div>

            <div class="form-row">
                <div class="form-group">
                    <label for="height">Height:</label>
                    <input type="text" value="${accountDetail.height}" id="height" name="height" required>
                </div>
                <div class="form-group">
                    <label for="weight">Weight:</label>
                    <input type="text" value="${accountDetail.weight}" id="weight" name="weight" required>
                </div>
            </div>
            <div class="form-group">
                <label for="interests">Interest:</label>
                <textarea id="interests" name="interest" required>${accountDetail.interest}</textarea>
            </div>
            <div class="form-group">
                <label for="description">Describe yourself:</label>
                <textarea id="description" name="describeYourself" required>${accountDetail.describeYourself}</textarea>
            </div>
            <div class="form-group">
                <label for="requirements" class="required">Regulations(<span>*</span>):</label>
                <textarea id="requirements" name="regulations" required>${accountDetail.regulations}</textarea>
            </div>
            <div class="form-group">
                <label for="facebook">Facebook:</label>
                <input type="text" value="${accountDetail.facebook}" id="facebook" name="facebook">
            </div>
            <div class="form-group">
                <label for="dob" class="required">Join date (<span>*</span>):</label>
                <input type="date" id="dob1" name="joinDate" readonly>
            </div>

            <script>
                const today = new Date().toISOString().split('T')[0];
                document.getElementById('dob1').value = today;
            </script>

            <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

                <div class="form-group">
                    <label for="price" class="required">Price/hour(<span>*</span>):</label>
                    <input type="number" value="${accountDetail.price}" id="price" name="price">
                </div>
            </c:if>

            <div class="form-group">
                <label for="depositMoney" class="required">Deposit money(<span>*</span>):</label>
                <input type="number" value="${accountDetail.depositMoney}" id="depositMoney" name="depositMoney"
                       class="depositMoney" readonly>
            </div>


            <div class="form-group">
                <input type="submit" value="Update information">
                <p class="desc">Fields marked with (<span class="required">*</span>) are required to be entered</p>

            </div>


        </form>
    </div>
</div>


<script>
    const urlParams = new URLSearchParams(window.location.search);
    const successMessage = urlParams.get("success");

    // Kiểm tra nếu có thông báo thành công
    if (successMessage) {
        // Hiển thị thông báo thành công
        const successAlert = document.getElementById("successMessage");
        successAlert.style.display = "block";
    }
</script>
<jsp:include page="footer.jsp"></jsp:include>

<script>

    // xem trước hình ảnh được chọn từ một đầu vào tệp tin
    // input" là đối tượng đầu vào tệp tin và "imageName" là tên hình ảnh.
    function previewImage(input, imageName) {
        const reader = new FileReader();
        // đọc nội dung của tệp tin.
        reader.onload = function (e) {
            const img = input.previousElementSibling;
            img.src = e.target.result;
        }

        if (input.files && input.files[0]) {
            reader.readAsDataURL(input.files[0]);
            // Kiểm tra xem người dùng đã chọn một tệp tin (input.files) và có ít nhất một tệp tin được chọn (input.files[0]).
            // Nếu có tệp tin được chọn, sử dụng phương thức readAsDataURL của đối tượng FileReader để đọc dữ liệu của tệp tin dưới dạng URL dữ liệu (data URL).

        } else {
            const img = input.previousElementSibling;
            img.src = imageName; // Gán đường dẫn ảnh từ cơ sở dữ liệu vào thuộc tính src của thẻ <img>
            // Trong trường hợp không có tệp tin được chọn, gán đường dẫn hình ảnh từ biến "imageName" vào thuộc tính "src" của thẻ img trước đó. Điều này cho phép hiển thị hình ảnh mặc định từ cơ sở dữ liệu nếu không có tệp tin mới được chọn.
        }
    }
</script>
</body>
</html>