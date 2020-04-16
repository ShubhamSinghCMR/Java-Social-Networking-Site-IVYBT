/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hyE
 */
public class changemail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
     
       try{
           
        String pass=request.getParameter("npass");
      //  pass="politod";
        HttpSession hs=request.getSession();
        String sob=hs.getAttribute("sob").toString();//current email
      //  sob="misty@ceuleancity.co.jp";
        
        String nemail=hs.getAttribute("nemail").toString();
      //  nemail="misty@pokemon.com";
        int k=0;
        out.println(pass);
        out.println(sob);
        out.println(nemail);
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
        String q1="select * from userinfo";
        PreparedStatement st1=con.prepareStatement(q1);
        ResultSet rs1=st1.executeQuery();
        while(rs1.next())
        {
            String p=rs1.getString(5);
            if(p.equals(pass))
                k=1;
        }
        if(k==1)
                {
                    out.println("1");
                    Class.forName("com.mysql.jdbc.Driver");
                      Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
                    String query="update userinfo set Email='"+nemail+"' where Email='"+sob+"'";
                    Statement st=cn.createStatement();
                    st.executeUpdate(query);
                   hs.setAttribute("sob",nemail);
                    out.println("done");
                }
        else
               out.println("1");
        con.close();
       }
    catch(ClassNotFoundException e){}
    catch(SQLException e){}
     finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
