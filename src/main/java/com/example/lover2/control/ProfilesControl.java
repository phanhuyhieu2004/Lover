package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;

import com.example.lover2.model.ServiceCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
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
        List<ServiceCategory> services = accountDAO.getServicesByAccountId(account_id);

        request.setAttribute("services", services);
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