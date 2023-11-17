package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;
import com.example.lovers.model.Account;
import com.example.lovers.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
        String dateOfBirth = request.getParameter("dateOfBirth");
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String nationality = request.getParameter("nationality");
        String avatar = request.getParameter("image");


        String interest = request.getParameter("interest");


        String facebook = request.getParameter("facebook");
        String joinDate = request.getParameter("joinDate");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int account_id = account.getIdAccount();
// Sử dụng giá trị accountId để lưu vào bảng Account Detail
        AccountDetail newAccountDetail = new AccountDetail();
        newAccountDetail.setDateOfBirth(dateOfBirth);
        newAccountDetail.setFullName(fullName);
        newAccountDetail.setGender(gender);
        newAccountDetail.setCity(city);
        newAccountDetail.setNationality(nationality);
        newAccountDetail.setAvatar(avatar);


        newAccountDetail.setInterest(interest);


        newAccountDetail.setFacebook(facebook);
        newAccountDetail.setJoinDate(joinDate);
        newAccountDetail.setAccount_id(account_id);

        accountDAO.addAccountDetail(newAccountDetail);
        request.setAttribute("messSuccess", "Successfully registered for the service");

        request.getRequestDispatcher("userInformation.jsp").forward(request, response);

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("userInformation.jsp").forward(request, response);
//        Phương thức doGet được ghi đè để xử lý yêu cầu "GET" và chuyển hướng người dùng đến trang "register.jsp".
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        Phương thức doPost được ghi đè để xử lý yêu cầu "POST". Nó gọi phương thức processRequest để xử lý yêu cầu và trả về phản hồi tương ứng.
    }

}