package com.companywebappnew.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.companywebappnew.dto.AdminUser;
import com.companywebappnew.service.AdminUserService;
import com.companywebappnew.util.ValidationUtil;

/**
 * Handles admin login requests and session management.
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminUserService adminUserService = new AdminUserService();
    
    /**
     * Handles POST requests for admin login.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        try {
            if (!ValidationUtil.isValidUsername(username)) {
                req.setAttribute("error", "Invalid username.");
                req.getRequestDispatcher("admin/login.jsp").forward(req, resp);
                return;
            }
            if (!ValidationUtil.isValidPassword(password)) {
                req.setAttribute("error", "Invalid password.");
                req.getRequestDispatcher("admin/login.jsp").forward(req, resp);
                return;
            }
            AdminUser admin = adminUserService.authenticate(username, password);
            if (admin != null) {
                HttpSession session = req.getSession();
                session.setAttribute("adminUser", admin);
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            } else {
                req.setAttribute("error", "Invalid username or password.");
                req.getRequestDispatcher("admin/login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            System.err.println("AdminLoginServlet error: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("admin/login.jsp").forward(req, resp);
        }
    }
    
    /**
     * Handles GET requests for admin login page.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin/login.jsp").forward(req, resp);
    }
} 