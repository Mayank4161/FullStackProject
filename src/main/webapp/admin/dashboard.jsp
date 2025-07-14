<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="../navbar.jsp" %>
<html>
<head>
    <title>Admin Dashboard - CompanyWebAppNew</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        
        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 3rem 0;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
            border: none;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
        }
        
        .stat-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        
        .dashboard-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: 2px solid transparent;
            text-decoration: none;
            color: #333;
            height: 100%;
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            border-color: #667eea;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            color: #333;
        }
        
        .card-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            color: #667eea;
        }
        
        .quick-actions {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .action-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: all 0.2s ease;
        }
        
        .action-btn:hover {
            background: linear-gradient(135deg, #5a6ba0 0%, #6a4190 100%);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="dashboard-header">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="display-4 mb-3">
                        <i class="bi bi-speedometer2 me-3"></i>Admin Dashboard
                    </h1>
                    <p class="lead mb-0">Welcome back, <%= session.getAttribute("adminUser") != null ? ((com.companywebappnew.dto.AdminUser)session.getAttribute("adminUser")).getUsername() : "Admin" %>! Manage your website content and monitor activity.</p>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container">
        <!-- Statistics Cards -->
        <div class="row mb-5">
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card stat-card text-center h-100">
                    <div class="card-body">
                        <div class="stat-icon">📁</div>
                        <h3 class="card-title text-primary">12</h3>
                        <p class="card-text text-muted">Total Projects</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card stat-card text-center h-100">
                    <div class="card-body">
                        <div class="stat-icon">👥</div>
                        <h3 class="card-title text-primary">8</h3>
                        <p class="card-text text-muted">Happy Clients</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card stat-card text-center h-100">
                    <div class="card-body">
                        <div class="stat-icon">📬</div>
                        <h3 class="card-title text-primary">25</h3>
                        <p class="card-text text-muted">Contact Messages</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 mb-4">
                <div class="card stat-card text-center h-100">
                    <div class="card-body">
                        <div class="stat-icon">📰</div>
                        <h3 class="card-title text-primary">156</h3>
                        <p class="card-text text-muted">Newsletter Subscribers</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Dashboard Cards -->
        <div class="row mb-5">
            <div class="col-lg-3 col-md-6 mb-4">
                <a href="${pageContext.request.contextPath}/admin/addProject.jsp" class="dashboard-card card text-center h-100">
                    <div class="card-body">
                        <div class="card-icon">📁</div>
                        <h5 class="card-title">Add New Project</h5>
                        <p class="card-text">Create and publish new project showcases to highlight your work</p>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <a href="ClientServlet" class="dashboard-card card text-center h-100">
                    <div class="card-body">
                        <div class="card-icon">👤</div>
                        <h5 class="card-title">Manage Clients</h5>
                        <p class="card-text">Add and manage client testimonials and information</p>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <a href="${pageContext.request.contextPath}/admin/viewContacts.jsp" class="dashboard-card card text-center h-100">
                    <div class="card-body">
                        <div class="card-icon">📬</div>
                        <h5 class="card-title">View Contact Messages</h5>
                        <p class="card-text">Review and respond to customer inquiries and feedback</p>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <a href="${pageContext.request.contextPath}/admin/viewSubscribers.jsp" class="dashboard-card card text-center h-100">
                    <div class="card-body">
                        <div class="card-icon">📰</div>
                        <h5 class="card-title">View Subscribers</h5>
                        <p class="card-text">Manage your newsletter subscriber list and engagement</p>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <a href="project-management" class="dashboard-card card text-center h-100">
                    <div class="card-body">
                        <div class="card-icon">📁</div>
                        <h5 class="card-title">Manage Projects</h5>
                        <p class="card-text">Add and manage project showcases and portfolio</p>
                    </div>
                </a>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="quick-actions p-4">
            <h3 class="text-center mb-4">
                <i class="bi bi-lightning me-2"></i>Quick Actions
            </h3>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="row g-3">
                        <div class="col-md-3 col-sm-6">
                            <a href="project-management" class="btn action-btn text-white w-100">
                                <i class="bi bi-plus-circle me-2"></i>Manage Projects
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <a href="ClientServlet" class="btn action-btn text-white w-100">
                                <i class="bi bi-person-plus me-2"></i>Manage Clients
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <a href="${pageContext.request.contextPath}/admin/viewContacts.jsp" class="btn action-btn text-white w-100">
                                <i class="bi bi-envelope me-2"></i>View Messages
                            </a>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <a href="../index.jsp" class="btn action-btn text-white w-100">
                                <i class="bi bi-eye me-2"></i>View Website
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 