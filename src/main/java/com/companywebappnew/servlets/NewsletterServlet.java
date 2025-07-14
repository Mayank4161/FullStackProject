package com.companywebappnew.servlets;

import com.companywebappnew.dto.NewsletterSubscriber;
import com.companywebappnew.service.NewsletterService;
import com.companywebappnew.util.ValidationUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

/**
 * Handles newsletter subscription requests.
 */
@WebServlet("/NewsletterServlet")
public class NewsletterServlet extends HttpServlet {
    private NewsletterService newsletterService = new NewsletterService();

    /**
     * Handles POST requests for newsletter subscription.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        try {
            System.out.println("NewsletterServlet: Processing newsletter subscription...");
            
            String email = req.getParameter("email");
            System.out.println("NewsletterServlet: Email received: " + email);
            
            if (email == null || email.trim().isEmpty()) {
                System.err.println("NewsletterServlet: Validation failed - email is empty");
                out.write("Error: Email address is required");
                return;
            }
            
            email = email.trim().toLowerCase();
            
            if (!ValidationUtil.isValidEmail(email)) {
                System.err.println("NewsletterServlet: Validation failed - invalid email format");
                out.write("Error: Please enter a valid email address");
                return;
            }
            
            if (!ValidationUtil.isValidEmailLength(email)) {
                System.err.println("NewsletterServlet: Validation failed - email too long");
                out.write("Error: Email address is too long");
                return;
            }
            
            if (newsletterService.existsByEmail(email)) {
                System.out.println("NewsletterServlet: Email already subscribed: " + email);
                out.write("This email is already subscribed to our newsletter!");
                return;
            }
            
            NewsletterSubscriber sub = new NewsletterSubscriber(0, email);
            System.out.println("NewsletterServlet: Creating subscriber object");
            
            boolean success = newsletterService.addSubscriber(sub);
            if (success) {
                System.out.println("NewsletterServlet: Subscription successful for: " + email);
                out.write("Thank you! You have been successfully subscribed to our newsletter.");
            } else {
                System.err.println("NewsletterServlet: Failed to add subscriber");
                out.write("Error: Could not subscribe to newsletter. Please try again later.");
            }
            
        } catch (Exception e) {
            System.err.println("NewsletterServlet: Unexpected error: " + e.getMessage());
            e.printStackTrace();
            out.write("Error: An unexpected error occurred: " + e.getMessage());
        }
    }

    /**
     * Handles GET requests (not supported for newsletter subscription).
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("GET not supported. Please use the newsletter form to subscribe via POST.");
    }
}
