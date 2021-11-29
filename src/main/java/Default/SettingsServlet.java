package Default;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SettingsServlet
 */
@WebServlet("/SettingsServlet")
public class SettingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SettingsServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "password");
			ResultSet rs = null;
			HttpSession session = request.getSession(); 
			
        	Object accountID = session.getAttribute("accountID");        	
        	int id = Integer.valueOf((String) accountID);
        	
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			
			
			PreparedStatement st = con.prepareStatement("UPDATE useraccounts SET username = '" + username + "', password = '" + password + "', firstName = '" + firstName + 
    				"', lastName = '" + lastName + "', email = '" + email + "' WHERE useraccounts.accountID = '" + id + "'");
    		st.executeUpdate();			
    		
    		session.setAttribute("username", username);
    		session.setAttribute("password", password);
    		session.setAttribute("firstName", firstName);
    		session.setAttribute("lastName", lastName);
    		session.setAttribute("email", email);

			response.sendRedirect(request.getContextPath() + "/professorLogin.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
