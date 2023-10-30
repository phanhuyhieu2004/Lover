package com.example.lover.control;

import com.example.lover.dao.AccountDAO;
import com.example.lover.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListAccountControl", urlPatterns = {"/listAccount"})
public class ListAccountControl extends HttpServlet {

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<Account> listUser = accountDAO.getAllUser();

        List<Account> listServiceProviders = accountDAO.getAllServiceProviders();
        List<Account> listAllAccount = accountDAO.getAllAccount();




// Tiếp tục xử lý danh sách và truyền cho JSP
        request.setAttribute("listUser", listUser);


        request.setAttribute("listServiceProviders", listServiceProviders);
        request.setAttribute("listAllAccount", listAllAccount);

        request.getRequestDispatcher("manager.jsp").forward(request, response);
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
