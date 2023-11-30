package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//XỬ LÝ LOGIC PHẦN CHẶN TÀI KHOẢN VÀ CẬP NHẬT TRẠNG THÁI THÀNH BLOCK TRONG GIAO DIỆN QUẢN LÝ TRẠNG THÁI TÀI KHOẢN

@WebServlet(name = "BlockStatusControl", urlPatterns = {"/BlockStatusServlet"})
public class BlockStatusControl extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        // Cập nhật trạng thái của tài khoản trong database
        accountDAO.updateAccountStatus(id, "Block");


        request.getRequestDispatcher("status.jsp").forward(request, response);


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
    }}