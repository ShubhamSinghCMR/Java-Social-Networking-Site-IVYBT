<%-- 
    Document   : frdtl1
    Created on : Apr 29, 2014, 5:13:58 PM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
                
                String str=request.getParameter("val");
                session.setAttribute("friend",str);
                response.sendRedirect("frdtl.jsp");
                %>
    </body>
</html>
