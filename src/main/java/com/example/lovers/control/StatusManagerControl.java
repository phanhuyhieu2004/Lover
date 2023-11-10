package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;
import com.example.lovers.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StatusManagerControl", urlPatterns = {"/status"})
public class StatusManagerControl extends HttpServlet {

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

     ;
        List<Account> listAccountBlock = accountDAO.getAllAccountBlock();
        List<Account> listAccountActive = accountDAO.getAllAccountActive();
        List<Account> listAccountVip = accountDAO.getAllAccountVip();
        List<Account> listAccountInactive = accountDAO.getAllAccountInactive();

//        Sử dụng đối tượng accountDAO để lấy danh sách tất cả người dùng, nhà cung cấp dịch vụ và tất cả tài khoản từ nguồn dữ liệu. Kết quả được lưu trữ trong các danh sách listUser, listServiceProviders và listAllAccount.


// Tiếp tục xử lý danh sách và truyền cho JSP

        request.setAttribute("listAccountBlock", listAccountBlock);
        request.setAttribute("listAccountActive", listAccountActive);
        request.setAttribute("listAccountVip", listAccountVip);
        request.setAttribute("listAccountInactive",listAccountInactive);

        request.getRequestDispatcher("status.jsp").forward(request, response);
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
