package com.example.lover2.dao;


import com.example.lover2.model.*;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AccountDAO implements IAccountDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
    private static final String SIGNUP_ACCOUNT = "INSERT INTO account (accountName, password, email, phoneNumber, identifyCard, surname, name, nickName, status) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'Active')";
    private static final String CHECK_ACCOUNT = "  SELECT * FROM account WHERE accountName=? ;";
    private static final String LOGIN_ACCOUNT = "SELECT account.*, role.idRole AS role_id, role.nameRole AS role_name, detail_Account.*\n" +
            "FROM account\n" +
            "JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "JOIN role ON role.idRole = account_role.role_id\n" +
            "LEFT JOIN detail_Account ON account.idAccount = detail_Account.account_id\n" +
            "WHERE account.accountName = ? AND account.password = ?;";
    //lấy hết thông tin từ bảng account,cột idRole,cột roleName,kết hợp bảng account với các bảng khác bằng so sánh các id
    private static final String LIST_ACCOUNT = "SELECT account.*, role.nameRole AS role_name\n" +
            "            FROM account\n" +
            "            JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "            JOIN role ON role.idRole = account_role.role_id\n" +
            "           WHERE idAccount <> 1 ORDER BY account.idAccount DESC;";

    private static final String LIST_ROLES_ACCOUNT = "SELECT account.*, role.nameRole AS role_name\n" +
            "FROM account\n" +
            "JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "JOIN role ON role.idRole = account_role.role_id\n" +
            "WHERE role.nameRole = ? ORDER BY account.idAccount DESC;";
    private static final String LIST_STATUS_ACCOUNT = "SELECT account.*, role.nameRole AS role_name\n" +
            "            FROM account\n" +
            "            JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "            JOIN role ON role.idRole = account_role.role_id\n" +
            "           WHERE idAccount <> 1 and status =? ORDER BY account.idAccount DESC;";
    private static final String SEARCH_ACCOUNT_LIST = "SELECT account.*, role.nameRole AS role_name\n" +
            "                       FROM account\n" +
            "                    JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "                    JOIN role ON role.idRole = account_role.role_id\n" +
            "                 WHERE idAccount <> 1 and  accountName like ? ORDER BY account.idAccount DESC; ";

    private static final String FILTER_ACCOUNTS = "SELECT account.*, role.nameRole AS role_name\n" +
            "FROM account\n" +
            "JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "JOIN role ON role.idRole = account_role.role_id\n" +
            "WHERE idAccount <> 1 AND (role.nameRole = ? AND status = ? AND accountName LIKE ?) ORDER BY account.idAccount DESC;";

    private static final String UPDATE_BLOCK = "        UPDATE account SET status = ? WHERE idAccount = ?;";

    private static final String INSERT_ACCOUNT_DETAIL = "  INSERT INTO detail_Account (dateOfBirth, fullName, gender, city, nationality, avatar, portrait,portrait1,portrait2, height, weight, interest, describeYourself, regulations, facebook, joinDate,price,depositMoney,account_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?)";
    private static final String SEARCH_ACCOUNT_DETAIL = " SELECT * from detail_account where fullName like ?  ";

    private static final String SELECT_ACCOUNT_DETAIL = " SELECT * FROM detail_account WHERE account_id = ?";
    private static final String UPDATE_ACCOUNT_DETAIL = " UPDATE detail_Account " +
            "SET dateOfBirth = ?, fullName = ?, gender = ?, city = ?, nationality = ?,avatar=?,portrait=?,portrait1=?,portrait2=?," +
            "height = ?, weight = ?, " +
            "interest = ?, describeYourself = ?, regulations = ?, facebook = ?, joinDate = ?, price = ?, depositMoney = ? " +
            "WHERE account_id = ?";
    private static final String SELECT_ACCOUNT_VIP =
            "            SELECT * FROM detail_Account\n" +
                    "JOIN account_role ON detail_Account.account_id = account_role.account_id\n" +
                    "JOIN role ON account_role.role_id = role.idRole\n" +
                    "JOIN account ON account.idAccount = account_role.account_id\n" +
                    "WHERE role.nameRole = 'serviceProviders' AND account.status = 'Vip' LIMIT 6;        ";
    private static final String SELECT_ACCOUNT_NUMBEROFRENTALS =
            " (\n" +
                    "    SELECT da.*\n" +
                    "FROM detail_Account da\n" +
                    "JOIN account acc ON da.account_id = acc.idAccount\n" +
                    "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
                    "JOIN role r ON ar.role_id = r.idRole\n" +
                    "WHERE da.gender = 'Man' AND r.idRole = 2\n" +
                    " \n" +
                    "  LIMIT 4\n" +
                    ")\n" +
                    "UNION\n" +
                    "(\n" +
                    "    SELECT da.*\n" +
                    "FROM detail_Account da\n" +
                    "JOIN account acc ON da.account_id = acc.idAccount\n" +
                    "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
                    "JOIN role r ON ar.role_id = r.idRole\n" +
                    "WHERE da.gender = 'Women' AND r.idRole = 2\n" +
                    " \n" +
                    "  LIMIT 8\n" +
                    ")          \n" +
                    " ORDER BY numberOfRentals DESC;";
    private static final String SELECT_ACCOUNT_VIEWS =
            "     SELECT da.*\n" +
                    "FROM detail_Account da\n" +
                    "JOIN account acc ON da.account_id = acc.idAccount\n" +
                    "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
                    "JOIN role r ON ar.role_id = r.idRole\n" +
                    "WHERE  r.idRole = 2\n" +
                    "order by view DESC limit 6; ";
    private static final String SELECT_NEW_ACCOUNT = "  SELECT da.*\n" +
            "FROM detail_Account da\n" +
            "JOIN account acc ON da.account_id = acc.idAccount\n" +
            "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
            "JOIN role r ON ar.role_id = r.idRole\n" +
            "WHERE  r.idRole = 2\n" +
            "order by joinDate DESC limit 12;";
    private static final String SELECT_BOY_ACCOUNT = "SELECT da.*\n" +
            "FROM detail_Account da\n" +
            "JOIN account acc ON da.account_id = acc.idAccount\n" +
            "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
            "JOIN role r ON ar.role_id = r.idRole\n" +
            "WHERE da.gender = 'Man' AND r.idRole = 2\n" +
            "\n" +
            " limit 12;";
    private static final String SELECT_GIRL_ACCOUNT = "SELECT da.*\n" +
            "FROM detail_Account da\n" +
            "JOIN account acc ON da.account_id = acc.idAccount\n" +
            "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
            "JOIN role r ON ar.role_id = r.idRole\n" +
            "WHERE da.gender = 'Women' AND r.idRole = 2\n" +
            "\n" +
            "limit 12;";

    private static final String SELECT_ADDRESS_ACCOUNT = "SELECT da.*\n" +
            "FROM detail_Account da\n" +
            "JOIN account acc ON da.account_id = acc.idAccount\n" +
            "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
            "JOIN role r ON ar.role_id = r.idRole\n" +
            "WHERE da.city = ? AND r.idRole = 2\n" +
            "\n" +
            "limit 12;";
    private static final String INSERT_SERVICE_QUERY = "INSERT INTO account_servicecategory (account_id, serviceCategory_id) VALUES (?, ?)";

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
    public void addAccountTransaction(Account account, List<Integer> roles) {
        Connection conn = null;
//        lưu trữ kết nối đến cơ sở dữ liệu.
        PreparedStatement pstmt = null;
//        thực thi câu lệnh SQL
        PreparedStatement pstmtAssignment = null;
//        thực thi câu lệnh SQL để gán vai trò cho account.
        ResultSet rs = null;
//        lưu trữ kết quả trả về từ câu lệnh SQL.
        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            pstmt = conn.prepareStatement(SIGNUP_ACCOUNT, Statement.RETURN_GENERATED_KEYS);
//            Statement.RETURN_GENERATED_KEYS được sử dụng để yêu cầu trả về các khóa được tạo tự động
            pstmt.setString(1, account.getAccountName());
            pstmt.setString(2, account.getPassword());
            pstmt.setString(3, account.getEmail());
            pstmt.setString(4, account.getPhoneNumber());
            pstmt.setString(5, account.getIdentifyCard());
            pstmt.setString(6, account.getSurname());
            pstmt.setString(7, account.getName());
            pstmt.setString(8, account.getNickName());
//            Đặt giá trị của các tham số trong câu lệnh SQL là các thuộc tính  đối tượng account.
            int rowAffected = pstmt.executeUpdate();
//            Thực thi câu lệnh SQL để chèn dữ liệu tài khoản mới vào cơ sở dữ liệu và lấy số hàng bị ảnh hưởng.

            rs = pstmt.getGeneratedKeys();
//            Lấy các khóa được tạo tự động từ kết quả thực thi câu lệnh SQL trước đó
            int accountId = 0;
//            Khởi tạo biến accountId và gán giá trị mặc định là 0. Biến này sẽ được sử dụng để lưu trữ khóa của tài khoản mới.
            if (rs.next())
                accountId = rs.getInt(1);
//            Kiểm tra xem kết quả trả về từ câu lệnh truy vấn khóa tạo tự động có tồn tại hay không.
//            Lấy giá trị của khóa tạo tự động từ kết quả truy vấn và gán vào biến accountId.

            if (rowAffected == 1) {
//                Kiểm tra xem có ảnh hưởng đúng một hàng trong cơ sở dữ liệu hay không
                String sqlPivot = "INSERT INTO account_role(account_id,role_id) "
                        + "VALUES(?,?)";
//                Khởi tạo một câu lệnh SQL để chèn vai trò của tài khoản vào bảng account_role
                pstmtAssignment = conn.prepareStatement(sqlPivot);
//                Chuẩn bị câu lệnh SQL để gán vai trò cho tài khoản và gán vào biến pstmtAssignment

                for (int roleId : roles) {
//                    Lặp qua danh sách các vai trò và gán từng vai trò cho tài khoản.
                    pstmtAssignment.setInt(1, accountId);
//                    Đặt giá trị của tham số thứ nhất trong câu lệnh SQL là khóa tài khoản từ biến accountId.
                    pstmtAssignment.setInt(2, roleId);
//                    Đặt giá trị của tham số thứ hai trong câu lệnh SQL là khóa vai trò từ danh sách roles.
                    pstmtAssignment.executeUpdate();
//                    Thực thi câu lệnh SQL để gán vai trò cho tài khoản.
                }
                conn.commit();
                AccountDetail newAccountDetail = new AccountDetail();
                newAccountDetail.setDateOfBirth(newAccountDetail.getDateOfBirth());
                newAccountDetail.setFullName(newAccountDetail.getFullName());
                newAccountDetail.setGender(newAccountDetail.getGender());
                newAccountDetail.setCity(newAccountDetail.getCity());
                newAccountDetail.setNationality(newAccountDetail.getNationality());
                newAccountDetail.setAvatar(newAccountDetail.getAvatar());
                newAccountDetail.setHeight(newAccountDetail.getHeight());
                newAccountDetail.setWeight(newAccountDetail.getWeight());
                newAccountDetail.setInterest(newAccountDetail.getInterest());
                newAccountDetail.setDescribeYourself(newAccountDetail.getDescribeYourself());
                newAccountDetail.setRegulations(newAccountDetail.getRegulations());
                newAccountDetail.setFacebook(newAccountDetail.getFacebook());
                newAccountDetail.setJoinDate(newAccountDetail.getJoinDate());
                newAccountDetail.setPrice(newAccountDetail.getPrice());
                newAccountDetail.setDepositMoney(50);
                newAccountDetail.setAccount_id(accountId);
//                lấy id của tài khoản  mới vừa thêm vào trong bảng account
                addAccountDetail(accountId, newAccountDetail);
//                gán giá trị của các thuộc tính khác của newAccountDetail cho chính nó,tất cả đều là null vì newAccountDetail là đối tươợng mới tượng tạo
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

    // Phương thức thêm dịch vụ vào bảng trung gian
    public void addServices(int accountId, List<Integer> serviceIds) {
        String sql = INSERT_SERVICE_QUERY;

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            for (Integer serviceId : serviceIds) {
                ps.setInt(1, accountId); // Gán account_id
                ps.setInt(2, serviceId); // Gán service_id
                ps.addBatch(); // Thêm vào batch
            }
            ps.executeBatch(); // Thực thi batch
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean isServiceAlreadyAdded(int accountId, int serviceId) {
        String sql = "SELECT COUNT(*) FROM account_servicecategory WHERE account_id = ? AND serviceCategory_id = ?";
        try (Connection connection = getConnection();

             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ps.setInt(2, serviceId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ServiceCategory> getServicesByAccountId(int accountId) {
        List<ServiceCategory> services = new ArrayList<>();
        String query = "SELECT * FROM service_category sc " +
                "JOIN account_servicecategory aserv ON sc.idServiceCategory = aserv.serviceCategory_id " +
                "WHERE aserv.account_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, accountId); // Gán ID tài khoản vào câu truy vấn

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                ServiceCategory service = new ServiceCategory();
                service.setIdServiceCategory(resultSet.getInt("idServiceCategory"));
                service.setServiceNameCategory(resultSet.getString("serviceNameCategory"));
                services.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    public void removeService(int accountId, int serviceCategoryId) {
        String query = "DELETE FROM account_servicecategory WHERE account_id = ? AND serviceCategory_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, accountId);
            preparedStatement.setInt(2, serviceCategoryId);

            int rowsAffected = preparedStatement.executeUpdate(); // Thực hiện câu lệnh xóa
            if (rowsAffected > 0) {
                System.out.println("Service removed successfully");
            } else {
                System.out.println("No service found for the given account and service category.");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi ra console
        }
    }

    @Override
    public Account checkAccountExist(String accountName) {
//        Phương thức kiểm tra xem account đã tồn tại trong DB hay chưa trả về 1 account và có tham số truyền vào là accountName

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_ACCOUNT)) {
//            Tạo một đối tượng PreparedStatement từ kết nối connection và truyền vào câu lệnh SQL CHECK_ACCOUNT. Đối tượng PreparedStatement được khởi tạo và gán cho biến preparedStatement. Điều này chuẩn bị câu lệnh SQL để thực thi.
            preparedStatement.setString(1, accountName);

//            giá trị của tham số thứ nhất trong câu lệnh SQL là accountName từ tham số của phương thức
            ResultSet resultSet = preparedStatement.executeQuery();
//            Thực thi câu lệnh SQL và lưu trữ kết quả trả về trong đối tượng ResultSet. Phương thức executeQuery() được gọi trên đối tượng PreparedStatement để thực hiện truy vấn và trả về kết quả trong đối tượng ResultSet.
            while (resultSet.next()) {
//                duyệt qua từng hàng trong kết quả trả về resultSet
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


//                tạo một đối tượng Account mới bằng cách truy cập các cột tương ứng trong kết quả sử dụng các phương thức getInt() và getString(). Mỗi giá trị được truy cập bằng cách truyền số thứ tự của cột trong truy vấn SQL.
            }
        } catch (Exception e) {
        }
        return null;
//        Trả về null nếu không có tài khoản nào được tìm thấy hoặc nếu có bất kỳ lỗi nào xảy ra trong quá trình truy vấn.
    }

    @Override
    public Account login(String accountName, String password) {

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_ACCOUNT)) {
            preparedStatement.setString(1, accountName);
            preparedStatement.setString(2, password);
//            Đặt tham số 1 và 2 trong câu lệnh SQL tương ứng với tên tài khoản (accountName) và mật khẩu (password) được truyền vào phương thức.

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Account account = new Account(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getString(8),
                        resultSet.getString(9),
                        resultSet.getString(10));
                AccountDetail accountDetail = new AccountDetail();

                accountDetail.setIdDetail(resultSet.getInt("idDetail"));

                accountDetail.setGender(resultSet.getString("gender"));
                accountDetail.setCity(resultSet.getString("city"));

                accountDetail.setAvatar(resultSet.getString("avatar"));
                accountDetail.setPortrait(resultSet.getString("portrait"));
                accountDetail.setPortrait1(resultSet.getString("portrait1"));
                accountDetail.setPortrait2(resultSet.getString("portrait2"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
// Tạo một đối tượng AccountDetail từ các cột dữ liệu tương ứng trong ResultSet.

                account.setAccountDetail(accountDetail);
                // Gán đối tượng AccountDetail vào thuộc tính accountDetail của đối tượng Account.
                Role role = new Role(
                        resultSet.getInt("role_id"),
                        resultSet.getString("role_name")
                );
                // Tạo một đối tượng Role từ các cột dữ liệu tương ứng trong ResultSet và gán vào thuộc tính role của đối tượng Account.
                account.setRole(role);
                account.getRole();


                return account;
                // Trả về đối tượng Account đã được tạo và cập nhật thông tin từ ResultSet.
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
//        Trả về giá trị null nếu không có hàng dữ liệu nào tương ứng với tên tài khoản và mật khẩu đã truyền vào, hoặc nếu có lỗi xảy ra trong quá trình thực thi câu lệnh SQL.
    }

    @Override
    public void updateAccountStatus(int id, String status) {
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(UPDATE_BLOCK)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public List<Account> getAllAccount() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LIST_ACCOUNT);
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


                Role role = new Role();
                String roleNameFromResultSet = resultSet.getString("role_name");
                role.setRoleName(roleNameFromResultSet);

                account.setRole(role);
                accounts.add(account);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return accounts;
    }


    @Override
    public List<Account> getAllRoles(String roleName) {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LIST_ROLES_ACCOUNT)) {
            preparedStatement.setString(1, roleName); // Truyền tham số nameRole vào truy vấn
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                // Lấy dữ liệu từ ResultSet và thêm vào danh sách accounts
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

                Role role = new Role();
                String roleNameFromResultSet = resultSet.getString("role_name");
                role.setRoleName(roleNameFromResultSet);

                account.setRole(role);
                accounts.add(account);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accounts;
    }


    @Override
    public List<Account> getAllAccountStatus(String status) {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(LIST_STATUS_ACCOUNT)) {
            preparedStatement.setString(1, status);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Account account = new Account();
                    account.setIdAccount(resultSet.getInt("idAccount"));
                    account.setAccountName(resultSet.getString("accountName"));
                    account.setEmail(resultSet.getString("email"));
                    account.setPhoneNumber(resultSet.getString("phoneNumber"));
                    account.setIdentifyCard(resultSet.getString("identifyCard"));
                    account.setSurname(resultSet.getString("surname"));
                    account.setName(resultSet.getString("name"));
                    account.setNickName(resultSet.getString("nickName"));
                    account.setStatus(resultSet.getString("status"));

                    Role role = new Role();
                    String roleNameFromResultSet = resultSet.getString("role_name");
                    role.setRoleName(roleNameFromResultSet);

                    account.setRole(role);
                    accounts.add(account);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accounts;
    }


    @Override
    public void addAccountDetail(int accountId, AccountDetail accountDetail) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACCOUNT_DETAIL)) {

            preparedStatement.setString(1, accountDetail.getDateOfBirth());
            preparedStatement.setString(2, accountDetail.getFullName());
            preparedStatement.setString(3, accountDetail.getGender());
            preparedStatement.setString(4, accountDetail.getCity());
            preparedStatement.setString(5, accountDetail.getNationality());
            preparedStatement.setString(6, accountDetail.getAvatar());
            preparedStatement.setString(7, accountDetail.getPortrait());
            preparedStatement.setString(8, accountDetail.getPortrait1());
            preparedStatement.setString(9, accountDetail.getPortrait2());
            preparedStatement.setString(10, accountDetail.getHeight());
            preparedStatement.setString(11, accountDetail.getWeight());
            preparedStatement.setString(12, accountDetail.getInterest());
            preparedStatement.setString(13, accountDetail.getDescribeYourself());
            preparedStatement.setString(14, accountDetail.getRegulations());
            preparedStatement.setString(15, accountDetail.getFacebook());
            preparedStatement.setString(16, accountDetail.getJoinDate());
            preparedStatement.setInt(17, accountDetail.getPrice());
            preparedStatement.setInt(18, accountDetail.getDepositMoney());
            preparedStatement.setInt(19, accountId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override


    public List<AccountDetail> getVipAccountDetail() {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_VIP);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AccountDetail accountDetail = new AccountDetail();
                accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                accountDetail.setFullName(resultSet.getString("fullName"));
                accountDetail.setGender(resultSet.getString("gender"));
                accountDetail.setCity(resultSet.getString("city"));
                accountDetail.setNationality(resultSet.getString("nationality"));
                accountDetail.setAvatar(resultSet.getString("avatar"));
                accountDetail.setPortrait(resultSet.getString("portrait"));
                accountDetail.setPortrait1(resultSet.getString("portrait1"));
                accountDetail.setPortrait2(resultSet.getString("portrait2"));
                accountDetail.setHeight(resultSet.getString("height"));
                accountDetail.setWeight(resultSet.getString("weight"));
                accountDetail.setInterest(resultSet.getString("interest"));
                accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                accountDetail.setRegulations(resultSet.getString("regulations"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setView(resultSet.getInt("view"));
                accountDetail.setPrice(resultSet.getInt("price"));

                accountDetails.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        }

        return accountDetails;
    }

    @Override
    public List<AccountDetail> getMostRented() {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_NUMBEROFRENTALS);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AccountDetail accountDetail = new AccountDetail();
                accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                accountDetail.setFullName(resultSet.getString("fullName"));
                accountDetail.setGender(resultSet.getString("gender"));
                accountDetail.setCity(resultSet.getString("city"));
                accountDetail.setNationality(resultSet.getString("nationality"));
                accountDetail.setAvatar(resultSet.getString("avatar"));
                accountDetail.setPortrait(resultSet.getString("portrait"));
                accountDetail.setPortrait1(resultSet.getString("portrait1"));
                accountDetail.setPortrait2(resultSet.getString("portrait2"));

                accountDetail.setHeight(resultSet.getString("height"));
                accountDetail.setWeight(resultSet.getString("weight"));
                accountDetail.setInterest(resultSet.getString("interest"));
                accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                accountDetail.setRegulations(resultSet.getString("regulations"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setView(resultSet.getInt("view"));
                accountDetail.setPrice(resultSet.getInt("price"));
                accountDetails.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        }

        return accountDetails;
    }

    @Override
    public List<AccountDetail> getMostView() {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_VIEWS);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AccountDetail accountDetail = new AccountDetail();
                accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                accountDetail.setFullName(resultSet.getString("fullName"));
                accountDetail.setGender(resultSet.getString("gender"));
                accountDetail.setCity(resultSet.getString("city"));
                accountDetail.setNationality(resultSet.getString("nationality"));
                accountDetail.setAvatar(resultSet.getString("avatar"));
                accountDetail.setPortrait(resultSet.getString("portrait"));
                accountDetail.setPortrait1(resultSet.getString("portrait1"));
                accountDetail.setPortrait2(resultSet.getString("portrait2"));

                accountDetail.setHeight(resultSet.getString("height"));
                accountDetail.setWeight(resultSet.getString("weight"));
                accountDetail.setInterest(resultSet.getString("interest"));
                accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                accountDetail.setRegulations(resultSet.getString("regulations"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setView(resultSet.getInt("view"));
                accountDetail.setPrice(resultSet.getInt("price"));

                accountDetails.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
        }

        return accountDetails;
    }

    @Override
    public List<AccountDetail> getNewAccount() {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NEW_ACCOUNT);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AccountDetail accountDetail = new AccountDetail();
                accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                accountDetail.setFullName(resultSet.getString("fullName"));
                accountDetail.setGender(resultSet.getString("gender"));
                accountDetail.setCity(resultSet.getString("city"));
                accountDetail.setNationality(resultSet.getString("nationality"));
                accountDetail.setAvatar(resultSet.getString("avatar"));
                accountDetail.setPortrait(resultSet.getString("portrait"));
                accountDetail.setPortrait1(resultSet.getString("portrait1"));
                accountDetail.setPortrait2(resultSet.getString("portrait2"));

                accountDetail.setHeight(resultSet.getString("height"));
                accountDetail.setWeight(resultSet.getString("weight"));
                accountDetail.setInterest(resultSet.getString("interest"));
                accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                accountDetail.setRegulations(resultSet.getString("regulations"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setView(resultSet.getInt("view"));
                accountDetail.setPrice(resultSet.getInt("price"));

                accountDetails.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
        }

        return accountDetails;
    }

    @Override
    public List<AccountDetail> getManAccount() {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOY_ACCOUNT);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AccountDetail accountDetail = new AccountDetail();
                accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                accountDetail.setFullName(resultSet.getString("fullName"));
                accountDetail.setGender(resultSet.getString("gender"));
                accountDetail.setCity(resultSet.getString("city"));
                accountDetail.setNationality(resultSet.getString("nationality"));
                accountDetail.setAvatar(resultSet.getString("avatar"));
                accountDetail.setPortrait(resultSet.getString("portrait"));
                accountDetail.setPortrait1(resultSet.getString("portrait1"));
                accountDetail.setPortrait2(resultSet.getString("portrait2"));

                accountDetail.setHeight(resultSet.getString("height"));
                accountDetail.setWeight(resultSet.getString("weight"));
                accountDetail.setInterest(resultSet.getString("interest"));
                accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                accountDetail.setRegulations(resultSet.getString("regulations"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setView(resultSet.getInt("view"));
                accountDetail.setPrice(resultSet.getInt("price"));

                accountDetails.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        }

        return accountDetails;
    }

    @Override
    public List<AccountDetail> getWomenAccount() {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_GIRL_ACCOUNT);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                AccountDetail accountDetail = new AccountDetail();
                accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                accountDetail.setFullName(resultSet.getString("fullName"));
                accountDetail.setGender(resultSet.getString("gender"));
                accountDetail.setCity(resultSet.getString("city"));
                accountDetail.setNationality(resultSet.getString("nationality"));
                accountDetail.setAvatar(resultSet.getString("avatar"));
                accountDetail.setPortrait(resultSet.getString("portrait"));
                accountDetail.setPortrait1(resultSet.getString("portrait1"));
                accountDetail.setPortrait2(resultSet.getString("portrait2"));

                accountDetail.setHeight(resultSet.getString("height"));
                accountDetail.setWeight(resultSet.getString("weight"));
                accountDetail.setInterest(resultSet.getString("interest"));
                accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                accountDetail.setRegulations(resultSet.getString("regulations"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setView(resultSet.getInt("view"));
                accountDetail.setPrice(resultSet.getInt("price"));

                accountDetails.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
        }

        return accountDetails;
    }

    @Override
    public List<AccountDetail> getAddressAccount(String city) {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADDRESS_ACCOUNT)) {

            preparedStatement.setString(1, city);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    AccountDetail accountDetail = new AccountDetail();
                    accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                    accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                    accountDetail.setFullName(resultSet.getString("fullName"));
                    accountDetail.setGender(resultSet.getString("gender"));
                    accountDetail.setCity(resultSet.getString("city"));
                    accountDetail.setNationality(resultSet.getString("nationality"));
                    accountDetail.setAvatar(resultSet.getString("avatar"));
                    accountDetail.setPortrait(resultSet.getString("portrait"));
                    accountDetail.setPortrait1(resultSet.getString("portrait1"));
                    accountDetail.setPortrait2(resultSet.getString("portrait2"));
                    accountDetail.setHeight(resultSet.getString("height"));
                    accountDetail.setWeight(resultSet.getString("weight"));
                    accountDetail.setInterest(resultSet.getString("interest"));
                    accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                    accountDetail.setRegulations(resultSet.getString("regulations"));
                    accountDetail.setFacebook(resultSet.getString("facebook"));
                    accountDetail.setJoinDate(resultSet.getString("joinDate"));
                    accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                    accountDetail.setAccount_id(resultSet.getInt("account_id"));
                    accountDetail.setView(resultSet.getInt("view"));
                    accountDetail.setPrice(resultSet.getInt("price"));

                    accountDetails.add(accountDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
        }

        return accountDetails;
    }

    public int getCurrentDepositMoney(int accountId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int currentDepositMoney = 0;

        try {
            conn = getConnection();
            if (conn != null) {
                String sql = "SELECT depositMoney FROM detail_account WHERE account_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, accountId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    currentDepositMoney = rs.getInt("depositMoney");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return currentDepositMoney;
    }

    public void rentPlayer(int playerId, int accountId, int rentalHours, int totalAmount) {
        String sql = "INSERT INTO player_rental (playerId, accountId, rentalHours, rentalDate, totalAmount) VALUES (?, ?, ?, ?, ?)";

        // Lấy thời gian hiện tại
        LocalDateTime rentalDate = LocalDateTime.now();

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, playerId);
            pstmt.setInt(2, accountId);
            pstmt.setInt(3, rentalHours);
            pstmt.setTimestamp(4, Timestamp.valueOf(rentalDate));
            pstmt.setInt(5, totalAmount);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Player rented successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean addDepositMoney(int accountId, int depositMoneyToAdd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isUpdated = false;

        try {
            conn = getConnection();
            if (conn != null) {
                int currentDepositMoney = getCurrentDepositMoney(accountId);

                int newDepositMoney = currentDepositMoney + depositMoneyToAdd;

                String sql = "UPDATE detail_account SET depositMoney = ? WHERE account_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, newDepositMoney);
                pstmt.setInt(2, accountId);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    isUpdated = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isUpdated;
    }

    public void updateAccountBalance(int accountId, int newBalance) {
        String sql = "UPDATE detail_account SET depositMoney = ? WHERE account_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, newBalance);
            pstmt.setInt(2, accountId);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Account balance updated successfully.");
            } else {
                System.out.println("Account not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public AccountDetail getAccountDetailByAccountId(int accountId) {
        AccountDetail accountDetail = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_DETAIL)) {
            preparedStatement.setInt(1, accountId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    accountDetail = new AccountDetail();
                    accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                    accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                    accountDetail.setFullName(resultSet.getString("fullName"));
                    accountDetail.setGender(resultSet.getString("gender"));
                    accountDetail.setCity(resultSet.getString("city"));
                    accountDetail.setNationality(resultSet.getString("nationality"));
                    accountDetail.setAvatar(resultSet.getString("avatar"));
                    accountDetail.setPortrait(resultSet.getString("portrait"));
                    accountDetail.setPortrait1(resultSet.getString("portrait1"));
                    accountDetail.setPortrait2(resultSet.getString("portrait2"));
                    accountDetail.setHeight(resultSet.getString("height"));
                    accountDetail.setWeight(resultSet.getString("weight"));
                    accountDetail.setInterest(resultSet.getString("interest"));
                    accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                    accountDetail.setRegulations(resultSet.getString("regulations"));
                    accountDetail.setFacebook(resultSet.getString("facebook"));
                    accountDetail.setJoinDate(resultSet.getString("joinDate"));
                    accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                    accountDetail.setAccount_id(resultSet.getInt("account_id"));

                    accountDetail.setView(resultSet.getInt("view"));
                    accountDetail.setPrice(resultSet.getInt("price"));
                    accountDetail.setDepositMoney(resultSet.getInt("depositMoney"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accountDetail;
    }

    public List<PlayerRental> getPlayerRentalByAccountId(int accountId) {
        List<PlayerRental> playerRentals = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM player_rental where accountId=?")) {
            preparedStatement.setInt(1, accountId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    PlayerRental playerRental = new PlayerRental();
                    playerRental.setPlayerId(resultSet.getInt("playerId"));
                    playerRental.setAccountId(resultSet.getInt("accountId"));
                    playerRental.setRentalHours(resultSet.getInt("rentalHours"));
                    Timestamp rentalDateTimestamp = resultSet.getTimestamp("rentalDate");

                    LocalDateTime rentalDate = rentalDateTimestamp.toLocalDateTime();
                    playerRental.setRentalDate(rentalDate);
                    playerRental.setTotalAmount(resultSet.getInt("totalAmount"));

                    // Thêm đối tượng PlayerRental vào danh sách
                    playerRentals.add(playerRental);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return playerRentals; // Trả về danh sách PlayerRental
    }

    public List<PlayerRental> getPlayerRentalByPlayerId(int playerId) {
        List<PlayerRental> playerRentals = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM player_rental where playerId=?")) {
            preparedStatement.setInt(1, playerId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    PlayerRental playerRental = new PlayerRental();
                    playerRental.setPlayerId(resultSet.getInt("playerId"));
                    playerRental.setAccountId(resultSet.getInt("accountId"));
                    playerRental.setRentalHours(resultSet.getInt("rentalHours"));
                    Timestamp rentalDateTimestamp = resultSet.getTimestamp("rentalDate");

                    LocalDateTime rentalDate = rentalDateTimestamp.toLocalDateTime();
                    playerRental.setRentalDate(rentalDate);
                    playerRental.setTotalAmount(resultSet.getInt("totalAmount"));

                    playerRentals.add(playerRental);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return playerRentals;
    }

    @Override
    public void updateAccountDetailByAccountId(String dateOfBirth, String fullName, String gender, String city, String nationality, String avatar, String portrait, String portrait1, String portrait2, String height, String weight, String interest, String describeYourself, String regulations, String facebook, String joinDate, int price, int depositMoney, int account_id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ACCOUNT_DETAIL)) {
            preparedStatement.setString(1, dateOfBirth);
            preparedStatement.setString(2, fullName);
            preparedStatement.setString(3, gender);
            preparedStatement.setString(4, city);
            preparedStatement.setString(5, nationality);
            preparedStatement.setString(6, avatar);
            preparedStatement.setString(7, portrait);
            preparedStatement.setString(8, portrait1);
            preparedStatement.setString(9, portrait2);


            preparedStatement.setString(10, height);
            preparedStatement.setString(11, weight);
            preparedStatement.setString(12, interest);
            preparedStatement.setString(13, describeYourself);
            preparedStatement.setString(14, regulations);
            preparedStatement.setString(15, facebook);
            preparedStatement.setString(16, joinDate);
            preparedStatement.setInt(17, price);
            preparedStatement.setInt(18, depositMoney);
            preparedStatement.setInt(19, account_id);


            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<AccountDetail> searchByName(String search) {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ACCOUNT_DETAIL)) {

            preparedStatement.setString(1, "%" + search + "%");
//tìm tên chứa kí tự muốn tìm kiếm ở bất kì vị trí nào trong tài khoản
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    AccountDetail accountDetail = new AccountDetail();
                    accountDetail.setIdDetail(resultSet.getInt("idDetail"));
                    accountDetail.setDateOfBirth(resultSet.getString("dateOfBirth"));
                    accountDetail.setFullName(resultSet.getString("fullName"));
                    accountDetail.setGender(resultSet.getString("gender"));
                    accountDetail.setCity(resultSet.getString("city"));
                    accountDetail.setNationality(resultSet.getString("nationality"));
                    accountDetail.setAvatar(resultSet.getString("avatar"));
                    accountDetail.setPortrait(resultSet.getString("portrait"));
                    accountDetail.setPortrait1(resultSet.getString("portrait1"));
                    accountDetail.setPortrait2(resultSet.getString("portrait2"));
                    accountDetail.setHeight(resultSet.getString("height"));
                    accountDetail.setWeight(resultSet.getString("weight"));
                    accountDetail.setInterest(resultSet.getString("interest"));
                    accountDetail.setDescribeYourself(resultSet.getString("describeYourself"));
                    accountDetail.setRegulations(resultSet.getString("regulations"));
                    accountDetail.setFacebook(resultSet.getString("facebook"));
                    accountDetail.setJoinDate(resultSet.getString("joinDate"));
                    accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                    accountDetail.setAccount_id(resultSet.getInt("account_id"));
                    accountDetail.setView(resultSet.getInt("view"));
                    accountDetails.add(accountDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
        }

        return accountDetails;
    }

    @Override
    public List<Account> searchByAccountName(String search) {
        List<Account> accounts = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ACCOUNT_LIST)) {

            preparedStatement.setString(1, "%" + search + "%");

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Account account = new Account();
                    account.setIdAccount(resultSet.getInt("idAccount"));
                    account.setAccountName(resultSet.getString("accountName"));
                    account.setPassword(resultSet.getString("password"));
                    account.setEmail(resultSet.getString("email"));
                    account.setPhoneNumber(resultSet.getString("phoneNumber"));
                    account.setIdentifyCard(resultSet.getString("identifyCard"));
                    account.setSurname(resultSet.getString("surname"));
                    account.setName(resultSet.getString("name"));
                    account.setNickName(resultSet.getString("nickName"));
                    account.setStatus(resultSet.getString("status"));

                    Role role = new Role();
                    String roleNameFromResultSet = resultSet.getString("role_name");
                    role.setRoleName(roleNameFromResultSet);

                    account.setRole(role);
                    accounts.add(account);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
        }

        return accounts;
    }

    public List<Account> filterAccounts(String roleName, String status, String search) {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FILTER_ACCOUNTS)) {
            preparedStatement.setString(1, roleName);
            preparedStatement.setString(2, status);
            preparedStatement.setString(3, "%" + search + "%");
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
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

                    Role role = new Role();
                    String roleNameFromResultSet = resultSet.getString("role_name");
                    role.setRoleName(roleNameFromResultSet);

                    account.setRole(role);
                    accounts.add(account);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return accounts;
    }


    public List<AccountDetail> searchAccounts(String fullName, String gender, String ageCategory, String view,
                                              boolean online, String rentals, String city) {

        List<AccountDetail> result = new ArrayList<>();

        StringBuilder query = new StringBuilder("SELECT da.* FROM detail_Account da ");
        query.append("JOIN account a ON da.account_id = a.idAccount ");
        query.append("JOIN account_role ar ON a.idAccount = ar.account_id ");
        query.append("WHERE ar.role_id = 2 AND a.status = 'Active' ");

        int minAge = 0, maxAge = Integer.MAX_VALUE;
        LocalDate today = LocalDate.now();

        if (fullName != null && !fullName.isEmpty()) {
            query.append("AND da.fullName LIKE ? ");
        }
        if (gender != null && !gender.isEmpty()) {
            query.append("AND da.gender = ? ");
        }
        if (ageCategory != null && !ageCategory.isEmpty()) {
            if (ageCategory.equals("18-30")) {
                minAge = 18;
                maxAge = 30;
            } else if (ageCategory.equals("30-40")) {
                minAge = 30;
                maxAge = 40;
            }
            query.append("AND DATEDIFF(CURDATE(), da.dateOfBirth) / 365 BETWEEN ? AND ? ");
        }
        if (view != null && !view.isEmpty()) {
            query.append("AND da.view >= ? ");
        }
        if (rentals != null && !rentals.isEmpty()) {
            query.append("AND da.numberOfRentals = ? ");
        }
        if (city != null && !city.isEmpty()) {
            query.append("AND da.city = ? ");
        }

        try (Connection connection = getConnection(); PreparedStatement pstmt = connection.prepareStatement(query.toString())) {
            int index = 1;

            if (fullName != null && !fullName.isEmpty()) {
                pstmt.setString(index++, "%" + fullName + "%");
            }
            if (gender != null && !gender.isEmpty()) {
                pstmt.setString(index++, gender);
            }
            if (ageCategory != null && !ageCategory.isEmpty()) {
                pstmt.setInt(index++, minAge);
                pstmt.setInt(index++, maxAge);
            }
            if (view != null && !view.isEmpty()) {
                pstmt.setInt(index++, Integer.parseInt(view));
            }
            if (rentals != null && !rentals.isEmpty()) {
                pstmt.setString(index++, rentals); // Thêm tham số rentals
            }
            if (city != null && !city.isEmpty()) {
                pstmt.setString(index++, city);
            }

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                AccountDetail accountDetail = new AccountDetail();
                accountDetail.setIdDetail(rs.getInt("idDetail"));
                accountDetail.setDateOfBirth(rs.getString("dateOfBirth"));
                accountDetail.setFullName(rs.getString("fullName"));
                accountDetail.setGender(rs.getString("gender"));
                accountDetail.setCity(rs.getString("city"));
                accountDetail.setNationality(rs.getString("nationality"));
                accountDetail.setAvatar(rs.getString("avatar"));
                accountDetail.setPortrait(rs.getString("portrait"));
                accountDetail.setPortrait1(rs.getString("portrait1"));
                accountDetail.setPortrait2(rs.getString("portrait2"));
                accountDetail.setHeight(rs.getString("height"));
                accountDetail.setWeight(rs.getString("weight"));
                accountDetail.setInterest(rs.getString("interest"));
                accountDetail.setDescribeYourself(rs.getString("describeYourself"));
                accountDetail.setRegulations(rs.getString("regulations"));
                accountDetail.setFacebook(rs.getString("facebook"));
                accountDetail.setJoinDate(rs.getString("joinDate"));
                accountDetail.setNumberOfRentals(rs.getInt("numberOfRentals"));
                accountDetail.setAccount_id(rs.getInt("account_id"));
                accountDetail.setView(rs.getInt("view"));
                // Tiếp tục lấy các trường khác...
                result.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Account> searchAccountsManager(String accountName, String status, String role) {

        List<Account> result = new ArrayList<>();

        StringBuilder query = new StringBuilder("SELECT a.*,r.nameRole FROM account a ");
        query.append("JOIN account_role ar ON a.idAccount = ar.account_id ");
        query.append("JOIN role r ON ar.role_id = r.idRole ");
        query.append("WHERE ar.role_id != 1 ");

        if (accountName != null && !accountName.isEmpty()) {
            query.append("AND a.accountName LIKE ? ");
        }
        if (status != null && !status.isEmpty()) {
            query.append("AND a.status = ? ");
        }
        if (role != null && !role.isEmpty()) {
            query.append("AND r.nameRole = ? ");
        }

        try (Connection connection = getConnection(); PreparedStatement pstmt = connection.prepareStatement(query.toString())) {
            int index = 1;

            if (accountName != null && !accountName.isEmpty()) {
                pstmt.setString(index++, "%" + accountName + "%");
            }
            if (status != null && !status.isEmpty()) {
                pstmt.setString(index++, status);
            }
            if (role != null && !role.isEmpty()) {
                pstmt.setString(index++, role);
            }

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setIdAccount(rs.getInt("idAccount"));
                account.setAccountName(rs.getString("accountName"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));
                account.setPhoneNumber(rs.getString("phoneNumber"));
                account.setIdentifyCard(rs.getString("identifyCard"));
                account.setSurname(rs.getString("surname"));
                account.setName(rs.getString("name"));
                account.setNickName(rs.getString("nickName"));
                account.setStatus(rs.getString("status"));

                result.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

}


