<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
</head>
<body>
<h3> Create new product</h3>
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
                <td><input type="number" name="id" id="id"></td>
            </tr>
            <tr>
                <td> Name</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td> Price</td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td> Description</td>
                <td><input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td> Brand</td>
                <td><input type="text" name="brand" id="brand"></td>
            </tr>
            <tr>
                <td>
                </td>
                <td><input type="submit" value="Create product"></td>
            </tr>
            </table>
        </fieldset>
</form>
</body>
</html>
