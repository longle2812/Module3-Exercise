<%--
  Created by IntelliJ IDEA.
  User: Long Le
  Date: 5/27/2021
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form method="post" action="/calculate">
    <h2> Product Discount Calculator</h2>
    <p> Product Description</p>
    <input type="text" name="description" placeholder="enter description">
    <p>List Price</p>
    <input type="number" name="price" value="price" >
    <p>Discount Percent</p>
    <input type="number" name="discountPercent">
    <br>
    <input type="submit" value="Submit">
  </form>
  </body>
</html>
