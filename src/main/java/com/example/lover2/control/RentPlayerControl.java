package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "RentPlayerControl", urlPatterns = {"/rent"})

public class RentPlayerControl  extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int rentalHours = Integer.parseInt(request.getParameter("rentalHours"));
        int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));

        int accountId = account.getAccountDetail().getAccount_id();
        int playerId = Integer.parseInt(request.getParameter("idPlayer"));

        accountDAO.rentPlayer(playerId, accountId, rentalHours, totalAmount);

        AccountDetail profile=accountDAO.getAccountDetailByAccountId(accountId);

        int newBalance = profile.getDepositMoney() - totalAmount;
        profile.setDepositMoney(newBalance);
        accountDAO.updateAccountBalance(accountId, newBalance);
        session.setAttribute("rentalSuccess", "Hired successfully!");
        response.getWriter().write("Player rental processed.");
        response.sendRedirect("profile?aid=" + playerId);
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
