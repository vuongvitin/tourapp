<%-- 
    Document   : cart
    Created on : Aug 27, 2021, 2:46:39 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h1 class="text-center text-danger">GIO HANG</h1>

<table class="table">
    <th>Ma san pham</th>
    <th>Ten san pham</th>
    <th>Don gia</th>
    <th>So luong/th>
        
    <c:forEach var="c" items="${carts}">
        <tr>
            <td>${c.productId}</td>
            <td>${c.name}</td>
            <td>${c.price} VND</td>
            <td>${c.count}</td>
        </tr>
    </c:forEach>
</table>