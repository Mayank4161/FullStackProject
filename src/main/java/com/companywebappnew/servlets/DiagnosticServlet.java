package com.companywebappnew.servlets;

import com.companywebappnew.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

/**
 * Diagnostic servlet to identify specific errors in the application.
 */
@WebServlet("/DiagnosticServlet")
public class DiagnosticServlet extends HttpServlet {

    /**
     * Handles GET requests for diagnostic testing.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        out.println("<html><head><title>Diagnostic Results</title>");
        out.println("<style>body{font-family:Arial,sans-serif;margin:20px;} .success{color:green;} .error{color:red;} .warning{color:orange;}</style>");
        out.println("</head><body>");
        out.println("<h1>🔍 Application Diagnostic Results</h1>");
        
        // Test 1: Servlet functionality
        out.println("<h2>✅ Test 1: Servlet Functionality</h2>");
        out.println("<p class='success'>Servlet is working correctly.</p>");
        
        // Test 2: Properties file
        out.println("<h2>Test 2: Database Properties</h2>");
        try {
            Properties props = new Properties();
            InputStream in = getClass().getClassLoader().getResourceAsStream("db.properties");
            if (in != null) {
                props.load(in);
                out.println("<p class='success'>✅ db.properties found</p>");
                out.println("<p>URL: " + props.getProperty("db.url") + "</p>");
                out.println("<p>Username: " + props.getProperty("db.username") + "</p>");
                out.println("<p>Password: " + (props.getProperty("db.password") != null ? "***" : "NULL") + "</p>");
                in.close();
            } else {
                out.println("<p class='error'>❌ db.properties not found in classpath</p>");
            }
        } catch (Exception e) {
            out.println("<p class='error'>❌ Error reading properties: " + e.getMessage() + "</p>");
        }
        
        // Test 3: MySQL Driver
        out.println("<h2>Test 3: MySQL Driver</h2>");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("<p class='success'>✅ MySQL driver loaded successfully</p>");
        } catch (ClassNotFoundException e) {
            out.println("<p class='error'>❌ MySQL driver not found: " + e.getMessage() + "</p>");
        }
        
        // Test 4: Database Connection
        out.println("<h2>Test 4: Database Connection</h2>");
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null && !conn.isClosed()) {
                out.println("<p class='success'>✅ Database connection successful</p>");
                
                // Test 5: Database Tables
                out.println("<h2>Test 5: Database Tables</h2>");
                Statement stmt = conn.createStatement();
                
                String[] tables = {"contacts", "newsletter_subscribers", "admin_users", "clients", "projects"};
                for (String table : tables) {
                    try {
                        ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM " + table);
                        if (rs.next()) {
                            out.println("<p class='success'>✅ " + table + " table exists with " + rs.getInt(1) + " records</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p class='error'>❌ " + table + " table error: " + e.getMessage() + "</p>");
                    }
                }
                
                stmt.close();
                conn.close();
                out.println("<p class='success'>✅ Database connection closed</p>");
            } else {
                out.println("<p class='error'>❌ Database connection failed</p>");
            }
        } catch (Exception e) {
            out.println("<p class='error'>❌ Database connection error: " + e.getMessage() + "</p>");
            out.println("<p class='error'>SQL State: " + (e instanceof java.sql.SQLException ? ((java.sql.SQLException)e).getSQLState() : "N/A") + "</p>");
            out.println("<p class='error'>Error Code: " + (e instanceof java.sql.SQLException ? ((java.sql.SQLException)e).getErrorCode() : "N/A") + "</p>");
        }
        
        // Test 6: System Information
        out.println("<h2>Test 6: System Information</h2>");
        out.println("<p>Java Version: " + System.getProperty("java.version") + "</p>");
        out.println("<p>Server Info: " + getServletContext().getServerInfo() + "</p>");
        out.println("<p>Context Path: " + req.getContextPath() + "</p>");
        out.println("<p>Class Path: " + System.getProperty("java.class.path") + "</p>");
        
        // Test 7: Common Issues
        out.println("<h2>Test 7: Common Issues Check</h2>");
        
        // Check if MySQL is running
        out.println("<h3>MySQL Service Check:</h3>");
        out.println("<p class='warning'>⚠️ Please ensure MySQL is running on localhost:3306</p>");
        out.println("<p class='warning'>⚠️ Please ensure database 'companywebappnew' exists</p>");
        out.println("<p class='warning'>⚠️ Please ensure user 'root' with password 'Mayank' has access</p>");
        
        // Check if tables exist
        out.println("<h3>Database Setup Check:</h3>");
        out.println("<p class='warning'>⚠️ Run: mysql -u root -p < database_setup.sql</p>");
        
        out.println("<br><p><a href='" + req.getContextPath() + "/index.jsp'>Back to Home</a></p>");
        out.println("</body></html>");
    }

    /**
     * Handles POST requests (not supported for diagnostic servlet).
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("POST not supported. Use GET to run diagnostics.");
    }
} 