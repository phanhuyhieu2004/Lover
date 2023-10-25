package com.example.lover.dao;

import com.example.lover.model.Account;

import java.util.List;

public interface IAccountDAO{
    Account login(String userName, String password);


    Account checkAccountExist(String user);

    void addAccountTransaction(Account account, List<Integer> roles);

    List<Account> getAllUser();

    List<Account> getAllServiceProviders();
}
