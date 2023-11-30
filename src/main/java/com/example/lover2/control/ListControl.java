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
//XỬ LÝ LOGIC PHẦN QUẢN LÝ TÀI KHOẢN

@WebServlet(name = "ListControl", urlPatterns = {"/list"})
public class ListControl extends HttpServlet {

    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String roleName=request.getParameter("optionList");
//        lấy giá trị tham số có tên "optionList" từ yêu cầu request và gán cho biến roleName.
        List<Account> listAccountRole;



        request.setAttribute("select", roleName);
//        đặt thuộc tính "select" trong yêu cầu request thành giá trị của biến roleName.
        if (roleName == null){
            listAccountRole = accountDAO.getAllRoles("serviceProviders");
        } else if(roleName.equals("account")){
            listAccountRole= accountDAO.getAllAccount();
        }
        else {
            listAccountRole = accountDAO.getAllRoles(roleName);
        }
//        Nếu roleName là null, listAccountRole bằng kết quả của phương thức getAllServiceProviders("serviceProviders") từ đối tượng accountDAO.
//        Nếu roleName là "account", listAccountRole bằng kết quả của phương thức getAllAccount() từ đối tượng accountDAO.
//        Trong trường hợp khác, listAccountRole được bằng kết quả của phương thức getAllServiceProviders(roleName) từ đối tượng accountDAO.
//        Mặc định khi chưa chọn option thì sẽ hiển thị danh sách người CCDV,nếu chọn option thì sẽ hiển thị danh sách theo lựa chọn đó và lấy giá trị từ các option thành tham số để truyền vào các phương thức
        request.setAttribute("listAccountRole", listAccountRole);

        request.getRequestDispatcher("managers.jsp").forward(request, response);
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
