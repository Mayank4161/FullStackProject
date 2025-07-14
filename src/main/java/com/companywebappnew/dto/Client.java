package com.companywebappnew.dto;

/**
 * Data Transfer Object for Client testimonials/portfolio entries.
 * Represents a client testimonial with name, description, designation, and image.
 */
public class Client {
    private int id;
    private String name;
    private String description;
    private String designation;
    private String imagePath;

    /**
     * Default constructor.
     */
    public Client() {}

    /**
     * Constructor with all fields.
     * @param id The unique identifier
     * @param name The client's name
     * @param description The testimonial description
     * @param designation The client's designation/role
     * @param imagePath Path to the client's image
     */
    public Client(int id, String name, String description, String designation, String imagePath) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.designation = designation;
        this.imagePath = imagePath;
    }

    /**
     * Gets the client ID.
     * @return The unique identifier
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the client ID.
     * @param id The unique identifier
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the client name.
     * @return The client's name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the client name.
     * @param name The client's name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the testimonial description.
     * @return The description text
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the testimonial description.
     * @param description The description text
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Gets the client designation.
     * @return The client's designation/role
     */
    public String getDesignation() {
        return designation;
    }

    /**
     * Sets the client designation.
     * @param designation The client's designation/role
     */
    public void setDesignation(String designation) {
        this.designation = designation;
    }

    /**
     * Gets the image path.
     * @return Path to the client's image
     */
    public String getImagePath() {
        return imagePath;
    }

    /**
     * Sets the image path.
     * @param imagePath Path to the client's image
     */
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
} 