<%@ page import="com.example.Midterm_JavaEE.Client" %>
<%@ page import="com.example.Midterm_JavaEE.ClientsDBManager" %><%--
  Created by IntelliJ IDEA.
  User: mukhtar
  Date: 15.03.2021
  Time: 06:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="vendor/head.jsp" %>
    <title>Flower Gallery</title>
</head>
<body>
<%@include file="vendor/nav.jsp" %>
<div class="container">
    <br>
    <% Client client = ClientsDBManager.getClientById(Integer.parseInt(request.getParameter("id"))); %>
    <label for="n1">Name:</label>
    <br>
    <b id="n1"><%= client.getName()%></b>
    <br><br>
    <label for="s1">Surename:</label>
    <br>
    <b id="s1"><%= client.getSurname()%></b>
    <br><br>
    <label for="b1">Birthday:</label>
    <br>
    <b id="b1"><%= client.getBirthday()%></b>
    <br><br>
    <label for="i1">Address:</label>
    <br>
    <b id="i1"><%= client.getAddress()%></b>
    <br><br>
    <label for="i1">Order status:</label>
    <br>
    <b id="i1"><%= client.getOrderstatus()%></b>
    <br><br>

    <a class="btn text-light" style="background-color: #6727b8"
       href="${pageContext.request.contextPath}/updateClient?id=<%= request.getParameter("id")%>">EDIT</a>
</div>

</body>
</html>
