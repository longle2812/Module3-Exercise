<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Customer" %>
<html>

<head>
    <title>$Title$</title>
</head>
<body>
<h2> Customer List</h2>

<%
    List<Customer> customerList = new ArrayList();
    customerList.add(new Customer("Long", "28/12/1994","HN"));
    customerList.add(new Customer("Thanh", "1/1/1994", "HN"));
    customerList.add(new Customer("Thuy", "2/2/1994", "HN"));
    pageContext.setAttribute("customerList",customerList);
%>

<form >
    <table class="table" style="color: blue" border="1px">
        <tr><th colspan="4"><h1>model.Customer List</h1></th></tr>
        <tr>
            <td width="150px" height="50px">Name</td>
            <td width="150px" height="50px">Date of Birth</td>
            <td width="150px" height="50px">Address</td>
        </tr>
        <c:forEach var="customer" items="#{customerList}">
            <tr>
                <td><c:out value="${customer.name}"/></td>
                <td><c:out value="${customer.dob}"/></td>
                <td><c:out value="${customer.address}"/></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>


