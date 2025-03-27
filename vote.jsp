<%-- 
    Document   : vote
    Created on : 11 Mar 2025, 4:12:49 pm
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0a0e21;
            color: white;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .vote {
            width: 50%;
            margin: 20px auto;
            background: #152238;
            padding: 20px;
            border-radius: 10px;
        }
        form label {
            display: block;
            margin: 10px 0;
        }
        button {
            background: blue;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        a{
           font-family: Arial, sans-serif;
            color: white;
            text-decoration: none;
        }
    </style>
     <script>
        function submitForm() {
            let AadharNo = prompt("Enter your Aadhaar Number:");
            if (AadharNo) {
                document.getElementById("aadhar").value = AadharNo;
                document.getElementById("voteForm").submit();
                document.getElementById("logout").submit();
            } else {
                alert("Aadhaar Number is required!");
            }
        }
        function showLogoutAlert() {
            if (confirm("Are you sure you want to logout?")) {
                window.location.href = 'logout.jsp';
            }
        }
    </script>
    </head>
    <body>
        <%
            String Email = (String) session.getAttribute("Email");
//            session.setAttribute("email", Email1);
//            String email = (String) session.getAttribute("email");
//            if (Email == null) {
//                response.sendRedirect("vote.jsp");  
//            }           
        %>
        <button><a href="dashboard.jsp">Dashboard</a></button>
        
        <h1>Welcome:<%=Email%></h1>
        
    <section class="vote"> 
        <h2>Voting Panel</h2>
        <p>You are allowed to vote only once. Select your candidate carefully.</p>
        <form action="vote.jsp" method="post" id="voteForm">
            <label><input type="radio" name="candidate" value="Narendra Modi"> BJP - Narendra Modi</label><br>
            <label><input type="radio" name="candidate" value="Rahul Gandhi"> Congress - Rahul Gandhi</label><br>
            <label><input type="radio" name="candidate" value="Arvind Kejriwal"> AAP - Arvind Kejriwal</label><br>
            <label><input type="radio" name="candidate" value="Baburao Ganpatrao Apte"> Independent - Baburao Ganpatrao Apte</label><br>
            <input type="hidden" name="aadhar" id="aadhar">
            <button type="button" onclick="submitForm()">Submit</button>
        </form>
        
    </section>
        <%
             try{
                response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setHeader("Expires", "0");

                if("POST".equalsIgnoreCase(request.getMethod())){
                    String AadharNo = request.getParameter("aadhar");
                    String vote = request.getParameter("candidate");

                    Class.forName("com.mysql.jdbc.Driver");  
                    Connection con=DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/voting","root","");
                    
                    String check = "select * from votecount where AadharNo = ?";
                    PreparedStatement ps1 = con.prepareStatement(check);
//                        ps1.setString(1, vote);
                        ps1.setString(1, AadharNo);
                    ResultSet rs = ps1.executeQuery();
                    if(rs.next()){
                        response.getWriter().write("<p style='color:red'>Already vote</p>");
                    }else{
//                         String insert = "insert into votecount(AadharNo, Candidates, Count) values(?, ?, ?)";
                        String insert = "insert into votecount(AadharNo, Candidates) values(?, ?)";
                        PreparedStatement ps = con.prepareStatement(insert);
                            ps.setString(1, AadharNo);
                            ps.setString(2, vote);
                        int rows = ps.executeUpdate();
                        if(rows>0){
    //                        response.getWriter().write("<p style='color:red'>Voted</p>");
    //                            response.sendRedirect("index.html");
                            %>
                                <button class="logout-btn" onclick="showLogoutAlert()" style="display: block; margin: auto;">Logout</button>
                            <%
                        }else{
                            response.getWriter().write("<p style='color:red'>Not working</p>");
                        }
                    }
                }
            }catch(Exception ex){
                response.getWriter().print(ex.getMessage());
            }
        %>
    </body>
</html>
