package com.example.lovers.dao;


import com.example.lovers.model.Account;
import com.example.lovers.model.AccountDetail;
import com.example.lovers.model.Service;


import javax.servlet.http.HttpSession;

import java.util.List;

// định nghĩa các phương thức mà một đối tượng DAO  cho Account cần triển khai.
public interface IAccountDAO {
    Account login(String userName, String password);


    void addAccountServices(List<Integer> serviceIds, HttpSession session);


    void addAccountService(int idService, HttpSession session);

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


    void addService(Service service);

    void addAccountDetail(AccountDetail accountDetail);

    List<AccountDetail> getAllAccountDetails();


    List<AccountDetail> getMostRented();

    List<AccountDetail> getMostView();

    List<AccountDetail> getNewAccount();

    List<AccountDetail> getManAccount();

    List<AccountDetail> getWomenAccount();

}
