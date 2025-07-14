<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Admin Login - CompanyWebAppNew</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            padding: 40px;
            width: 100%;
            max-width: 400px;
        }
        
        .admin-icon {
            font-size: 3rem;
            color: #ffffff;
            margin-bottom: 20px;
        }
        
        .login-header h1 {
            color: #ffffff;
            font-size: 2rem;
            margin-bottom: 10px;
        }
        
        .login-header p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1rem;
        }
        
        .form-label {
            color: #ffffff;
            font-weight: 600;
        }
        
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            color: #ffffff;
            backdrop-filter: blur(5px);
        }
        
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        
        .form-control:focus {
            outline: none;
            border-color: #ffffff;
            background: rgba(255, 255, 255, 0.15);
            color: #ffffff;
            box-shadow: 0 0 0 0.2rem rgba(255, 255, 255, 0.25);
        }
        
        .input-group-text {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            color: #ffffff;
            backdrop-filter: blur(5px);
        }
        
        .btn-primary {
            background: rgba(255, 255, 255, 0.2);
            color: #ffffff;
            border: 2px solid rgba(255, 255, 255, 0.3);
            padding: 14px;
            font-size: 1.1rem;
            font-weight: 600;
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background: rgba(255, 255, 255, 0.3);
            color: #ffffff;
            border-color: rgba(255, 255, 255, 0.5);
            transform: translateY(-2px);
        }
        
        .error-message {
            background: rgba(255, 107, 107, 0.2);
            color: #ffffff;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid rgba(255, 107, 107, 0.3);
            backdrop-filter: blur(5px);
        }
        
        .back-link a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        
        .back-link a:hover {
            color: #ffffff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="login-card text-center">
                    <div class="login-header mb-4">
                        <i class="bi bi-shield-lock admin-icon"></i>
                        <h1>Admin Login</h1>
                        <p>Enter your credentials to access the admin panel</p>
                    </div>
                    
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="error-message">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>
                    
                    <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-person"></i>
                                </span>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <span class="input-group-text">
                                    <i class="bi bi-lock"></i>
                                </span>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn btn-primary w-100 mb-3">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Login
                        </button>
                    </form>
                    
                    <div class="back-link">
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            <i class="bi bi-arrow-left me-1"></i>Back to Home
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 