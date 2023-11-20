<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>

  <title>Manager Service</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="manager.css">
</head>
<style>
  .menu-text {
    margin-left: 10px;
  }

  .block-btn {
    background-color: #cf3a35; /* Màu đỏ */
    border: none;
    border-radius: 5px;
    color: #fff; /* Màu chữ trắng */
    font-size: 10px;
    font-weight: bold;
    padding: 8px 16px;
    text-transform: uppercase; /* Chữ in hoa */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); /* Đổ bóng */
    transition: all 0.3s ease; /* Hiệu ứng chuyển động */

  }

  .block-btn:hover {
    background-color: #e74b48; /* Màu đỏ sáng */
    cursor: pointer;
    box-shadow: 0 4px 9px rgba(0, 0, 0, 0.5); /* Hiệu ứng đổ bóng lớn hơn */
  }

  table {
    background: papayawhip;
    padding: 1rem;
    text-align: left;

    border: 5px solid deeppink;
    width: 500px;
    height: 70%;
    margin-right: 40px;
    margin-left: 30px;

  }

  table td, th {
    padding: 0.2rem 0.8rem;
    border-bottom: 1px solid deeppink;
    border-right: 1px solid deeppink;
  }

  table th {
    font-size: 15px;
  }

  table td {
    font-size: 15px;
  }


  .side_navbar {
    padding: 10px;
    display: flex;
    flex-direction: column;
    width: 200px;
  }

  .container {
    margin-top: 40px;
    margin-bottom: 40px;
    display: flex;
    justify-content: space-between;
  }

</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="Flower.jsp"></jsp:include>
<div class="container">
  <nav style="background-color: white">

    <div class="side_navbar">


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
                class="menu-text">Service Catalog</span></a>
      </c:if>
      <c:if test="${sessionScope.acc != null && sessionScope.acc.role.idRole == 2}">

        <a href="serviceList"class="active" > <i class="fa-solid fa-bars"></i> <span
                class="menu-text">Service List</span></a>
      </c:if>

      <a href="#"><i class="fa-solid fa-wallet"></i><span class="menu-text">E-wallet</span></a>
      <a href="#"><i class="fa-solid fa-circle-play"></i><span class="menu-text">Player</span></a>
      <a href="#"><i class="fa-solid fa-circle-dollar-to-slot"></i><span class="menu-text">Donate</span></a>
    </div>
  </nav>
  <div class="main-body" style="margin-right: 130px">




    <div class="table info">
      <table id="userTable">
        <thead>
        <tr>
          <th>STT</th>

          <th>Name service</th>
          <th>Category</th>
          <th>Price</th>

          <th>Edit</th>
          <th>Delete</th>
        </tr>
        </thead>
        <tbody>


        <tr>
          <td>1</td>
          <td>Tên dịch vụ</td>
          <td>Chơi game,Đi xem phim</td>

          <td>Gía</td>


          <td>
            <button class="block-btn" onclick="blockAccount('${user.idAccount}')">Edit</button>
          </td>
          <td>
            <button class="block-btn" onclick="blockAccount('${user.idAccount}')">Delete</button>
          </td>
        </tbody>
      </table>


    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>
