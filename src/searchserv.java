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
public class searchserv extends HttpServlet {

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
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
                int k=0,p=0,z=0;
                 String search=request.getParameter("val");
                 HttpSession hs=request.getSession();
                hs.setAttribute("fob",search);
                String email=hs.getAttribute("sob").toString();
                String femail=search;
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
                String q1="select * from userinfo";
                PreparedStatement s1=con.prepareStatement(q1);
                ResultSet rs1=s1.executeQuery();
                while(rs1.next())
                    {
                        String email1=rs1.getString(4);
                        if(email1.equals(femail))   //checks if entered email exists or not
                            p=1;
                   }   
                if(p==1)    //means entered email exists
                {
                if(email.equals(femail))    //if current user email is entered his about is displayed
                    response.sendRedirect("about.jsp");
                else
                {
               
                String query="select * from frq ";
                PreparedStatement st=con.prepareStatement(query);
                ResultSet rs=st.executeQuery();
                while(rs.next())
                        {
                            String se=rs.getString(2);
                            String rc=rs.getString(3);
                            String state=rs.getString(4);
                            if(rc.equals(email)&& se.equals(femail) )
                                    {if( state.equals("0"))
                                        z=9;
                                    else 
                                        z=8;
                                    }
                                    
                            else if(se.equals(email)&& rc.equals(femail))
                                    { k=1;                  
                                    if(state.equals("1"))
                                            k=2;
                                    }
                        }
                if(z==9)    //deny request page
                        response.sendRedirect("032541.jsp");
                else if (k==1) //friend request not accepted
                        response.sendRedirect("users.jsp");
              else if(k==2 || z==8) //already friend
              {hs.setAttribute("friend",femail);  
                  response.sendRedirect("fpv015522638.jsp");
              }
              else
                         response.sendRedirect("searchdetail.jsp"); //to add as a friend
                
                }
                }
               else
                    out.println("User with this email does not exists");
            }
        catch (ClassNotFoundException ex) { } 
        catch (SQLException ex) {}
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
