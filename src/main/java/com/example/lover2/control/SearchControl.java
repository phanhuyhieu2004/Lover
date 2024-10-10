package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.AccountDetail;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SearchControl", urlPatterns = {"/search"})
public class SearchControl extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void getRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("searchFullName");
        String gender = request.getParameter("gender");
        String ageCategory = request.getParameter("ageCategory");
        String view = request.getParameter("view");
        boolean online = request.getParameter("online") != null;
        String rentals = request.getParameter("rentals");
        String city = request.getParameter("city");

        List<AccountDetail> listAccountDetail = accountDAO.searchAccounts(fullName, gender, ageCategory, view, online, rentals, city);

        request.setAttribute("searchFullName", fullName);
        request.setAttribute("gender", gender);
        request.setAttribute("ageCategory", ageCategory);
        request.setAttribute("view", view);
        request.setAttribute("online", online);
        request.setAttribute("rentals", rentals);
        request.setAttribute("city", city);
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