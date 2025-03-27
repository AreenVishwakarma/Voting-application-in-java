<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #0a0e21;
            color: white;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        .dashboard {
            width: 50%;
            margin: 50px auto;
            background: #152238;
            padding: 20px;
            border-radius: 10px;
        }
        p {
            margin: 10px 0;
        }
        button {
            background: blue;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <section class="dashboard">
        <!--<h2>Message: <%= request.getAttribute("Email") %></h2>-->
        <%
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            
            String Email = (String) session.getAttribute("Email");
                HttpSession session1 = request.getSession();
                session1.setAttribute("Email", Email);
//            String AadharNo = request.getParameter("aadhar");
            try{
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/voting","root","");

               String check = "select * from registar where Email=?";
//                String check = "select * from registar";
                PreparedStatement ps1 = con.prepareStatement(check);
                ps1.setString(1, Email); 
                ResultSet rs = ps1.executeQuery();
                if(rs.next()){
                    out.print("<h2>Welcome: "+ rs.getString(1) +"</h2>");
                    out.print("<p>Date: "+ rs.getString(2) +"</p>");
                    out.print("<p>P Name: "+ rs.getString(3) +"</p>");
                    out.print("<p>Eamil: "+ rs.getString(4) +"</p>");
                    out.print("<p>Number: "+ rs.getString(5) +"</p>");
                    out.print("<p>Aadhar No.: "+ rs.getString(7) +"</p>");
                }else{
                    out.println("<p style='color:red;'>Login first</p>");
                }
            }catch(Exception ex){
                response.getWriter().print(ex.getMessage());
            }
        %>   
            <button>Edit Profile</button>
            
        <!--<button><a href="vote.jsp">Vote Page</a></button>-->
    </section>
</body>
</html>