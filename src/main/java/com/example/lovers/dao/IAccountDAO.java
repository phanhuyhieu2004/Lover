package com.example.lovers.dao;


import com.example.lovers.model.Account;
import com.example.lovers.model.AccountDetail;

import java.sql.SQLException;
import java.util.List;
// định nghĩa các phương thức mà một đối tượng DAO  cho Account cần triển khai.
public interface IAccountDAO {
    Account login(String userName, String password);


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


//    void addAccountDetail(AccountDetail accountDetail);

    void addAccountDetail(AccountDetail accountDetail);

    List<AccountDetail> getAllAccountDetails();
}
