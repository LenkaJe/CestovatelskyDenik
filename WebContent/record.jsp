<%@page import="cz.czechitas.denik.bean.Record"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Record zapis = (Record)request.getAttribute("record");%>

<div><%=zapis.getJmeno_autor() %></div>
<div><%=zapis.getNazev_vylet() %></div>
<div><%=zapis.getZapis() %></div>
<div><%=zapis.getIkony_urceni() %></div>
<div><%=zapis.getIkony_vylet() %></div>
<div><%=zapis.getOdkaz_misto() %></div>
<div><%=zapis.getOdkaz_restaurace() %></div>
<div><%=zapis.getHodnoceni() %></div>
<div><%=zapis.getOkres() %></div>


</body>
</html>