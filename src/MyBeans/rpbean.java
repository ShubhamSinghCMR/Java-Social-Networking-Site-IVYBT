/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MyBeans;

import java.sql.*;

/**
 *
 * @author hyE
 */
public class rpbean {
    private String npa1,ss;

    public String getNpa1() {
        return npa1;
    }

    public void setNpa1(String npa1) {
        this.npa1 = npa1;
    }

    public String getSs() {
        return ss;
    }

    public void setSs(String ss) {
        this.ss = ss;
    }

    public rpbean(String npa1, String ss) {
        this.npa1 = npa1;
        this.ss = ss;
    }

    
    public void check(rpbean i1)
    {try{
        String ss1=i1.getSs();
       String pa=i1.getNpa1();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String query="update userinfo set Pass='"+pa+"' where Email='"+ss1+"'";
        Statement st=con.createStatement();
	st.executeUpdate(query);
        con.close();
       }
    catch(ClassNotFoundException e){}
    catch(SQLException e){}
    }
}
