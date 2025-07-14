package com.companywebappnew.dto;

/**
 * Data Transfer Object for Contact form submissions.
 * Represents a contact message from a visitor with their details.
 */
public class Contact {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String city;
    private String message;

    /**
     * Default constructor.
     */
    public Contact() {}

    /**
     * Constructor with all fields.
     * @param id The unique identifier
     * @param name The contact person's name
     * @param email The contact person's email
     * @param phone The contact person's phone number
     * @param city The contact person's city
     * @param message The contact message
     */
    public Contact(int id, String name, String email, String phone, String city, String message) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.city = city;
        this.message = message;
    }

    /**
     * Gets the contact ID.
     * @return The unique identifier
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the contact ID.
     * @param id The unique identifier
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the contact person's name.
     * @return The contact person's name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the contact person's name.
     * @param name The contact person's name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the contact person's email.
     * @return The contact person's email
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the contact person's email.
     * @param email The contact person's email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets the contact person's phone number.
     * @return The contact person's phone number
     */
    public String getPhone() {
        return phone;
    }

    /**
     * Sets the contact person's phone number.
     * @param phone The contact person's phone number
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * Gets the contact person's city.
     * @return The contact person's city
     */
    public String getCity() {
        return city;
    }

    /**
     * Sets the contact person's city.
     * @param city The contact person's city
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * Gets the contact message.
     * @return The contact message
     */
    public String getMessage() {
        return message;
    }

    /**
     * Sets the contact message.
     * @param message The contact message
     */
    public void setMessage(String message) {
        this.message = message;
    }
} 