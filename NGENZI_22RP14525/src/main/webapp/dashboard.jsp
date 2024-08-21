<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="dash.css">
</head>
<body>
<div class="list">
	<h1>STOCK<br>MANAGEMENT<br>SYSTEM</h1>
	<hr>
	<ol class="ol">
		<li><img src="image/productout.png"><a href="productview.jsp"> Products</a></li>
		<li><img src="image/toatal-user.png"><a href="customer.jsp">Customers</a></li>
		<li><img src="image/suppliers.jpeg"><a href="suppliers.jsp">Suppliers</a></li>
		<li><img src="image/user.png"><a href="users.jsp">Users</a></li>
		<li><img src="image/report.png"><a href="report.jsp">Report</a></li>
	</ol>
</div>
<div class="dash">

		<img src="image/user.png"> <p>Welcome:Ezi12</p>
		<h1>Dashboard</h1>
		<div class="logout">
			<a href="index.jsp"><img src="image/log-out.png"><p>Logout<p></a>
		</div>
		<div class="productin">
			<a href="productview.jsp" style="text-decoration: none">
			<img src="image/productin.jpeg">
			<h4> Products In</h4>
			<h4>30</h4>
			</a>
		</div>
		<div class="productout">
			<a href="productview.jsp" style="text-decoration: none">
			<img src="image/productout.png">
			<h4> Products Out</h4>
			<h4>9</h4>
			</a>
		</div>
			<div class="main">
		<div class="suppliers">
			<a href="suppliers.jsp" style="text-decoration: none">
			<img src="image/suppliers.jpeg">
			<h4>Total Suppliers</h4>
			<h4>21</h4>
			</a>
		</div>
          <div class="customer">
          	<a href="customer.jsp" style="text-decoration: none">
			<img src="image/toatal-user.png">
			<h4>Total Customers</h4>
			<h4>17</h4>
			</a>
		</div>
		</div>
		</div>
	
</div>
</body>
</html>