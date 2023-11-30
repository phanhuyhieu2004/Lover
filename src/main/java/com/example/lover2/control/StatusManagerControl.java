package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
//XỬ LÝ LOGIC PHẦN HIỂN THỊ DANH SÁCH CÁC TÀI KHOẢN THEO TRẠNG THÁI
@WebServlet(name = "StatusManagerControl", urlPatterns = {"/listStatus"})
public class StatusManagerControl extends HttpServlet {

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

     ;
        String status=request.getParameter("optionList");

        List<Account> listStatus;



        request.setAttribute("select", status);
        if (status == null){
            listStatus = accountDAO.getAllAccountStatus("Active");
        }else {
            listStatus = accountDAO.getAllAccountStatus(status);

        }
        request.setAttribute("listStatus",listStatus);


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
