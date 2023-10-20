package com.example.lover.control.register;

import com.example.lover.dao.RegisterDAO;
import com.example.lover.modal.Admin;
import com.example.lover.modal.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.concurrent.CancellationException;

@WebServlet(name = "RegisterServlet", value = "/register-servlet")

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1;
    private RegisterDAO registerDAO;

    @Override
    public void init() throws ServletException {
        registerDAO = new RegisterDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String email = req.getParameter("email");
        String passWord = req.getParameter("password");

        User user = new User();
        user.setUserName(userName);
        user.setEmail(email);
        user.setPassword(passWord);
        try {
            if (registerDAO.validate(user)) {
                HttpSession session = req.getSession();
                session.setAttribute("username", userName);
                resp.sendRedirect("register.jsp");
            }else {
                HttpSession session = req.getSession();
                session.setAttribute("username", userName);
                resp.sendRedirect("registersuccess.jsp");
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}