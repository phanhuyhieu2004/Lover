package com.example.lover.dao;

import com.example.lover.model.Account;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO implements IAccountDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/newProject?user=root";
    private String jdbcUsername = "root";
    private String jdbcPassword = "gabynexo221";
    private static final String LOGIN_ACCOUNT = "SELECT * FROM account where accountName=?and password=?";
    private static final String CHECK_ACCOUNT = "  SELECT * FROM account WHERE accountName=? ;";
    private static final String SIGNUP_ACCOUNT = "INSERT INTO account (accountName, password, email, phoneNumber, identifyCard, surname, name, nickName, status) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'Active')";
    private static final String LIST_USERS ="SELECT * FROM account;";
    private static final String LIST_SERVICE_PROVIDERS ="SELECT account.*, role.nameRole AS role_name\n" +
            "FROM account\n" +
            "JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "JOIN role ON role.idRole = account_role.role_id\n" +
            "WHERE role.nameRole = 'serviceProviders'ORDER BY account.idAccount DESC;";
    private static final String LIST_NORMAL_USERS = "SELECT account.*, role.nameRole AS role_name\n" +
            "FROM account\n" +
            "JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "JOIN role ON role.idRole = account_role.role_id\n" +
            "WHERE role.nameRole = 'user'ORDER BY account.idAccount DESC;";

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
    public List<Account> getAllNormalUser() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LIST_NORMAL_USERS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Account account = new Account();
                account.setIdAccount(resultSet.getInt("idAccount"));
                account.setAccountName(resultSet.getString("accountName"));
                account.setEmail(resultSet.getString("email"));
                account.setPhoneNumber(resultSet.getString("phoneNumber"));
                account.setIdentifyCard(resultSet.getString("identifyCard"));
                account.setSurname(resultSet.getString("surname"));
                account.setName(resultSet.getString("account.name"));
                account.setNickName(resultSet.getString("nickName"));
                account.setStatus(resultSet.getString("status"));

                accounts.add(account);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return accounts;
    }

    @Override
    public Account login(String accountName, String password) {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_ACCOUNT)) {
            preparedStatement.setString(1, accountName);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Account(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getString(9),
                        resultSet.getString(10));
            }
        } catch (Exception e) {
        }
        return null;
    }
    @Override
    public Account checkAccountExist(String accountName) {
        Account account = new Account();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_ACCOUNT)) {
            preparedStatement.setString(1, accountName);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {

                account.setIdAccount(resultSet.getInt("idAccount"));
                account.setAccountName(resultSet.getString("accountName"));
                account.setEmail(resultSet.getString("email"));
                account.setPhoneNumber(resultSet.getString("phoneNumber"));
                account.setIdentifyCard(resultSet.getString("identifyCard"));
                account.setSurname(resultSet.getString("surname"));
                account.setName(resultSet.getString("name"));
                account.setNickName(resultSet.getString("nickName"));
                account.setStatus(resultSet.getString("status"));
            }
        } catch (Exception e) {

        }

        return account;
    }

    @Override
    public void addAccountTransaction(Account account, List<Integer> roles) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmtAssignment = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            pstmt = conn.prepareStatement(SIGNUP_ACCOUNT, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, account.getAccountName());
            pstmt.setString(2, account.getPassword());
            pstmt.setString(3, account.getEmail());
            pstmt.setString(4, account.getPhoneNumber());
            pstmt.setString(5, account.getIdentifyCard());
            pstmt.setString(6, account.getSurname());
            pstmt.setString(7, account.getName());
            pstmt.setString(8, account.getNickName());
            int rowAffected = pstmt.executeUpdate();

            rs = pstmt.getGeneratedKeys();
            int accountId = 0;
            if (rs.next())
                accountId = rs.getInt(1);

            if (rowAffected == 1) {
                String sqlPivot = "INSERT INTO account_role(account_id,role_id) "
                        + "VALUES(?,?)";
                pstmtAssignment = conn.prepareStatement(sqlPivot);

                for (int roleId : roles) {
                    pstmtAssignment.setInt(1, accountId);
                    pstmtAssignment.setInt(2, roleId);
                    pstmtAssignment.executeUpdate();
                }
                conn.commit();
            } else {
                conn.rollback();
            }

        } catch (SQLException ex) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }
    @Override
    public List<Account> getAllUser() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LIST_USERS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Account account = new Account();
                        account.setIdAccount(resultSet.getInt("idAccount"));
                        account.setAccountName(resultSet.getString("accountName"));
                        account.setEmail(resultSet.getString("email"));
                        account.setPhoneNumber(resultSet.getString("phoneNumber"));
                        account.setIdentifyCard(resultSet.getString("identifyCard"));
                        account.setSurname(resultSet.getString("surname"));
                        account.setName(resultSet.getString("account.name"));
                        account.setNickName(resultSet.getString("nickName"));
                        account.setStatus(resultSet.getString("status"));

                        accounts.add(account);
                    }
                } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accounts;
    }
    @Override
    public List<Account> getAllServiceProviders() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LIST_SERVICE_PROVIDERS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        Account account = new Account();
                        account.setIdAccount(resultSet.getInt("idAccount"));
                        account.setAccountName(resultSet.getString("accountName"));
                        account.setEmail(resultSet.getString("email"));
                        account.setPhoneNumber(resultSet.getString("phoneNumber"));
                        account.setIdentifyCard(resultSet.getString("identifyCard"));
                        account.setSurname(resultSet.getString("surname"));
                        account.setName(resultSet.getString("account.name"));
                        account.setNickName(resultSet.getString("nickName"));
                        account.setStatus(resultSet.getString("status"));

                        accounts.add(account);
                    }
                } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accounts;
    }
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
      Account account=dao.checkAccountExist("Bao");
        System.out.println(account);
//        List<Category> listC = dao.getAllCategory();


    }

}
