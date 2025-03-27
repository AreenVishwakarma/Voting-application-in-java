/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class login extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loging</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loging at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String Email = request.getParameter("email");
        String Password = request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/voting","root","");
            
//            String check ="select * from registar Where Email=?";
//            PreparedStatement ps1 = con.prepareStatement(check);
//            ps1.setString(1,Email);
//            ResultSet rs1 = ps1.executeQuery();
//            if(rs1.next()){
//                response.getWriter().write("<p style='color:red'>Already Voted</p>");
//            }else{
//                String sql ="select * from registar where Email=? and  Password=?";
//                PreparedStatement ps = con.prepareStatement(sql);
//                ps.setString(1, Email);
//                ps.setString(2, Password);
//                ResultSet rs = ps.executeQuery();
//                if(rs.next()){
//                    HttpSession session = request.getSession();
//                    session.setAttribute("Email", Email);
//                    response.sendRedirect("dashboard.jsp");
//                }else{
//                   response.getWriter().write("<p style='color:red'>Already LogedIn</p>");
//                }
//            }

                String sql ="select * from registar where Email=? and  Password=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, Email);
                ps.setString(2, Password);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    HttpSession session = request.getSession();
                    session.setAttribute("Email", Email);
                    response.sendRedirect("dashboard.jsp");
                }else{
                   response.getWriter().write("<p style='color:red'>Registar first</p>");
                }
        }catch(Exception ex){
            response.getWriter().print(ex.getMessage());
        }
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
