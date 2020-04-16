/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MyBeans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author hyE
 */
public class delf {
    private String femail,email;

    public delf(String femail, String email) {
        this.femail = femail;
        this.email = email;
    }

    public String getFemail() {
        return femail;
    }

    public void setFemail(String femail) {
        this.femail = femail;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    public void delse(delf d1)
    {
        
        try{
            String p1=d1.getEmail();
            String p2=d1.getFemail();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
         String query="delete from frq where se='"+p2+"' and re='"+p1+"' and state='1'";
        Statement st=con.createStatement();
	st.executeUpdate(query);
        con.close();
        }
        catch(ClassNotFoundException e){} 
        catch (SQLException e) { }
        
    }
     public void delre(delf d1)
    {
        
        try{
             String p1=d1.getEmail();
            String p2=d1.getFemail();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
         String query="delete from frq where re='"+p2+"'and se='"+p1+"'  and state='1'";
        Statement st=con.createStatement();
	st.executeUpdate(query);
        con.close();
        }
        catch(ClassNotFoundException e){} 
        catch (SQLException e) { }
        
    }
}
