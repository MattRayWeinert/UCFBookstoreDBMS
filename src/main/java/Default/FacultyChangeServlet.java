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
        	
        	String deleteButton = request.getParameter("update_button");
        	String updateButton = request.getParameter("delete_button");
        	String reminderButton = request.getParameter("reminder_button");

        	String accountID = request.getParameter("accountID");
        	String username = request.getParameter("username");
        	String password = request.getParameter("password");
        	String firstName = request.getParameter("firstName");
        	String lastName = request.getParameter("lastName");
        	String email = request.getParameter("email");
        	        
        	if(deleteButton != null) {
        		PreparedStatement st = con.prepareStatement("UPDATE useraccounts SET username = '" + username + "', password = '" + password + "', firstName = '" + firstName + 
        				"', lastName = '" + lastName + "', email = '" + email + "' WHERE useraccounts.accountID = '" + accountID + "'");
        		st.executeUpdate();
        		response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");        		
        	} else if (updateButton != null) {
            	PreparedStatement st = con.prepareStatement("DELETE FROM useraccounts WHERE accountID = ?");
            	st.setString(1, accountID);
        		st.executeUpdate();
            	response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        	} else if (reminderButton != null) {
        		SendMail.sendEmail(email, "Book request reminder", "REMINDER: Submit book your requests.");
            	response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        	}

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
