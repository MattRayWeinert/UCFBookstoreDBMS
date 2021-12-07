<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Account Recovery</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />  <style>
    .nav-link-btns{
    color: whitesmoke;
    size: 1.5rem;
}
    </style>
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
	    %>
    <div style="width: 340px; margin: 50px auto; font-size: 15px; display: block; text-align: center;">
      <form action="./RecoverServlet" method="post">
        <h2 class="text-center">Recover your account</h2>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Enter Username" required="required" name="username" />
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block" style="margin-top: 10px" >
            Recover Account
          </button>
        </div>
      </form>
    </div>
  </body>
</html>