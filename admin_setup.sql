-- Admin Users Table Setup
-- Run this script in your MySQL database to create the admin authentication system

-- Create admin_users table
CREATE TABLE IF NOT EXISTS admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    full_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Insert default admin user
-- Username: admin
-- Password: admin123
-- In production, use proper password hashing (BCrypt, PBKDF2, etc.)
INSERT INTO admin_users (username, password, email, full_name) 
VALUES ('admin', 'admin123', 'admin@companywebapp.com', 'Administrator')
ON DUPLICATE KEY UPDATE username = username;

-- Optional: Create additional admin users
-- INSERT INTO admin_users (username, password, email, full_name) 
-- VALUES ('manager', 'manager123', 'manager@companywebapp.com', 'Manager User');

-- Create indexes for better performance
CREATE INDEX idx_admin_username ON admin_users(username);
CREATE INDEX idx_admin_active ON admin_users(is_active);

-- Show the created table structure
DESCRIBE admin_users;

-- Show the admin users (for verification)
SELECT id, username, email, full_name, created_at, is_active FROM admin_users; 