package com.example.lover2.control;



import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
//XỬ LÝ LOGIC PHẦN HIỂN THỊ THÔNG TIN TRONG TRANG THÔNG TIN CỦA TÀI KHOẢN
@WebServlet(name = "ServiceProviderInformation", urlPatterns = {"/serviceProviderInformation"})

public class ServiceProviderInformation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int account_id = account.getAccountDetail().getAccount_id();
//Lấy id tài khoản đang đăng nhập truyền vào phương thức để lấy ra thông tin của tài khoản trong bảng chi tiết thông tin
       AccountDetail accountDetail=accountDAO.getAccountDetailByAccountId(account_id);

        request.setAttribute("accountDetail", accountDetail);


        request.getRequestDispatcher("serviceProviderInformation.jsp").forward(request, response);
    }




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        //        Phương thức doGet được ghi đè để xử lý yêu cầu "GET" và chuyển hướng người dùng đến trang "register.jsp".
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        Phương thức doPost được ghi đè để xử lý yêu cầu "POST". Nó gọi phương thức processRequest để xử lý yêu cầu và trả về phản hồi tương ứng.
    }

}
