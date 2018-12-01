<%@page import="cz.czechitas.denik.bean.Record"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cz.czechitas.denik.bean.RecordList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seznam cestovatelských zápisů</title>
  <style> <style>
      body, html {
        height: 100%;
        margin: 0;
        font-family: Calibri, Calibri, sans-serif;
      }

      .hero-image {
        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("bus.jpg");
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

      .hero-obsah {
        text-align: center;
        position: absolute;
        top: 80%;
        left: 22%;
        transform: translate(-100%, -50%);
        color: #61544E;
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
        background-color: #61544E;
        color: white;
      }
      .hero-text button {
        background-color: transparent;
        color: floralwhite;    
      }

      .navbar {

        overflow: hidden;
        background-color: #61544E;
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
        background-color: #61544E;
        font-family: inherit;
        margin: 0;
      }

      .navbar a:hover, .dropdown:hover .dropbtn {
        background-color: transparent;
      }

      .dropdown-content {
        display: none;
        position: absolute;
        background-color: #61544E;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
      }

      .dropdown-content a {
        float: none;
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
        .tableclass {
  border: 1px solid black;
  
  }
  .tableposition {position: fixed;
        top: 50%;
        left: 50%;}
  .tdclass { 
  border: 1px solid black
  }
    </style>
  </head>
  <body>

  <div class="hero-image">
  <div class="hero-text">
    <h1 style="font-size:25px">Seznam cestovatelských zápisů</h1>
    &nbsp;
        <p>Komunita vybudovaná cestovateli a výletníky pro cestovatele, kteří se chtějí podělit o své zážitky</p>

        <button>Nový záznam</button>  
      </div>
    </div>
  <p> </p>
  
 <div class="tableposition">
    Projdete si záznamy a inspirujte se na cesty
 <form action="DenikServlet" method="get">  

 <table class = "tableclass">
        <tr>
        <th class ="tdclass"> Název výletu </th>
        <th class ="tdclass"> Jméno autora </th>
        <th class ="tdclass"> Okres </th>
        <th class ="tdclass"> Hodnocení </th>
        <th class ="tdclass"> Zobraz detail </th>
       </tr>
        <% RecordList recordList = (RecordList) request.getAttribute("recordList");
        if (recordList != null) {
        ArrayList <Record> list = recordList.getListOfRecordsFromDb();
        for (Record zapis : list){ 
         %>
        <tr>
        <td class ="tdclass"><%=zapis.getNazev_vylet()%></td>
        <td class ="tdclass"><%=zapis.getJmeno_autor()%></td>
        <td class ="tdclass"><%=zapis.getOkres() %> </td>
        <td class ="tdclass"><%=zapis.getHodnoceni()%> </td>
     
        <td class ="tdclass"><input type="radio" id="id_zapis" name="id_zapis" value="<%=zapis.getIdzapis()%>"></td>
        <%}}%>
   
         </tr>
      
     </table>
   
       <button type="submit" name="action" value="detail">Zobraz detail zápisu </button>
   </form>
   </div>
</body>
</html>