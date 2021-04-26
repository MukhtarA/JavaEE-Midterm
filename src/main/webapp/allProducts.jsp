<%@ page import="com.example.Midterm_JavaEE.Client" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.Midterm_JavaEE.ClientsDBManager" %><%--
  Created by IntelliJ IDEA.
  User: mukhtar
  Date: 15.03.2021
  Time: 06:12
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

<nav class="navbar navbar-expand-sm bg-light">
    <form class="form-inline" action="${pageContext.request.contextPath}/filterClient" method="get">
        <label for="name1" class="mb-2 mr-sm-4">Flower type:</label>
        <input type="text" class="form-control mb-2 mr-sm-5" id="name1" placeholder="Enter type" name="name">
        <label for="lastname" class="mb-2 mr-sm-4">Color:</label>
        <input type="text" class="form-control mb-2 mr-sm-5" id="lastname" placeholder="Enter color" name="surname">
        <label for="address" class="mb-2 mr-sm-4">Price:</label>
        <input type="text" class="form-control mb-2 mr-sm-5" id="address" placeholder="Enter price" name="address">
        <label for="address" class="mb-2 mr-sm-4">Season:</label>
        <input type="text" class="form-control mb-2 mr-sm-5" id="address1" placeholder="Enter season" name="address">
        <button type="submit" class="btn text-light mb-2" style="background-color: #6727b8">Filter</button>
    </form>
</nav>

<div class="container">
    <br>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Flower type</th>
            <th>Color</th>
            <th>Price</th>
            <th>Season</th>
        </tr>
        </thead>
        <%
            ArrayList<Client> clients = ClientsDBManager.selectAllClients();
            if (request.getAttribute("filteredClients") != null) {
                clients = (ArrayList<Client>)request.getAttribute("filteredClients");
            }
            for (Client client: clients) {
        %>
        <tbody>
        <tr>
            <td><%= client.getId()%></td>
            <td><%= client.getName()%></td>
            <td><%= client.getSurname()%></td>
            <td><%= client.getBirthday()%></td>
            <td><%= client.getAddress()%></td>
            <td><%= client.getOrderstatus()%></td>
            <td><a class="btn text-light" style="background-color: #6727b8"
                   href="clientDetails.jsp?id=<%= client.getId()%>">Details</a></td>
        </tr>
        </tbody>
        <% } %>
    </table>
</div>


</body>
</html>