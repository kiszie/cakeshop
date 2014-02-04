<%@ page import ="java.sql.*" %>

<%
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
    String fname = request.getParameter("firstName");
    String lname = request.getParameter("lastName");
    String address = request.getParameter("address");

    try{
    Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Cakeshop" +
                "?user=root&password=1234");
        Statement st = con.createStatement();
    //ResultSet rs;
        String sql = "INSERT INTO customer(username,name,lastname,address,password) VALUES ('"+ user +"','"+ fname +"','"+ lname +"','"+ address +"','"+ address +"')";
        int i = st.executeUpdate(sql);
        session.setAttribute("regis",user);
        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("http://localhost:8080/login(img).jsp");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
            out.print("Invalid Insertion!");
            response.sendRedirect("login.jsp");
        }
    }
    catch(Exception e){out.println(e);}
%>