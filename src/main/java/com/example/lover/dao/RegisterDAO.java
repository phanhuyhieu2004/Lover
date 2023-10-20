package com.example.lover.dao;

import com.example.lover.modal.User;

import java.sql.*;

public class RegisterDAO<HttpServletResponse> {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1";

    private static final String INSERT_USERS_SQL = "INSERT INTO user (userName, email, password) VALUES (?, ?, ?);";
    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        return connection;
    }
    public User insertUser(String userName , String password , String email) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);
            preparedStatement.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public static void main(String[] args) throws SQLException {
        RegisterDAO registerDAO = new RegisterDAO();
        try {
            User user=registerDAO.insertUser("mai" , "123", "abc@gmail.com");
            System.out.println(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean validate (User user ) throws ClassNotFoundException, SQLException {
        boolean status = false;
        return false;
    }
}

