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

@WebServlet(name = "AddMoneyControl", urlPatterns = {"/addMoney"})

public class AddMoneyControl  extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String moneyValue = request.getParameter("moneyDenomination");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");

        if (moneyValue != null && !moneyValue.isEmpty() ) {
            try {
                int depositMoney = Integer.parseInt(moneyValue);
                int accountId = account.getAccountDetail().getAccount_id();
                AccountDetail accountDetail=accountDAO.getAccountDetailByAccountId(accountId);

                AccountDAO accountDAO = new AccountDAO();
                boolean isUpdated = accountDAO.addDepositMoney(accountId, depositMoney);

                if (isUpdated) {
                    request.setAttribute("accountDetail", accountDetail);

                    request.setAttribute("message", "Update money successfully!");
                } else {
                    request.setAttribute("error", "Money update failed!");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid data!");
            }
        } else {
            request.setAttribute("error", "Please select denomination and provide account ID.");
        }

       response.sendRedirect("addMoney");



    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int accountId = account.getAccountDetail().getAccount_id(); // Lấy ID tài khoản

        AccountDetail accountDetail=accountDAO.getAccountDetailByAccountId(accountId);

        request.setAttribute("accountDetail", accountDetail);

        request.getRequestDispatcher("recharge.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
