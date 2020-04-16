/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package MyBeans;


import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hyE
 */
public class signupbean {
    
   private String name,gender,email,pass,sq,ans,dt;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getSq() {
        return sq;
    }

    public void setSq(String sq) {
        this.sq = sq;
    }

    public String getAns() {
        return ans;
    }

    public void setAns(String ans) {
        this.ans = ans;
    }

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }

    public signupbean(String name, String gender, String email, String pass, String sq, String ans, String dt) {
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.pass = pass;
        this.sq = sq;
        this.ans = ans;
        this.dt = dt;
    }

    
   public void check(signupbean i1)
    {try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String query="insert into userinfo values(?,?,?,?,?,?,?)";
        PreparedStatement st=con.prepareStatement(query);
       st.setString(1,i1.getName());
       st.setString(2,i1.getGender());
       st.setString(3,i1.getDt());
       st.setString(4,i1.getEmail());
       st.setString(5,i1.getPass());
       st.setString(6,i1.getSq());
       st.setString(7,i1.getAns());
       st.executeUpdate();
       con.close();
      }
    catch(ClassNotFoundException e){}
    catch(SQLException e){}
    
   }
   public void iupd(String e1)
   {
       try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
            String query="insert into userprofiledetail values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st=con.prepareStatement(query);
            st.setString(1,e1);
            st.setString(2,"");
            st.setString(3,"");
            st.setString(4,"");
            st.setString(5,"");
            st.setString(6,"");
            st.setString(7,"");
            st.setString(8,"");
            st.setString(9,"");
            st.setString(10,"");
            st.setString(11,"");
            st.setString(12,"");
            st.executeUpdate();
            con.close();
             }
    catch(ClassNotFoundException e)  {} 
       catch (SQLException e) {   
       }   
   }
   
  public  void makeit(String e1)
   {
       try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
            String tabnam="scrap"+e1;
            String query="create table '"+tabnam+"' (scrap longtext,testi longtext)";
            Statement st=con.createStatement();
            st.executeUpdate(query);
            }
       catch (ClassNotFoundException ex) {
           Logger.getLogger(signupbean.class.getName()).log(Level.SEVERE, null, ex);
       } catch (SQLException ex) {
           Logger.getLogger(signupbean.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
}
   
