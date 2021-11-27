<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
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
			Hello, ${firstName}. <br/><br/>
			
			<form action="./CreateAccount" method="post">
			  	<div class="container">
				    <label for="username"><b>Create Account: </b></label>
				    <input type="text" placeholder="Enter Email" name="email" required>
				    <button type="submit">Submit</button>&emsp;
			  	</div>
			</form>
			<br/>
			<form action="./LogoutServlet">
				<button type="">Logout</button>&emsp;
	    	</form>
		</h2>
	</body>
</html>