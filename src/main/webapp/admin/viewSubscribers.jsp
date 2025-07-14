<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp" %>
<%@ page import="java.sql.*,com.companywebappnew.util.DBConnection" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Subscribers</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        /* Reduce top margin for this page only */
        section.admin-table-section, section {
            margin-top: 10px !important;
        }
    </style>
</head>
<body>
<section class="admin-table-section">
    <h2>Newsletter Subscribers</h2>
    <div class="table-container">
        <table class="admin-table">
            <thead>
                <tr><th>Email</th></tr>
            </thead>
            <tbody>
<%
    try (Connection con = DBConnection.getConnection()) {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM newsletter_subscribers");
        while (rs.next()) {
%>
                <tr>
                    <td><%= rs.getString("email") %></td>
                </tr>
<%
        }
        rs.close();
        st.close();
    } catch (Exception e) { 
        out.print("<tr><td colspan='1' class='error'>Error: " + e.getMessage() + "</td></tr>"); 
        System.err.println("Error in viewSubscribers.jsp: " + e.getMessage());
        e.printStackTrace();
    }
%>
            </tbody>
        </table>
    </div>
</section>
</body>
</html> 