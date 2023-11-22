package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;
import com.example.lovers.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProfileControl", urlPatterns = {"/profile"})
public class ProfileControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int account_id = Integer.parseInt(request.getParameter("aid"));
        AccountDAO accountDAO=new AccountDAO();
        AccountDetail profile=accountDAO.getAccountDetailByAccountId(account_id);
        request.setAttribute("profile", profile);
        request.getRequestDispatcher("profile.jsp").forward(request, response);


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