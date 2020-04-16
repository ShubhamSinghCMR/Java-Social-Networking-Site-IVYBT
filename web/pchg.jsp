<%-- 
    Document   : pchg
    Created on : Apr 2, 2014, 10:03:02 PM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="pchgstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
    </head>
    <body id="bodyback">
        <%
            String str=(String)session.getAttribute("sob");
      
        if(str==null)
                   response.sendRedirect("index.jsp");
        else
            {
               
                %>
       
    <p id="sitename">
    Your password has been changed... just 
    <a href="index.jsp">Click here</a>
     to login <br> 
     @sNs.iN <br>
      <img src="pics/kk.png" width="568" height="342">
     </p>
      <%
                  }
                  %>
     </body>
</html>
