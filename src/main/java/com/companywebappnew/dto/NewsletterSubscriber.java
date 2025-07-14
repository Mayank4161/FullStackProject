package com.companywebappnew.dto;

/**
 * Data Transfer Object for Newsletter subscribers.
 * Represents a newsletter subscription with subscriber's email address.
 */
public class NewsletterSubscriber {
    private int id;
    private String email;

    /**
     * Default constructor.
     */
    public NewsletterSubscriber() {}

    /**
     * Constructor with all fields.
     * @param id The unique identifier
     * @param email The subscriber's email address
     */
    public NewsletterSubscriber(int id, String email) {
        this.id = id;
        this.email = email;
    }

    /**
     * Gets the subscriber ID.
     * @return The unique identifier
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the subscriber ID.
     * @param id The unique identifier
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the subscriber's email address.
     * @return The subscriber's email address
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets the subscriber's email address.
     * @param email The subscriber's email address
     */
    public void setEmail(String email) {
        this.email = email;
    }
} 