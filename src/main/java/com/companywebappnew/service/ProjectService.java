package com.companywebappnew.service;

import com.companywebappnew.dao.ProjectDAO;
import com.companywebappnew.dto.Project;
import java.util.List;

public class ProjectService {
    private ProjectDAO projectDAO = new ProjectDAO();

    public List<Project> getAllProjects() throws Exception {
        return projectDAO.getAllProjects();
    }

    public boolean addProject(Project project) throws Exception {
        return projectDAO.addProject(project);
    }

    public boolean updateProject(Project project) throws Exception {
        return projectDAO.updateProject(project);
    }

    public boolean deleteProject(int id) throws Exception {
        return projectDAO.deleteProject(id);
    }
    // Add more business logic methods as needed
} 