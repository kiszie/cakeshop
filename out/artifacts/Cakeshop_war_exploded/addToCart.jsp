
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

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/Cakeshop"
                   user="root" password="1234"/>

<c:if test="${empty sessionScope['loginUser']}">
    <c:redirect url="login.jsp"/>
</c:if>

<c:if test="${not empty sessionScope['loginUser']}">
<sql:update dataSource="${ds}" var="addToCart">
insert into addcart value(null,${sessionScope['cartID']},${param.pid},${param.amount},${param.price})
</sql:update>
    <c:redirect url="product-overview.jsp"/>
</c:if>
