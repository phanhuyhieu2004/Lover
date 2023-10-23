<%--
  Created by IntelliJ IDEA.
  User: hieuh
  Date: 10/23/2023
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>



<html>
<head>
  <title>Lover</title>

  <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css" />
  <link rel="stylesheet" href="home.css" />

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
  .main-body{
    width: 100%;
    padding: 1rem;
  }

  .img game{

    margin-top: 10px;
    border-radius: 8px;

    display: block;
    padding: 6px 12px;
    border-radius: 5px;
    cursor: pointer;


  }



</style>
<body>




<jsp:include page="header.jsp"></jsp:include>

<div class="container">
  <nav>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <nav>
      <div class="side_navbar">
        <span>Game Category</span>
        <c:forEach var="i" begin="1" end="10">
          <a href="#">
            <img src="https://play-lh.googleusercontent.com/Msw_2aCxfjPxvKXlRLNz82pDmLwbyqVM8qLgty0uiavOzexo2QFwx0OaZ7rzs49-pA=s64" alt="Game" />
            Game
          </a>
        </c:forEach>
      </div>
    </nav>
  </nav>
  <div class="main-body">

    <div class="img game">
      <img src="https://files.playerduo.net/production/images/banner/446982ba-1aeb-4730-8d52-8e4308776e4b__ca8ef380-0f15-11ee-a657-a54d6be1d46a__admin_banner.jpg" style="width: 90%">
    </div>
  </div>

</div>

</body>
</html>
