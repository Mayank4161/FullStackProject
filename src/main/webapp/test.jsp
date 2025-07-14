<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.companywebappnew.util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test Page</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .success { color: green; }
        .error { color: red; }
        .warning { color: orange; }
        .test-section { margin: 20px 0; padding: 10px; border: 1px solid #ccc; }
    </style>
</head>
<body>
    <h1>🧪 Application Test Page</h1>
    
    <div class="test-section">
        <h2>✅ Test 1: JSP Processing</h2>
        <p class="success">JSP is working correctly!</p>
        <p>Current time: <%= new java.util.Date() %></p>
        <p>Server info: <%= application.getServerInfo() %></p>
    </div>
    
    <div class="test-section">
        <h2>Test 2: Database Connection</h2>
        <%
        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null && !conn.isClosed()) {
                out.println("<p class='success'>✅ Database connection successful</p>");
                
                // Test contacts table
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) as count FROM contacts");
                if (rs.next()) {
                    out.println("<p class='success'>✅ Contacts table accessible: " + rs.getInt("count") + " records</p>");
                }
                rs.close();
                
                // Test newsletter_subscribers table
                try {
                    rs = stmt.executeQuery("SELECT COUNT(*) as count FROM newsletter_subscribers");
                    if (rs.next()) {
                        out.println("<p class='success'>✅ Newsletter subscribers table accessible: " + rs.getInt("count") + " records</p>");
                    }
                    rs.close();
                } catch (Exception e) {
                    out.println("<p class='error'>❌ Newsletter subscribers table error: " + e.getMessage() + "</p>");
                }
                
                stmt.close();
                conn.close();
                out.println("<p class='success'>✅ Connection closed properly</p>");
            } else {
                out.println("<p class='error'>❌ Database connection failed</p>");
            }
        } catch (Exception e) {
            out.println("<p class='error'>❌ Database error: " + e.getMessage() + "</p>");
            out.println("<p class='error'>Error type: " + e.getClass().getSimpleName() + "</p>");
        }
        %>
    </div>
    
    <div class="test-section">
        <h2>Test 3: Form Processing</h2>
        <%
        String testParam = request.getParameter("test");
        if (testParam != null) {
            out.println("<p class='success'>✅ Form parameter received: " + testParam + "</p>");
        } else {
            out.println("<p class='warning'>⚠️ No test parameter provided</p>");
        }
        %>
        <form method="get">
            <input type="text" name="test" placeholder="Enter test value">
            <input type="submit" value="Test Form">
        </form>
    </div>
    
    <div class="test-section">
        <h2>Test 4: Session Management</h2>
        <%
        HttpSession currentSession = request.getSession();
        if (currentSession != null) {
            out.println("<p>Session ID: " + currentSession.getId() + "</p>");
            long creationTime = currentSession.getCreationTime();
            out.println("<p>Session creation time (raw): " + creationTime + "</p>");
            out.println("<p>Session creation time (formatted): " + new java.util.Date(creationTime) + "</p>");
            out.println("<p>Session is new: " + currentSession.isNew() + "</p>");
        } else {
            out.println("<p class='error'>Session is null!</p>");
        }
        %>
    </div>
    
    <div class="test-section">
        <h2>Test 5: System Information</h2>
        <p>Java version: <%= System.getProperty("java.version") %></p>
        <p>Java vendor: <%= System.getProperty("java.vendor") %></p>
        <p>OS name: <%= System.getProperty("os.name") %></p>
        <p>OS version: <%= System.getProperty("os.version") %></p>
        <p>User directory: <%= System.getProperty("user.dir") %></p>
    </div>
    
    <div class="test-section">
        <h2>🔗 Quick Links</h2>
        <p><a href="<%= request.getContextPath() %>/DiagnosticServlet">🔍 Run Full Diagnostics</a></p>
        <p><a href="<%= request.getContextPath() %>/index.jsp">🏠 Back to Home</a></p>
        <p><a href="<%= request.getContextPath() %>/contact.jsp">📞 Contact Page</a></p>
        <p><a href="<%= request.getContextPath() %>/admin/login.jsp">🔐 Admin Login</a></p>
        <p><a href="<%= request.getContextPath() %>/admin/viewSubscribers.jsp">📧 View Newsletter Subscribers</a></p>
    </div>
    
    <div class="test-section">
        <h2>📋 Next Steps</h2>
        <p>If you see any ❌ errors above, please:</p>
        <ol>
            <li>Check the specific error message</li>
            <li>Run the <a href="<%= request.getContextPath() %>/DiagnosticServlet">full diagnostic</a></li>
            <li>Ensure MySQL is running</li>
            <li>Verify database setup is complete</li>
            <li>Check server logs for detailed error information</li>
        </ol>
    </div>
</body>
</html> 