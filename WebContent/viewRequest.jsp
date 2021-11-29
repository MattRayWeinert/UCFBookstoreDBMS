<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book Requests</title>
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
			View Book Request JSP
			
			<form action="professorLogin.jsp">
				<button type="">Home</button>&emsp;
	    	</form>
	    	
    	</h2>
    	        <table style="width: 100%; border: 1px solid black">
    	        <th style="border: 1px solid black">Account ID</th>
    	        <th style="border: 1px solid black">Title</th>
    	        <th style="border: 1px solid black">Publisher</th>
    	        <th style="border: 1px solid black">Edition</th>
    	        <th style="border: 1px solid black">Author</th>
        		<th style="border: 1px solid black">ISBN</th>
        	
        	
        	
        	
		     <c:forEach items="${results}" var="item">
		       <tr>
				<form action="./BookstoreServlet" method="post">
					<td style="border: 1px solid black; width: 10%;"><input style="width: 99%" type="text" placeholder="${item.accountID}" name="accountID" value="${item.accountID}" readonly></td>
					<td style="border: 1px solid black; width: 10%"><input style="width: 99%" type="text" placeholder="${item.title}" name="title" value="${item.title}"></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${item.publisher}" name="publisher" value="${item.publisher}"></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${item.edition}" name="edition" value="${item.edition}"></td>
					<td style="border: 1px solid black" ><input style="width: 99%" type="text" placeholder="${item.author}" name="author" value="${item.author}"></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${item.isbn}" name="isbn" value="${item.isbn}"></td>
					<td style="width: 1%"><button>Submit</button></td>
				</form>
		       </tr>
		     </c:forEach>
        </table>
			<form action="./LogoutServlet">
				<button type="">Logout</button>&emsp;
	    	</form>
	</body>
</html>