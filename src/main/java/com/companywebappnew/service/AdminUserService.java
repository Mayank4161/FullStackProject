package com.companywebappnew.service;

import com.companywebappnew.dao.AdminUserDAO;
import com.companywebappnew.dto.AdminUser;

public class AdminUserService {
    private AdminUserDAO adminUserDAO = new AdminUserDAO();
    public AdminUser authenticate(String username, String password) throws Exception {
        return adminUserDAO.findByUsernameAndPassword(username, password);
    }

    public boolean addAdminUser(AdminUser user) throws Exception {
        return adminUserDAO.addAdminUser(user);
    }

    public boolean deleteAdminUser(int id) throws Exception {
        return adminUserDAO.deleteAdminUser(id);
    }
} 