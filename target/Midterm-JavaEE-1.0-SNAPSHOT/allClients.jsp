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
        <label for="name1" class="mb-2 mr-sm-4">Name:</label>
        <input type="text" class="form-control mb-2 mr-sm-5" id="name1" placeholder="Enter Name" name="name">
        <label for="lastname" class="mb-2 mr-sm-4">Surname:</label>
        <input type="text" class="form-control mb-2 mr-sm-5" id="lastname" placeholder="Enter Surname" name="surname">
        <label for="address" class="mb-2 mr-sm-4">Address:</label>
        <input type="text" class="form-control mb-2 mr-sm-5" id="address" placeholder="Enter Address" name="address">
        <div class="form-group">
            <label for="orderStatus" class="mb-2 mr-sm-4">Order status:</label>
            <select class="form-control mb-2 mr-sm-5" id="orderStatus" name="grant">
                <option>Order Placed</option>
                <option>Packed</option>
                <option>Shipped</option>
                <option>Delivered</option>
            </select>
        </div>
        <button type="submit" class="btn text-light mb-2" style="background-color: #6727b8">Filter</button>
    </form>
</nav>

<div class="container">
    <br>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Surname</th>
            <th>Birthday</th>
            <th>Address</th>
            <th>Order status</th>
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