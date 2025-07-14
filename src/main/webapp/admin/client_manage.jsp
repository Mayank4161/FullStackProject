<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="../navbar.jsp" %>
<html>
<head>
    <title>Client Management - CompanyWebAppNew</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .management-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }
        .btn-action {
            margin: 0 0.25rem;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="management-card p-4">
                    <h2 class="mb-4">
                        <i class="bi bi-people me-2"></i>Client Management
                    </h2>
                    
                    <%-- DEBUG OUTPUT --%>
                    <%
                        Object debugClients = request.getAttribute("clients");
                        out.println("<div style='color: red; font-weight: bold;'>DEBUG: clients attribute type: " + (debugClients == null ? "null" : debugClients.getClass().getName()) + ", size: " + (debugClients == null ? 0 : ((java.util.List)debugClients).size()) + "</div>");
                        if (request.getAttribute("error") != null) {
                            out.println("<div style='color: orange; font-weight: bold;'>DEBUG ERROR: " + request.getAttribute("error") + "</div>");
                        }
                    %>
                    
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>
                    
                    <% if (request.getAttribute("message") != null) { %>
                        <div class="alert alert-success">
                            <i class="bi bi-check-circle-fill me-2"></i>
                            <%= request.getAttribute("message") %>
                        </div>
                    <% } %>
                    
                    <!-- Add New Client Form -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="bi bi-plus-circle me-2"></i>Add New Client
                            </h5>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/ClientServlet" method="post">
                                <input type="hidden" name="action" value="add">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="name" class="form-label">Name *</label>
                                        <input type="text" class="form-control" id="name" name="name" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="designation" class="form-label">Designation *</label>
                                        <input type="text" class="form-control" id="designation" name="designation" required>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description *</label>
                                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="imagePath" class="form-label">Image Path</label>
                                    <input type="text" class="form-control" id="imagePath" name="imagePath" placeholder="assets/images/client.jpg">
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-plus-circle me-2"></i>Add Client
                                </button>
                            </form>
                        </div>
                    </div>
                    
                    <!-- Clients List -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="mb-0">
                                <i class="bi bi-list me-2"></i>Existing Clients
                            </h5>
                        </div>
                        <div class="card-body">
                            <% if (request.getAttribute("clients") != null && ((java.util.List)request.getAttribute("clients")).size() > 0) { %>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Designation</th>
                                                <th>Description</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Object obj : (java.util.List)request.getAttribute("clients")) { 
                                                com.companywebappnew.dto.Client client = (com.companywebappnew.dto.Client)obj;
                                            %>
                                                <tr>
                                                    <td><%= client.getId() %></td>
                                                    <td><%= client.getName() %></td>
                                                    <td><%= client.getDesignation() %></td>
                                                    <td><%= client.getDescription().length() > 50 ? client.getDescription().substring(0, 50) + "..." : client.getDescription() %></td>
                                                    <td>
                                                        <button class="btn btn-sm btn-warning btn-action" onclick="editClient(<%= client.getId() %>)">
                                                            <i class="bi bi-pencil"></i>
                                                        </button>
                                                        <form action="${pageContext.request.contextPath}/ClientServlet" method="post" style="display: inline;">
                                                            <input type="hidden" name="action" value="delete">
                                                            <input type="hidden" name="id" value="<%= client.getId() %>">
                                                            <button type="submit" class="btn btn-sm btn-danger btn-action" onclick="return confirm('Are you sure?')">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            <% } else { %>
                                <p class="text-muted text-center">No clients found.</p>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function editClient(id) {
            // TODO: Implement edit functionality
            alert('Edit functionality will be implemented soon for client ID: ' + id);
        }
    </script>
</body>
</html> 