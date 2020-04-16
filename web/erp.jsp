<%-- 
    Document   : erp
    Created on : Apr 3, 2014, 7:10:38 PM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="erpstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
        <script>
            function check()
            {
                    var email=document.getElementById("email").value;
                    var pass=document.getElementById("pass").value;
                    
                    if(email.length==0 || pass.length==0)
                            {
                                    document.getElementById('incomplete').innerHTML="<font color=red>Please fill both the fields....</font>";
                                    return false;
                            }
                    else if(pass.length<6)
                          {   
                              document.getElementById('incomplete').innerHTML="<font color=red>Invalid email or password!</font>";
                              return false;
                          }
            }       
</script> 
    </head>
    <body id="bodyback"><br>
        <form action="erpserv" onsubmit="return check()">
          <p id="sitename">&nbsp;sNs.iN : Incorrect Email/Password</p>
   	<p>&nbsp;</p>
    <table id="ta" width="480" border="0" align="center">
          <tr>
            <td width="210" >Re enter email :</td>
            <td width="237" height="21" >
              <input name="email" type="text" id="email" size="40">
            </td>
          </tr>
          <tr>
            <td width="210" >Re enter password :</td>
            <td height="40"><label for="email6">
              <input name="pass" type="password" id="pass" size="30">
                <div id="incomplete"></div>
            </label></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="22"><strong>
            <input type="submit" name="movein" id="movein" value="    Log In    ">
            </strong></td>
          </tr>
        
    </table>
        </form>
    </body>
</html>
