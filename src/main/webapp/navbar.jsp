<%
    // Check if admin is logged in
    Boolean adminLoggedIn = (Boolean) session.getAttribute("adminLoggedIn");
    String adminUsername = (String) session.getAttribute("adminUsername");
%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(135deg, #1a2233 0%, #2c3e50 100%);">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">
            <i class="bi bi-building me-2"></i>CompanyWebApp
        </a>
        
        <!-- Mobile Toggle -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- Navigation Items -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">
                        <i class="bi bi-house me-1"></i>Home
                    </a>
                </li>
            </ul>
            
            <!-- Admin Section -->
            <ul class="navbar-nav">
                <% if (adminLoggedIn != null && adminLoggedIn) { %>
                    <!-- Admin is logged in - show admin menu -->
                    <li class="nav-item dropdown">
                        <span class="navbar-text me-3 text-light">
                            <i class="bi bi-person-circle me-1"></i>Welcome, <%= adminUsername %>
                        </span>
                        <a class="nav-link dropdown-toggle btn btn-warning text-dark" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="bi bi-shield-lock me-1"></i>Admin
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="bi bi-speedometer2 me-2"></i>Dashboard
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/project-management">
                                    <i class="bi bi-folder me-2"></i>Projects
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/ClientServlet">
                                    <i class="bi bi-people me-2"></i>Clients
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/viewContacts.jsp">
                                    <i class="bi bi-envelope me-2"></i>View Contacts
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/viewSubscribers.jsp">
                                    <i class="bi bi-newspaper me-2"></i>View Subscribers
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/AdminLoginServlet">
                                    <i class="bi bi-box-arrow-right me-2"></i>Logout
                                </a>
                            </li>
                        </ul>
                    </li>
                <% } else { %>
                    <!-- Admin not logged in - show login button -->
                    <li class="nav-item">
                        <a class="nav-link admin-login-btn-purewhite" href="${pageContext.request.contextPath}/admin/login.jsp">
                            <i class="bi bi-shield-lock me-1"></i>Admin Login
                        </a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
.navbar {
    box-shadow: 0 2px 12px rgba(44, 62, 80, 0.10);
}

.navbar-brand {
    font-size: 1.3rem;
}

.nav-link {
    font-weight: 500;
    transition: color 0.2s;
}

.nav-link:hover {
    color: #ffc107 !important;
}

.dropdown-menu {
    border: none;
    box-shadow: 0 8px 16px rgba(0,0,0,0.2);
    border-radius: 8px;
}

.dropdown-item:hover {
    background-color: #f8f9fa;
    color: #ffc107;
}

.navbar-text {
    font-size: 0.9rem;
}

.admin-login-btn-purewhite {
    color: #fff !important;
    background: transparent !important;
    font-weight: 600;
    border-radius: 8px;
    border: 2px solid #fff !important;
    padding: 8px 20px !important;
    transition: background 0.2s, color 0.2s;
    box-shadow: none !important;
    display: flex;
    align-items: center;
    gap: 8px;
}
.admin-login-btn-purewhite i {
    color: #fff !important;
}
.admin-login-btn-purewhite:hover {
    background: #fff !important;
    color: #1a2233 !important;
}
.admin-login-btn-purewhite:hover i {
    color: #1a2233 !important;
}

@media (max-width: 991.98px) {
    .navbar-nav {
        text-align: center;
        margin-top: 1rem;
    }
    
    .navbar-text {
        display: none;
    }
    
    .dropdown-menu {
        text-align: center;
    }
}
</style> 