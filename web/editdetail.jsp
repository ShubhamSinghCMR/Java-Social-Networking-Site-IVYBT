<%-- 
    Document   : editdetail
    Created on : Apr 10, 2014, 7:18:32 PM
    Author     : hyE
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="editdetailstyle.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sNs.iN</title>
        
        <script language="javascript" type="text/javascript">
          var x;
          function disp(str) 
                        {
                           x=new XMLHttpRequest();
                           x.open("GET","get.jsp?fname="+str,true);
                           x.send(null);
                        }
         </script>
    </head>
    <body>
         <%
        
        String str1=(String)session.getAttribute("sob");
        if(str1==null)
            {
                    response.sendRedirect("index.jsp");
            }   
        else
            {
     %>
        
         <%!    
          String p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12;       
         String t1,t2,t3,t4,t5,t6,t7;
        %>
        <%

            try{
                String email=(String)session.getAttribute("sob");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String query="select * from userinfo";
        PreparedStatement st=con.prepareStatement(query);
        ResultSet rs=st.executeQuery();
        while(rs.next())
            { String email1=rs.getString(4);
              if(email1.equals(email))
              {
                         t1=rs.getString(1);
                         t2=rs.getString(2);
                         t3=rs.getString(3);
                         t4=rs.getString(4);
                                  
              }   
                    
            }   
        
        
        //query for userprofiledetail
        query="select * from userprofiledetail";
        st=con.prepareStatement(query);
        rs=st.executeQuery();
        
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
        }
        catch(ClassNotFoundException e){} 
        catch (SQLException e) { }
        
        %>
    <p id="sitename">sNs.iN : Update Profile</p>
	<form name="form1" method="post" action="updateprofile" >
    <table id="noop" width="1114" border="0" align="center">
      <tr>
        <td>
          <input type="submit" name="button" id="button" value="       Update!       ">
          <img src="pics/line.jpg" width="1014" height="1">
        </td>
      </tr>
    </table>
    <p></p>
    <table  id="noop" width="1006" height="408" border="0" align="center">
      <tr>
        <td width="460"><%
           
            String email=(String)session.getAttribute("sob");
            String path="userdata\\"+email+"\\profilepic\\pp.jpg";
        
           // Profile pic upload code    
        %>          
         
       <img src="userdata/demo.jpg" width="460" height="408"/>
            
            </td>
        <td width="536" style="text-align:left; padding-left:1cm;">
        <label>Name &nbsp; &nbsp;&nbsp;: </label><%=t1%><br>
        <label>Gender &nbsp; : </label>
          <%
            if(t2.equals("0"))
                    
                    out.println("Male");
                    
            else
                    
                    out.println("Female");
 
        %>
        
        
        <br>
		<label>Religion : </label>
		<select name="p2" id="p2" value="<%=p2%>">
		  <option>Hinduism</option>
		  <option>Islam</option>
		  <option>Christianity</option>
		  <option>Sikhism</option>
		  <option>Buddhism</option>
		  <option>Jainism</option>
		  <option>Other</option>
		  </select>
		<br>
		<label>Hometown : </label>
		<input name="p3" type="text" id="p3" size="30"  value="<%=p3%>">
		<br>
		<label>Country  &nbsp;: </label>
		<select name="p4" id="p4" value="<%=p4%>">
		  <option>Afghanistan</option>
		  <option>Argentina</option>
		  <option>Australia</option>
		  <option>Bangladesh</option>
		  <option>Belgium</option>
		  <option>Brazil</option>
		  <option>Bulgaria</option>
		  <option>Canada</option>
		  <option>China</option>
		  <option>Cuba</option>
		  <option>Denmark</option>
		  <option>Egypt</option>
		  <option>Figi</option>
		  <option>France</option>
		  <option>Germany</option>
		  <option>Iceland</option>
		  <option>India</option>
		  <option>Indonesia</option>
		  <option>Iran</option>
		  <option>Italy</option>
		  <option>Japan</option>
		  <option>North Korea</option>
		  
		  <option>Mexico</option>
		  <option>Nepal</option>
		  <option>Netherland</option>
		  <option>New Zealand</option>
		  <option>Norway</option>
          <option>Other</option>
		  <option>Peru</option>
		  <option>Poland</option>
		  <option>Portugal</option>
		  <option>Qatar</option>
		  <option>Russia</option>
		  <option>Singapore</option>
		  <option>South Korea</option>
          <option>South Africa</option>
		  <option>Sri Lanka</option>
		  <option>Switzerland</option>
		  <option>United Arab Emirates</option>
		  <option>United Kingdom</option>
		  <option>Vietnam</option>
		  <option>Zimbabwe</option>
		  </select>
		<br>
        &nbsp;</td>
      </tr>
    </table>
    <table width="1106" border="0" align="left" id="noop" style="text-align:left; padding-left:5cm;">
      <tr>
        <td>
          <label><b>about me..</b></label><br>
            <textarea name="p5"  id="p5" cols="120" rows="5"><%=p5%></textarea>
        </td>
      </tr>
      <tr>
        <td><label><b>Birthday : </b></label><%=t3%></td>
      </tr>
      <tr>
        <td><label><b>Relationship status : 
          <select name="p6" id="p6" value="<%=p6%>">
            <option>Single</option>
            <option>In a relationship</option>
            <option>Married</option>
            <option>It's Complicated</option>
            <option>I need's no one</option>
          </select>
        </b></label></td>
      </tr>
      <tr>
        <td><label><b>Known Languages : </b><br>
          <textarea name="p7" id="p7"  cols="120" rows="5"><%=p7%></textarea>
        <br></label></td>
      </tr>
      <tr>
        <td><label><b>passion : </b><br>
          <textarea name="p8" id="p8" cols="120"  rows="5"><%=p8%></textarea>
        <br></label></td>
      </tr>
      <tr>
        <td><label><b>movies :</b> <br>
                <textarea name="p9" id="p9" cols="120" rows="5" ><%=p9%></textarea>
        <br></label></td>
      </tr>
      <tr>
        <td><label><b>music : </b><br>
          <textarea name="p10" id="p10" cols="120" rows="5" ><%=p10%></textarea>
        <br></label></td>
      </tr>
      
      <tr>
        <td height="21"><label><b>Occuption : 
          <select name="p11" id="p11" value="<%=p11%>">
            <option>Student</option>
            <option>Working</option>
          </select>
        </b></label></td>
      </tr>
      <tr>
        <td height="19"></td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td><label><b>Email : </b><span style="text-align:left; padding-left:1cm;">
          <%=p1%>
          
        </span></label></td>
      </tr>
      <tr>
        <td height="21"><label><b>Current City : <span style="text-align:left; padding-left:1cm;">
          <input name="p12" type="text" id="p12"  value="<%=p12%>" size="30" >
        </span></b></label></td>
      </tr>
    </table>
  
    </form>
          <%
            }
        %>
</body>
</html>
