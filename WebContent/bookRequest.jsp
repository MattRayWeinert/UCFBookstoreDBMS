<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Book Requests</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
	  <style>
    .nav-link-btns{
    color: whitesmoke;
    size: 1.5rem;
}
    </style>
</head>
<body>
	<%
	Object accountID = request.getAttribute("accountID");
	Object accountType = request.getAttribute("accountType");
	Object username = request.getAttribute("username");
	Object firstName = request.getAttribute("firstName");
	Object lastName = request.getAttribute("lastName");
	Object email = request.getAttribute("email");
	Object error = request.getAttribute("error");

	session = request.getSession(false);
	if (session.getAttribute("accountID") == null) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<a class="navbar-brand" href="#">
				<h2>All Book Requests</h2>
			</a>
			<ul class="navbar-nav ms-auto">
				<li class="nav-item px-2">
					<form action="adminLogin.jsp" method="post">
						<button class="btn btn-link-primary btn-outline-secondary nav-link-btns">Home</button>
					</form>
				</li>
				<li class="nav-item px-2">
					<form action="./FacultyServlet" method="post">
						<button class="btn btn-link-primary btn-outline-secondary nav-link-btns">Faculty</button>
					</form>
				</li>
				<li class="nav-item px-2">
					<form action="./SaveBooksServlet" method="post">
						<button class="btn btn-link-primary btn-outline-secondary nav-link-btns">Generate File</button>
					</form>
				</li>
				<li class="nav-item px-2">
					<form action="./LogoutServlet">
						<button class="btn btn-link-primary btn-outline-secondary nav-link-btns">Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div style="height: 30px"></div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Email</th>
					<th scope="col">Title</th>
					<th scope="col">Publisher</th>
					<th scope="col">Edition</th>
					<th scope="col">Author</th>
					<th scope="col">ISBN</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book">
					<tr>
						<form action="./BookstoreServlet" method="post">
							<td style="border: 1px solid black; width: 10%"><input
								style="width: 99%" type="text" placeholder="${book.email}"
								name="title" value="${book.email}" readonly></td>
							<td style="border: 1px solid black; width: 10%"><input
								style="width: 99%" type="text" placeholder="${book.title}"
								name="title" value="${book.title}" readonly></td>
							<td style="border: 1px solid black"><input
								style="width: 99%" type="text" placeholder="${book.publisher}"
								name="publisher" value="${book.publisher}" readonly></td>
							<td style="border: 1px solid black"><input
								style="width: 99%" type="text" placeholder="${book.edition}"
								name="edition" value="${book.edition}" readonly></td>
							<td style="border: 1px solid black"><input
								style="width: 99%" type="text" placeholder="${book.author}"
								name="author" value="${book.author}" readonly></td>
							<td style="border: 1px solid black"><input
								style="width: 99%" type="text" placeholder="${book.isbn}"
								name="isbn" value="${book.isbn}" readonly></td>
						</form>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</html>