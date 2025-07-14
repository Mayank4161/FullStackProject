package com.companywebappnew.servlets;

import com.companywebappnew.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;

/**
 * Test servlet to verify backend functionality.
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {

    /**
     * Handles GET requests for testing backend functionality.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        out.println("<html><head><title>Backend Test</title></head><body>");
        out.println("<h1>Backend Test Results</h1>");
        
        // Test 1: Servlet functionality
        out.println("<h2>✅ Servlet Test: PASSED</h2>");
        out.println("<p>Servlet is working correctly.</p>");
        
        // Test 2: Database connection
        out.println("<h2>Database Connection Test:</h2>");
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null && !conn.isClosed()) {
                out.println("<p>✅ Database connection: PASSED</p>");
                conn.close();
            } else {
                out.println("<p>❌ Database connection: FAILED</p>");
            }
        } catch (Exception e) {
            out.println("<p>❌ Database connection: FAILED</p>");
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
        
        // Test 3: System information
        out.println("<h2>System Information:</h2>");
        out.println("<p>Java Version: " + System.getProperty("java.version") + "</p>");
        out.println("<p>Server Info: " + getServletContext().getServerInfo() + "</p>");
        out.println("<p>Context Path: " + req.getContextPath() + "</p>");
        
        out.println("<br><p><a href='" + req.getContextPath() + "/index.jsp'>Back to Home</a></p>");
        out.println("</body></html>");
    }

    /**
     * Handles POST requests (not supported for test servlet).
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("POST not supported. Use GET to test backend functionality.");
    }
} 