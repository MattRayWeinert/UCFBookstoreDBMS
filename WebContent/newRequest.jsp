<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Book Request</title>
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
			if(session.getAttribute("accountID")==null) {
	    		response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
	    %>
		<h2>
			New Book Request JSP 
			
			<form action="./CreateEntryServlet" method="post">
			  	<div class="container">
				    <input type="text" placeholder="Enter ISBN" name="isbn" required>
				    <input type="text" placeholder="Enter publisher" name="publisher" required>
				    <input type="text" placeholder="Enter edition" name="edition" required>
				    <input type="text" placeholder="Enter author" name="author" required>
				    <input type="text" placeholder="Enter title" name="title" required>
				    <button type="submit">Submit</button>&emsp;
			  	</div>
			</form>
			<br/>
			
			<form action="professorLogin.jsp">
				<button type="">Home</button>&emsp;
	    	</form>
	    	
			<form action="./LogoutServlet">
				<button type="">Logout</button>&emsp;
	    	</form>
    	</h2>
	</body>
</html>