<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Professor Login</title>
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
          <h2>Professor Login</h2>
        </a>
        <ul class="navbar-nav ms-auto">
          <li class="nav-item px-2">
            <form action="newRequest.jsp" method="post">
		    	<button class="btn btn-link-primary btn-outline-secondary nav-link-btns" href="newRequest.jsp">New Book Request</button>
	    	</form>
          </li>
          <li class="nav-item px-2">
            <form action="./BookstoreServlet" method="post">
				<button class="btn btn-link-primary btn-outline-secondary nav-link-btns" type="">View Old Requests</button>
	    	</form>
          </li>
          <li class="nav-item px-2">
            <form action="userSettings.jsp" method="post">
				<button class="btn btn-link-primary btn-outline-secondary nav-link-btns" type="">Settings</button>
	    	</form>
          </li>
          <li class="nav-item px-2">
            <form action="./LogoutServlet">
				<button class="btn btn-link-primary btn-outline-secondary nav-link-btns" type="">Logout</button>
	    	</form>
          </li>
        </ul>
      </div>
    </nav>
    <div style="display: block; text-align: center; margin-top: 30px">
      <h2>Hello ${firstName}, welcome to your home page!<br /><br /></h2>
    </div>
  </body>
</html>