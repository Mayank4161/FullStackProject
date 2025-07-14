package com.companywebappnew.servlets;

import com.companywebappnew.dto.Contact;
import com.companywebappnew.service.ContactService;
import com.companywebappnew.util.ValidationUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet; // यही mapping जरूरी है!
import java.io.*;

/**
 * Handles contact form submissions.
 */
@WebServlet("/ContactServlet") // यही mapping जरूरी है!
public class ContactServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private ContactService contactService = new ContactService();
	
	public  ContactServlet() {
		System.out.println("Object created ContactServlet");
	}

	/**
	 * Handles POST requests for contact form submissions.
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		try {
			System.out.println("ContactServlet: Processing contact form submission...");
			
			// Get form parameters
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String city = request.getParameter("city");
			String message = request.getParameter("message");
			
			System.out.println("ContactServlet: Form data - Name: " + name + ", Email: " + email);
			
			// Validate input
			if (name == null || name.trim().isEmpty() || 
				email == null || email.trim().isEmpty() || 
				phone == null || phone.trim().isEmpty() ||
				city == null || city.trim().isEmpty() ||
				message == null || message.trim().isEmpty()) {
				System.err.println("ContactServlet: Validation failed - missing required fields");
				request.setAttribute("error", "Please fill in all required fields.");
				request.getRequestDispatcher("/contact.jsp").forward(request, response);
				return;
			}
			
			name = name.trim();
			email = email.trim().toLowerCase();
			phone = phone.trim();
			city = city.trim();
			message = message.trim();
			
			if (!ValidationUtil.isValidEmail(email)) {
				System.err.println("ContactServlet: Validation failed - invalid email");
				request.setAttribute("error", "Please enter a valid email address.");
				request.getRequestDispatcher("/contact.jsp").forward(request, response);
				return;
			}
			
			if (!ValidationUtil.isValidMobile(phone)) {
				System.err.println("ContactServlet: Validation failed - invalid mobile number");
				request.setAttribute("error", "Please enter a valid 10-digit mobile number.");
				request.getRequestDispatcher("/contact.jsp").forward(request, response);
				return;
			}
			
			if (!ValidationUtil.isValidName(name)) {
				System.err.println("ContactServlet: Validation failed - invalid name");
				request.setAttribute("error", "Name must be between 2 and 50 characters.");
				request.getRequestDispatcher("/contact.jsp").forward(request, response);
				return;
			}
			
			if (!ValidationUtil.isValidCity(city)) {
				System.err.println("ContactServlet: Validation failed - invalid city");
				request.setAttribute("error", "City must be between 2 and 30 characters.");
				request.getRequestDispatcher("/contact.jsp").forward(request, response);
				return;
			}
			
			// Create Contact object
			Contact contact = new Contact(0, name, email, phone, city, message);
			
			System.out.println("ContactServlet: Contact object created successfully");
			
			// Save to database
			boolean success = contactService.addContact(contact);
			
			if (success) {
				System.out.println("ContactServlet: Contact saved successfully");
				request.setAttribute("success", "Thank you for your message! We'll get back to you soon.");
			} else {
				System.err.println("ContactServlet: Failed to save contact");
				request.setAttribute("error", "Sorry, there was an error saving your message. Please try again.");
			}
			
		} catch (Exception e) {
			System.err.println("ContactServlet: Unexpected error: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
		}
		
		request.getRequestDispatcher("/contact.jsp").forward(request, response);
	}
	
	/**
	 * Handles GET requests (not supported for contact form).
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/contact.jsp").forward(req, resp);
	}
}