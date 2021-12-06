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
 * Servlet implementation class BookRequestChangeServlet
 */
@WebServlet("/BookRequestChangeServlet")
public class BookRequestChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(
        	        "jdbc:mysql://localhost:3306/bookstore", "root", "password");
        	ResultSet rs = null;
        	HttpSession session = request.getSession();       
        	
        	String deleteButton = request.getParameter("delete_button");

        	String title = request.getParameter("title");
        	String author = request.getParameter("author");
        	String edition = request.getParameter("edition");
        	String publisher = request.getParameter("publisher");
        	String isbn = request.getParameter("isbn");
        	String accountID = session.getAttribute("accountID").toString();
        	
        	if(deleteButton != null) {
            	PreparedStatement st = con.prepareStatement("DELETE FROM bookorders WHERE title = ? AND author = ? AND edition = ? AND publisher = ? AND isbn = ? AND accountID = ?");
            	st.setString(1, title);
            	st.setString(2, author);
            	st.setString(3, edition);
            	st.setString(4, publisher);
            	st.setString(5, isbn);
            	st.setString(6, accountID);
        		st.executeUpdate();
            	response.sendRedirect(request.getContextPath() + "/professorLogin.jsp");     		
        	}

        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
