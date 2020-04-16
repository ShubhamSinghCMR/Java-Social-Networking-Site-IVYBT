/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hyE
 */
public class delac extends HttpServlet {

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
        try {
            String pass=request.getParameter("pass");
            HttpSession hs=request.getSession();
            String sob=hs.getAttribute("sob").toString();//current email
            int k=0;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
            String q1="select * from userinfo";
            PreparedStatement st1=con.prepareStatement(q1);
            ResultSet rs1=st1.executeQuery();
            while(rs1.next())
                        {
                            String p=rs1.getString(4);  
                            if(p.equals(sob))
                                        {
                                            String pa=rs1.getString(5);
                                            if(pa.equals(pass))
                                                        k=1;
                                        }
                        
                        }
            if(k==1)
                       {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
                            String q11="delete from userinfo where Email='"+sob+"'";
                            Statement st=con1.createStatement();
                            st.executeUpdate(q11);
                            out.println("2");
                        }
            else
            {
                        out.println("1");
            }
        }
        catch (ClassNotFoundException ex) {
            Logger.getLogger(delac.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (SQLException ex) {
            Logger.getLogger(delac.class.getName()).log(Level.SEVERE, null, ex);
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
