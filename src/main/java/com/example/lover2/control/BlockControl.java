package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

//XỬ LÝ LOGIC PHẦN CHẶN TÀI KHOẢN VÀ CẬP NHẬT TRẠNG THÁI THÀNH BLOCK TRONG GIAO DIỆN QUẢN LÝ TÀI KHOẢN
@WebServlet(name = "BlockControl", urlPatterns = {"/BlockAccountServlet"})
public class BlockControl extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        accountDAO.updateAccountStatus(id, "Block");


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
