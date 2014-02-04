<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>

<html>
<head>
<title>ThaiCreate.Com JSP Tutorial</title>
</head>
<body>
<%
    String keyword = "";
    if(request.getParameter("txtKeyword") != null) {
    keyword = request.getParameter("txtKeyword");
    }
    %>
<form name="frmSearch" method="get" action="searchTest.jsp">
<table width="599" border="1">
<tr>
<th>Keyword
<input name="txtKeyword" type="text" id="txtKeyword" value="<%=keyword%>">
<input type="submit" value="Search"></th>
</tr>
</table>
</form>

<%
    Connection connect = null;
    Statement s = null;

    try {
    Class.forName("com.mysql.jdbc.Driver");

    connect =  DriverManager.getConnection("jdbc:mysql://localhost/Cakeshop" +
            "?user=root&password=1234");

    s = connect.createStatement();

    String sql = "SELECT * FROM  product WHERE keyword like '%" +  keyword + "%' " +
            " ORDER BY pid ASC";

    System.out.println(sql);

    ResultSet rec = s.executeQuery(sql);
    %>
<table width="600" border="1">
<tr>
<th width="91"> <div align="center">ProductID </div></th>
<th width="98"> <div align="center">Name </div></th>

</tr>
<%while((rec!=null) && (rec.next())) { %>
<tr>
<td><div align="center"><%=rec.getString("pid")%></div></td>
<td><%=rec.getString("name")%></td>

</tr>
<%}%>
</table>
<%
        } catch (Exception e) {
        // TODO Auto-generated catch block
        out.println(e.getMessage());
        e.printStackTrace();
        }

    try {
    if(s!=null){
        s.close();
        connect.close();
        }
    } catch (SQLException e) {
    // TODO Auto-generated catch block
    out.println(e.getMessage());
    e.printStackTrace();
    }
    %>
</body>
</html>