package com.example.lover2.dao;


import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;


import javax.servlet.http.HttpSession;

import java.sql.SQLException;
import java.util.List;

// định nghĩa các phương thức mà một đối tượng DAO  cho Account cần triển khai.
public interface IAccountDAO {
    Account login(String userName, String password);





    Account checkAccountExist(String account);

    void addAccountTransaction(Account account, List<Integer> roles);


    void updateAccountStatus(int id, String status);

    List<Account> getAllAccount();











    void addAccountDetail(int accountId, AccountDetail accountDetail);



    List<AccountDetail> getVipAccountDetail();

    List<AccountDetail> getMostRented();

    List<AccountDetail> getMostView();

    List<AccountDetail> getNewAccount();





    List<AccountDetail> getManAccount();

    List<AccountDetail> getWomenAccount();

    List<AccountDetail> getAddressAccount(String city);

    AccountDetail getAccountDetailByAccountId(int accountId);


    List<Account> getAllRoles(String roleName);

    List<Account> getAllAccountStatus(String status) throws SQLException;




    void updateAccountDetailByAccountId(String dateOfBirth, String fullName, String gender, String city, String nationality, String avatar, String portrait, String portrait1, String portrait2, String height, String weight, String interest, String describeYourself, String regulations, String facebook, String joinDate, int account_id);

    List<AccountDetail> searchByName(String search);

    List<Account> searchByAccountName(String search);
}
