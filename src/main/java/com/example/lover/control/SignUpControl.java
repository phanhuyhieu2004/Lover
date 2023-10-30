package com.example.lover.control;

import com.example.lover.dao.AccountDAO;
import com.example.lover.model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SignUpControl", urlPatterns = {"/signup"})
public class SignUpControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accountName = request.getParameter("accountName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String identifyCard = request.getParameter("identifyCard");
        String surname = request.getParameter("surname");
        String name = request.getParameter("name");
        String nickName = request.getParameter("nickName");

        String role_service = request.getParameter("role_service");
        String role_user = request.getParameter("role_user");
        Account newUser = new Account();
        List<Integer> roles = new ArrayList<>();
        if (role_service != null) {
            roles.add(2);
        }
        if (role_user != null) {
            roles.add(3);
        }

        newUser.setAccountName(accountName);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setIdentifyCard(identifyCard);
        newUser.setSurname(surname);
        newUser.setName(name);
        newUser.setNickName(nickName);
//        set từng thuộc tính cho đối tượng mới newUser là để gán giá trị từ các biến đã nhận được từ request vào các thuộc tính tương ứng của đối tượng.
//        accountDAO.addAccountTransaction(newUser, roles);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//        dispatcher.forward(request, response);
        Account a = accountDAO.checkAccountExist(accountName);
        if(a == null){
            //dc signup
            accountDAO.addAccountTransaction(newUser,roles);
            request.setAttribute("messSuccess", "register success,click login now");

            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else{
            request.setAttribute("messWarning", "accountName already exists");

            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}