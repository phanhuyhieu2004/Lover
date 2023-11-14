package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;
import com.example.lovers.model.AccountDetail;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DisplayServiceProviderController", value = "/homePage.jsp")
public class DisplayServiceProviderControl extends HttpServlet {
    AccountDAO dao = new AccountDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<AccountDetail> listAccountToShow = dao.getAccountDetails();
        req.setAttribute("listAccountToShow",listAccountToShow);
        req.getRequestDispatcher("home.jsp").forward(req,resp);
    }
}
