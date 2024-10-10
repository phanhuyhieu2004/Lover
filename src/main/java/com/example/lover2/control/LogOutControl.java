package com.example.lover2.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
//XỬ LÝ ĐĂNG XUẤT
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