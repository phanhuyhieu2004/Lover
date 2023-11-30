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
import java.util.List;
//XỬ LÝ LOGIC PHẦN TRANG CHỦ

@WebServlet(name = "HomeControl", urlPatterns = {"/home"})
public class HomeControl extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List<AccountDetail> listAccountDetail = accountDAO.getVipAccountDetail();
        List<AccountDetail> listAccountRentals = accountDAO.getMostRented();
        List<AccountDetail> listAccountViews = accountDAO.getMostView();
        List<AccountDetail> listNewAccount = accountDAO.getNewAccount();
        List<AccountDetail> listManAccount = accountDAO.getManAccount();
        List<AccountDetail> listWomenAccount = accountDAO.getWomenAccount();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        String city = account.getAccountDetail().getCity();
        List<AccountDetail> listAddressAccount = accountDAO.getAddressAccount(city);



        request.setAttribute("listAccountDetail", listAccountDetail);
        request.setAttribute("listAccountRentals", listAccountRentals);
        request.setAttribute("listAccountViews",listAccountViews);
        request.setAttribute("listNewAccount",listNewAccount);
        request.setAttribute("listManAccount",listManAccount);
        request.setAttribute("listWomenAccount",listWomenAccount);
        request.setAttribute("listAddressAccount",listAddressAccount);




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
