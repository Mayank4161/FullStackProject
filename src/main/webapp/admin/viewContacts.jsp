<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="../navbar.jsp" %>
<html>
<head>
    <title>View Contacts</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .contacts-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="contacts-card p-4">
                    <h2 class="mb-4">
                        <i class="bi bi-envelope me-2"></i>Contact Messages
                    </h2>
                    
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>City</th>
                                    <th>Message</th>
                                    <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                try {
                                    java.sql.Connection conn = com.companywebappnew.util.DBConnection.getConnection();
                                    java.sql.Statement stmt = conn.createStatement();
                                    java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM contacts ORDER BY id DESC");
                                    
                                    while(rs.next()) {
                                %>
                                    <tr>
                                        <td><%= rs.getInt("id") %></td>
                                        <td><%= rs.getString("name") %></td>
                                        <td><%= rs.getString("email") %></td>
                                        <td><%= rs.getString("phone") %></td>
                                        <td><%= rs.getString("city") %></td>
                                        <td><%= rs.getString("message") != null ? (rs.getString("message").length() > 50 ? rs.getString("message").substring(0, 50) + "..." : rs.getString("message")) : "" %></td>
                                        <td><%= rs.getTimestamp("created_at") != null ? rs.getTimestamp("created_at").toString() : "" %></td>
                                    </tr>
                                <%
                                    }
                                    rs.close();
                                    stmt.close();
                                    conn.close();
                                } catch(Exception e) {
                                    out.println("<tr><td colspan='7' class='text-center text-danger'>Error loading contacts: " + e.getMessage() + "</td></tr>");
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 