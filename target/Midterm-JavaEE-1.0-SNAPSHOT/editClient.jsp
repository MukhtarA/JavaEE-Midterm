<%@ page import="com.example.Midterm_JavaEE.Client" %>
<%@ page import="com.example.Midterm_JavaEE.ClientsDBManager" %><%--
  Created by IntelliJ IDEA.
  User: mukhtar
  Date: 15.03.2021
  Time: 06:16
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
    <h2>Edit Client</h2>
    <br>
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Successfully added!</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <%
        }
        if ("true".equals(request.getParameter("deleted"))) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Successfully deleted!</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <%
        }

        Client client = new Client();
        if (request.getParameter("id") != null) {
            client = ClientsDBManager.getClientById(Integer.parseInt(request.getParameter("id")));
        }
    %>
    <form class="was-validated" action="${pageContext.request.contextPath}/updateClient"  method="post">
        <div class="form-group" style="display: none">
            <label>ID: </label>
            <label>
                <input class="form-control" type="text" value="<%= client.getId()%>" name="id1" readonly>
            </label>
        </div>
        <div class="form-group">
            <label>Name: </label>
            <label>
                <input type="text" class="form-control" name="name1"
                       value="<%= client.getName()%>" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field</div>
        </div>
        <div class="form-group">
            <label>Surname: </label>
            <label>
                <input type="text" class="form-control" name="surname1"
                       value="<%= client.getSurname()%>" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field</div>
        </div>
        <div class="form-group">
            <label>Birthday: </label>
            <label>
                <input type="date" class="form-control" name="birthday1"
                       value="<%= client.getBirthday()%>" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label>Address: </label>
            <label>
                <input type="text" class="form-control" name="Address"
                       value="<%= client.getAddress()%>" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div class="form-group">
            <label>Order status: </label>
            <label>
                <input type="text" class="form-control" name="orderstatus"
                       value="<%= client.getOrderstatus()%>" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div class="clearfix">
            <button class="btn text-light float-left" type="submit" style="background-color: #6727b8">Save</button>
            <form action="${pageContext.request.contextPath}/deleteClient" method="get">
                <div class="clearfix">
                    <a class="btn btn-danger text-light float-right"
                       href="${pageContext.request.contextPath}/deleteClient?id=<%= client.getId()%>">DELETE</a>
                </div>
            </form>
        </div>
    </form>

</div>
</body>
</html>
