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
			
			<form action="professorLogin.jsp">
				<button type="">Home</button>&emsp;
	    	</form>
    	</h2>
		<form action="./NewRequestServlet">
	    	<label for="username"><b>Request: </b></label>
			<br/>
	    	<input type="text" placeholder="Book Title" name="bookTitle" required>
			<br/>
	    	<input type="text" placeholder="Author Names" name="authorNames" required>
			<br/>			
	    	<input type="text" placeholder="Edition" name="edition" required>
			<br/>			
	    	<input type="text" placeholder="Publisher" name="publisher" required>
			<br/>			
	    	<input type="text" placeholder="ISBN" name="isbn" required>
			<br/>
		    <button type="submit">Submit</button>
    	</form></br>
	    	
			<form action="./LogoutServlet">
				<button type="">Logout</button>&emsp;
	    	</form>
	</body>
</html>