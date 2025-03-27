<%-- 
    Document   : VoteCount1
    Created on : 25 Mar 2025, 4:41:23 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        text-align: center;
    }
    h1 {
        color: #333;
    }
    table {
        width: 50%;
        margin: 20px auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 10px;
        border: 2px solid #333;
        text-align: center;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
</style>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/voting","root","");
        %>
        <h1>Numbers Of Votes</h1>
        <table border="2">
            <tr>
                <th>Candidates</th>
                <th>No. of Votes</th>
            </tr>            
            <%
                try{
                    String show = "select DISTINCT Candidates from votecount";
                    PreparedStatement ps = con.prepareStatement(show);
//                    ps.setString(1, Candidates);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                    %>
                        <tr>
                            <td><%=rs.getString("Candidates")%></td>
                    <%
                        String count = "SELECT count(Candidates) from votecount where Candidates = ?";
//                        String count = "SELECT count(Candidates) from votecount where Candidates = 'Baburao Ganpatrao Apte'";
                        PreparedStatement ps1 = con.prepareStatement(count);
                        String cand = rs.getString("Candidates");
                        ps1.setString(1, cand);
                        ResultSet rs1 = ps1.executeQuery();
                        while(rs1.next()){
                            %>
                                    <td><%=rs1.getString("count(Candidates)")%></td>
                                </tr>
                            <%
                        }
                    }
            %>
        </table>
        <%
            String win="SELECT Candidates, COUNT(*) AS vote_count FROM votecount GROUP BY Candidates ORDER BY vote_count DESC LIMIT 1";
            PreparedStatement ps1 = con.prepareStatement(win);
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next()){
                %>
                    <p>Person with max votes:<b><%= rs1.getString("Candidates")%></b></p>
                <%
            }
            }catch(Exception ex){
                response.getWriter().print(ex.getMessage());
            }
        %>
    </body>
</html>
