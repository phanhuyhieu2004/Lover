package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControl", urlPatterns = {"/search"})
public class SearchControl extends HttpServlet {
//XỬ LÝ PHẦN TÌM KIẾM HỌ TÊN  TRONG TRANG CHỦ

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }
    protected void getRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String search = request.getParameter("searchFullName");

        List<AccountDetail> listAccountDetail = accountDAO.searchByName(search);

        request.setAttribute("searchFullName", search);
        request.setAttribute("listAccountDetail", listAccountDetail);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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