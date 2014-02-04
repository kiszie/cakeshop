<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html> <%@page import="javazoom.upload.*"%>
<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title> </head>
<body>

<% try{ MultipartFormDataRequest mul = new MultipartFormDataRequest(request);
    UploadFile uploadFile =(UploadFile)mul.getFiles().get("pic");
    String prefix = getServletInfo();
     uploadFile.setFileName(session.getAttribute("regis")+".jpg");
     UploadBean up = new UploadBean(); up.setFolderstore("C:\\Users\\Dell\\IdeaProjects\\Cakeshop\\web\\images\\customer");
     up.store(mul);
    session.removeAttribute("regis");
    } catch(Exception e)
{
    out.print(e);
}
%>
<c:redirect url="index.jsp"/>
</body>
</html>