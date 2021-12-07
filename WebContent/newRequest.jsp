<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>New Book Request</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
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
				<h2>New Book Request</h2>
			</a>
			<ul class="navbar-nav ms-auto">
				<li class="nav-item">
					<form action="professorLogin.jsp">
						<button type="">Home</button>
					</form>
				</li>
				<li class="nav-item">
					<form action="./BookstoreServlet" method="post">
						<button type="">View Old Requests</button>
					</form>
				</li>
				<li class="nav-item">
					<form action="userSettings.jsp" method="post">
						<button type="">Settings</button>
					</form>
				</li>
				<li class="nav-item">
					<form action="./LogoutServlet">
						<button type="">Logout</button>
					</form>
				</li>
			</ul>
		</div>
	</nav>

	<h2 class="text-center">Create a new entry below</h2>
    <div style="margin: 0 auto; font-size: 15px; display: block; text-align: center;">
      	<div class="form-control input-group" style="width: 50%; margin: 0 auto; float: none">
	      	<div style="width: 50%; margin: 0 auto; float: none">
			<form action="./CreateEntryServlet" method="post">
				<div class="container">
					<input class="form-control col-9" type="text" placeholder="Enter ISBN" name="isbn" style="margin: 5px" required />
					<input class="form-control col-9" type="text" placeholder="Enter publisher" name="publisher" style="margin: 5px" required /> 
					<input class="form-control col-9" type="text" placeholder="Enter edition" name="edition" style="margin: 5px" required />
					<input class="form-control col-9" type="text" placeholder="Enter author" name="author" style="margin: 5px" required />
					<input class="form-control col-9" type="text" placeholder="Enter title" name="title" style="margin: 5px" required />
		          <button type="submit" class="btn btn-primary btn-block"> Submit </button>
				</div>
			</form>
	      	</div>
    	</div>
    </div>
</body>
</html>