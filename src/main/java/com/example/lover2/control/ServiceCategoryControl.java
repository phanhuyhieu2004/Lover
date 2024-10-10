package com.example.lover2.control;

import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServiceCategoryControl", urlPatterns = {"/serviceCategory"})
public class ServiceCategoryControl extends HttpServlet {

    private final AccountDAO accountDAO = new AccountDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int accountId = account.getAccountDetail().getAccount_id();
        String[] selectedServices = request.getParameterValues("services[]");

        if (selectedServices != null) {
            List<Integer> serviceIds = new ArrayList<>();
            List<Integer> alreadyAddedServices = new ArrayList<>();

            for (String service : selectedServices) {
                int serviceId;
                switch (service) {
                    case "family":
                        serviceId = 1;
                        break;
                    case "friends":
                        serviceId = 2;
                        break;
                    case "travel":
                        serviceId = 3;
                        break;
                        case "together":
                        serviceId = 4;
                        break; case "birthday":
                        serviceId = 5;
                        break; case "online":
                        serviceId = 6;
                        break; case "offline":
                        serviceId = 7;
                        break; case "Tet":
                        serviceId = 8;
                        break;
                        case "holidays":
                        serviceId = 9;
                        break;

                    default:
                        serviceId = 0;
                }

                if (serviceId != 0) {
                    if (accountDAO.isServiceAlreadyAdded(accountId, serviceId)) {
                        alreadyAddedServices.add(serviceId);
                    } else {
                        serviceIds.add(serviceId);
                    }
                }
            }

            if (!serviceIds.isEmpty()) {
                accountDAO.addServices(accountId, serviceIds);
                request.setAttribute("messSuccess", "Registered service successfully!");
            }

            if (!alreadyAddedServices.isEmpty()) {
                request.setAttribute("messWarning", "The following services have been registered:: " + alreadyAddedServices.toString());
            }

            if (serviceIds.isEmpty() && alreadyAddedServices.isEmpty()) {
                request.setAttribute("messSuccess", "No services selected.");
            }
        } else {
            request.setAttribute("messSuccess", "No services selected.");
        }

        request.getRequestDispatcher("serviceCategory.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("serviceCategory.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
