package com.companywebappnew.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {
    private static String url;
    private static String username;
    private static String password;
    
    static {
        try {
            System.out.println("DBConnection: Initializing database connection...");
            
            // Load properties
            Properties props = new Properties();
            InputStream in = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");
            
            if (in == null) {
                System.err.println("DBConnection: ERROR - db.properties file not found!");
                throw new RuntimeException("db.properties file not found in classpath");
            }
            
            props.load(in);
            url = props.getProperty("db.url");
            username = props.getProperty("db.username");
            password = props.getProperty("db.password");
            
            System.out.println("DBConnection: Properties loaded - URL: " + url);
            System.out.println("DBConnection: Username: " + username);
            
            // Load MySQL driver
            System.out.println("DBConnection: Loading MySQL driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("DBConnection: MySQL driver loaded successfully");
            
        } catch (Exception e) {
            System.err.println("DBConnection: ERROR during initialization: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize database connection", e);
        }
    }
    
    public static Connection getConnection() throws SQLException {
        try {
            System.out.println("DBConnection: Attempting to connect to database...");
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println("DBConnection: Database connection successful");
            return conn;
        } catch (SQLException e) {
            System.err.println("DBConnection: ERROR connecting to database: " + e.getMessage());
            System.err.println("DBConnection: SQL State: " + e.getSQLState());
            System.err.println("DBConnection: Error Code: " + e.getErrorCode());
            throw e;
        }
    }
} 