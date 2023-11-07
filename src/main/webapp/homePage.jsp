<%--
  Created by IntelliJ IDEA.
  User: buimai
  Date: 11/3/23
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Giao diện trang chủ</title>


    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <link rel="stylesheet" href="homePage.css"/>
    <script src="https://kit.fontawesome.com/74cf7057a9.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container" style=" max-width: 1000px;">
    <div class="header">
        <select class="btn btn-outline-danger" id="gender">
            <option value="gender">Giới tính</option>
            <option value="male">Nam</option>
            <option value="female">Nữ</option>
            <option value="other">Khác</option>
        </select>

        <select class="btn btn-outline-danger" id="category">
            <option value="category">Thể loại</option>
            <option value="new">Người mới</option>
            <option value="hot">Hot</option>
            <option value="vip">Vip</option>
        </select>

        <select class="btn btn-outline-danger" id="view">
            <option value="price">View</option>
            <option value="10">5 - 10</option>
            <option value="20">5 - 20</option>
            <option value="30">5 - 30 </option>
            <option value="40">5 - 40</option>
            <option value="50">5 - 50</option>
            <option value="60">5 - 60</option>
            <option value="70">5 - 70</option>
            <option value="80">5 - 80</option>
            <option value="90">5 - 90</option>
            <option value="100">5 - 100</option>
            <option value="100">> 100k</option>
        </select>


        <input type="checkbox" class="btn-check"  id="online" autocomplete="off">
        <label class="btn btn-outline-danger" style="width: 100px; height: 37px; font-size: 10px;padding-top: 10px;" for="online">Online</label>

        <select class="btn btn-outline-danger" id="price">
            <option value="price">Khoảng giá</option>
            <option value="10">5.000 - 10.000</option>
            <option value="20">5.000 - 20.000</option>
            <option value="30">5.000 - 30.000</option>
            <option value="40">5.000 - 40.000</option>
            <option value="50">5.000 - 50.000</option>
            <option value="60">5.000 - 60.000</option>
            <option value="70">5.000 - 70.000</option>
            <option value="80">5.000 - 80.000</option>
            <option value="90">5.000 - 90.000</option>
            <option value="100">5.000 - 100.000</option>
        </select>
        <input class="btn btn-outline-danger" type="text" id="live" placeholder="Sống tại">

        <input class="btn btn-outline-danger" type="text" id="nameplayer" placeholder="Tên/Url Player">

        <input class="btn btn-outline-danger" type="text" id="namegame" placeholder="Tên game">

        <button class="btn btn-outline-danger" style="font-size: 10px;height: 37px; width: 80px; float: right;" type="submit" value="search">
            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg>
            Tìm kiếm</button>

    </div>
    <div class="content">
        <div class="front">
            <b style="font-size: 20px">VIP PLAYER</b>

            <div class="img1" style="width: 100% ; height: 550px; background-color: #f5e8e8">
                <%--            <c:forEach var="list" items="${listServiceProvider}">--%>
                <div class="box" style="width: 190px; height: 272px; background-color: white; float: left">
                    <div class="imgPlayer" style="width: 190px; height: 200px; background-color: paleturquoise">
                        <button type="button" value="display" style="width: 90px; height: 28px; border-radius: 15px/15px; background-color: #dc3545; float: right; margin-top: 165px; margin-right: 5px;"></button>
                    </div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: #4bb6b7"></div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: tomato"></div>
                    <div class="imgUser" style="width: 190px; height: 25px; display: flex; justify-content: space-between">
                        <div style="display: flex;">
                            <div class="circle" id="circle-1"></div>
                            <div class="circle" id="circle-2"></div>
                            <div class="circle" id="circle-3"></div>
                        </div>

                        <div class="star" style="color:yellow;">
                            <i  style="font-size: 20px" class="fa-solid fa-star"></i>
                            <span><b style="color: #3f3a3a">5</b></span>
                        </div>
                    </div>
                    <a href="/project?action=add&id=${list.getId()}">
                        <img src="${list.getImg()}">
                    </a>
                    <h2>${list.getName()}</h2>
                    <h2>${list.getDescribe()}</h2>
                </div>

                <div class="box" style="width: 190px; height: 272px ; background-color: white; margin-left: 30px; float: left">
                    <div class="imgPlayer" style="width: 190px; height: 200px; background-color: paleturquoise">
                        <button type="button" value="display" style="width: 90px; height: 28px; border-radius: 15px/15px; background-color: #dc3545; float: right; margin-top: 165px; margin-right: 5px;"></button>
                    </div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: #4bb6b7"></div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: tomato"></div>
                    <div class="imgUser" style="width: 190px; height: 25px; display: flex; justify-content: space-between">
                        <div style="display: flex;">
                            <div class="circle" id="circle-4"></div>
                            <div class="circle" id="circle-5"></div>
                            <div class="circle" id="circle-6"></div>
                        </div>

                        <div class="star" style="color:yellow;">
                            <i  style="font-size: 20px" class="fa-solid fa-star"></i>
                            <span><b style="color: #3f3a3a">5</b></span>
                        </div>
                    </div>
                    <a href="/project?action=add&id=${list.getId()}">
                        <img src="${list.getImg()}">
                    </a>
                    <h2>${list.getName()}</h2>
                    <h2>${list.getDescribe()}</h2>
                </div>
                <%--            </c:forEach>--%>
            </div>
            <div class="front-end">
                <b style="font-size: 20px">HOT PLAYER</b>
            </div>
            <div class="img2" style="width: 100% ; height: 500px; background-color: #f5e8e8">
                <%--            <c:forEach var="list" items="${listServiceProvider}">--%>
                <div class="box" style="width: 190px; height: 272px; background-color: white; float: left">
                    <div class="imgPlayer" style="width: 190px; height: 200px; background-color: paleturquoise">
                        <button type="button" value="display" style="width: 90px; height: 28px; border-radius: 15px/15px; background-color: #dc3545; float: right; margin-top: 165px; margin-right: 5px;"></button>
                    </div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: #4bb6b7"></div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: tomato"></div>
                    <div class="imgUser" style="width: 190px; height: 25px; display: flex; justify-content: space-between">
                        <div style="display: flex;">
                            <div class="circle" id="circle-7"></div>
                            <div class="circle" id="circle-8"></div>
                            <div class="circle" id="circle-9"></div>
                        </div>

                        <div class="star" style="color:yellow;">
                            <i  style="font-size: 20px" class="fa-solid fa-star"></i>
                            <span><b style="color: #3f3a3a">5</b></span>
                        </div>
                    </div>
                    <a href="/project?action=add&id=${list.getId()}">
                        <img src="${list.getImg()}">
                    </a>
                    <h2>${list.getName()}</h2>
                    <h2>${list.getDescribe()}</h2>
                </div>

                <div class="box" style="width: 190px; height: 272px ; background-color: white; margin-left: 30px; float: left">
                    <div class="imgPlayer" style="width: 190px; height: 200px; background-color: paleturquoise">
                        <button type="button" value="display" style="width: 90px; height: 28px; border-radius: 15px/15px; background-color: #dc3545; float: right; margin-top: 165px; margin-right: 5px;"></button>
                    </div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: #4bb6b7"></div>
                    <div class="namePlayer" style="width: 190px; height: 23px; background-color: tomato"></div>
                    <div class="imgUser" style="width: 190px; height: 25px; display: flex; justify-content: space-between">
                        <div style="display: flex;">
                            <div class="circle" id="circle-10"></div>
                            <div class="circle" id="circle-11"></div>
                            <div class="circle" id="circle-12"></div>
                        </div>

                        <div class="star" style="color:yellow;">
                            <i  style="font-size: 20px" class="fa-solid fa-star"></i>
                            <span><b style="color: #3f3a3a">4.8</b></span>
                        </div>
                    </div>
                    <a href="/project?action=add&id=${list.getId()}">
                        <img src="${list.getImg()}">
                    </a>
                    <h2>${list.getName()}</h2>
                    <h2>${list.getDescribe()}</h2>
                </div>
                <%--            </c:forEach>--%>
            </div>
        </div>
    </div>
</div>
<script>
    var select = document.querySelector('#gender');
    select.addEventListener('change',function(e){
        if(select.options.selectedIndex !== 0) {
            select.classList.add("bg-red");
        }else {
            select.classList.remove("bg-red");
        }
    });
    var cate = document.querySelector('#category');
    cate.addEventListener('change',function(e){
        if(cate.options.selectedIndex !== 0) {
            cate.classList.add("bg-red");
        }else {
            cate.classList.remove("bg-red");
        }
    });
    var view = document.querySelector('#view');
    view.addEventListener('change',function(e){
        if(view.options.selectedIndex !== 0) {
            view.classList.add("bg-red");
        }else {
            view.classList.remove("bg-red");
        }
    });
    var price = document.querySelector('#price');
    price.addEventListener('change',function(e){
        if(price.options.selectedIndex !== 0) {
            price.classList.add("bg-red");
        }else {
            price.classList.remove("bg-red");
        }
    });
</script>
</body>
</html>
