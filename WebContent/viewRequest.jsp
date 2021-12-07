 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
      <style>
    .nav-link-btns{
    color: whitesmoke;
    size: 1.5rem;
}
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand" href="#">
          <h2>View Book Requests</h2>
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
          
          <li class="nav-item px-2">
            <form action="professorLogin.jsp" method="post">
				<button class="btn btn-link-primary btn-outline-secondary nav-link-btns" type="">Home</button>
	    	</form>
          </li>
          <li class="nav-item px-2">
            <form action="newRequest.jsp" method="post">
		    	<button class="btn btn-link-primary btn-outline-secondary nav-link-btns" href="newRequest.jsp">New Book Request</button>
	    	</form>
          </li>
 		  <li class="nav-item px-2">
			<form action="userSettings.jsp" method="post">
				<button class="btn btn-link-primary btn-outline-secondary nav-link-btns" type="">Settings</button>
			</form>
		  </li>
          <li class="nav-item px-2">
            <form action="./LogoutServlet">
			<button class="btn btn-link-primary btn-outline-secondary nav-link-btns">Logout</button>
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
				<form action="./BookRequestChangeServlet" method="post">				
					<td style="border: 1px solid black; width: 10%"><input style="width: 99%" type="text" placeholder="${book.title}" name="title" value="${book.title}" readonly></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${book.publisher}" name="publisher" value="${book.publisher}" readonly></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${book.edition}" name="edition" value="${book.edition}" readonly></td>
					<td style="border: 1px solid black" ><input style="width: 99%" type="text" placeholder="${book.author}" name="author" value="${book.author}" readonly></td>
					<td style="border: 1px solid black"><input style="width: 99%" type="text" placeholder="${book.isbn}" name="isbn" value="${book.isbn}" readonly></td>
					<td style="width: 1%">
					<button name="delete_button" class="btn btn-danger" value="Delete">Delete</button>
				</form>
				</td>
				
		       </tr>
		     </c:forEach>
    </table>
    </div>
  </body>
</html> 
