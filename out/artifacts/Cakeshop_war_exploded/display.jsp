<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
    <title>SELECT Operation</title>
</head>
<body>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/Cakeshop"
                   user="root"  password="1234"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from product;
</sql:query>

<table border="1" width="100%">
    <tr>
        <th>Emp ID</th>
        <th>First Name</th>

    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.username}"/></td>
            <td><c:out value="${row.name}"/></td>

        </tr>
    </c:forEach>
</table>

</body>
</html>