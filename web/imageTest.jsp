<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%

    Connection connection = null;
    String connectionURL = "jdbc:mysql://localhost/Cakeshop";
    ResultSet rs = null;
    PreparedStatement psmnt = null;

    InputStream sImage;

    try {
        // Load JDBC driver "com.mysql.jdbc.Driver"
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(connectionURL, "root", "1234");

            psmnt = connection.prepareStatement("SELECT picture FROM product ");
            // psmnt = connection.prepareStatement("SELECT picture FROM product ");

            //  psmnt.setString(1,"+count+");
            rs = psmnt.executeQuery();
            if(rs.next()) {
                byte[] bytearray = new byte[1048576];
                int size=0;
                sImage = rs.getBinaryStream(1);
                //response.reset();
                response.setContentType("image/jpeg");

                while((size=sImage.read(bytearray))!= -1 ){

                    response.getOutputStream().write(bytearray,0,size);
                }
            }

    }
    catch(Exception ex){
        out.println("error :"+ex);
    }


%>
	