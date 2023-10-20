package com.example.lover.dao;

import com.example.lover.modal.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginDAO {
    public boolean validate (Admin admin ) throws ClassNotFoundException, SQLException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?user=root" , "root" , "gabynexo221")){
            List<Admin> adminList = new ArrayList<>();

          Statement statement = connection.createStatement();
              ResultSet resultSet = statement.executeQuery("select * from admin where userName = '"+ admin.getUserName() + "'");
           while (resultSet.next()) {
               int id = resultSet.getInt("idAdim");
               String userName = resultSet.getString("userName");
               String password = resultSet.getString("password");
               int permission = resultSet.getInt("permission");
               Admin admin1 = new Admin(id , userName , password , permission);
               adminList.add(admin1);
        }
         for (Admin admin1 : adminList){
             if (admin.getUserName().equals(admin1.getUserName())){
                 if (admin.getPassword().equals(admin1.getPassword())){
                     return true;
                 }
             }
         }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return status;
    }
}
