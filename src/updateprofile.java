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
public class updateprofile extends HttpServlet {

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
        try
            { 
           HttpSession hs=request.getSession();
            String email=hs.getAttribute("sob").toString();
            String p2=request.getParameter("p2");
            String p3=request.getParameter("p3");
            String p4=request.getParameter("p4");
            String p5=request.getParameter("p5");
            String p6=request.getParameter("p6");
            String p7=request.getParameter("p7");
            String p8=request.getParameter("p8");
            String p9=request.getParameter("p9");
            String p10=request.getParameter("p10");
            String p11=request.getParameter("p11");
            String p12=request.getParameter("p12");
            Class.forName("com.mysql.jdbc.Driver");
            out.println(email);
            out.println(p2);
            out.println(p3);
            out.println(p4);
            out.println(p5);
            out.println(p6);
            out.println(p7);
            out.println(p8);
            out.println(p9);
            out.println(p10);
            out.println(p11);
            out.println(p12);
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
            String query="update userprofiledetail set Religion='"+p2+"' ,Hometown='"+p3+"' ,Country='"+p4+"' ,About='"+p5+"' ,Relationshipstatus='"+p6+"' ,Knownlanguages='"+p7+"' ,Passion='"+p8+"' ,Movie='"+p9+"' ,Music='"+p10+"' ,Occupation='"+p11+"' ,Currentcity='"+p12+"' where Email='"+email+"'";
            Statement st=con.createStatement();
            st.executeUpdate(query);
           response.sendRedirect("home.jsp");
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
