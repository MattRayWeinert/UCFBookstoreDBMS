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
 * Servlet implementation class BookRequestServlet
 */
@WebServlet("/SaveBooksServlet")
public class SaveBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(
        	        "jdbc:mysql://localhost:3306/bookstore", "root", "password");
        	ResultSet rs = null;
        	PreparedStatement st = null;
        	HttpSession session = request.getSession();    
			

        	st = con.prepareStatement("SELECT email, title, author, edition, publisher, isbn FROM bookorders INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/books.csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'");
        	rs = st.executeQuery();
        	
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
		} catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
        }
	}

}
