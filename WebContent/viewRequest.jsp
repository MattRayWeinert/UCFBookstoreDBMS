<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>View Book Requests</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand" href="#">
          <h2>Faculty Database</h2>
        </a>
        <ul class="navbar-nav ms-auto">
          <!-- <li class="nav-item">
            <a class="nav-link" href="./FacultyServlet">Faculty</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./BookRequestServlet">Book Requests</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="./LogoutServlet">Logout</a>
          </li> -->
          
          <li class="nav-item">
            <form action="professorLogin.jsp" method="post">
				<button type="">Home</button>
	    	</form>
          </li>
          <li class="nav-item">
            <form action="newRequest.jsp" method="post">
		    	<button href="newRequest.jsp">New Book Request</button>
	    	</form>
          </li>
          <li class="nav-item">
            <form action="./LogoutServlet">
			<button>Logout</button>
		</form>
          </li>
        </ul>
      </div>
    </nav>
    <%
	    	Object accountID = request.getAttribute("accountID");
			Object accountType = request.getAttribute("accountType");
			Object username = request.getAttribute("username");
			Object firstName = request.getAttribute("firstName");
			Object lastName = request.getAttribute("lastName");
			Object email = request.getAttribute("email");
			Object error = request.getAttribute("error");
			
			Object title = request.getAttribute("title");
			Object publisher = request.getAttribute("publisher");
			Object edition = request.getAttribute("edition");
			Object isbn = request.getAttribute("isbn");
			Object author = request.getAttribute("author");
			
			session = request.getSession(false);
			if(session.getAttribute("accountID")==null) {
	    		response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
	    %>
	    <div class="container">
    <div style="height: 30px"></div>

    <table class="table">
      <thead>
        <tr>
          <th scope="col">Title</th>
          <th scope="col">Publisher</th>
          <th scope="col">Edition</th>
          <th scope="col">Author</th>
          <th scope="col">ISBN</th>
        </tr>
      </thead>
 
        <c:forEach items="${books}" var="book">
		       <tr>
				
					<td style="border: 1px solid black; width: 10%">${book.title}</td>
					<td style="border: 1px solid black">${book.publisher}</td>
					<td style="border: 1px solid black">${book.edition}</td>
					<td style="border: 1px solid black">${book.author}</td>
					<td style="border: 1px solid black">${book.isbn}</td>
					<td style="width: 1%">
				<form action="./BookRequestChangeServlet" method="post">
					<button name="delete_button" value="Delete">Delete</button>
				</form>
				</td>
				
		       </tr>
		     </c:forEach>
    </table>
    </div>
  </body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			
			Object title = request.getAttribute("title");
			Object publisher = request.getAttribute("publisher");
			Object edition = request.getAttribute("edition");
			Object isbn = request.getAttribute("isbn");
			Object author = request.getAttribute("author");
			
			session = request.getSession(false);
			if(session.getAttribute("accountID")==null) {
	    		response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
	    %>
		<h2>
			View Book Request JSP<br/><br/>
			
			<form action="professorLogin.jsp" method="post">
				<button type="">Home</button>&emsp;
	    	</form>
	    	
			<form action="newRequest.jsp" method="post">
		    	<button href="newRequest.jsp">New Book Request</button>&emsp;
	    	</form>
	    	
			<form action="./LogoutServlet">
				<button>Logout</button>&emsp;
	    	</form>     
	    	
    	</h2>
        <table style="width: 100%; border: 1px solid black">
	        <th style="border: 1px solid black">Title</th>
	        <th style="border: 1px solid black">Publisher</th>
	        <th style="border: 1px solid black">Edition</th>
	        <th style="border: 1px solid black">Author</th>
	   		<th style="border: 1px solid black">ISBN</th>
	     	<c:forEach items="${books}" var="book">
		       <tr>
				<form action="./BookRequestChangeServlet" method="post">
					<td style="border: 1px solid black; width: 10%"><input style="width: 99%" type="text" placeholder="${book.title}" name="title" value="${book.title}" readonly></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${book.publisher}" name="publisher" value="${book.publisher}" readonly></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${book.edition}" name="edition" value="${book.edition}" readonly></td>
					<td style="border: 1px solid black" ><input style="width: 99%" type="text" placeholder="${book.author}" name="author" value="${book.author}" readonly></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${book.isbn}" name="isbn" value="${book.isbn}" readonly></td>
					<td style="width: 1%"><button name="delete_button" value="Delete">Delete</button></td>
				</form>
		       </tr>
		     </c:forEach>
        </table>
        <h2>
   
        </h2>
	</body>
</html>