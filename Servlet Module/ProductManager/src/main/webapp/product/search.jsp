<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search product</title>
</head>
<body>
<h3> Search product by name</h3>
<p>
    <a href="/products">Back to product list</a>
</p>
<form method="post">
    <table>
        <tr>
            <td> Enter name:</td>
            <td><input type="text" name="name" id="name"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Search"></td>
        </tr>
    </table>
</form>

<c:if test="${product == null}">
    <span class="message"> ${requestScope["message"]}</span>
</c:if>

<c:if test='${product != null}'>
    <form>
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
        </table>
    </form>
</c:if>
</body>
</html>
