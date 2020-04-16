<%-- 
    Document   : rp
    Created on : Apr 2, 2014, 8:06:17 PM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="rpcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
        <script>
              function check()
              {
                  var npa1=document.getElementById("npa1").value;
                  var npa2=document.getElementById("npa2").value;
                   if(npa1.length==0 || npa2.length==0 )
                   {document.getElementById('mydiv1').innerHTML="<font color=red>Please fill all the fields....</font>";
                   return false;
                    }
                    else if(npa1.length<6)
                   {document.getElementById('mydiv1').innerHTML="<font color=red>Password length should be greator than six  </font>";
                   return false;
                    }
                  else if(npa1!=npa2)
                            {   
                                document.getElementById('mydiv1').innerHTML="";
                                document.getElementById('mydiv1').innerHTML="<font color=red>Passwords MISMATCH</font>";
                                return false;   
                            }
              }
              
              
              
          </script>
    </head>
    <body id="bodyback">
    <br>
        <%
            String str=(String)session.getAttribute("sob");
      
        if(str==null)
                   response.sendRedirect("index.jsp");
        else
            {
               
                %>
    <p id="sitename">&nbsp;sNs.iN : CHANGE PASSWORD</p>
    <p>&nbsp;</p>
    <form name="form1" method="get" action="rpserv" onsubmit="return check()">
      <table id="ta" width="475" border="0" align="center">
        <tr>
          <td width="162" height="29">New Password :</td>
          <td width="303"><label for="npa1"></label>
            <input name="npa1" type="password" id="npa1" size="35"></td>
        </tr>
        <tr>
          <td>Confirm Password :</td>
          <td><label for="npa2"></label>
            <input name="npa2" type="password" id="npa2" size="35">
            <br>
            <div id="mydiv1"></div></td>
        </tr>
        <tr>
          <td height="37">&nbsp;</td>
          <td><input type="submit" name="npabut" id="npabut" value="Change Password"></td>
        </tr>
      </table>
    </form>
                  <%
                  }
                  %>
    </body>
</html>
