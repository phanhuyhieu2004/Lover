package com.example.lover.control;

import com.example.lover.dao.AccountDAO;
import com.example.lover.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LogInControl extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accountName = request.getParameter("account");
        String password = request.getParameter("pass");
        AccountDAO dao = new AccountDAO();
        Account a = dao.login(accountName, password);
//        TRUYỀN user/pass vaào login

        if (a == null) {
            request.setAttribute("mess", "Wrong login name or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
//            nếu lỗi thì sẽ phải login lại
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            session.setMaxInactiveInterval(10000);
            response.sendRedirect("home.jsp");
//            Đẩy về con servlet home
        }

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}