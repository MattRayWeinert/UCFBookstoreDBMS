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
           <form action="./LogoutServlet">
				<button type="">Logout</button>&emsp;
	    	</form>
          </li>
        </ul>
      </div>
    </nav>

    <div
      style="
        width: 340px;
        margin: 50px auto;
        font-size: 15px;
        display: block;
        text-align: center;
      "
    >
      <h4>Edit your information below.</h4>
      <form action="./SettingsServlet" method="POST">
        <div class="form-group">
          <input
            type="text"
            class="form-control"
            placeholder="${username}" 
            name="username" 
            value="${username}"
            required="required"
          />
        </div>
        <div class="form-group" style="padding-top: 10px">
          <input
            type="text"
            class="form-control"
           placeholder="${password}" 
           name="password" 
           value="${password}"
            required="required"
          />
        </div>
        <div class="form-group" style="padding-top: 10px">
          <input
            type="text"
            class="form-control"
            placeholder="${firstName}"
            value="${firstName}"
            name="firstName"
            required="required"
          />
        </div>
        <div class="form-group" style="padding-top: 10px">
          <input
            type="text"
            class="form-control"
            name="lastName"
            placeholder="${lastName}"
            value="${lastName}"
            required="required"
          />
        </div>
        <div class="form-group" style="padding-top: 10px">
          <input
            type="text"
            class="form-control"
            placeholder="${email}"
            name="email"
            value="${email}"
            required="required"
          />
        </div>
        <div class="form-group">
          <button
            type="submit"
            class="btn btn-primary btn-block"
            style="margin-top: 10px"
          >
            Submit
          </button>
        </div>
      </form>
    </div>
  </body>
</html>