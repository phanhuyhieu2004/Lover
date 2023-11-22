package com.example.lovers.dao;


import com.example.lovers.model.Account;
import com.example.lovers.model.AccountDetail;


import javax.servlet.http.HttpSession;

import java.util.List;

// định nghĩa các phương thức mà một đối tượng DAO  cho Account cần triển khai.
public interface IAccountDAO {
    Account login(String userName, String password);


    void addAccountServices(List<Integer> serviceIds, HttpSession session);



    Account checkAccountExist(String account);

    void addAccountTransaction(Account account, List<Integer> roles);


    void updateAccountStatus(int id, String status);

    List<Account> getAllAccount();

    List<Account> getAllUser();

    List<Account> getAllServiceProviders();

    List<Account> getAllAccountBlock();

    List<Account> getAllAccountActive();

    List<Account> getAllAccountVip();

    List<Account> getAllAccountInactive();




    void addAccountDetail(int accountId, AccountDetail accountDetail);



    List<AccountDetail> getVipAccountDetail();

    List<AccountDetail> getMostRented();

    List<AccountDetail> getMostView();

    List<AccountDetail> getNewAccount();

    List<AccountDetail> getManAccount();

    List<AccountDetail> getWomenAccount();



    List<AccountDetail> getAddressAccount(String city);

    AccountDetail getAccountDetailByAccountId(int accountId);


    void updateAccountDetailByAccountId(String dateOfBirth, String fullName, String gender, String city, String nationality, String height, String weight, String interest, String describeYourself, String regulations, String facebook, String joinDate,int account_id);
}
