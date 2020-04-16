<%-- 
    Document   : home
    Created on : Apr 4, 2014, 6:28:01 PM
    Author     : hyE
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        
        String str1=(String)session.getAttribute("sob");
        if(str1==null)
            {
                    response.sendRedirect("index.jsp");
            }   
        else
            {
     %>
    <head>
       <link rel="stylesheet" type="text/css" href="hstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
        
        <script>
        var x;    
        function loadit(str)
            {
                x= new XMLHttpRequest();
                x.open("GET",str,true);
                x.onreadystatechange=work;
                x.send(null);
            }
      function work()
            {
          if(x.readyState==4)
              document.getElementById('mydiv1').innerHTML=x.responseText;
          else
              document.getElementById('mydiv1').innerHTML="<img src='pics/load.gif'/>";
           }
          function log()
          {
              location="logout.jsp";
          }
         function hisfor()
         {
                Window.history.forward();
         }
         
         var z;    
        function help()
            { var val=document.getElementById('search').value;
                z= new XMLHttpRequest();
                z.open("GET","helpserv?val="+val,true);
                z.onreadystatechange=helpfun;
                z.send(null);
            }
      function helpfun()
            {
          if(z.readyState==4)
          {document.getElementById('helpdiv').innerHTML="";
              document.getElementById('helpdiv').innerHTML=z.responseText;
          }
          else
              document.getElementById('helpdiv').innerHTML="<img src='pics/load1.gif'/>";
           }
         
         var y;    
        function find()
            { var val=document.getElementById('search').value;
                y= new XMLHttpRequest();
                y.open("GET","searchserv?val="+val,true);
                y.onreadystatechange=fod;
                y.send(null);
            }
      function fod()
            {
          if(y.readyState==4)
              document.getElementById('mydiv1').innerHTML=y.responseText;
          else
              document.getElementById('mydiv1').innerHTML="<img src='pics/load.gif'/>";
           }
        
         function set()
         {
             location="home.jsp";
         }
         </script>
    </head>
    
    
    <body >
        <table id="noop" width="1328" height="62" border="0">
          <tr>
              <td height="58" ><br><b><a onclick="set()">hOme</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="loadit('about.jsp')">abOuT</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="loadit('stuff.jsp')">stufF</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="log()">lOgOuT</a>
                                             </b>
            <img src="pics/line.jpg" width="1204" height="1"></td>
          </tr>
        </table>
        <table id="noop" width="1352" height="450" border="0">
          <tr>
            <td><div id="mydiv1">
              <table width="921" height="371" border="5" align="center" id="noop1">
                <tr>
                  <th height="41" scope="col">FRIEND LIST</th>
                  <th scope="col">FRIEND REQUESTS</th>
                </tr>
                <tr>
                  <td> <%
                    // FRIEND LIST
                  try
                  {
            String currentuser=(String)session.getAttribute("sob");
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
            String qry="select * from frq";
            PreparedStatement ps=cn.prepareStatement(qry);
            ResultSet r=ps.executeQuery();
            while(r.next())
            {   String m1=r.getString(2);
                String p1=r.getString(3);
                 String state=r.getString(4);
                if(p1.equals(currentuser)&& state.equals("1"))
                    {
                            String se=r.getString(2);
                           Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
                        String query="select * from userinfo ";
                        PreparedStatement st1=con1.prepareStatement(query);
                        ResultSet rs1=st1.executeQuery();
                        while(rs1.next())
                                {   
                                    String a=rs1.getString(4);
                                    String name=rs1.getString(1);
                                    if(se.equals(a))
                                            {
                                                 session.setAttribute("fob",se);   //session.setAttribute("frnd",a);                                            
                                               %>
                                               <a href="frdtl1.jsp?val=<%=se%>" style="text-decoration:none; color:brown;font-size: 20px;"><%=name%></a> <br>
                                               <%
                                            }
                                }
                    }
                else if(m1.equals(currentuser)&& state.equals("1"))
                    {
                            String se=r.getString(3);
                           Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
                        String query="select * from userinfo ";
                        PreparedStatement st1=con1.prepareStatement(query);
                        ResultSet rs1=st1.executeQuery();
                        while(rs1.next())
                                {   
                                    String a=rs1.getString(4);
                                    String name=rs1.getString(1);
                                    if(se.equals(a))
                                            {
                                                 session.setAttribute("fob",se);   //session.setAttribute("frnd",a);                                            
                                               %>
                                               <a href="frdtl1.jsp?val=<%=se%>" style="text-decoration:none; color:brown;font-size: 20px;"><%=name%></a> <br>
                                               <%
                                            }
                                }
                    }
               
               
                }
                  }
            
           catch (ClassNotFoundException ex) {     }
            catch (SQLException ex) { } 
             %></td>
                  <td><%  //FRIEND REQUEST
             //     int i=0;
           // String far[][]; //store received requests
          
try {
            String me=(String)session.getAttribute("sob");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
            String q="select * from frq";
            PreparedStatement st=con.prepareStatement(q);
            ResultSet rs=st.executeQuery();
            while(rs.next())
            {
                String p1=rs.getString(3);
                String state=rs.getString(4);
                if(p1.equals(me)&& state.equals("0")) //check if i am receiver and currently not frnds
                    {
                            String se=rs.getString(2);
                           
                            Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
                        String query="select * from userinfo ";
                        PreparedStatement st1=con1.prepareStatement(query);
                        ResultSet rs1=st1.executeQuery();
                        while(rs1.next())
                                {   
                                    String a=rs1.getString(4);
                                    String name=rs1.getString(1);
                                    if(se.equals(a))
                                            {   
                                                //far[i][]=name;
                                                //far[i][]=far[i][]+"<form action='acceptfr'><br><input type='submit' value='Accept' name='b1'/><br></form>";
                                                
                                               out.println(name+" ");
                                                out.println("<a href='acceptfr?val="+a+"' style='color:green;font-size: 20px;'>Add</a>");   
                                                out.println("<a href='deletefr?val="+a+"' style='color:red;font-size: 20px;'>Deny</a><br>");    
                                                //out.println(name+" wants to be your friend");
                                            //   out.println("<input type='submit' value='Accept' name='b1'/>");
                                                  //out.println("<input type='submit' value='Deny' name='b2'/><br>");
                                                
                                            }
                                }
                    }
               
            
            }
            
        }
        catch (ClassNotFoundException ex) {
  
        }
        catch (SQLException ex) {
             } 
             %></td>
                </tr>
              </table>
            </div></td>
          </tr>
        </table>
        <table width="1355" id="noop1" height="52" border="0">
          <tr>
            <td>
                <form name="form1" method="post" action="">
                    <input name="search" type="text" id="search" size="40" placeholder="                            Enter email" onkeyup="help()">
                   
              <input type="button" name="searchbut" id="searchbut" value="     Search     " onclick="find()">
               <div id="helpdiv"></div>
            </form></td>
          </tr>
          <tr>
            <td>sNs.iN &copy; 2014</td>
          </tr>
        </table>
    </body>
        <%
            }
     %>
</html>
