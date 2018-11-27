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
  <style>
  .tableclass {
  border: 1px solid black
  }
  .tdclass { 
  border: 1px solid black
  }
  
   </style>
</head>
<body>
 <table class = "tableclass">
        <tr>
        <th class ="tdclass"> Název výletu </th>
        <th class ="tdclass"> Jméno autora </th>
        <th class ="tdclass"> Zápis </th>
       </tr>
        <% RecordList recordList = (RecordList) request.getAttribute("recordList");
       if (recordList != null) {
        ArrayList <Record> list = recordList.getListOfRecordsFromDb();
        for (Record zapis : list){ 
         %>
         <tr>
        <td class ="tdclass"><%=zapis.getNazev_vylet()%></td>
        <td class ="tdclass"><%=zapis.getJmeno_autor()%></td>
        <td class ="tdclass"><%=zapis.getZapis()%> 
        <%}}%>
         </tr>
     </table>
</body>
</html>