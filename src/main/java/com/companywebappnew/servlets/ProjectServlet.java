package com.companywebappnew.servlets;

import com.companywebappnew.dto.Project;
import com.companywebappnew.service.ProjectService;
import com.companywebappnew.util.ValidationUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * Handles project management operations (add, update, delete, list).
 */
@WebServlet("/admin/project-management")
public class ProjectServlet extends HttpServlet {
    private ProjectService projectService = new ProjectService();

    /**
     * Handles POST requests for project operations.
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        try { 
            if ("add".equals(action)) {
                handleAddProject(req, resp);
            } else if ("update".equals(action)) {
                handleUpdateProject(req, resp);
            } else if ("delete".equals(action)) {
                handleDeleteProject(req, resp);
            } else {
                req.setAttribute("error", "Unknown action.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            System.err.println("ProjectServlet error: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
        }
    }
    
    /**
     * Handles GET requests for project listing and management page.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Project> projects = projectService.getAllProjects();
            req.setAttribute("projects", projects);
            req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
        } catch (Exception e) {
            System.err.println("ProjectServlet error: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
        }
    }

    /**
     * Handles adding a new project.
     */
    private void handleAddProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("ProjectServlet: Processing project addition...");
            
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            String imagePath = req.getParameter("imagePath");
            
            System.out.println("ProjectServlet: Add project - Name: " + name + ", Description length: " + (description != null ? description.length() : 0));

            if (!ValidationUtil.isValidName(name)) {
                System.err.println("ProjectServlet: Validation failed - invalid name: " + name);
                req.setAttribute("error", "Invalid name (2-50 characters required).");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }
            if (description == null || description.trim().isEmpty()) {
                System.err.println("ProjectServlet: Validation failed - description is empty");
                req.setAttribute("error", "Description is required.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }

            Project project = new Project(0, name, description, imagePath);
            try {
                boolean success = projectService.addProject(project);
                if (success) {
                    req.setAttribute("message", "Project added successfully.");
                } else {
                    req.setAttribute("error", "Failed to add project.");
                }
            } catch (Exception e) {
                System.err.println("ProjectServlet: Error adding project: " + e.getMessage());
                req.setAttribute("error", "Failed to add project: " + e.getMessage());
            }
            List<Project> projects = projectService.getAllProjects();
            req.setAttribute("projects", projects);
            req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
        } catch (Exception e) {
            System.err.println("ProjectServlet: Unexpected error in handleAddProject: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
        }
    }

    /**
     * Handles updating an existing project.
     */
    private void handleUpdateProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("ProjectServlet: Processing project update...");
            
            String idStr = req.getParameter("id");
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            String imagePath = req.getParameter("imagePath");
            
            System.out.println("ProjectServlet: Update project - ID: " + idStr + ", Name: " + name);

            int id = -1;
            try { 
                id = Integer.parseInt(idStr); 
            } catch (NumberFormatException e) {
                System.err.println("ProjectServlet: Validation failed - invalid project ID format: " + idStr);
                req.setAttribute("error", "Invalid project ID format. Please provide a valid number.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }
            
            if (id <= 0) {
                System.err.println("ProjectServlet: Validation failed - project ID must be positive: " + id);
                req.setAttribute("error", "Invalid project ID. ID must be a positive number.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }

            if (!ValidationUtil.isValidName(name)) {
                System.err.println("ProjectServlet: Validation failed - invalid name: " + name);
                req.setAttribute("error", "Invalid name (2-50 characters required).");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }
            if (description == null || description.trim().isEmpty()) {
                System.err.println("ProjectServlet: Validation failed - description is empty");
                req.setAttribute("error", "Description is required.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }

            Project project = new Project(id, name, description, imagePath);
            try {
                boolean success = projectService.updateProject(project);
                if (success) {
                    System.out.println("ProjectServlet: Project updated successfully. ID: " + id);
                    req.setAttribute("message", "Project updated successfully.");
                } else {
                    System.err.println("ProjectServlet: Failed to update project. ID: " + id);
                    req.setAttribute("error", "Failed to update project.");
                }
            } catch (Exception e) {
                System.err.println("ProjectServlet: Error updating project: " + e.getMessage());
                req.setAttribute("error", "Failed to update project: " + e.getMessage());
            }
            List<Project> projects = projectService.getAllProjects();
            req.setAttribute("projects", projects);
            req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
        } catch (Exception e) {
            System.err.println("ProjectServlet: Unexpected error in handleUpdateProject: " + e.getMessage());
            req.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
        }
    }

    /**
     * Handles deleting a project.
     */
    private void handleDeleteProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("ProjectServlet: Processing project deletion...");
            
            String idStr = req.getParameter("id");
            System.out.println("ProjectServlet: Delete request for project ID: " + idStr);
            
            if (idStr == null || idStr.trim().isEmpty()) {
                System.err.println("ProjectServlet: Validation failed - project ID is null or empty");
                req.setAttribute("error", "Project ID is required for deletion.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }
            
            int id = -1;
            try { 
                id = Integer.parseInt(idStr.trim()); 
            } catch (NumberFormatException e) {
                System.err.println("ProjectServlet: Validation failed - invalid project ID format: " + idStr);
                req.setAttribute("error", "Invalid project ID format. Please provide a valid number.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }
            
            if (id <= 0) {
                System.err.println("ProjectServlet: Validation failed - project ID must be positive: " + id);
                req.setAttribute("error", "Invalid project ID. ID must be a positive number.");
                req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
                return;
            }

            System.out.println("ProjectServlet: Attempting to delete project with ID: " + id);
            boolean success = projectService.deleteProject(id);
            
            if (success) {
                System.out.println("ProjectServlet: Project deleted successfully. ID: " + id);
                req.setAttribute("message", "Project deleted successfully.");
            } else {
                System.err.println("ProjectServlet: Failed to delete project. ID: " + id);
                req.setAttribute("error", "Failed to delete project. The project may not exist or there was a database error.");
            }
            
            List<Project> projects = projectService.getAllProjects();
            req.setAttribute("projects", projects);
        } catch (Exception e) {
            System.err.println("ProjectServlet: Unexpected error during project deletion: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "An unexpected error occurred during project deletion: " + e.getMessage());
        }
        
        req.getRequestDispatcher("project_manage.jsp").forward(req, resp);
    }
} 