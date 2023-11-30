package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//XỬ LÝ LOGIC PHẦN HIỂN THỊ THÔNG TIN TRÊN TRANG CÁ NHÂN CỦA TÀI KHOẢN ĐANG ĐĂNG NHẬP VÀO HỆ THỐNG

@WebServlet(name = "ProfilesControl", urlPatterns = {"/profiles"})
public class ProfilesControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int account_id = account.getAccountDetail().getAccount_id();
        AccountDAO accountDAO=new AccountDAO();
        AccountDetail profile=accountDAO.getAccountDetailByAccountId(account_id);
        request.setAttribute("profiles", profile);
        request.getRequestDispatcher("profiles.jsp").forward(request, response);


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