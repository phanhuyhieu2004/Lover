package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchAccountControl", urlPatterns = {"/searchAccount"})
public class SearchAccountControl extends HttpServlet {
//XỬ LÝ PHẦN TÌM KIẾM TÊN ĐĂNG NHẬP TRONG TRANG QUẢN LÝ CỦA ADMIN
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }
    protected void getRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("searchFullName");

        List<Account> listAccountRole = accountDAO.searchByAccountName(search);

        request.setAttribute("searchFullName", search);
        request.setAttribute("listAccountRole", listAccountRole);
        request.getRequestDispatcher("managers.jsp").forward(request, response);
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getRequest(request, response);
    }
}