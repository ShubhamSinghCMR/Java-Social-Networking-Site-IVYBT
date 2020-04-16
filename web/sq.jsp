<%-- 
    Document   : sq
    Created on : Feb 26, 2014, 10:26:05 PM
    Author     : hyE
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="sqstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
       <script>
        
           function check()
            {
                var ans1=document.getElementById('ans').value;
                if(ans1.length==0)
                    {
                        document.getElementById('ansdiv').innerHTML="<font color=red>Please enter the answer!</font>";
                    }
		else
                    {
                        document.getElementById('ansdiv').innerHTML="";
                    }
            }
            
            var x;    
            function checkans()
                {
                    var ans1=document.getElementById('ans').value;
                    if(ans1.length==0)
                        {
                            document.getElementById('ansdiv').innerHTML="<font color=red>Please enter the answer!</font>";
                        }
                    else
                        {
                            x=new XMLHttpRequest();
                            x.open("GET","ansserv?ans="+ans1,true); 
                            x.onreadystatechange=abc;
                            x.send(null);
                        }
                 }
    
            function abc()
                {
                    if(x.readyState==4)
                        {var st1=x.responseText;
                            if(st1==1)
                            {
                                location="rp.jsp";
                                
                            }
                            else
                            {
                            document.getElementById('l1').innerHTML="";
                            document.getElementById('ansdiv').innerHTML=x.responseText;
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
        <%
        String str=(String)session.getAttribute("sob");
       //str="aa"; //comment to check
        if(str==null)
                   response.sendRedirect("index.jsp");
        else
            {
                 String squ="Loading..";
                //str="ash@pokemon.com";
            try
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
                String query="select * from userinfo";
                PreparedStatement st=con.prepareStatement(query);
                ResultSet rs=st.executeQuery();
                while(rs.next())
                    {
                        String email1=rs.getString(4);
                        if(str.equals(email1))
                        {
                                squ=rs.getString(6);
                               squ=squ+" ?";
                        }
                    } 
                }
            catch(Exception e)
            {
                
            }
            
        %>
          
        
        
        
    <p id="sitename">&nbsp;sNs.iN : RECOVER PASSWORD</p>
    <p>&nbsp;</p>
    
    <form name="form1" method="post" action="npa.jsp">
      <table id="ta" width="631" border="0" align="center">
        <tr>
          <td width="201" height="29">Security Question :</td>
          <td width="420"><%=squ%></td>
        </tr>
        <tr>
          <td height="31">Answer :</td>
          <td><label for="ans"></label>
              <input name="ans" type="text" id="ans" size="70" onblur="check()"><div id="ansdiv"></div></td>
        </tr>
        <tr>
          <td height="49">&nbsp;</td>
          <td><input type="button" name="sqbut" id="sqbut" value="    Continue    " onclick="checkans()"></td>
        </tr>
      </table>
      <div id="l1"></div>
    </form>
    <p>&nbsp;</p>
    <%
            }
        %>
    </body>
</html>
