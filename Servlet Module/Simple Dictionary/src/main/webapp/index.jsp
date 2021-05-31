<%--
  Created by IntelliJ IDEA.
  User: Long Le
  Date: 5/27/2021
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2> Vietnamese Dictionary</h2>
  <div>
    <form action="/translate" method="post">
      <input type="text" name="textSearch" placeholder="Enter your word:">
      <input type="submit" value="Search" id="submit">
    </form>
  </div>
  </body>
</html>
