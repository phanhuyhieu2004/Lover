package com.example.lovers.dao;


import com.example.lovers.model.Account;
import com.example.lovers.model.AccountDetail;
import com.example.lovers.model.Role;
import com.example.lovers.model.Service;

import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    private static final String LIST_ACCOUNT = "SELECT * FROM account WHERE idAccount <> 1;";
    private static final String LIST_USERS = "SELECT account.*, role.nameRole AS role_name\n" +
            "FROM account\n" +
            "JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "JOIN role ON role.idRole = account_role.role_id\n" +
            "WHERE role.nameRole = 'user'ORDER BY account.idAccount DESC;";
    private static final String LIST_SERVICE_PROVIDERS = "SELECT account.*, role.nameRole AS role_name\n" +
            "FROM account\n" +
            "JOIN account_role ON account.idAccount = account_role.account_id\n" +
            "JOIN role ON role.idRole = account_role.role_id\n" +
            "WHERE role.nameRole = 'serviceProviders'ORDER BY account.idAccount DESC;";
    private static final String ACTIVE_ACCOUNT = "            SELECT * from account where status='Active' and idAccount <> 1;";
    private static final String BLOCK_ACCOUNT = "            SELECT * from account where status='Block';";
    private static final String VIP_ACCOUNT = "            SELECT * from account where status='Vip';";
    private static final String INACTIVE_ACCOUNT = "            SELECT * from account where status='Inactive';";
    private static final String UPDATE_BLOCK = "        UPDATE account SET status = ? WHERE idAccount = ?;";
    private static final String INSERT_ACCOUNT_DETAIL = "  INSERT INTO detail_Account (dateOfBirth, fullName, gender, city, nationality, avatar, portrait,portrait1,portrait2, height, weight, interest, describeYourself, requestWithUser, facebook, joinDate,account_id,price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
    private static final String INSERT_SERVICE = "  INSERT INTO service (serviceName) VALUES (?)";
    private static final String SELECT_ACCOUNT_DETAIL =
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
    private static final String SELECT_NEW_ACCOUNT= "  SELECT da.*\n" +
            "FROM detail_Account da\n" +
            "JOIN account acc ON da.account_id = acc.idAccount\n" +
            "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
            "JOIN role r ON ar.role_id = r.idRole\n" +
            "WHERE  r.idRole = 2\n" +
            "order by joinDate DESC limit 12;";
    private static final String SELECT_BOY_ACCOUNT= "SELECT da.*\n" +
            "FROM detail_Account da\n" +
            "JOIN account acc ON da.account_id = acc.idAccount\n" +
            "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
            "JOIN role r ON ar.role_id = r.idRole\n" +
            "WHERE da.gender = 'Man' AND r.idRole = 2\n" +
            "\n" +
            " limit 12;";
    private static final String SELECT_GIRL_ACCOUNT= "SELECT da.*\n" +
            "FROM detail_Account da\n" +
            "JOIN account acc ON da.account_id = acc.idAccount\n" +
            "JOIN account_role ar ON acc.idAccount = ar.account_id\n" +
            "JOIN role r ON ar.role_id = r.idRole\n" +
            "WHERE da.gender = 'Women' AND r.idRole = 2\n" +
            "\n" +
            "limit 12;";

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
//                Xác nhận giao dịch bằng cách lưu các thay đổi vào cơ sở dữ liệu
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
    public void addAccountServices(List<Integer> serviceIds, HttpSession session) {
        Connection conn = null;
        PreparedStatement pstmtAssignment = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            Account account = (Account) session.getAttribute("acc");
            int loggedInAccountId = account.getIdAccount();
            // Lấy giá trị ID của tài khoản đã đăng nhập từ session

            String sqlPivot = "INSERT INTO account_service(account_id, service_id) VALUES (?, ?)";
            pstmtAssignment = conn.prepareStatement(sqlPivot);

            // Thêm các ID dịch vụ vào bảng trung gian account_service
            for (int serviceId : serviceIds) {
                pstmtAssignment.setInt(1, loggedInAccountId);
                pstmtAssignment.setInt(2, serviceId);
                pstmtAssignment.executeUpdate();
            }

            conn.commit();
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
                if (pstmtAssignment != null)
                    pstmtAssignment.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }
    @Override
    public void addAccountService(int serviceId, HttpSession session) {
        Connection conn = null;
        PreparedStatement pstmtAssignment = null;

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            Account account = (Account) session.getAttribute("acc");
            int loggedInAccountId = account.getIdAccount();
            // Lấy giá trị ID của tài khoản đã đăng nhập từ session

            String sqlPivot = "INSERT INTO account_service(account_id, service_id) VALUES (?, ?)";
            pstmtAssignment = conn.prepareStatement(sqlPivot);

            // Thêm ID dịch vụ vào bảng trung gian account_service
            pstmtAssignment.setInt(1, loggedInAccountId);
            pstmtAssignment.setInt(2, serviceId);
            pstmtAssignment.executeUpdate();

            conn.commit();
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
                if (pstmtAssignment != null)
                    pstmtAssignment.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
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

                accounts.add(account);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return accounts;
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
    @Override
    public List<Account> getAllAccountBlock() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(BLOCK_ACCOUNT);
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
    public List<Account> getAllAccountActive() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(ACTIVE_ACCOUNT);
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
    public List<Account> getAllAccountVip() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(VIP_ACCOUNT);
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
    public List<Account> getAllAccountInactive() {
        List<Account> accounts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INACTIVE_ACCOUNT);
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
    public void addAccountDetail(AccountDetail accountDetail) {
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
            preparedStatement.setString(14, accountDetail.getRequestWithUser());
            preparedStatement.setString(15, accountDetail.getFacebook());
            preparedStatement.setString(16, accountDetail.getJoinDate());
            preparedStatement.setInt(17, accountDetail.getAccount_id());
            preparedStatement.setString(18, accountDetail.getPrice());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addService(Service service) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE, Statement.RETURN_GENERATED_KEYS)) {

            preparedStatement.setString(1, service.getServiceName());

            preparedStatement.executeUpdate();

            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int newServiceId = generatedKeys.getInt(1);
                service.setIdService(newServiceId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override


    public List<AccountDetail> getAllAccountDetails() {
        List<AccountDetail> accountDetails = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_DETAIL);
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
                accountDetail.setRequestWithUser(resultSet.getString("requestWithUser"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
accountDetail.setPrice(resultSet.getString("price"));
accountDetail.setView(resultSet.getInt("view"));
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
                accountDetail.setRequestWithUser(resultSet.getString("requestWithUser"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setPrice(resultSet.getString("price"));
                accountDetail.setView(resultSet.getInt("view"));
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
                accountDetail.setRequestWithUser(resultSet.getString("requestWithUser"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setPrice(resultSet.getString("price"));
                accountDetail.setView(resultSet.getInt("view"));
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
                accountDetail.setRequestWithUser(resultSet.getString("requestWithUser"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setPrice(resultSet.getString("price"));
                accountDetail.setView(resultSet.getInt("view"));
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
                accountDetail.setRequestWithUser(resultSet.getString("requestWithUser"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setPrice(resultSet.getString("price"));
                accountDetail.setView(resultSet.getInt("view"));
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
                accountDetail.setRequestWithUser(resultSet.getString("requestWithUser"));
                accountDetail.setFacebook(resultSet.getString("facebook"));
                accountDetail.setJoinDate(resultSet.getString("joinDate"));
                accountDetail.setNumberOfRentals(resultSet.getInt("numberOfRentals"));
                accountDetail.setAccount_id(resultSet.getInt("account_id"));
                accountDetail.setPrice(resultSet.getString("price"));
                accountDetail.setView(resultSet.getInt("view"));
                accountDetails.add(accountDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng kết nối và tài nguyên
        }

        return accountDetails;
    }

    public static void main(String[] args) throws SQLException {
        AccountDAO accountDao=new AccountDAO();
List<AccountDetail> accountDetails=accountDao.getMostRented();
for (AccountDetail accountDetail:accountDetails) {
    System.out.println(accountDetail);

}


    }


}
