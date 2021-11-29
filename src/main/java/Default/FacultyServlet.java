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
 * Servlet implementation class FacultyServlet
 */
@WebServlet("/FacultyServlet")
public class FacultyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection con = DriverManager.getConnection(
        	        "jdbc:mysql://localhost:3306/bookstore", "root", "password");
        	ResultSet rs = null;
        	PreparedStatement st = null;
        	HttpSession session = request.getSession();       
        	
        	String query = "SELECT * FROM useraccounts";
        	st = con.prepareStatement(query);
        	rs = st.executeQuery();
        	List<Map> list = new ArrayList<Map>();
        	
        	while(rs.next()) {
        		Map map = new HashMap();
        		map.put("accountID", rs.getString("accountID"));
        		map.put("accountType", rs.getString("accountType"));
        		map.put("username", rs.getString("username"));
        		map.put("password", rs.getString("password"));
        		map.put("firstName", rs.getString("firstName"));
        		map.put("lastName", rs.getString("lastName"));
        		map.put("email", rs.getString("email"));
        		
        		list.add(map);
        	}
        	
        	session.setAttribute("results", list);
        	response.sendRedirect(request.getContextPath() + "/faculty.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
