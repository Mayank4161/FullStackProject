package com.companywebappnew.service;

import com.companywebappnew.dao.NewsletterDAO;
import com.companywebappnew.dto.NewsletterSubscriber;

public class NewsletterService {
    private NewsletterDAO newsletterDAO = new NewsletterDAO();
    public boolean addSubscriber(NewsletterSubscriber sub) throws Exception {
        return newsletterDAO.addSubscriber(sub);
    }
    public boolean existsByEmail(String email) throws Exception {
        return newsletterDAO.existsByEmail(email);
    }
} 