<%-- 
    Document   : home
    Created on : Apr 4, 2014, 6:28:01 PM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" type="text/css" href="hstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
    </head>
    <body >
         <%
              String me=session.getAttribute("sob").toString();
              
              %>
        <table id="noop" width="1352" height="450" border="0">
          <tr>
            <td><div id="mydiv1">
             <b> <table id="noop1"  width="635" height="230" border="0" align="center">
                <tr>
                  <td><a href="scrap.jsp?val=<%=me%>" style="text-decoration:none; color:black;">SCRAPS</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="photo.jsp" style="text-decoration:none;color:black;">PHOTOS</a></td>
                </tr>
                <tr>
                  <td><a href="test.jsp?val=<%=me%>" style="text-decoration:none;color:black;">TESTIMONIALS</a></td>
                </tr>
              </table></b>
            </div></td>
          </tr>
        </table>
            </body>
        
</html>
