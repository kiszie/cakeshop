
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Authentication page</title>
</head>
<body>


<c:if test="${ empty param.username2 or empty param.password2}">
<c:redirect url="index.jsp" >
    <c:param name="errMsg" value="Please Enter UserName and Password" />
</c:redirect>

</c:if>

<c:if test="${not empty param.username2 and not empty param.password2}">
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/Cakeshop"
                       user="root" password="1234"/>


<sql:query dataSource="${ds}" var="selectQ">
select username,password from customer
where username='${param.username2}'
and password='${param.password2}'
</sql:query>

<c:forEach var="user" items="${selectQ.rows}" >
    <%--<c:out value="Haha" />--%>
    <c:set scope="session"
           var="loginUser"
           value="${user.username}"/>
<sql:query dataSource="${ds}" var="select">
select * from cart
where username='${user.username}' order by cartID DESC limit 0,1;

</sql:query>

<c:forEach var="cart" items="${select.rows}">
<c:choose>
<c:when test="${cart.checkOutStatus==0}">
    <c:set scope="session" var="cartID" value="${cart.cartID}"/>
</c:when>
<c:when test="${cart.checkOutStatus==1}">
<sql:update dataSource="${ds}" var="count">
insert into cart value(null,${user.username},0,2014-01-20,0);
</sql:update>
<sql:query dataSource="${ds}" var="select2">
select * from cart
where username="${user.username}" order by cartID DESC limit 0,1;
</sql:query>
<c:forEach var="cart" items="${select2.rows}">
    <c:set scope="session" var="cartID" value="${cart.cartID}"/>
</c:forEach>
</c:when>
</c:choose>
</c:forEach>
<c:if test="${empty sessionScope['cartID']}">

<sql:update dataSource="${ds}" var="count">
insert into cart values(null,'${user.username}',0,'2014-01-20');
</sql:update>
    <c:out value="insert into cart value(null,${user.username},0,2014-01-20);"></c:out>
<sql:query dataSource="${ds}" var="select2">
select * from cart
where username="${user.username}" order by cartID DESC limit 0,1;
</sql:query>
<c:forEach var="cart" items="${select2.rows}">
    <c:set scope="session" var="cartID" value="${cart.cartID}"/>
</c:forEach>
</c:if>
    <c:redirect url="index.jsp"/>
</c:forEach>
<c:redirect url="login.jsp" >
    <c:param name="errMsg" value="Username/password does not match" />
</c:redirect>



</c:if>
