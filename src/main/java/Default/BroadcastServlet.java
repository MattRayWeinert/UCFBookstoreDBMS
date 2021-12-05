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
 * Servlet implementation class RequestServlet
 */
@WebServlet("/BroadcastServlet")
public class BroadcastServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(
        	        "jdbc:mysql://localhost:3306/bookstore", "root", "password");
        	ResultSet rs = null;
        	PreparedStatement st = null;
        	HttpSession session = request.getSession();    
			
        	String date = request.getParameter("date");

        	st = con.prepareStatement("SELECT email FROM useraccounts");
        	rs = st.executeQuery();
        	
        	response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");

        	while(rs.next()) {
    			SendMail.sendEmail(rs.getString("email"), "BROADCAST: BOOKSTORE REMINDER!", "Reminder: submission book deadline by " + date + ".");
    		}			       		
			
		} catch (Exception e) {
            e.printStackTrace();
        }
	}

}
