<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 24/1/2557
  Time: 1:27 น.
  To change this template use File | Settings | File Templates.
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/cakeshopdb"
                   user="root" password="1234"/>
<sql:update dataSource="${ds}" var="removeFromCart">
    delete from addcart
    where addcartID=${param.addcartID}
</sql:update>
<c:redirect url="shoppingcart.jsp"/>
</body>
</html>
