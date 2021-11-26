<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Recovery</title>
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
	    %>
	    
		<form action="./RecoverServlet" method="post">
		  <div class="container">
		    <label for="username"><b>Enter your Username: </b></label>
		    <input type="text" placeholder="Enter Username" name="username" required>
			<br/><br/>
		    <button type="submit">Enter</button>&emsp;
		    <br/><br/>
		  </div>
		</form>
	</body>
</html>