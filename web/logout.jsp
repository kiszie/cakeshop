<%--
  Created by IntelliJ IDEA.
  User: SONY
  Date: 13/1/2557
  Time: 22:04 น.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logged out</title>
</head>
<body>
<%
    session.removeAttribute("loginUser");
%>

<c:redirect url="index.jsp"/>
</body>
</html>
