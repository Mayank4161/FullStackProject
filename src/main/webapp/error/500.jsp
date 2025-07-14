<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - Internal Server Error</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 20px; 
            background-color: #f8f9fa;
        }
        .error-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .error-header {
            color: #dc3545;
            font-size: 2em;
            margin-bottom: 20px;
        }
        .error-message {
            color: #6c757d;
            margin-bottom: 30px;
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
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-header">500</h1>
        <h2>Internal Server Error</h2>
        <p class="error-message">
            The server encountered an internal error and was unable to complete your request.
        </p>
        
        <div>
            <a href="<%= request.getContextPath() %>/DiagnosticServlet" class="btn">🔍 Run Diagnostics</a>
            <a href="<%= request.getContextPath() %>/" class="btn">🏠 Back to Home</a>
        </div>
    </div>
</body>
</html> 