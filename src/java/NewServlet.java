/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author M_H
 */
@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session=request.getSession(true);
            String studentid = request.getParameter("id");            
            String studentpassword = request.getParameter("password");
            session.setAttribute("sid",studentid);
            session.setAttribute("spassword", studentpassword);
            int sid=Integer.parseInt((String)session.getAttribute("sid"));
            int spassword=Integer.parseInt((String)session.getAttribute("spassword"));
           
           Connection conn =null;
            Statement Stmt = null;
            PreparedStatement preparedstat = null;
            ResultSet RS = null;
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/gradience";
            String password="";
            String user="root";
            try{
                
            conn = (Connection) DriverManager.getConnection(url,user,password);
            Stmt = (Statement) conn.createStatement();
            
                RS =Stmt.executeQuery("SELECT sid,password FROM student where sid='"+sid+"'and password ='"+spassword+"'");
                if(RS.next())
                {
                    int id=RS.getInt("sid");
                    int pass=RS.getInt("password");
                    session.setAttribute("sids",sid );
                     session.setAttribute("password",pass );
                      response.sendRedirect("studentpage.jsp");
                }
                else
                {
                    
                    response.sendRedirect("index.jsp?value=Invalid input wrong Password or ID");
                }
//                while(RS.next()){
//                int id=RS.getInt("sid");
//                int pass=RS.getInt("password");
//                /*check password */
//                if(spassword==pass && sid==id){
//                     session.setAttribute("sids",sid );
//                     session.setAttribute("password",pass );
//                      response.sendRedirect("studentpage.jsp"); // go to login page
//                }
//                
//                }
                 // go to login page
                
            }
            catch(Exception cnfe)
            {
            System.err.println("Exception: " + cnfe);
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, "correct");
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
