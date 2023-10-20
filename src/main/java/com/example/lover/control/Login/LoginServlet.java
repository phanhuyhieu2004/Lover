package com.example.lover.control.Login;

import com.example.lover.dao.LoginDAO;
import com.example.lover.modal.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1;
    private LoginDAO loginDAO;

    public void init() {
        loginDAO = new LoginDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        Admin admin = new Admin();
        admin.setUserName(userName);
        admin.setPassword(password);

        try {
            if (loginDAO.validate(admin)) {
                HttpSession session = req.getSession();
                session.setAttribute("username", userName);
                resp.sendRedirect("loginsuccess.jsp");
            } else {
                HttpSession session = req.getSession();
                session.setAttribute("user", userName);
                resp.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);

        }
    }
}
