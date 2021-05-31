<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit product detail</title>
</head>
<body>
<h3> Edit product detail</h3>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <table>
            <legend>Product information</legend>
            <tr>
                <td> ID</td>
                <td><input type="number" name="id" id="id" value="${product.getId()}"></td>
            </tr>
            <tr>
                <td> Name</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
      </tr>
      <tr>
        <td> Price</td>
        <td><input type="text" name="price" id="price" value="${product.getPrice()}">
                </td>
            </tr>
            <tr>
                <td> Description</td>
                <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
            </tr>
            <tr>
                <td> Brand</td>
                <td><input type="text" name="brand" id="brand" value="${product.getBrand()}"></td>
            </tr>
            <tr>
                <td>
                </td>
                <td><input type="submit" value="Edit product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
