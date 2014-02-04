<%@ page import ="java.sql.*" %>

<%
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
        String sql = "INSERT INTO product(name,description,price,keyword) VALUES ('"+ pName +"','"+ pDes +"','"+ price +"','"+ keyword +"')";
        int i = st.executeUpdate(sql);
        String sql1 = "SELECT pid FROM product ORDER by pid DESC limit 0,1";

        ResultSet rec = st.executeQuery(sql1);
        while((rec!=null) && (rec.next())){
            session.setAttribute("add",rec.getString("pid"));
        }


        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("http://localhost:8080/Add(img).jsp");
            // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
        } else {
            out.print("Invalid Insertion!");
            response.sendRedirect("update.jsp");
        }
    }
    catch(Exception e){out.println(e);}
%>