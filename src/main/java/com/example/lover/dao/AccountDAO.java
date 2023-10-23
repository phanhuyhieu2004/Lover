package com.example.lover.dao;

import com.example.lover.model.Account;

import java.sql.*;

public class AccountDAO implements IAccountDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
    private static final String LOGIN_ADMIN = "SELECT * FROM account where userName=?and password=?";


    //    private static finalj String SELECT_Product_SQL = "SELECT * FROM product;";
    public AccountDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Không thể kết nối với DB");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    // Phương thức kết nối đến cơ sở dữ liệu

    @Override
    public Account login(String userName, String password) {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_ADMIN)) {
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Account(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getString(9),
                        resultSet.getString(10),
                        resultSet.getInt(11));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO accountDAO=new AccountDAO();
        Account account=accountDAO.login("Hieu","123456");
        System.out.println(account);
    }

}
