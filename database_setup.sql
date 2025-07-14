-- Database setup script for CompanyWebAppNew
-- Run this script in MySQL to create all required tables

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS companywebappnew;
USE companywebappnew;

-- Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS newsletter_subscribers;
DROP TABLE IF EXISTS admin_users;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS projects;

-- Create contacts table
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(30) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create newsletter_subscribers table
CREATE TABLE newsletter_subscribers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create admin_users table
CREATE TABLE admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create clients table (for testimonials/portfolio)
CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    designation VARCHAR(100) NOT NULL,
    image_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create projects table
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    image_path VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default admin user (username: admin, password: admin123)
INSERT INTO admin_users (username, password, email, full_name) 
VALUES ('admin', 'admin123', 'admin@company.com', 'Administrator');

-- Insert sample data for testing
INSERT INTO clients (name, description, designation, image_path) VALUES
('John Doe', 'Excellent service and professional team. Highly recommended!', 'CEO, TechCorp', 'assets/images/client1.jpg'),
('Jane Smith', 'Outstanding work quality and timely delivery.', 'Manager, DesignStudio', 'assets/images/client2.jpg');

INSERT INTO projects (name, description, image_path) VALUES
('E-commerce Website', 'Modern e-commerce platform with payment integration', 'assets/images/project1.jpg'),
('Mobile App Development', 'Cross-platform mobile application for iOS and Android', 'assets/images/project2.jpg');

-- Show table structure for verification
DESCRIBE contacts;
DESCRIBE newsletter_subscribers;
DESCRIBE admin_users;
DESCRIBE clients;
DESCRIBE projects; 