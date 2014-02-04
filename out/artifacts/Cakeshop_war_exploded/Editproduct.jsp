<%@ page import ="java.sql.*" %>

<%
    String pid = request.getParameter("pid");
    String pName = request.getParameter("name");
    String pDes = request.getParameter("description");
    String price = request.getParameter("price");
    String keyword = request.getParameter("keyword");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Cakeshop" +
                "?user=root&password=1234");
        Statement st = con.createStatement();
        //ResultSet rs;
        String sql = "UPDATE product SET name='"+pName+ "' " +
                ", description= '"+ pDes + "' " +
                ", price = "+ price+ " " +
                ", keyword = '"+ keyword + "' "+
                 " WHERE pid = " + pid + " ";
        //out.println(sql);
        int i = st.executeUpdate(sql);
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("http://localhost:8080/Allproduct.jsp");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
            out.print("Invalid Insertion!");
            response.sendRedirect("Edit.jsp");
        }
    }
    catch(Exception e){out.println(e);}
%>