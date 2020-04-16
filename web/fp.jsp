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
        
           function check()
            {var email=document.getElementById('fpt').value;
                if(email.length==0)
                    {
                        document.getElementById('mydiv1').innerHTML="<font color=red>Enter the Email!</font>";
                    }
		else
                    {
                        document.getElementById('mydiv1').innerHTML="";
                    }
            }
            
           var x;    
        function checkmail()
            {var email=document.getElementById('fpt').value;
                if(email.length==0)
                    {
                        document.getElementById('mydiv1').innerHTML="<font color=red>Enter the Email!</font>";
                    }
                else
                    {
                    x=new XMLHttpRequest();
                    x.open("GET","fptserv?email="+email,true);
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
                                    location="sq.jsp";
                                }
                            else
                                {
                                    document.getElementById('l1').innerHTML="";
                                    document.getElementById('mydiv1').innerHTML=x.responseText;
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
        
          <p id="sitename">&nbsp;sNs.iN : RECOVER PASSWORD</p>
          <p>&nbsp;</p>
          <table id="ta" width="481" border="0" align="center">
            <tr>
              <td width="464" height="46"> Enter your email&nbsp;&nbsp;:&nbsp;
                <label for="fpt"></label>
              <input name="fpt" type="text" id="fpt" size="50" onblur="check()"><div id="mydiv1"></div></td>
            </tr>
            <tr>
                <td height="40"> 
                    <input type="button" name="fpbut" id="fpbut" value="       Continue       "  onclick="checkmail()"></td>
            </tr>
          </table><div id="l1"></div>
        
        
    </body>
</html>
