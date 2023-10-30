package com.example.lover.control;

import com.example.lover.dao.AccountDAO;
import com.example.lover.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name= "ListNormalUserController" , urlPatterns = "/listNormalUser")
public class ListUser extends HttpServlet {

    private AccountDAO accountDAO;
    public void init(){
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        List<Account> listNormalUser = accountDAO.getAllNormalUser();


// Tiếp tục xử lý danh sách và truyền cho JSP

        request.setAttribute("ListNormalUser", listNormalUser);

        request.getRequestDispatcher("normalUser.jsp").forward(request, response);

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
