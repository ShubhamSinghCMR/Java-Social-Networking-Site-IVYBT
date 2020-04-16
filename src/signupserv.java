/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import MyBeans.signupbean;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hyE
 */
public class signupserv extends HttpServlet {

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
            String name=request.getParameter("nm");
            String gender=request.getParameter("gr");
            String mm=request.getParameter("mm");
            String dd=request.getParameter("dd");
            String yy=request.getParameter("yy");
            String dt=yy+"-"+mm+"-"+dd;
            String email=request.getParameter("em");
            String pass=request.getParameter("pa");
            String sq=request.getParameter("sq");
            String ans=request.getParameter("ans");
            signupbean i1=new signupbean(name,gender,email,pass,sq,ans,dt);
         //insert values in userprofiletable for current user
            i1.iupd(email);
          //insert value in usaerinfo for current user
             i1.check(i1);
             
             //create scrap and testi table
             i1.makeit(email);
             //folder maker code
            ServletContext sc=getServletContext();
            String path=sc.getRealPath("userdata");
            path=path+"\\"+email;
            File f=new File(path);
            f.mkdir();
            
            //profile pic folder maker
            path=path+"\\dpp";
            File f2=new File(path);
            f2.mkdir();
            //copying profile pic
            try
            {
                 FileInputStream fis=new FileInputStream(sc.getRealPath("userdata")+"\\demo.jpg");
                FileOutputStream fos=new FileOutputStream(path+"\\pp.jpg");
                int i=fis.read();
                while(i!=-1)
                {
                    fos.write(i);
                    i=fis.read();
                }
                fis.close();
                fos.close();
            }
            catch(IOException e){}
            
            response.sendRedirect("acreated.jsp");
        
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
