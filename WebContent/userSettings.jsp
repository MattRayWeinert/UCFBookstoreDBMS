<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>User Settings</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
  </head>
  <body>
   <%
	    	Object accountID = request.getAttribute("accountID");
			Object accountType = request.getAttribute("accountType");
			Object username = request.getAttribute("username");
			Object password = request.getAttribute("password");
			Object firstName = request.getAttribute("firstName");
			Object lastName = request.getAttribute("lastName");
			Object email = request.getAttribute("email");
			Object error = request.getAttribute("error");
			
	
			session = request.getSession(false);
			if(session.getAttribute("accountID")==null) {
	    		response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
	    %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand" href="#">
          <h2>User Settings</h2>
        </a>
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <form action="professorLogin.jsp">
				<button type="">Home</button>
		   	</form>
          </li>
          <li class="nav-item">
            <form action="newRequest.jsp" method="post">
		    	<button href="newRequest.jsp">New Book Request</button>
	    	</form>
          </li>
          <li class="nav-item">
			<form action="./BookstoreServlet" method="post">
				<button type="">View Old Requests</button>
			</form>
		  </li>
          <li class="nav-item">
           <form action="./LogoutServlet">
				<button type="">Logout</button>&emsp;
	    	</form>
          </li>
        </ul>
      </div>
    </nav>

	<h2 class="text-center">Edit your information below</h2>
    <div style="margin: 0 auto; font-size: 15px; display: block; text-align: center;">
      	<div class="form-control input-group" style="width: 50%; margin: 0 auto; float: none">
	      	<div style="width: 50%; margin: 0 auto; float: none">
		      <form action="./SettingsServlet" method="POST">
		        <div class="container">
		          <input class="form-control col-9" type="text" placeholder="${username}" name="username" value="${username}" style="margin: 5px" />
		          <input type="text" class="form-control" placeholder="${password}" name="password" value="${password}" style="margin: 5px" />
		          <input type="text" class="form-control" placeholder="${firstName}" value="${firstName}" name="firstName" style="margin: 5px" />
		          <input type="text" class="form-control" name="lastName" placeholder="${lastName}" value="${lastName}" style="margin: 5px" />
		          <input type="text" class="form-control" placeholder="${email}" name="email" value="${email}" style="margin: 5px" />
		          <button type="submit" class="btn btn-primary btn-block"> Submit </button>
		        </div>
		      </form>
	      	</div>
    	</div>
    </div>
  </body>
</html>