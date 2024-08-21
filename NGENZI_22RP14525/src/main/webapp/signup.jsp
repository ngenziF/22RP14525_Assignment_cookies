<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="logo">
		<img src="image/logo.png" width="200px">
	</div>
<div class="cantainer">
	<h1>STOCK MANAGEMENT SYSTEM</h1><br>
<div class="image">
		<img src="image/image.jpg">
	</div>

	<div class="contents">
   <form method="POST">
   	<h2>SignUp</h2>
		  <hr>
	<input type="text" name="name" placeholder="Enter  Name Here"><br><br>
	<input type="email" name="email" placeholder="Enter  Email Here"><br><br>
	<input type="password" name="password" placeholder="Enter Password Here"><br><br>
   	<button  name="submit">SigUp</button>
   </form>
   </div>
    <%
            if (request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                
                
                String url = "jdbc:mysql://localhost:3306/stock_management";
                String user = "root"; 
                String pass = "";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    conn = DriverManager.getConnection(url, user, pass);
                    
                   
                    String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, password); 
                    pstmt.executeUpdate();

                    out.println("<h3>Signup Successful!</h3>");
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.println("<h3>Error: " + e.getMessage() + "</h3>");
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                }
            }
        %>
</body>
</html>