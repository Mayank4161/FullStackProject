package com.companywebappnew.servlets;

import com.companywebappnew.dto.Client;
import com.companywebappnew.service.ClientService;
import com.companywebappnew.util.ValidationUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Handles client management operations (add, update, delete, list).
 */
@WebServlet("/admin/ClientServlet")
public class ClientServlet extends HttpServlet {
    private ClientService clientService = new ClientService();

    /**
     * Handles POST requests for client operations.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        try {
            if ("add".equals(action)) {
                handleAddClient(req, resp);
            } else if ("update".equals(action)) {
                handleUpdateClient(req, resp);
            } else if ("delete".equals(action)) {
                handleDeleteClient(req, resp);
            } else {
                req.setAttribute("error", "Unknown action.");
                req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            System.err.println("ClientServlet error: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
        }
    }

    /**
     * Handles GET requests for client listing and management page.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Client> clients = clientService.getAllClients();
            req.setAttribute("clients", clients);
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
        } catch (Exception e) {
            System.err.println("ClientServlet error: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
        }
    }

    /**
     * Handles adding a new client.
     */
    private void handleAddClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String designation = req.getParameter("designation");
        String imagePath = req.getParameter("imagePath");

        if (!ValidationUtil.isValidName(name)) {
            req.setAttribute("error", "Invalid name (2-50 characters required).");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }
        if (description == null || description.trim().isEmpty()) {
            req.setAttribute("error", "Description is required.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }
        if (designation == null || designation.trim().isEmpty()) {
            req.setAttribute("error", "Designation is required.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }

        Client client = new Client(0, name, description, designation, imagePath);
        try {
            boolean success = clientService.addClient(client);
            if (success) {
                req.setAttribute("message", "Client added successfully.");
            } else {
                req.setAttribute("error", "Failed to add client.");
            }
        } catch (Exception e) {
            System.err.println("ClientServlet: Error adding client: " + e.getMessage());
            req.setAttribute("error", "Failed to add client: " + e.getMessage());
        }
        req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
    }

    /**
     * Handles updating an existing client.
     */
    private void handleUpdateClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String designation = req.getParameter("designation");
        String imagePath = req.getParameter("imagePath");

        int id = -1;
        try { id = Integer.parseInt(idStr); } catch (Exception ignore) {}
        if (id <= 0) {
            req.setAttribute("error", "Invalid client ID.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }

        if (!ValidationUtil.isValidName(name)) {
            req.setAttribute("error", "Invalid name (2-50 characters required).");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }
        if (description == null || description.trim().isEmpty()) {
            req.setAttribute("error", "Description is required.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }
        if (designation == null || designation.trim().isEmpty()) {
            req.setAttribute("error", "Designation is required.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }

        Client client = new Client(id, name, description, designation, imagePath);
        try {
            boolean success = clientService.updateClient(client);
            if (success) {
                req.setAttribute("message", "Client updated successfully.");
            } else {
                req.setAttribute("error", "Failed to update client.");
            }
        } catch (Exception e) {
            System.err.println("ClientServlet: Error updating client: " + e.getMessage());
            req.setAttribute("error", "Failed to update client: " + e.getMessage());
        }
        req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
    }

    /**
     * Handles deleting a client.
     */
    private void handleDeleteClient(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        int id = -1;
        try { id = Integer.parseInt(idStr); } catch (Exception ignore) {}
        if (id <= 0) {
            req.setAttribute("error", "Invalid client ID.");
            req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
            return;
        }
        try {
            boolean success = clientService.deleteClient(id);
            if (success) {
                req.setAttribute("message", "Client deleted successfully.");
            } else {
                req.setAttribute("error", "Failed to delete client.");
            }
        } catch (Exception e) {
            System.err.println("ClientServlet: Error deleting client: " + e.getMessage());
            req.setAttribute("error", "Failed to delete client: " + e.getMessage());
        }
        req.getRequestDispatcher("client_manage.jsp").forward(req, resp);
    }
} 
 