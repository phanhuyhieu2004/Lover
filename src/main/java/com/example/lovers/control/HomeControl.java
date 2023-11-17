package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;

import com.example.lovers.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<AccountDetail> listAccountDetail = accountDAO.getAllAccountDetails();
        List<AccountDetail> listAccountRentals = accountDAO.getMostRented();
        List<AccountDetail> listAccountViews = accountDAO.getMostView();
        List<AccountDetail> listNewAccount = accountDAO.getNewAccount();
        List<AccountDetail> listManAccount = accountDAO.getManAccount();
        List<AccountDetail> listWomenAccount = accountDAO.getWomenAccount();



        request.setAttribute("listAccountDetail", listAccountDetail);
        request.setAttribute("listAccountRentals", listAccountRentals);
        request.setAttribute("listAccountViews",listAccountViews);
        request.setAttribute("listNewAccount",listNewAccount);
        request.setAttribute("listManAccount",listManAccount);
        request.setAttribute("listWomenAccount",listWomenAccount);




        request.getRequestDispatcher("home.jsp").forward(request, response);
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
