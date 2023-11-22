package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;
import com.example.lovers.model.Account;
import com.example.lovers.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "EditServiceProviderInformation.java", urlPatterns = {"/edit"})

public class EditServiceProviderInformation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String nationality = request.getParameter("nationality");
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String interest = request.getParameter("interest");
        String describeYourself = request.getParameter("describeYourself");
        String regulations = request.getParameter("regulations");
        String facebook = request.getParameter("facebook");
        String joinDate = request.getParameter("joinDate");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int account_id = account.getAccountDetail().getAccount_id();
      accountDAO.updateAccountDetailByAccountId(dateOfBirth,fullName,gender,city,nationality,height,weight,interest,describeYourself,regulations,facebook,joinDate,account_id);




        response.sendRedirect("login");;

    }






    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        // Phương thức doGet được ghi đè để xử lý yêu cầu "GET" và chuyển hướng người dùng đến trang "register.jsp".
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        // Phương thức doPost được ghi đè để xử lý yêu cầu "POST". Nó gọi phương thức processRequest để xử lý yêu cầu và trả về phản hồi tương ứng.
    }

}