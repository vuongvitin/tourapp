<%-- 
    Document   : index.jsp
    Created on : Aug 2, 2021, 5:59:52 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<h1 class="text-center text-danger">Cac san pham</h1>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<div>
    <a href="<c:url value="/admin/products" />" class="btn btn-danger">QUAN LY PRODUCT</a>
</div> 
</sec:authorize>


        
            
       

<form action="">
    <div class="row">
        <div class="col-md-11">
            <input class="form-control" type="text" name="kw" placeholder="Nhap tu khoa de tim..." />
        </div>
        <div class="col-md-1">
            <input type="submit" value="Search" class="btn btn-danger"/>
        </div>
    </div>
</form>

<div>
    ${counter}
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
            <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${i}" >${i}</a></li>
        </c:forEach>
    </ul>
</div>

<div class="row">
    <c:forEach var="p" items="${products}">
        <div class="card col-md-4 ">
<!--            <div class="card-header">Header</div>-->
            <div class="card-body">
                <c:if test= "${p.image != null && p.image.startsWith('https') == true}">
                    <img class="img-fluid" src="<c:url value="${p.image}" />" alt="${p.name}" />                                
                </c:if>
                <c:if test= "${p.image == null || p.image.startsWith('https') == false}">
                    <img class="img-fluid" src="<c:url value="/images/Uyen.jpg" />" alt="${p.name}" />                                
                </c:if>
                <h3>${p.name}</h3>
                <p>${p.price} VND</p>
            </div>
            <div>
                <a href="javascript:;" class="btn btn-danger" onclick="addToCart(${p.id})">Them vao gio</a>
                <a href="#" class="btn btn-info">Mua ngay</a>
            </div>
        </div>
    </c:forEach>
</div>


<%--
    <c:forEach var="cat" items="${categories}">
        <li>${cat.id} --  ${cat.name}</li>
        </c:forEach>

<a href="<c:url value="test" />">Redirect/forward</a>
<div>
    <img src="<c:url value="images/207443174_535874871096867_1898482930834982474_n.jpg" />" />
    
</div>
<h1>Welcomes</h1>
<h1>Hello ${name} </h1>
<c:if test="${ fullName  !=  null}" >
        <h1>Dang xuat</h1>
</c:if>
  
        <ul>
            <c:forEach var="i" begin="1" end="10">
                <c:choose>
                    <c:when test="${i%2 == 0}">
                        <li style="color: blue"> ${i}</li>
                    </c:when>
                    <c:otherwise>
                            <li style="color: crimson"> ${i}</li>
                    </c:otherwise>
                </c:choose>
                
            </c:forEach>
        </ul>
        <ol>
            <c:forEach var="u" items="${users}">
                <li>
                    ${u.firstname}  ${u.lastname}
                </li>
            </c:forEach>
        </ol>
        
        <ul>
            <c:forTokens var="f" delims=","
                         items="Apple,Lemon,Orange">
                <li>${f}</li>
            </c:forTokens>
        </ul>
        
        <c:url value="/hello-post" var="action"></c:url>
<form:form method="post" action="${action}" modelAttribute="user">
    <spring:message code="label.firstName" />           
    <form:input path="firstname" ></form:input>
    
    <br>
    
    <spring:message code="label.lastName" />     
    <form:input path="lastname" ></form:input>
    <input value="Send" type="submit"  />
</form:form>
--%>
