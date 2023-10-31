package com.example.lover.controller;

import com.example.lover.modal.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "RegisterServlet2" ,value = "/register" )
public class RegisterServlet2<function> extends HttpServlet {
    private String jdbcURL = "jdbc:mysql://localhost:3306/project?user=root";
    private String jdbcUsername = "root";
    private String jdbcPassword = "1";

    protected void doPost(HttpServletRequest request,  HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");
        String identifyCard = request.getParameter("identifyCard");
        String surname = request.getParameter("surname");
        String name  = request.getParameter("name");
        String nickName = request.getParameter("nickName");

         Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            String sql = "INSERT INTO account (userName, password, email, phoneNumber, identifyCard, surname, name, nickName) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, userName);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, phoneNumber);
            statement.setString(5, identifyCard);
            statement.setString(6, surname);
            statement.setString(7, name);
            statement.setString(8, nickName);
            statement.executeUpdate();
            statement.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        response.sendRedirect("registersuccess.jsp");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}
