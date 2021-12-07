<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Faculty</title>
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
          <li class="nav-item">
            <form action="adminLogin.jsp" method="post">
				<button>Home</button>
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
    <div style="display: block; padding: 30px">
      <form action="./CreateAccount" method="post">
          <label for="username"><b>Create Account: </b></label>
              	<div class="form-control input-group col-9">        
          <input
            type="email"
            placeholder="Enter Email"
            name="email"
            class="form-control"
            required
          />
          <button
          	type="submit"
            class="btn btn-success"
            value="Submit"
          >
            Submit</button
          >&emsp;
              </div>
        
      </form>
    </div>

    <br /><br />

    <table class="table">
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Account Type</th>
          <th scope="col">Username</th>
          <th scope="col">Password</th>
          <th scope="col">First Name</th>
          <th scope="col">Last Name</th>
          <th scope="col">Email</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
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
					<td style="width: 1%"><button class="btn btn-success" name="update_button" value="Update">Submit</button></td>
					<td style="width: 1%"><button class="btn btn-danger" name="delete_button" value="Delete">Delete</button></td>
					<td style="width: 1%"><button class="btn btn-warning" name="reminder_button" value="Reminder">Reminder</button></td>
				</form>
		       </tr>
		     </c:forEach>
      </tbody>
    </table>
    </div>
  </body>
</html>