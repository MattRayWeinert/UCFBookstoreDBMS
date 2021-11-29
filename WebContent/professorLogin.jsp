<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Professor Login</title>
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
			<form action="newRequest.jsp">
		    	<button href="newRequest.jsp">New Book Request</button>&emsp;
	    	</form>

			<form action="./BookstoreServlet" method="post">
				<button type="">View Old Requests</button>&emsp;
	    	</form>
	    	
 			<form action="userSettings.jsp">
				<button type="">Settings</button>&emsp;
	    	</form>
	    	
			<form action="./LogoutServlet">
				<button type="">Logout</button>&emsp;
	    	</form>
		</h2>
	</body>
</html>