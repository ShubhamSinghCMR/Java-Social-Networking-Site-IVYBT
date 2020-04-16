<%-- 
    Document   : fp
    Created on : Feb 26, 2014, 10:20:15 PM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="fpstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>sNs.iN</title>
    <script>
        var x;   
           function check()
            {var email=document.getElementById('fpt').value;
                if(email.length==0)
                    {
                        document.getElementById('mydiv1').innerHTML="<font color=red>Enter Password!</font>";
                    }
                   else if(email.length<6)
                    {
                        document.getElementById('mydiv1').innerHTML="<font color=red>Incorrect Password!</font>";
                    }
		else 
                    {
                        document.getElementById('mydiv1').innerHTML="";
                        x=new XMLHttpRequest();
                        x.open("GET","delac?pass="+email,true);
                        x.onreadystatechange=abc;
                        x.send(null);
                    }
             }
             
            function abc()
                {
                    if(x.readyState==4)
                        {
                            var str=x.responseText;
                            if(str==1)
                                {
                                    document.getElementById('l1').innerHTML="";
                                    document.getElementById('mydiv1').innerHTML="<font color=red>Incorrect Password!</font>";
                                }
                            else
                            {
                                
                                location="deleted.jsp";
                                
                            }
                        }
                    else
                        {
                        document.getElementById('l1').innerHTML="<img src='pics/load.gif'/>";
                        }
                } 
    </script>
    </head>
    <body id="bodyback"><br>
        
          <p id="sitename">&nbsp;sNs.iN : DELETE ACCOUNT</p>
          <p>&nbsp;</p>
          
          <table id="ta" width="481" border="0" align="center">
            <tr>
              <td width="464" height="46"> Your Password&nbsp;&nbsp;:&nbsp;
                <label for="fpt"></label>
              <input name="fpt" type="password" id="fpt" size="50" onblur="check()"><div id="mydiv1"></div></td>
            </tr>
            *As you enter password your account get deleted.. Click <a href ="home.jsp" style="text-decoration:none; color:black;font-size: 20px;">Cancel</a> to go back!
            
          </table><div id="l1"></div>
        
        
    </body>
</html>
