package com.companywebappnew.dto;

/**
 * Data Transfer Object for Admin User accounts.
 * Represents an administrator user with authentication credentials and profile information.
 */
public class AdminUser {
    private int id;
    private String username;
    private String password;
    private String email;
    private String fullName;

    /**
     * Default constructor.
     */
    public AdminUser() {}

    /**
     * Constructor with all fields.
     * @param id The unique identifier
     * @param username The admin username
     * @param password The admin password (should be hashed in production)
     * @param email The admin email address
     * @param fullName The admin's full name
     */
    public AdminUser(int id, String username, String password, String email, String fullName) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
    }

    /**
     * Gets the admin user ID.
     * @return The unique identifier
     */
    public int getId() { return id; }

    /**
     * Sets the admin user ID.
     * @param id The unique identifier
     */
    public void setId(int id) { this.id = id; }

    /**
     * Gets the admin username.
     * @return The admin username
     */
    public String getUsername() { return username; }

    /**
     * Sets the admin username.
     * @param username The admin username
     */
    public void setUsername(String username) { this.username = username; }

    /**
     * Gets the admin password.
     * @return The admin password (should be hashed in production)
     */
    public String getPassword() { return password; }

    /**
     * Sets the admin password.
     * @param password The admin password (should be hashed in production)
     */
    public void setPassword(String password) { this.password = password; }

    /**
     * Gets the admin email.
     * @return The admin email address
     */
    public String getEmail() { return email; }

    /**
     * Sets the admin email.
     * @param email The admin email address
     */
    public void setEmail(String email) { this.email = email; }

    /**
     * Gets the admin full name.
     * @return The admin's full name
     */
    public String getFullName() { return fullName; }

    /**
     * Sets the admin full name.
     * @param fullName The admin's full name
     */
    public void setFullName(String fullName) { this.fullName = fullName; }
} 