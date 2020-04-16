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

/**
 *
 * @author hyE
 */
public class indexbean {
    private String email,pass;

    public indexbean(String email, String pass) {
        this.email = email;
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public int check(indexbean i1)
    {int k=0;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String query="select * from userinfo";
        PreparedStatement st=con.prepareStatement(query);
        ResultSet rs=st.executeQuery();
        String p1,p2;
        p1=i1.getEmail();
        p2=i1.getPass();
        while(rs.next())
            {String email1=rs.getString(4);
            String pass1=rs.getString(5);
            if(email1.equals(p1) && pass1.equals(p2))
                       k=1;
                    
            }     
        }
        catch(ClassNotFoundException e){} 
        catch (SQLException e) { }
        return k;  
    }
    
}
