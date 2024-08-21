<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
<head>
<head>
	<title>Product Recorded</title>
	<style type="text/css">
		table{
	border-collapse: collapse;
	background-color: #cdf489;
}
td{
	padding: 10px;
}
		th
		{
           background-color: gainsboro;
		}
			button
		{
			border-color: darkblue;
			border-radius: 7px;
			height: 40px;
			width: 150px;
		}
			button:hover
			{
				background-color: white;
				color: red;
				border-color: red;
			}
		body
		{
			background-color: lightskyblue;
		}
		p
		{
			font-family: sans-serif;
			font-size: 35px;
			background-color: cornflowerblue;
			color: darkblue;
			width: 100%;
			height: 50px;
			border-radius: 10px;
		}
	</style>
</head>
<body>
		<button><a href="product.jsp" style="text-decoration:none;" class="active">Add New product</a></button>
		<button><a href="retrieve.jsp" style="text-decoration:none;" class="active">Retrieve</a></button>
		<button><a href="dashboard.jsp" style="text-decoration:none;">Go TO Home</a></button><br>
	<center>
		<p><b>
	     List of Recorded Product!	
	</b></p>
<table border="1">
	<tr>
		<th>Product Code</th>
		<th>Product Name</th>
		<th>Quantity</th>
		<th>Unity Price </th>
		<th>Total Price</th>
		<th colspan="2">ACTION</th>
	</tr>
	<%
	String url = "jdbc:mysql://localhost:3306/stock_management";
    String user = "root"; 
    String pass = "";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC Driver
            conn = DriverManager.getConnection(url, user, pass);
            stmt = conn.createStatement();
            String sql = "SELECT * FROM product";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("productcode");
                String name = rs.getString("productname");
                int quantity = rs.getInt("quantity");
                int price = rs.getInt("price");
    %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= quantity %></td>
                    <td><%=price %></td>
                    <td><a href="updateProduct.jsp?	productcode=<%= id %>">Update</a></td>
                     <td><a href="deleteProduct.jsp?productcode=<%= id %>">Delete</a></td>
                </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>