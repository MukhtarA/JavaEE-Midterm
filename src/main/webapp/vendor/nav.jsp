<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <title>Flower gallery</title>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #6727b8">
    <h3 class="navbar-brand"> </h3>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Gallery</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/allClients.jsp">All Clients</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/addClient.jsp">Add Client</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/allProducts.jsp">All Products</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/addProduct.jsp">Add Product</a>
        </li>
    </ul>
</nav>
</body>
</html>
