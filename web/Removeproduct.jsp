<%@ page import ="java.sql.*" %>

<%
    String pid = request.getParameter("pid");


    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cakeshopdb" +
                "?user=root&password=1234");
        Statement st = con.createStatement();
        //ResultSet rs;
        String sql = "delete from product where pid='"+pid+"' ";
        int i = st.executeUpdate(sql);
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("http://localhost:8080/AllProduct.jsp");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
            out.print("Invalid Insertion!");
            response.sendRedirect("Allproduct.jsp");
        }
    }
    catch(Exception e){out.println(e);}
%>