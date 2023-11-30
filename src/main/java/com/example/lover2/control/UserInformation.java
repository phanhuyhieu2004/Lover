package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//XỬ LÝ THÔNG TIN PHẦN HIỂN THỊ THÔNG TIN CỦA NGƯỜI DÙNG TRONG TRANG THÔNG TIN
@WebServlet(name = "UserInformation", urlPatterns = {"/userInformation"})
public class UserInformation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;
//    biến toàn cục của lớp SignUpControl dùng để thao tác,xử lý dữ liệu đối với tài khoản

    public void init() {
        accountDAO = new AccountDAO();
//        Nó tạo một đối tượng  mới của lớp AccountDAO và gán nó cho biến accountDAO để có thể sử dụng cho các hoạt động tương tác với cơ sở dữ liệu liên quan đến tài khoản.
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int account_id = account.getAccountDetail().getAccount_id();

        AccountDetail accountDetail=accountDAO.getAccountDetailByAccountId(account_id);

        request.setAttribute("accountDetail", accountDetail);

        request.getRequestDispatcher("userInformation.jsp").forward(request, response);

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