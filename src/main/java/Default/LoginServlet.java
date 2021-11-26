package Default;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
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
        	String password = request.getParameter("password");
        	
        	String query = "SELECT * FROM useraccounts WHERE username = ? AND password = ?";
        	st = con.prepareStatement(query);
        	st.setString(1, username);
        	st.setString(2, password);
        	rs = st.executeQuery();
        	
        	if(rs.next()) {
            	session.setAttribute("accountID", rs.getString("accountID"));
            	session.setAttribute("accountType", rs.getString("accountType")); // Account Type "1" = Admin, Account Type "2" = Professor
            	session.setAttribute("username", rs.getString("username"));
            	session.setAttribute("firstName", rs.getString("firstName"));
            	session.setAttribute("lastName", rs.getString("lastName"));
            	session.setAttribute("email", rs.getString("email"));
            	
            	if(rs.getString("accountType").contains("1")) {
            		response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");	
            	} else if (rs.getString("accountType").contains("2")) {
            		response.sendRedirect(request.getContextPath() + "/professorLogin.jsp");	
            	}
            	
        	} else {
        		session.setAttribute("error", "Not logged in.");
        		response.sendRedirect(request.getContextPath() + "/index.jsp");
        	}
			
			
        } catch (Exception e) {
            e.printStackTrace();
        }

	}

}
