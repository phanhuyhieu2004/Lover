package com.example.lover.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccountDAO implements IAccountDAO {

    // Thông tin kết nối cơ sở dữ liệu
    private String jdbcURL = "jdbc:mysql://localhost:3306/store?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
//    private static final String SELECT_Product_SQL = "SELECT * FROM product;";
public AccountDAO() {
}

    // Phương thức kết nối đến cơ sở dữ liệu
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
}
