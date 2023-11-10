package com.example.lovers.control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//xử lý đăng xuất
@WebServlet(name = "LogOutControl", urlPatterns = {"/logout"})
public class LogOutControl extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        Lấy đối tượng HttpSession từ yêu cầu hiện tại.
        HttpSession session = request.getSession();
        session.removeAttribute("acc");
//        Xóa thuộc tính "acc" khỏi đối tượng,chính là tài khoản đang đăng nhập
        response.sendRedirect("/login");
//        chuyển hướng về home.jsp,lúc này tài khoản đã đăng xuất
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