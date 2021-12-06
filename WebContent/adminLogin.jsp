<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Admin Login</title>
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
	Object firstName = request.getAttribute("firstName");
	Object lastName = request.getAttribute("lastName");
	Object email = request.getAttribute("email");
	Object error = request.getAttribute("error");

	session = request.getSession(false);
	if (session.getAttribute("accountID") == null) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	%>
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
            <form action="./FacultyServlet" method="post">
			<button>Faculty</button>
		</form>
          </li>
          <li class="nav-item">
            <form action="./BookRequestServlet" method="post">
			<button>Book Requests</button>
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
<div class="container">
    <div style="text-align: center; display: block; margin-top: 10px">
      <h2>Hello, ${firstName}.</h2>
    </div>
    <!-- <form action="./BroadcastServlet" method="post">
        <input type="date" name="date" />
        <button>Broadcast</button>&emsp;
      </form> -->
    <form action="./BroadcastServlet" method="post" class="display-inline">
    <div class="d-inline">
      <div class="form-group col-9 ">
        <!-- Date input -->
        <h4>Please select the broadcast date</h4>
        <input
          class="form-control "
          id="date"
          name="date"
          placeholder="MM/DD/YYYY"
          type="date"
        />
      </div>
      <div class="form-group col-3 ">
        <button
          class="btn btn-primary"
          style="margin-top: 10px"
          name="submit"
          type="submit"
        >
          Broadcast
        </button>
      </div>
      </div>
    </form>
    </div>
  </body>
</html>