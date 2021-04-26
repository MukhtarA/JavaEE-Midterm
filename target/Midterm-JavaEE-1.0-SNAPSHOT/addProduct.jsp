<%--
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
    <h2>Add Client</h2>
    <% if ("true".equals(request.getParameter("success"))) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Successfully added!</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <%
        }
    %>
    <form class="was-validated"  action="/addClient"  method="post">
        <div class="form-group">
            <label>Flower type: </label>
            <label>
                <input type="text" class="form-control" name="name1" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field</div>
        </div>
        <div class="form-group">
            <label>Color: </label>
            <label>
                <input type="text" class="form-control" name="surname1" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field</div>
        </div>
        <div class="form-group">
            <label>Price: </label>
            <label>
                <input type="text" class="form-control" name="address" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label>Season: </label>
            <label>
                <input type="text" class="form-control" name="orderStatus" required>
            </label>
            <div class="valid-feedback">Valid</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <button class="btn text-light" type="submit" style="background-color: #6727b8">ADD</button>
    </form>
</div>

</body>
</html>
