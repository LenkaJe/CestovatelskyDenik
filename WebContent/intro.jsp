<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
      body, html {
        height: 100%;
        margin: 0;
        font-family: Calibri, Calibri, sans-serif;
      }

      .hero-image {
        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("uvod_foto.jpg");
        height: 50%;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
      }

      .hero-text {
        text-align: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
      }

      .hero-text button {
        border: 2px solid ;
        display: inline-block;
        padding: 10px 25px;
        color: transparent;
        background-color:transparent;
        text-align: center;
        cursor: pointer;
      }

      .hero-text button:hover {
        background-color: #3d3d5c;
        color: white;
      }
        .hero-text button {
          background-color: transparent;
          color: floralwhite;    
      }
      
      .navbar {
        
        overflow: hidden;
        background-color: #223C55;
        font-family: calibri, calibri, sans-serif;
      }

      .navbar a {
        float: right;
        font-size: 16px;
        color: lightcoral;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
      }

      .dropdown {
        float: left;
        overflow: hidden;
      }

      .dropdown .dropbtn {
        font-size: 16px;    
        border: none;
        outline: none;
        color: white;
        padding: 14px 16px;
        background-color: #223C55;
        font-family: inherit;
        margin: 0;
      }

      .navbar a:hover, .dropdown:hover .dropbtn {
        background-color: transparent;
      }

      .dropdown-content {
        display: none;
        position: absolute;
        background: none;
        background-color: #223C55;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
      }

      .dropdown-content a {
        float: none;
        background:none;
        color: whitesmoke;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        text-align: left;
      }

      .dropdown-content a:hover {
        background-color: black;
      }

      .dropdown:hover .dropdown-content {
        display: block;
      }
  
    </style>
  </head>
<body>
 <div class="hero-image">
      <div class="hero-text">
        <h1 style="font-size:25px">Cestovatelský deník </h1>
        &nbsp
        <p>Komunita vybudovaná cestovateli a výletníky pro cestovatele, kteří se chtějí podělit o své zážitky</p>
      	<form action="DenikServlet" method="get">
        <button type="button" onclick="location.href='newRecord.jsp';">Nový zápis</button>  
        <button type="submit" name = "action" value = "list">Seznam zápisů</button>
        </form>
      </div>
    </div>
    
   <%--
    <div class="navbar">
      <div class="dropdown">
        <button class="dropbtn">Vyber podle priorit 
          <i class="fa fa-caret-down"></i>
        </button>
        
        <div class="dropdown-content">
        <form action="DenikServlet" method ="get">
        <p>  <button type="submit" name = "filter" value = "1">Výlet vhodný pro psy </button>  </p>
        <p>  <button type="submit" name = "filter" value = "2">Výlet vhodný pro rodiny s dětmi</button> </p>
        <p>  <button type="submit" name = "filter" value = "3">Výlet vhodný pro osoby na invalidním vozíku <i class="fab fa-accessible-icon"></i></button> </p>
        </form>
        </div>        
      </div> 
    </div>
     --%> 
 </body>
</html>