<%@ page import ="java.sql.*" %>

<%

    String keyword = request.getParameter("param.");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Cakeshop" +
                "?user=root&password=1234");
        Statement st = con.createStatement();
        //ResultSet rs;
        String sql = "SELECT * FROM  product WHERE keyword like '%" +  keyword + "%' " +
                " ORDER BY pid ASC";;
        int i = st.executeUpdate(sql);
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("http://localhost:8080/Result.jsp");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
            out.print("Invalid Insertion!");
            response.sendRedirect("Result.jsp");
        }
    }
    catch(Exception e){out.println(e);}
%>