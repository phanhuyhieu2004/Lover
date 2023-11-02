<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Đăng ký người dùng</title>
<%--    <style>--%>
<%--        --%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background-color: #f4f4f4;--%>
<%--        }--%>
<%--        .container {--%>
<%--            max-width: 300px;--%>
<%--            margin: 0 auto;--%>
<%--            padding: 20px;--%>
<%--            background-color: #fff;--%>
<%--            border-radius: 5px;--%>
<%--            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>
<%--        h2 {--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        .form-group {--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>
<%--        label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--            font-weight: bold;--%>
<%--        }--%>
<%--        input[type="text"],--%>
<%--        input[type="date"],--%>
<%--        select,--%>
<%--        textarea {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            border-radius: 3px;--%>
<%--            border: 1px solid #ccc;--%>
<%--        }--%>
<%--        input[readonly] {--%>
<%--            background-color: #f4f4f4;--%>
<%--        }--%>
<%--        preview-img {--%>
<%--            display: flex;--%>
<%--            max-width: 150px;--%>
<%--            margin: 0 1em 1em 0;--%>
<%--            padding: 0.5em;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 3px;--%>
<%--        }--%>
<%--        input[type="submit"] {--%>
<%--            width: 50%;--%>
<%--            padding: 10px;--%>
<%--            background-color: blue;--%>
<%--            color: #fff;--%>
<%--            border: none;--%>
<%--            cursor: pointer;--%>
<%--        }--%>
<%--    </style>--%>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
    <h2>Đăng thông tin cá nhân</h2>
    <form>
        <div class="form-group">
            <label for="name">Tên:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="dob">Năm sinh:</label>
            <input type="date" id="dob" name="dob" required>
        </div>
        <div class="form-group">
            <label for="gender">Giới tính:</label>
            <select id="gender" name="gender" required>
                <option value="">Chọn giới tính</option>
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
                <option value="Khác">Khác</option>
            </select>
        </div>
        <div class="form-group">
            <label for="city">Thành phố:</label>
            <input type="text" id="city" name="city" required>
        </div>
        <div class="form-group">
            <label for="nationality">Quốc tịch:</label>
            <input type="text" id="nationality" name="nationality" required>
        </div>
        <div class="form-group">
            <label for="file1">Ảnh đại diện:</label>
            <%--            <input type="file" id="avatar" name="avatar" required accept="image/*">--%>
            <input type="file" id="file1" class="form-control mb-4" />
            <div class="preview" id="preview-avatar"></div>

        </div>
        <div class="form-group">
            <label for="file">Ảnh chân dung:</label>
            <input type="file" id="file" class="form-control mb-4" multiple accept="image/*">
            <div class="preview" id="preview"></div>
        </div>
        <div class="form-group">
            <label for="height">Chiều cao:</label>
            <input type="text" id="height" name="height">
        </div>
        <div class="form-group">
            <label for="weight">Cân nặng:</label>
            <input type="text" id="weight" name="weight">
        </div>
        <div class="form-group">
            <label for="interests">Sở thích:</label>
            <textarea id="interests" name="interests"></textarea>
        </div>
        <div class="form-group">
            <label for="description">Mô tả về bản thân:</label>
            <textarea id="description" name="description"></textarea>
        </div>
        <div class="form-group">
            <label for="requirements">Yêu cầu với người thuê:</label>
            <textarea id="requirements" name="requirements"></textarea>
        </div>
        <div class="form-group">
            <label for="facebook">Facebook (link):</label>
            <input type="text" id="facebook" name="linkface">
        </div>
        <div class="form-group">
            <label for="dob">Ngày tham gia:</label>
            <input type="date" id="dob1" name="dob" required>
        </div>
        <div class="form-group">
            <label for="rentalCount">Số lần được thuê:</label>
            <input type="text" id="rentalCount" name="rentalCount" readonly value="0">
        </div>
        <div style="text-align: center" class="form-group">
            <input type="submit" value="Đăng thông tin">
        </div>
    </form>
</div>

<script>
    const ipnFileElement1 = document.querySelector('#file1');
    const avatarImgElement = document.querySelector('#preview-avatar');
    const ipnFileElement = document.querySelector('#file');
    const resultElement = document.querySelector('#preview');
    const validImageTypes = ['image/gif', 'image/jpeg', 'image/png'];

    ipnFileElement1.addEventListener('change', function(e) {
        const files = e.target.files;
        const file = files[0];
        const fileType = file['type'];

        if (!validImageTypes.includes(fileType)) {
            avatarImgElement.insertAdjacentHTML(
                'beforeend',
                '<span class="preview-img">Chọn ảnh đi :3</span>'
            )
            return;
        }

        const fileReader = new FileReader();
        fileReader.readAsDataURL(file);

        fileReader.onload = function() {
            const url = fileReader.result;
            avatarImgElement.innerHTML =
                '<img src="' + url + '" alt="${file1.name}" class="preview-img" width="25%" style="text-align: center"/>';
        }
    })


    ipnFileElement.addEventListener('change', function(e) {
        const files = e.target.files;
        const file = files[0];
        const fileType = file['type'];

        if (!validImageTypes.includes(fileType)) {
            resultElement.insertAdjacentHTML(
                'beforeend',
                '<span class="preview-img">Chọn ảnh đi :3</span>'
            )
            return;
        }

        const fileReader = new FileReader();
        fileReader.readAsDataURL(file);

        fileReader.onload = function() {
            const url = fileReader.result;
            resultElement.insertAdjacentHTML(
                'beforeend',
                '<img src="' + url + '" alt="${file.name}" class="preview-img" width="25%" style="padding:10px"/>'
            )
        }
    })
</script>
<%--<jsp:include page="footer.jsp"></jsp:include>--%>

</body>
</html>