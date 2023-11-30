package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//XỬ LÝ LOGIC PHẦN ĐĂNG NHẬP

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LogInControl extends HttpServlet {





    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accountName = request.getParameter("account");
        String password = request.getParameter("pass");
        AccountDAO dao = new AccountDAO();
        Account a = dao.login(accountName, password);


        if (a == null) {
            // Kiểm tra giá trị của đối tượng Account trả về. Nếu a là null, tức là thông tin đăng nhập không chính xác, Servlet sẽ đặt thuộc tính "mess" cho yêu cầu và chuyển hướng nó đến trang "login.jsp" để hiển thị thông báo lỗi.
            request.setAttribute("mess", "Wrong Account name or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Kiểm tra trạng thái của tài khoản
            if (a.getStatus().equals("Block")) {
                // Tài khoản đã bị chặn, thông báo cho người dùng và chuyển hướng đến trang thông báo hoặc trang đăng nhập lại
                response.sendRedirect("block");
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("acc", a);

            session.setMaxInactiveInterval(1000);
            response.sendRedirect("home");
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