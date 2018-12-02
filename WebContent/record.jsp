<%@page import="cz.czechitas.denik.bean.Record"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="record.css">
<title>Insert title here</title>
</head>
<body>
<div class="hero-image">
    <div class="hero-text">
      <h1 style="font-size:25px">Stránka zápisů</h1>
      &nbsp;
      <p>Komunita vybudovaná cestovateli a výletníky pro cestovatele, kteří se chtějí podělit o své zážitky.
        Inspirujte a nechte se inspirovat</p>

      <button type="button" onclick="location.href='intro.jsp';">Domů</button>   
        
    </div>
  </div>
<%Record zapis = (Record)request.getAttribute("record");%>
<div class="hero-obsah">
<div ><span class="hero-vyraz">autor:</span> &nbsp; <%=zapis.getJmeno_autor() %></div>  
<div ><span class="hero-vyraz">název výletu:</span> &nbsp;<%=zapis.getNazev_vylet() %></div>
<div ><span class="hero-vyraz">příběh tvého výletu:</span>&nbsp;<%=zapis.getZapis() %></div>
<div ><span class="hero-vyraz">pro koho je výlet vhodný:</span>&nbsp;<%=zapis.getIkony_urceni() %></div>
<div ><span class="hero-vyraz">atrakce výletu:</span> &nbsp;<%=zapis.getIkony_vylet() %></div>
<div ><span class="hero-vyraz">odkaz na místo:</span>&nbsp;<%=zapis.getOdkaz_misto() %></div>
<div ><span class="hero-vyraz">odkaz na restauraci:</span>&nbsp;<%=zapis.getOdkaz_restaurace() %></div>
<div ><span class="hero-vyraz">hodnocení výletu:</span> &nbsp;<%=zapis.getHodnoceni() %></div>
<div ><span class="hero-vyraz">ve kterém okresu jste byli:</span>&nbsp;<%=zapis.getOkres() %></div>
</div>

</body>
</html>