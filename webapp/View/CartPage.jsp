<%@ page import="java.util.List" %>
<%@ page import="Model.Book" %>
<%@	page import="DAO.BookDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore - Cart Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
}

h1 {
	text-align: center;
	padding: 20px 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	margin: 20px auto;
}

th, td {
	padding: 12px 15px;
	text-align: left;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 8px 16px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 4px;
}
</style>
</head>
<body>
	<h1>Bookstore - Cart Page</h1>
	<form action="/BookStoreMVC/Controller/CartController" method="post"> <!-- Thêm action và method -->
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Action</th>
				<th>Total Price</th>
			</tr>
			<% 
			// Lấy danh sách sách từ Session
			HttpSession cartSession = request.getSession();
			List<Book> cart = (List<Book>) cartSession.getAttribute("cart");

			// Hiển thị danh sách sách trong bảng
			if (cart != null) {
				for (Book book : cart) {
			%>
			<tr>
				<td><%= book.getId() %></td>
				<td><%= book.getName() %></td>
				<td><%= book.getPrice() %></td>
				<td>
					<input type="number" name="quantity" value="<%= book.getQuantity() %>"> <!-- Đặt giá trị ban đầu cho quantity -->
				</td>
				<td>
					<button type="submit" name="updateQuantity" value="<%= book.getId() %>">Cập nhật số lượng</button>
				</td>
				<td><%= book.getTotalPrice() %></td> <!-- Hiển thị total price -->
			</tr>
			<%
					}
				}
			%>
		</table>
	</form> <!-- Đóng thẻ form -->
	<a href="/BookStoreMVC/View/HomePage.jsp" class="button">Tiếp tục mua sắm</a>
</body>
</html>
