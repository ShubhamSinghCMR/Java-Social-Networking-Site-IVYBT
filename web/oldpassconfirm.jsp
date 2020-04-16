<%-- 
    Document   : oldpassconfirm
    Created on : Apr 27, 2014, 7:52:21 AM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     <link rel="stylesheet" type="text/css" href="fpstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function checkpass()
            {
                 var newem=document.getElementById('t1').value;
                if(newem.length==0 )
                    {
                        document.getElementById('nv').innerHTML="Enter your password!";
                    }
                else if(newem.length<6)
                    {
                        document.getElementById('nv').innerHTML="Password should be six characters long!";
                    }
                    
                    
                    
            }
         var m1;   
         function check()
            {
                 document.getElementById('nv').innerHTML="";
                 var newem=document.getElementById('t1').value;
                 m1=new XMLHttpRequest();
                 m1.open("GET","changemail?npass="+newem,true);
                 m1.onreadystatechange=abcd;
                 m1.send(null);
             }
         function abcd()
         {
             if(m1.readyState==4)
                        {
                            var str=m1.responseText;
                            if(str==1)
                                     {
                                         document.getElementById('nv').innerHTML="Incorrect Password!";
                                         return false;
                                     }
                             else
                             {
                                alert('Email changed succesfully'); 
                                
                                return true;
                             }
        
                        }
         }
                    </script>
    </head>
    <body id="bodyback">
    <p id="sitename">&nbsp;sNs.iN : CONFIRM PASSWORD</p>
    <p>&nbsp;</p>
    <form name="form1" method="post" action="home.jsp" onsubmit="check()">
          <table width="516" height="66" border="0" align="center" id="ta">
            <tr>
              <th height="25" scope="col"><label>Enter your Password : 
                  <input name="t1" type="password" id="t1" size="35" onblur="checkpass()">
              </label>
                &nbsp;
            <div id="nv" style="color : red;"></div>
              </th>
            </tr>
            <tr>
              <td height="35">
                <input type="submit" name="button" id="button" value="    Change Email    " >
              </td>
            </tr>
          </table>
    </form>
          <p>&nbsp;</p>
          
          </body>
</html>
