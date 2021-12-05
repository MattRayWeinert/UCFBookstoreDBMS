<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty</title>
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
	    	Faculty Database<br/><br/>
    	
			<form action="adminLogin.jsp" method="post">
				<button>Home</button>&emsp;
	    	</form>
	    	
	    	<form action="./BookRequestServlet" method="post">
				<button>Book Requests</button>&emsp;
	    	</form>
	    	
			<form action="./LogoutServlet">
				<button>Logout</button>&emsp;
	    	</form>
    	</h2>
    	
		<form action="./CreateAccount" method="post">
		  	<div class="container">
			    <label for="username"><b>Create Account: </b></label>
			    <input type="email" placeholder="Enter Email" name="email" required>
			    <button type="submit">Submit</button>&emsp;
		  	</div>
		</form>
		<br/><br/>

        <table style="width: 100%; border: 1px solid black">
        	<th style="border: 1px solid black">ID</th>
        	<th style="border: 1px solid black">Account Type</th>
        	<th style="border: 1px solid black">Username</th>
        	<th style="border: 1px solid black">Password</th>
        	<th style="border: 1px solid black">First Name</th>
        	<th style="border: 1px solid black">Last Name</th>
        	<th style="border: 1px solid black">Email</th>
		     <c:forEach items="${results}" var="item">
		       <tr>
				<form action="./FacultyChangeServlet" method="post">
					<td style="border: 1px solid black; width: 10%;"><input style="width: 99%" type="text" placeholder="${item.accountID}" name="accountID" value="${item.accountID}" readonly></td>
					<td style="border: 1px solid black; width: 10%"><input style="width: 99%" type="text" placeholder="${item.accountType}" name="accountType" value="${item.accountType}"></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${item.username}" name="username" value="${item.username}"></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${item.password}" name="password" value="${item.password}"></td>
					<td style="border: 1px solid black" ><input style="width: 99%" type="text" placeholder="${item.firstName}" name="firstName" value="${item.firstName}"></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${item.lastName}" name="lastName" value="${item.lastName}"></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${item.email}" name="email" value="${item.email}"></td>
					<td style="width: 1%"><button name="update_button" value="Update">Submit</button></td>
					<td style="width: 1%"><button name="delete_button" value="Delete">Delete</button></td>
					<td style="width: 1%"><button name="reminder_button" value="Reminder">Reminder</button></td>
				</form>
		       </tr>
		     </c:forEach>
        </table>    
</body>
</html>