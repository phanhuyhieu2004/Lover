package com.example.lover.dao;

import com.example.lover.model.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO implements IAccountDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project?user=root";
    private String jdbcUsername = "root";
    private String jdbcPassword = "gabynexo221";
    private static final String LOGIN_ADMIN = "SELECT * FROM account where userName=?and password=?";
    private static final String SELECT_ALL_USER = "SELECT * FROM account;";
    private static final String SELECT_USER = "SELECT idUser , userName ,email, phoneNumber , identifyCard FROM account where idRole = 2; ";

    //    private static finalj String SELECT_Product_SQL = "SELECT * FROM product;";
    public AccountDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
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
    public List<Account> selectUser() {
        List<Account> ccdvAccount = new ArrayList<>();
        Connection connection = getConnection();
         try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_USER);
            while (resultSet.next()) {
                int id = resultSet.getInt("idUser");
                String userName = resultSet.getString("userName");
                String email = resultSet.getString("email");
                int phoneNumber = resultSet.getInt("phoneNumber");
                String identifyCard = resultSet.getString("identifyCard");
//                int role = resultSet.getInt("idRole");
                ccdvAccount.add(new Account(id, userName, email, phoneNumber, identifyCard ));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ccdvAccount;
    }

    @Override
    public List<Account> selectAllUsers() {
        List<Account> accounts = new ArrayList<>();
        Connection connection = getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_USER);
            while (resultSet.next()) {
                int id = resultSet.getInt("idUser");
                String userName = resultSet.getString("userName");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                int phoneNumber = resultSet.getInt("phoneNumber");
                String status = resultSet.getString("status");
                int role = resultSet.getInt("idRole");
                accounts.add(new Account(id, userName, password, phoneNumber, status,role));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return accounts;
    }
//        try (
//             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);){
//            System.out.println(preparedStatement);
//             ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("idUser");
//                String userName = resultSet.getString("userName");
//                String password = resultSet.getString("password");
//                String email = resultSet.getString("email");
//                int phoneNumber = resultSet.getInt("phoneNumber");
//                String status = resultSet.getString("status");
//                accounts.add(new Account(id, userName, password , email , phoneNumber , status));
//            }
//        } catch (Exception e) {
//        }




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
        AccountDAO accountDAO = new AccountDAO();

     List<Account> accounts= accountDAO.selectAllUsers();
        for(Account o:accounts){
            System.out.println(o);
        }
    }

}
