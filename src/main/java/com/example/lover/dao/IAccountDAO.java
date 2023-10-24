package com.example.lover.dao;

import com.example.lover.model.Account;

import java.util.List;

public interface IAccountDAO{

  // Phương thức kết nối đến cơ sở dữ liệu

  List<Account> selectAllUsers();
  List<Account> selectUser();
    Account login(String userName, String password);
}
