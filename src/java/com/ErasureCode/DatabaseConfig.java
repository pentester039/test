package com.ErasureCode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database configuration utility for Railway deployment
 * Uses environment variables for database connection
 */
public class DatabaseConfig {
    
    // Database connection parameters from environment variables
    private static final String DB_HOST = System.getenv("DB_HOST") != null ? 
        System.getenv("DB_HOST") : "localhost";
    private static final String DB_PORT = System.getenv("DB_PORT") != null ? 
        System.getenv("DB_PORT") : "3306";
    private static final String DB_NAME = System.getenv("DB_NAME") != null ? 
        System.getenv("DB_NAME") : "erasurecode";
    private static final String DB_USER = System.getenv("DB_USER") != null ? 
        System.getenv("DB_USER") : "root";
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD") != null ? 
        System.getenv("DB_PASSWORD") : "password";
    
    // JDBC URL
    private static final String JDBC_URL = String.format(
        "jdbc:mysql://%s:%s/%s?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
        DB_HOST, DB_PORT, DB_NAME
    );
    
    /**
     * Get database connection using environment variables
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            // Use newer MySQL driver for Java 11+
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // Fallback to older driver
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                throw new SQLException("MySQL driver not found", ex);
            }
        }
        
        return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
    }
    
    /**
     * Get database connection with custom credentials
     * @param username database username
     * @param password database password
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection(String username, String password) throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                throw new SQLException("MySQL driver not found", ex);
            }
        }
        
        return DriverManager.getConnection(JDBC_URL, username, password);
    }
    
    /**
     * Test database connection
     * @return true if connection successful, false otherwise
     */
    public static boolean testConnection() {
        try (Connection conn = getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (SQLException e) {
            System.err.println("Database connection test failed: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Print current database configuration (for debugging)
     */
    public static void printConfig() {
        System.out.println("Database Configuration:");
        System.out.println("Host: " + DB_HOST);
        System.out.println("Port: " + DB_PORT);
        System.out.println("Database: " + DB_NAME);
        System.out.println("User: " + DB_USER);
        System.out.println("JDBC URL: " + JDBC_URL);
    }
}
