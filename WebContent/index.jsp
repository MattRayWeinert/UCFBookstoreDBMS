<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Login Page</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
  </head>
  <body>
  <div class="container text-center pt-3">
  <h1>The Best Book Site Around!</h1>
  </div>
    <div
      style="
        width: 340px;
        margin: 50px auto;
        font-size: 15px;
        display: block;
        text-align: center;
      "
    >
      <form action="./LoginServlet" method="post">
        <h2 class="text-center">Log in</h2>
        <div class="form-group">
          <input
            type="text"]
            name="username"
            class="form-control"
            placeholder="Username"
            required="required"
          />
        </div>
        <div class="form-group" style="padding-top: 10px">
          <input
            type="password"
            name="password"
            class="form-control"
            placeholder="Password"
            required="required"
          />
        </div>
        <div class="form-group">
          <button
            type="submit"
            class="btn btn-primary btn-block"
            style="margin-top: 10px"
          >
            Log in
          </button>
        </div>
        <div style="padding-top: 10px">
          <a href="recoverAccount.jsp" class="float-right">Forgot Password?</a>
        </div>
      </form>
    </div>
  </body>
</html>