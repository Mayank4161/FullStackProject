package com.companywebappnew.service;

import com.companywebappnew.dao.ClientDAO;
import com.companywebappnew.dto.Client;
import java.util.List;

public class ClientService {
    private ClientDAO clientDAO = new ClientDAO();

    public List<Client> getAllClients() throws Exception {
        return clientDAO.getAllClients();
    }

    public boolean addClient(Client client) throws Exception {
        return clientDAO.addClient(client);
    }

    public boolean updateClient(Client client) throws Exception {
        return clientDAO.updateClient(client);
    }

    public boolean deleteClient(int id) throws Exception {
        return clientDAO.deleteClient(id);
    }
    // Add more business logic methods as needed
} 