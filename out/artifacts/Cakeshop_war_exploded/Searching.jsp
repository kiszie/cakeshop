<%@ page import ="java.sql.*" %>

<%


    String keyword = request.getParameter("keyword");
    session.setAttribute("kw",keyword);

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Cakeshop" +
                "?user=root&password=1234");
        Statement st = con.createStatement();
        //ResultSet rs;
        String sql = "SELECT * FROM  product WHERE keyword ='"+keyword+"'";
        st.executeQuery(sql);

        response.sendRedirect("http://localhost:8080/brownies.jsp?id='"+session.getAttribute("kw")+"'");
    }
    catch(Exception e){out.println(e);}
%>