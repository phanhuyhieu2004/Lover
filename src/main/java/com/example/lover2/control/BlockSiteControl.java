package com.example.lover2.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
//XỬ LÝ LOGIC PHẦN TÀI KHOẢN BỊ CHẶN SẼ KHÔNG ĐĂNG NHẬP ĐƯỢC VÀO TRANG CHỦ MÀ SẼ BỊ CHUYỂN ĐẾN TRANG THÔNG BÁO LÀ TÀI KHOẢN ĐÃ BỊ CHẶN

@WebServlet(name = "BlockSiteControl", urlPatterns = {"/block"})
public class BlockSiteControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher("block.jsp").forward(request, response);


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
