<%-- 
    Document   : signup.jsp
    Created on : Feb 26, 2014, 6:37:43 PM
    Author     : hyE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
        <link rel="stylesheet" type="text/css" href="signupstyle.css" />
        <script>
            function check()
            {
                    var nm1=document.getElementById("nm").value;
                    var em1=document.getElementById("em").value;
                   var pa1=document.getElementById("pa").value;
                   var rpa1=document.getElementById("rpa").value;
                   var sq1=document.getElementById("sq").value;
                   var ans1=document.getElementById("ans").value;
                   var day=document.getElementById("dd").value;
                   var mon=document.getElementById("mm").value;
                   var yr=document.getElementById("yy").value;
                                
                   if(nm1.length==0 || em1.length==0 || isNaN(day) || isNaN(mon) || isNaN(yr) || pa1.length==0 || rpa1.length==0 || sq1.length==0 || ans1.length==0)
                   {document.getElementById('mydiv1').innerHTML="<font color=red>Please fill all the fields....</font>";
                   return false;
                    }
                    
                    
                    else if(pa1!=rpa1)
                            {   
                                document.getElementById('mydiv1').innerHTML="";
                                document.getElementById('mydiv1').innerHTML="<font color=red>Password MISMATCH!</font>";
                                return false;   
                            }
                    else 
                     	{
                            document.getElementById('mydiv1').innerHTML="";
                            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                            var email=document.getElementById("em").value;
                            if(email.match(mailformat))
                            {
                                 return true;
                             }
                            else
                             {
       //                          document.getElementById('mydiv11').innerHTML="<font color=red>Email should contain characters,digits,@ and .</font>";
                             alert("Invalid email address!");
                               return false;
                                 }
                         
                   /*         for(i=0;i<em1.length;i++)
                                     {
                                         if(em1[i]=='@' || (em1[i]>='A' && em1[i]<='Z') || (em1[i]>='a' && em1[i]<='z') || (em1[i]>=0 && em1[i]<=9)  || em1[i]=='.')
                                               {
                                                   document.getElementById('mydiv11').innerHTML="";
                                                   return true;
                                               }
                                         else
                                             { 
                                               document.getElementById('mydiv11').innerHTML="<font color=red>Email should contain characters,digits,@ and .</font>";
                                                return false;
                                             }
                                    }
                     */
                    
                    
                        }
                    
                       
                   
    }
    
    function blur1()
    {
        var pa2=document.getElementById('pa').value;
        if(pa2.length<6)
        {       document.getElementById('mydiv22').innerHTML="<font color=red>Password should be six characters long</font>";
        }
		else
		 {       document.getElementById('mydiv22').innerHTML="";
        }
    }
            
            
        </script>
        </head>
   <body id="bodyback">
     <p id="sitename">     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sNs.iN : Account Creation</p>
<form name="form1" method="post" action="signupserv" onsubmit="return check()">
  
  <table id="table1back" width="475" border="0" align="center">
    <tr>
      <td width="198" height="40">Since we'll be friends, can you tell us your name?</td>
      <td width="267"><label for="nm"></label>
      <input name="nm" type="text" id="nm" size="33"><br></td>
    </tr>
    <tr>
      <td height="40">Gender</td>
      <td><p>
        <label>
          <input name="gr" type="radio" id="gr_0" value="0" checked>
          Male</label> 
        <label>
          <input type="radio" name="gr" value="1" id="gr_1">
          Female</label>
        <br>
      </p></td>
    </tr>
     <tr>
      <td height="40">Date Of Birth</td>
      <td><label for="dd"></label>
      <select name="mm" id="mm">
            <option>Month</option>
            <%
                for(int i=1;i<13;i++)
                {
                    %>
                    <option><%=i%></option>
                    <%
                }
                %>
                
            
        </select>
        <label for="dd"></label>
        <select name="dd" id="dd">
          <option>Day</option>
            <%
                for(int i=1;i<=31;i++)
                {
                    %>
                    <option><%=i%></option>
                    <%
                }
                %>
            
            
        </select>
        <label for="yy"></label>
        <select name="yy" id="yy">
            <option>Year</option>
            <%
                for(int i=1995;i>=1920;i--)
                {
                    %>
                    <option><%=i%></option>
                    <%
                }
                %>
            
      </select></td>
    </tr>
    <tr>
      <td height="40">Email</td>
      <td><label for="em"></label>
      <input name="em" type="text" id="em" size="33"><div id="mydiv11"></div></td>
    </tr>
    <tr>
      <td height="40">Password</td>
      <td><label for="pa"></label>
      <input name="pa" type="password" id="pa" onblur="blur1()" size="15" maxlength="15"><div id="mydiv22" ></div></td>
    </tr>
    <tr>
      <td height="40">Confirm Password</td>
      <td><input name="rpa" type="password" id="rpa" size="15" maxlength="15"></td>
    </tr>
    <tr>
      <td height="40">Security Question</td>
    <td><label for="sq"></label>
          <input name="sq" type="text" id="sq" size="37"></td>
    </tr>
    <tr>
      <td height="40">Answer</td>
      <td>
          <p>
        <label for="ans"></label>
        <input name="ans" type="text" id="ans" size="40"> 
        </p>
          </td>
          
     </tr>
    <tr>
      <td height="40">&nbsp;</td>
      <td><div id="mydiv1"></div></td>
    </tr>
   
    
     
  </table>
  <p id="generalfont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; By clicking on 'I accept' below you are agreeing to our <a href="terms.jsp">Terms &amp; Conditions</a>...</p>
  <p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="signupbut" id="signupbut" value="  I accept&gt;&gt;  ">
</p>
  
    </form>
</body>
</html>