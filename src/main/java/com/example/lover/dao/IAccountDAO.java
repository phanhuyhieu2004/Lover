package com.example.lover.dao;

import com.example.lover.model.Account;

public interface IAccountDAO{
    Account login(String userName, String password);
}
