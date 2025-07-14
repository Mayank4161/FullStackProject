package com.companywebappnew.servlets;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AdminAuthFilter: Initialized");
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        String requestURI = httpRequest.getRequestURI();
        System.out.println("AdminAuthFilter: Processing request: " + requestURI);
        
        // Allow access to login page and AdminLoginServlet without authentication
        if (requestURI.endsWith("/admin/login.jsp") || requestURI.endsWith("/admin/login")) {
            System.out.println("AdminAuthFilter: Allowing access to login page");
            chain.doFilter(request, response);
            return;
        }
        
        // Check if admin is logged in
        Object adminUser = session != null ? session.getAttribute("adminUser") : null;
        
        if (adminUser == null) {
            System.out.println("AdminAuthFilter: User not authenticated, redirecting to login");
            // Redirect to login page if not authenticated
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin/login.jsp");
            return;
        }
        
        System.out.println("AdminAuthFilter: User authenticated, allowing access");
        // Continue with the request if authenticated
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        System.out.println("AdminAuthFilter: Destroyed");
    }
} 