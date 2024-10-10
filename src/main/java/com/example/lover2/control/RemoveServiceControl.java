package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.ServiceCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "RemoveServiceControl", urlPatterns = {"/removeService"})

public class RemoveServiceControl extends HttpServlet {

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Lấy accountId từ session
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int accountId = account.getAccountDetail().getAccount_id();

        // Lấy serviceCategoryId từ request (được gửi từ form khi nhấn nút xóa)
        int serviceCategoryId = Integer.parseInt(request.getParameter("serviceCategoryId"));

        // Gọi phương thức xóa dịch vụ
        accountDAO.removeService(accountId, serviceCategoryId);

        // Sau khi xóa thành công, chuyển hướng lại trang danh sách dịch vụ
        response.sendRedirect("accountService");

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
