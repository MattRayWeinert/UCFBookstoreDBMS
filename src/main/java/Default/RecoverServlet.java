package Default;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RecoverServlet
 */
@WebServlet("/RecoverServlet")
public class RecoverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RecoverServlet() {
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
        	
        	String username = request.getParameter("username");
        	
        	String query = "SELECT * FROM useraccounts WHERE username = ?";
        	st = con.prepareStatement(query);
        	st.setString(1, username);
        	rs = st.executeQuery();
        	String newPassword = getSaltString();

        	
        	if(rs.next()) {
            	String email = rs.getString("email");        		
            	String subject = "Bookstore Account Password Reset";
            	String content = "Your new Password is: " + newPassword;
            	session.setAttribute("username", rs.getString("username"));
            	
            	query = "UPDATE useraccounts SET useraccounts.password = '" + newPassword + 
            			"' WHERE useraccounts.username = '" + username + "'";
            	st.executeUpdate(query);
            	
            	// Send the user an email            	
            	try {
            		SendMail.sendEmail(email, subject, content);            		
            	} catch (Exception ex) {
                    ex.printStackTrace();
                }
            	
            	response.sendRedirect(request.getContextPath() + "/index.jsp");
        	} else {
        		session.setAttribute("error", "Not a valid username.");
        		response.sendRedirect(request.getContextPath() + "/index.jsp");
        	}
			
			
        } catch (Exception e) {
            e.printStackTrace();
        }

	}

	protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 8) { // length of the random string
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
}
