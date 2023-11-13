package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServiceControl", urlPatterns = {"/service"})
public class ServiceControl extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] services = request.getParameterValues("services[]");

        List<Integer> serviceIds = new ArrayList<>();
        if (services != null) {
            for (String service : services) {
                if (service.equals("family")) {
                    serviceIds.add(1);
                } else if (service.equals("friends")) {
                    serviceIds.add(2);
                } else if (service.equals("travel")) {
                    serviceIds.add(3);
                } else if (service.equals("together")) {
                    serviceIds.add(4);
                } else if (service.equals("birthday")) {
                    serviceIds.add(5);
                } else if (service.equals("online")) {
                    serviceIds.add(6);
                } else if (service.equals("offline")) {
                    serviceIds.add(7);
                } else if (service.equals("Tet")) {
                    serviceIds.add(8);
                } else if (service.equals("holidays")) {
                    serviceIds.add(9);
                } else if (service.equals("hand")) {
                    serviceIds.add(10);
                } else if (service.equals("love")) {
                    serviceIds.add(11);
                } else if (service.equals("eyes")) {
                    serviceIds.add(12);
                } else if (service.equals("song")) {
                    serviceIds.add(13);
                } else if (service.equals("kiss")) {
                    serviceIds.add(14);
                } else if (service.equals("hug")) {
                    serviceIds.add(15);
                } else if (service.equals("childish")) {
                    serviceIds.add(16);
                } else if (service.equals("intimate")) {
                    serviceIds.add(17);
                } else if (service.equals("movie")) {
                    serviceIds.add(18);
                }
            }


        }
        HttpSession session = request.getSession();
        accountDAO.addAccountService(serviceIds,session);
        request.setAttribute("messSuccess", "Successfully registered for the service");
        request.getRequestDispatcher("service.jsp").forward(request, response);


    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("service.jsp").forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
