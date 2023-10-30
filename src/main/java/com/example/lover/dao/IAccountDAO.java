package com.example.lover.dao;

import com.example.lover.model.Account;

import java.sql.SQLException;
import java.util.List;

public interface IAccountDAO{

    // Phương thức kết nối đến cơ sở dữ liệu
    List<Account> getAllNormalUser();

    Account login(String userName, String password);


    Account checkAccountExist(String user);
    void addAccountTransaction(Account account, List<Integer> roles);

    List<Account> getAllUser();

    List<Account> getAllServiceProviders();
}