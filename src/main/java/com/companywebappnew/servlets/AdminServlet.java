package com.companywebappnew.servlets;

import com.companywebappnew.dto.AdminUser;
import com.companywebappnew.service.AdminUserService;
import com.companywebappnew.util.ValidationUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 * Handles admin user management actions.
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private AdminUserService adminUserService = new AdminUserService();

    /**
     * Handles POST requests for admin user actions (add, update, delete).
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            if ("add".equals(action)) {
                if (!ValidationUtil.isValidUsername(username)) {
                    req.setAttribute("error", "Invalid username.");
                    req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
                    return;
                }
                if (!ValidationUtil.isValidPassword(password)) {
                    req.setAttribute("error", "Invalid password.");
                    req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
                    return;
                }
                AdminUser newUser = new AdminUser(0, username, password, "", "");
                // TODO: Hash password before storing (best practice)
                // newUser.setPassword(PasswordUtil.hash(password));
                // For now, store as plain text for demo
                boolean success = adminUserService.addAdminUser(newUser);
                if (success) {
                    req.setAttribute("message", "Admin user added successfully.");
                } else {
                    req.setAttribute("error", "Failed to add admin user.");
                }
                req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
            } else if ("delete".equals(action)) {
                String idStr = req.getParameter("id");
                int id = -1;
                try { id = Integer.parseInt(idStr); } catch (Exception ignore) {}
                if (id <= 0) {
                    req.setAttribute("error", "Invalid admin user ID.");
                    req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
                    return;
                }
                boolean success = adminUserService.deleteAdminUser(id);
                if (success) {
                    req.setAttribute("message", "Admin user deleted successfully.");
                } else {
                    req.setAttribute("error", "Failed to delete admin user.");
                }
                req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
            } else {
                req.setAttribute("error", "Unknown action.");
                req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            System.err.println("AdminServlet error: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
        }
    }

    /**
     * Handles GET requests for admin management page.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin_manage.jsp").forward(req, resp);
    }
} 