package Default;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    protected static Connection initializeDatabase()
            throws SQLException, ClassNotFoundException
        {
            // Initialize all the information regarding
            // Database Connection
            String dbDriver = "com.mysql.jdbc.Driver";
            String dbURL = "jdbc:mysql://localhost:3306/bookstore";
            // Database name to access
            String dbName = "bookstore";
            String dbUsername = "root";
            String dbPassword = "password";
      
            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(dbURL + dbName,
                                                         dbUsername, 
                                                         dbPassword);
            return con;
        }
}
