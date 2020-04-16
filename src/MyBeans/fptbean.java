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
public class fptbean {
    private String str1;

    public fptbean(String str1) {
        this.str1 = str1;
    }

    public String getStr1() {
        return str1;
    }

    public void setStr1(String str1) {
        this.str1 = str1;
    }
    public int check(fptbean e1)
    {int k=0;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String query="select * from userinfo";
        PreparedStatement st=con.prepareStatement(query);
        ResultSet rs=st.executeQuery();
        String p1;
        p1=e1.getStr1();
        while(rs.next())
            {String email1=rs.getString(4);
             if(p1.equals(email1))
                     k=1;
             }     
        }
        catch(ClassNotFoundException e){} 
        catch (SQLException e) { }
        return k;  
    }
    
}
