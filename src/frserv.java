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
public class frserv extends HttpServlet {

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
             int k=1;
            HttpSession hs=request.getSession();
            String email=hs.getAttribute("sob").toString();
            String femail=hs.getAttribute("fob").toString();
            out.println(email);
            out.println(femail);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/snsdb?user=root&password=root");
            String query="select * from userinfo ";
            PreparedStatement st=con.prepareStatement(query);
            ResultSet rs=st.executeQuery();
            while(rs.next())
                {
                 String re=rs.getString(4);
                if(re.equals(femail))
                        {k=2;
                        }
                }
         if(k==2)
            {int p=0;
            query="select * from frq ";
            st=con.prepareStatement(query);
            rs=st.executeQuery();
            while(rs.next())
                {
                 String re=rs.getString(1);
                         int count=Integer.parseInt(re);
                 if(count>p)
                     p=count;
                }
            p=p+1;
            query="insert into frq values(?,?,?,?)";
            st=con.prepareStatement(query);
            st.setString(1,""+p+"");
            st.setString(2,email);
            st.setString(3,femail);
            st.setString(4,"0");
            st.executeUpdate();
             response.sendRedirect("inhome.jsp");
            }
       }
        catch (ClassNotFoundException ex) {        
            Logger.getLogger(frserv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(frserv.class.getName()).log(Level.SEVERE, null, ex);
        }        
        
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
