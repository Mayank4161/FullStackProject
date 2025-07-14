package com.companywebappnew.servlets;

import com.companywebappnew.dto.Project;
import com.companywebappnew.service.ProjectService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * API Servlet for projects - returns JSON data for frontend consumption.
 */
@WebServlet("/api/ProjectServlet")
public class ProjectAPIServlet extends HttpServlet {
    private ProjectService projectService = new ProjectService();

    /**
     * Handles GET requests to return projects as JSON.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        try {
            List<Project> projects = projectService.getAllProjects();
            
            // Build JSON response
            StringBuilder json = new StringBuilder();
            json.append("[");
            
            for (int i = 0; i < projects.size(); i++) {
                Project project = projects.get(i);
                json.append("{");
                json.append("\"id\":").append(project.getId()).append(",");
                json.append("\"name\":\"").append(escapeJson(project.getName())).append("\",");
                json.append("\"description\":\"").append(escapeJson(project.getDescription())).append("\",");
                json.append("\"image_path\":\"").append(escapeJson(project.getImagePath())).append("\"");
                json.append("}");
                
                if (i < projects.size() - 1) {
                    json.append(",");
                }
            }
            
            json.append("]");
            out.print(json.toString());
            
        } catch (Exception e) {
            System.err.println("ProjectAPIServlet error: " + e.getMessage());
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
        resp.getWriter().write("POST not supported. Use GET to retrieve projects.");
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