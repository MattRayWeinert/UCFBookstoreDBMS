package Default;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FacultyChangeServlet
 */
@WebServlet("/FacultyChangeServlet")
public class FacultyChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(
        	        "jdbc:mysql://localhost:3306/bookstore", "root", "password");
        	ResultSet rs = null;
        	HttpSession session = request.getSession();       
        	
        	String accountID = request.getParameter("accountID");
        	String username = request.getParameter("username");
        	String password = request.getParameter("password");

        	String firstName = request.getParameter("firstName");
        	String lastName = request.getParameter("lastName");
        	String email = request.getParameter("email");
        	
        	PreparedStatement st = con.prepareStatement("UPDATE useraccounts SET username = '" + username + "', password = '" + password + "', firstName = '" + firstName + 
        			"', lastName = '" + lastName + "', email = '" + email + "' WHERE useraccounts.accountID = '" + accountID + "'");
        	System.out.println(st);
    		st.executeUpdate();
        	response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
