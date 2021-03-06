package Default;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccount")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(
        	        "jdbc:mysql://localhost:3306/bookstore", "root", "password");
        	ResultSet rs = null;
        	PreparedStatement st = null;
        	HttpSession session = request.getSession();       
        	
        	String email = request.getParameter("email");
        	String usernameOnly = email.substring(0,email.indexOf('@'));
        	String query = "SELECT * FROM useraccounts WHERE email = ?";
        	st = con.prepareStatement(query);
        	st.setString(1, email);
        	rs = st.executeQuery();
        	      		
        	int accountType = 2;
        	String newUsername = randomString();
        	String newPassword = randomString();

        	if(rs.next()) {           	
        		query = "UPDATE useraccounts SET useraccounts.password = '" + newPassword + 
        				"' WHERE useraccounts.email = '" + email + "'";
        		st.executeUpdate(query);
        		
        		SendMail.sendEmail(email, "UCF Bookstore: New password & login link", 
        				"Your new Bookstore Password is: " + newPassword + ". LOGIN LINK: http://localhost:8080/Bookstore/adminLogin.jsp");
        		
        		response.sendRedirect(request.getContextPath() + "/index.jsp");
        	} else {
        		// Create new account
        		// Send email the new account info + the login link
            	PreparedStatement st2 = con.prepareStatement("INSERT into useraccounts (accountType, username, password, firstNAme, lastName, email) values (?, ?, ?, ?, ?, ?)");
            	st2.setInt(1,  2);
            	st2.setString(2, usernameOnly);
            	st2.setString(3, newPassword);
            	st2.setString(4, "Default First Name");
            	st2.setString(5, "Default Last Name");
            	st2.setString(6, email);
        		st2.executeUpdate();
        		
        		SendMail.sendEmail(email, "UCF Bookstore: New password & login link", 
        				"Your new Bookstore Username is: "+ usernameOnly + ", and new Password is: " + newPassword + 
        				". LOGIN LINK: http://localhost:8080/Bookstore/index.jsp");
        		
        		response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        	}
			
			
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	protected String randomString() {
        String baseChars = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder rando = new StringBuilder();
        Random rnd = new Random();
        while (rando.length() < 6) { // length of the random string
            int index = (int) (rnd.nextFloat() * baseChars.length());
            rando.append(baseChars.charAt(index));
        }
        
        return rando.toString();
    }
}
