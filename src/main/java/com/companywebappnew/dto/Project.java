package com.companywebappnew.dto;

/**
 * Data Transfer Object for Project portfolio entries.
 * Represents a project with name, description, and image.
 */
public class Project {
    private int id;
    private String name;
    private String description;
    private String imagePath;

    /**
     * Default constructor.
     */
    public Project() {}

    /**
     * Constructor with all fields.
     * @param id The unique identifier
     * @param name The project name
     * @param description The project description
     * @param imagePath Path to the project image
     */
    public Project(int id, String name, String description, String imagePath) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.imagePath = imagePath;
    }

    /**
     * Gets the project ID.
     * @return The unique identifier
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the project ID.
     * @param id The unique identifier
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the project name.
     * @return The project name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the project name.
     * @param name The project name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the project description.
     * @return The project description
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the project description.
     * @param description The project description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Gets the image path.
     * @return Path to the project image
     */
    public String getImagePath() {
        return imagePath;
    }

    /**
     * Sets the image path.
     * @param imagePath Path to the project image
     */
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
} 