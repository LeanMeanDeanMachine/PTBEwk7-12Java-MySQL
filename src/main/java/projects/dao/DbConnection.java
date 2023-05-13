package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {

    private static final String HOST = "localhost";
    private static final int PORT = 3306;
    private static final String SCHEMA = "projects";
    private static final String User = "projects";
    private static final String PASSWORD = "password";

    public static Connection getConnection() {
        String url = "jdbc:mysql://" + HOST + ":" + PORT + "/" + SCHEMA;

        try {
            return DriverManager.getConnection(url, User, PASSWORD);
        } catch (SQLException e) {
            throw new DbException("Error connecting to database.", e);
        }
    }
}
