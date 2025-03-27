/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class registration extends HttpServlet {

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
            out.println("<title>Servlet registration</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registration at " + request.getContextPath() + "</h1>");
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
        String Name = request.getParameter("name");
        String Date = request.getParameter("dob");
        String Pname = request.getParameter("parentName");
        String Email = request.getParameter("email");
        String Number = request.getParameter("mobile");
        String Password = request.getParameter("password");
        String AadharNo = request.getParameter("aadhar");
//        String Vote = request.getParameter("vote");
//        String Count = request.getParameter("count");
        
//        HttpSession session = request.getSession(true);
//        session.setAttribute("AadharNo", AadharNo);

        try{
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/voting","root","");
            
            String check = "select * from registar where AadharNo=?";
            PreparedStatement ps1 = con.prepareStatement(check);
                ps1.setString(1, AadharNo); 
                ResultSet rs = ps1.executeQuery();
            if(rs.next()){
//                    response.getWriter().write("<p style='color:red'>AadharNo Already exist</p>");
                    out.println("<p style='color:red'>Voted</p>");
            }else{               
               String query = "INSERT INTO registar (Name, Date, Pname, Email, Number, Password, AadharNo) VALUES (?, ?, ?, ?, ?, ?, ?)";
//               String query = "INSERT INTO registar (Name, Date, Pname, Email, Number, Password, AadharNo, Vote, vote_count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, Name);
                    ps.setString(2, Date);
                    ps.setString(3, Pname);
                    ps.setString(4, Email);
                    ps.setString(5, Number);
                    ps.setString(6, Password);
                    ps.setString(7, AadharNo);
//                    ps.setString(8, Vote);
//                    ps.setString(9, Count);
                int rows = ps.executeUpdate();
                if(rows>0){
                    HttpSession session = request.getSession();
                    session.setAttribute("Email", Email);
                   response.sendRedirect("vote.jsp");
                }else{
                   response.getWriter().write("<p style='color:red'><b>Already registrated</b></p>");
                }
            }
        }catch(Exception ex){
            response.getWriter().print("Error: "+ex.getMessage());
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
