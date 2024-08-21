<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
body
		{
			background-color: lightskyblue;
		}
		form{
	justify-content: center;
	align-items: center;
	margin-top: 115px;
	width:65%;
	height: 300px;
	margin-left: 220px;
	box-shadow:2px 4px 8px chocolate;
	border-radius:10px;
	background-color: grey;
	text-align:center;
		}
		hr{
	height:3px;
	background-color: black;
	margin:7px

}
 button{
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius:5px;
	font-size: 18px;
	cursor: pointer;
	outline: none; 


}
 button:hover{
	background-color: chocolate;
}
form input{
width:250px;
	height:40px;
	border:none;
	outline: none;
	border-bottom:1px solid blue;
	border-radius: 8px;
	text-align: center;
	background-color: #d7d7e6;
	font-size: 15px;
	color: blue;


}
</style>
    <meta charset="ISO-8859-1">
    <title>Update Product</title>
    
    
</head>
<body>
    
    <%
    String url = "jdbc:mysql://localhost:3306/stock_management";
    String user = "root"; 
    String pass = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String productCode = request.getParameter("productcode");
    String currentName = "";
    int currentQuantity = 0;
    double currentPrice = 0.0;

    // Fetch the current product details
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        String sql = "SELECT productname, quantity, price FROM product WHERE productcode = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productCode);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            currentName = rs.getString("productname");
            currentQuantity = rs.getInt("quantity");
            currentPrice = rs.getDouble("price");
        }
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update the product details if the form is submitted
    if (request.getParameter("update") != null) {
        String newName = request.getParameter("name");
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
        double newPrice = Double.parseDouble(request.getParameter("price"));

        try {
            conn = DriverManager.getConnection(url, user, pass);
            String sql = "UPDATE product SET productname = ?, quantity = ?, price = ? WHERE productcode = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newName);
            pstmt.setInt(2, newQuantity);
            pstmt.setDouble(3, newPrice);
            pstmt.setString(4, productCode);
            pstmt.executeUpdate();  
            response.sendRedirect("productview.jsp");
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    %>

    <form method="POST">
    <h1>Update Product</h1><hr>
        <label for="name">Current Name:</label>
        <input type="text" name="name" value="<%= currentName %>" required><br><br>

        <label for="quantity">Current Quantity:</label>
        <input type="number" name="quantity" value="<%= currentQuantity %>" required><br><br>

        <label for="price">Current Price:</label>
        <input type="text" name="price" value="<%= currentPrice %>" required><br><br>

        <input type="hidden" name="productcode" value="<%= productCode %>">
        <button name="update">Update</button>
    </form>
</body>
</html>
