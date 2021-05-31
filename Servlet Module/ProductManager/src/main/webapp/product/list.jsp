<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <style>

    </style>
</head>
<body>
<h3> Product List</h3>
<p> <a href="/products?action=create">Create new product </a></p>
<p> <a href="/products?action=search">Search product by name</a></p>
<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Brand</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
<c:forEach items="${products}" var="product">
<tr>
    <td>${product.getId()}</td>
    <td> <a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
    <td> ${product.getPrice()}</td>
    <td> ${product.getDescription()}</td>
    <td> ${product.getBrand()}</td>
    <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
    <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
</tr>
</c:forEach>

</table>
</body>
</html>
