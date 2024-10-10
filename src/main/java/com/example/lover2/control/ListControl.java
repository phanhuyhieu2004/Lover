package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
//XỬ LÝ LOGIC PHẦN QUẢN LÝ TÀI KHOẢN

@WebServlet(name = "ListControl", urlPatterns = {"/list"})
public class ListControl extends HttpServlet {

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String status = request.getParameter("status");
        String role = request.getParameter("role");

        String accountName = request.getParameter("nameSearch");

        List<Account> listAccount= accountDAO.searchAccountsManager(accountName,status,role);
        request.setAttribute("accountName", accountName);
        request.setAttribute("status", status);
        request.setAttribute("status", status);

        request.setAttribute("listAccount", listAccount);

        request.getRequestDispatcher("managers.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}