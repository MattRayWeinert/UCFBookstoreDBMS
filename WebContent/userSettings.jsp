<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Settings</title>
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
			User Settings
			<form action="professorLogin.jsp">
				<button type="">Home</button>&emsp;
		   	</form>
		</h2>
    	
		<form action="./SettingsServlet" method="POST">
	    	<label for="username"><b>Username: </b></label>
	    	<input type="text" placeholder="${username}" name="username">
			<br/><br/>
			
			<label for="username"><b>Password: </b></label>
	    	<input type="text" placeholder="**********" name="password">
			<br/><br/>
			
    		<label for="firstName"><b>First Name: </b></label>
	    	<input type="text" placeholder="${firstName}" name="firstName">
			<br/><br/>
			
			<label for="username"><b>Last Name: </b></label>
	    	<input type="text" placeholder="${lastName}" name="lastName">
			<br/><br/>
			
			<label for="username"><b>Email: </b></label>
	    	<input type="text" placeholder="${email}" name="email">
			<br/><br/>
			
		    <button type="submit">Submit</button>
    	</form></br>
    	
		<form action="./LogoutServlet">
			<button type="">Logout</button>&emsp;
    	</form>

	</body>
</html>