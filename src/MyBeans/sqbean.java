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
public class sqbean {
    private String ans,email;

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public sqbean(String ans, String email) {
        this.ans = ans;
        this.email = email;
    }

    
    
    
    public int check(sqbean e1)
    {int k=0;
        try{
            String p1,p2;
            p2=e1.getEmail();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String query="select * from userinfo";
        PreparedStatement st=con.prepareStatement(query);
        ResultSet rs=st.executeQuery();
        p1=e1.getAns();
        while(rs.next())
            {
                String ans1=rs.getString(7);
                String e1s=rs.getString(4);
                if(p1.equals(ans1)&&e1s.equals(p2))
                     k=1;
             }     
        }
        catch(ClassNotFoundException e){} 
        catch (SQLException e) { }
        return k;  
    }
}
