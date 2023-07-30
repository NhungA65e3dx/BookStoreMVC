<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore - Home Page</title>
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

.add-to-cart-button {
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
	<h1>Bookstore - Home Page</h1>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Author</th>
			<th>Introduce</th>
			<th>Price</th>
			<th>Action</th>
		</tr>
		<% 
            DAO.BookDAO bookDAO = new DAO.BookDAO();
            java.util.List<Model.Book> books = bookDAO.getAllBooks();
            for (Model.Book book : books) { 
        %>
		<tr>
			<td><%= book.getId() %></td>
			<td><%= book.getName() %></td>
			<td><%= book.getAuthor() %></td>
			<td><%= book.getIntroduce() %></td>
			<td><%= book.getPrice() %></td>
			<td><a
				href="/BookStoreMVC/Controller/CartController?bookId=<%= book.getId() %>&bookName=<%= book.getName() %>&bookPrice=<%= book.getPrice() %>"
				class="add-to-cart-button">Thêm vào giỏ hàng</a></td>
		</tr>
		<% } %>
	</table>
</body>
</html>
