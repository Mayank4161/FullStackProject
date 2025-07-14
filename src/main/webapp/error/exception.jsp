<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - Exception Occurred</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 20px; 
            background-color: #f8f9fa;
        }
        .error-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .error-header {
            color: #dc3545;
            border-bottom: 2px solid #dc3545;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .error-details {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin: 15px 0;
            border-left: 4px solid #dc3545;
        }
        .error-stack {
            background: #f1f3f4;
            padding: 15px;
            border-radius: 5px;
            font-family: monospace;
            font-size: 12px;
            white-space: pre-wrap;
            max-height: 300px;
            overflow-y: auto;
            margin: 15px 0;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
        }
        .btn:hover {
            background: #0056b3;
        }
        .btn-secondary {
            background: #6c757d;
        }
        .btn-secondary:hover {
            background: #545b62;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-header">🚨 Application Error</h1>
        
        <p><strong>An unexpected error occurred in the application.</strong></p>
        
        <div class="error-details">
            <h3>Error Details:</h3>
            <p><strong>Exception Type:</strong> <%= exception != null ? exception.getClass().getName() : "Unknown" %></p>
            <p><strong>Error Message:</strong> <%= exception != null ? exception.getMessage() : "No message available" %></p>
            <p><strong>Request URI:</strong> <%= request.getAttribute("jakarta.servlet.error.request_uri") %></p>
            <p><strong>Servlet Name:</strong> <%= request.getAttribute("jakarta.servlet.error.servlet_name") %></p>
        </div>
        
        <% if (exception != null) { %>
        <div class="error-details">
            <h3>Stack Trace:</h3>
            <div class="error-stack">
                <% 
                java.io.StringWriter sw = new java.io.StringWriter();
                java.io.PrintWriter pw = new java.io.PrintWriter(sw);
                exception.printStackTrace(pw);
                out.println(sw.toString());
                %>
            </div>
        </div>
        <% } %>
        
        <div class="error-details">
            <h3>Common Solutions:</h3>
            <ul>
                <li><strong>Database Connection:</strong> Ensure MySQL is running and database exists</li>
                <li><strong>Database Setup:</strong> Run the database setup script</li>
                <li><strong>Configuration:</strong> Check db.properties file exists and is correct</li>
                <li><strong>Dependencies:</strong> Ensure all required JAR files are in classpath</li>
                <li><strong>Permissions:</strong> Check database user permissions</li>
            </ul>
        </div>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="<%= request.getContextPath() %>/DiagnosticServlet" class="btn">🔍 Run Diagnostics</a>
            <a href="<%= request.getContextPath() %>/test.jsp" class="btn btn-secondary">🧪 Test Page</a>
            <a href="<%= request.getContextPath() %>/" class="btn btn-secondary">🏠 Back to Home</a>
        </div>
        
        <div style="margin-top: 20px; padding: 15px; background: #e7f3ff; border-radius: 5px;">
            <h4>📋 Troubleshooting Steps:</h4>
            <ol>
                <li>Check the error details above for specific information</li>
                <li>Run the diagnostic servlet to test all components</li>
                <li>Verify MySQL service is running: <code>net start mysql</code></li>
                <li>Check database connection: <code>mysql -u root -p</code></li>
                <li>Review Tomcat logs in Eclipse for additional details</li>
                <li>Ensure all required files are in the correct locations</li>
            </ol>
        </div>
    </div>
</body>
</html> 