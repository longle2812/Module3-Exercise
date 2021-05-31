<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Controller</title>
  </head>
  <body>
  <h1> Simple Controller</h1>
  <form name="Calculator" method="post" action="/calculate">
      <div id="first">
          <span> First operand</span>
          <input type="number" name="first" value="first">
      </div>
    <div id="operator">
      <span> Operator</span>
      <select name="operator">
        <option value="+"> Addition</option>
        <option value="-"> Subtraction</option>
        <option value="*"> Multiplication</option>
        <option value="/"> Division </option>
      </select>
    </div>
    <div id="second">
      <span> Second operand</span>
      <input type="number" name="second" value="second">
    </div>
    <button type="submit">Calculate</button>
  </form>
  </body>
</html>
