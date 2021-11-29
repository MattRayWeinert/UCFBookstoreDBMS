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
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateEntryServlet")
public class CreateEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateEntryServlet() {
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
        	

        	Object accountID = session.getAttribute("accountID");
        	int id = Integer.valueOf((String) accountID);
        	String newisbn = request.getParameter("isbn");
        	String newpublisher = request.getParameter("publisher");
        	String newedition = request.getParameter("edition");
        	String newauthor = request.getParameter("author");
        	String newtitle = request.getParameter("title");

    		// Create new book order
        	PreparedStatement st2 = con.prepareStatement("INSERT into bookorders (isbn, publisher, edition, author, title, accountID) values (?, ?, ?, ?, ?, ?)");
        	
        	st2.setString(1, newisbn);
        	st2.setString(2, newpublisher);
        	st2.setString(3, newedition);
        	st2.setString(4, newauthor);
        	st2.setString(5, newtitle);
        	//UPDATE FOR ACCOUNTID
        	st2.setInt(6, id);
    		st2.executeUpdate();
        		
    		response.sendRedirect(request.getContextPath() + "/professorLogin.jsp");
        	
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	

}
