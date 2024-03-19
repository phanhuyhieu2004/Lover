package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FilterControl", urlPatterns = {"/filterAndSearch"})
public class FilterControl extends HttpServlet {

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String roleName = request.getParameter("roleList");
        String status = request.getParameter("optionList");
        String search = request.getParameter("searchFullName");
//        if (search == null || search.trim().isEmpty()) {
//            request.setAttribute("error", "No characters were entered, please enter again");
//            request.getRequestDispatcher("managers.jsp").forward(request, response);
//            return;
//        }

        List<Account> filteredAccounts = accountDAO.filterAccounts(roleName, status, search);

        request.setAttribute("select", roleName);
        request.setAttribute("selects", status);
        request.setAttribute("searchFullName", search);
        request.setAttribute("listAccountRole", filteredAccounts);
        request.getRequestDispatcher("managers.jsp").forward(request, response);
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
