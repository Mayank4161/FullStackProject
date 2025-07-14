package com.companywebappnew.servlets;

import com.companywebappnew.dto.Client;
import com.companywebappnew.service.ClientService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * API Servlet for clients - returns JSON data for frontend consumption.
 */
@WebServlet("/api/ClientServlet")
public class ClientAPIServlet extends HttpServlet {
    private ClientService clientService = new ClientService();

    /**
     * Handles GET requests to return clients as JSON.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        try {
            List<Client> clients = clientService.getAllClients();
            
            // Build JSON response
            StringBuilder json = new StringBuilder();
            json.append("[");
            
            for (int i = 0; i < clients.size(); i++) {
                Client client = clients.get(i);
                json.append("{");
                json.append("\"id\":").append(client.getId()).append(",");
                json.append("\"name\":\"").append(escapeJson(client.getName())).append("\",");
                json.append("\"description\":\"").append(escapeJson(client.getDescription())).append("\",");
                json.append("\"designation\":\"").append(escapeJson(client.getDesignation())).append("\",");
                json.append("\"image_path\":\"").append(escapeJson(client.getImagePath())).append("\"");
                json.append("}");
                
                if (i < clients.size() - 1) {
                    json.append(",");
                }
            }
            
            json.append("]");
            out.print(json.toString());
            
        } catch (Exception e) {
            System.err.println("ClientAPIServlet error: " + e.getMessage());
            e.printStackTrace();
            out.print("[]");
        }
    }

    /**
     * Handles POST requests (not supported for API).
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("POST not supported. Use GET to retrieve clients.");
    }

    /**
     * Escapes special characters in JSON strings.
     */
    private String escapeJson(String input) {
        if (input == null) return "";
        return input.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\n", "\\n")
                   .replace("\r", "\\r")
                   .replace("\t", "\\t");
    }
} 