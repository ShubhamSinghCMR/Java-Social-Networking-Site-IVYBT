<%-- 
    Document   : about
    Created on : Apr 3, 2014, 10:42:52 PM
    Author     : hyE
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="sentfrstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
        
    </head>
    <body >
        <%!        String p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;
                    String t1,t2,t3,t4,t5,t6,t7;
        %>
        <%
           
            String email=(String)session.getAttribute("fob");
          
            String path="userdata\\"+email+"\\profilepic\\pp.jpg";
       
            try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String query="select * from userprofiledetail";
        PreparedStatement st=con.prepareStatement(query);
        ResultSet rs=st.executeQuery();
        
        while(rs.next())
            {String email1=rs.getString(1);
                     if(email1.equals(email))
                     {
                         p1=rs.getString(1);
                         p2=rs.getString(2);
                         p3=rs.getString(3);
                         p4=rs.getString(4);
                         p5=rs.getString(5);
                         p6=rs.getString(6);
                         p7=rs.getString(7);
                         p8=rs.getString(8);
                         p9=rs.getString(9);
                         p10=rs.getString(10);
                         p11=rs.getString(11);
                         p12=rs.getString(12);
                     }
                    
            }   
        //query for userinfo
        query="select * from userinfo";
        st=con.prepareStatement(query);
        rs=st.executeQuery();
        
        while(rs.next())
            { String email1=rs.getString(4);
              if(email1.equals(email))
              {
                         t1=rs.getString(1);
                         t2=rs.getString(2);
                         t3=rs.getString(3);
                         t4=rs.getString(4);
                         t5=rs.getString(5);
                         t6=rs.getString(6);
                         t7=rs.getString(7);
                        
              }   
                    
            }   
        }
        catch(ClassNotFoundException e){} 
        catch (SQLException e) { }
        
        %>
    <table id="noop1" width="1114" border="0" align="center">
      <tr>
          
          <td><form name="form1" method="post" action="denyfr">
                    <p id="sitename">&nbsp;
                        <input type="submit" name="button" id="button" value="    Deny request     ">
                    </p>
            <img src="pics/line.jpg" width="1014" height="1">
        </form></td>
      </tr>
    </table>
    <p></p>
    <table  width="1006" height="408" border="0" align="center">
      <tr>
        <td width="460">
            
       
        <img src="userdata/demo.jpg" width="460" height="408"/>&nbsp;</td>
        
        
        
        <td width="536" 
        style="font-family: 'Courier New','Verdana',sans-serif;
    			font-size:30px;
			    text-align:left;
			     padding-left:1cm;"
                 >
        <label>Name &nbsp; &nbsp;&nbsp;: </label><%=t1%><br>
        <label>Gender &nbsp; : </label>
      <%
           if(t2.equals("0"))
                    
                    out.println("Male");
                    
            else
                    
                    out.println("Female");
 
       
      %>
            <br>
    		<label>Religion : </label><%=p2%><br>
		<label>Hometown : </label><%=p3%><br>
		<label>Country  &nbsp;: </label><%=p4%><br>
        &nbsp;</td>
      </tr>
    </table>
    <table width="1183" border="0" align="left" style="font-family: 'Courier New','Verdana',sans-serif;
    			font-size:30px;
                text-align:left; 
                padding-left:5cm;"
                >
<tr>
          <td><label><b>about me..</b></label><br><%=p5%></td>
      
      </tr>
      <tr>
        <td><label><b>Birthday : </b></label><%=t3%></td>
      </tr>
      <tr>
        <td><label><b>Relationship status : </b></label><%=p6%></td>
      </tr>
      <tr>
        <td><label><b>Known Languages : </b><br></label><%=p7%></td>
      </tr>
      <tr>
        <td><label><b>passion : </b><br></label><%=p8%></td>
      </tr>
      <tr>
        <td><label><b>movies :</b> <br></label><%=p9%></td>
      </tr>
      <tr>
        <td><label><b>music : </b><br></label><%=p10%></td>
      </tr>
      
      <tr>
        <td height="21"><label><b>Occuption : </b></label><%=p11%></td>
      </tr>
      <tr>
        <td><label><b>Email : </b></label><%=p1%></td>
      
      </tr>
      <tr>
        <td height="21"><label><b>Current City : </b></label><%=p12%></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    </body>
</html>