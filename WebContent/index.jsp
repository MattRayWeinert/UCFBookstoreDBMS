<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
	<body>
		<form action="./LoginServlet" method="post">
		  <div class="container">
		    <label for="username"><b>Username: </b></label>
		    <input type="text" placeholder="Enter Username" name="username" required>
			<br/><br/>
		    <label for="password"><b>Password:</b></label>
		    <input type="password" placeholder="Enter Password" name="password" required>
			<br/><br/>
		    <button type="submit">Login</button>&emsp;
		    <span class="psw">Forgot <a href="recoverAccount.jsp">password?</a></span>
		    <br/><br/>
		  </div>
		</form>
	</body>
</html>