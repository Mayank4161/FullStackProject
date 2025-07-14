package com.companywebappnew.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Utility class to test database connection and verify tables exist.
 */
public class DatabaseTest {
    
    public static void main(String[] args) {
        testDatabaseConnection();
    }
    
    public static void testDatabaseConnection() {
        try {
            System.out.println("Testing database connection...");
            
            // Test 1: Load MySQL driver
            System.out.println("1. Loading MySQL driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("   ✅ MySQL driver loaded successfully");
            
            // Test 2: Connect to database
            System.out.println("2. Connecting to database...");
            Connection conn = DBConnection.getConnection();
            if (conn != null && !conn.isClosed()) {
                System.out.println("   ✅ Database connection successful");
                
                // Test 3: Check if tables exist
                System.out.println("3. Checking database tables...");
                Statement stmt = conn.createStatement();
                
                // Check contacts table
                try {
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM contacts");
                    if (rs.next()) {
                        System.out.println("   ✅ contacts table exists with " + rs.getInt(1) + " records");
                    }
                } catch (Exception e) {
                    System.out.println("   ❌ contacts table error: " + e.getMessage());
                }
                
                // Check newsletter_subscribers table
                try {
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM newsletter_subscribers");
                    if (rs.next()) {
                        System.out.println("   ✅ newsletter_subscribers table exists with " + rs.getInt(1) + " records");
                    }
                } catch (Exception e) {
                    System.out.println("   ❌ newsletter_subscribers table error: " + e.getMessage());
                }
                
                // Check admin_users table
                try {
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM admin_users");
                    if (rs.next()) {
                        System.out.println("   ✅ admin_users table exists with " + rs.getInt(1) + " records");
                    }
                } catch (Exception e) {
                    System.out.println("   ❌ admin_users table error: " + e.getMessage());
                }
                
                // Check clients table
                try {
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM clients");
                    if (rs.next()) {
                        System.out.println("   ✅ clients table exists with " + rs.getInt(1) + " records");
                    }
                } catch (Exception e) {
                    System.out.println("   ❌ clients table error: " + e.getMessage());
                }
                
                // Check projects table
                try {
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM projects");
                    if (rs.next()) {
                        System.out.println("   ✅ projects table exists with " + rs.getInt(1) + " records");
                    }
                } catch (Exception e) {
                    System.out.println("   ❌ projects table error: " + e.getMessage());
                }
                
                stmt.close();
                conn.close();
                System.out.println("   ✅ Database connection closed");
                
            } else {
                System.out.println("   ❌ Database connection failed");
            }
            
        } catch (Exception e) {
            System.err.println("❌ Database test failed: " + e.getMessage());
            e.printStackTrace();
        }
    }
} 