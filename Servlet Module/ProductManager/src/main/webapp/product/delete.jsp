<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete product detail</title>
</head>
<body>
<h3> Delete product detail</h3>
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
                <td><c:out value="${product.getId()}"></c:out></td>
            </tr>
            <tr>
                <td> Name</td>
                <td><c:out value="${product.getName()}"></c:out></td>
            </tr>
            <tr>
                <td> Price</td>
                <td><c:out value="${product.getPrice()}"></c:out></td>
            </tr>
            <tr>
                <td> Description</td>
                <td><c:out value="${product.getDescription()}"></c:out></td>
            </tr>
            <tr>
                <td> Brand</td>
                <td><c:out value="${product.getBrand()}"></c:out></td>
            </tr>
            <tr>
                <td>
                </td>
                <td><input type="submit" value="Delete product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
