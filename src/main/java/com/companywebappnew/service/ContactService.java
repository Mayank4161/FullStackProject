package com.companywebappnew.service;

import com.companywebappnew.dao.ContactDAO;
import com.companywebappnew.dto.Contact;

public class ContactService {
    private ContactDAO contactDAO = new ContactDAO();
    public boolean addContact(Contact contact) throws Exception {
        return contactDAO.addContact(contact);
    }
} 