<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 23/1/2557
  Time: 17:12 น.
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/Cakeshop"
                   user="root"  password="1234"/>

<sql:query dataSource="${snapshot}" var="result">
    INSERT INTO card() values();
</sql:query>
</body>
</html>
