package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;
import com.example.lovers.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
// xử lý chức năng đăng ký
@WebServlet(name = "RegisterControl", urlPatterns = {"/register"})
public class RegisterControl extends HttpServlet {
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
        String accountName = request.getParameter("accountName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String identifyCard = request.getParameter("identifyCard");
        String surname = request.getParameter("surname");
        String name = request.getParameter("name");
        String nickName = request.getParameter("nickName");

        String role = request.getParameter("role");
//        lấy giá trị của các tham số từ yêu cầu bằng cách sử dụng phương thức request.getParameter. Các tham số này tương ứng với các ô trong  form đăng ký
        Account newUser = new Account();
        List<Integer> roles = new ArrayList<>();
        if (role != null) {
            if (role.equals("service")) {
                roles.add(2); // Quyền cho dịch vụ
            } else if (role.equals("user")) {
                roles.add(3); // Quyền cho người dùng
            }
        }
//        kiểm tra xem các checkbox cho "role_service" và "role_user" có được chọn hay không bằng cách kiểm tra giá trị của các tham số tương ứng. Nếu checkbox được chọn, chúng ta thêm giá trị tương ứng của vai trò vào danh sách roles.

        newUser.setAccountName(accountName);
        newUser.setPassword(password);
        newUser.setEmail(email);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setIdentifyCard(identifyCard);
        newUser.setSurname(surname);
        newUser.setName(name);
        newUser.setNickName(nickName);
//        tạo một đối tượng newUser từ lớp Account và gán các giá trị đã lấy từ yêu cầu vào các thuộc tính tương ứng của newUser.
//        set từng thuộc tính cho đối tượng mới newUser là để gán giá trị từ các biến đã nhận được từ request vào các thuộc tính tương ứng của đối tượng.
;
        Account a = accountDAO.checkAccountExist(accountName);
//        kiểm tra xem tài khoản đã tồn tại trong cơ sở dữ liệu chưa bằng cách gọi phương thức checkAccountExist của đối tượng accountDAO
        if(a == null){
            //dc signup
            accountDAO.addAccountTransaction(newUser,roles);
            request.setAttribute("messSuccess", "register success,click login now");

            request.getRequestDispatcher("register.jsp").forward(request, response);
//            Nếu tài khoản không tồn tại, tức là có thể đăng ký, chúng ta gọi phương thức addAccountTransaction của accountDAO để thêm tài khoản mới và gán các vai trò tương ứng.Sau đó phải chuyển hướng lại trang register.jsp để thông báo thành công
        }else{
            request.setAttribute("messWarning", "accountName already exists");

            request.getRequestDispatcher("register.jsp").forward(request, response);
//            Nếu tài khoản đã tồn tại, chúng ta đặt thông báo lỗi "accountName already exists" vào thuộc tính "messWarning" của yêu cầu và chuyển hướng người dùng đến trang "register.jsp" để hiển thị thông báo lỗi.
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
//        Phương thức doGet được ghi đè để xử lý yêu cầu "GET" và chuyển hướng người dùng đến trang "register.jsp".
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        Phương thức doPost được ghi đè để xử lý yêu cầu "POST". Nó gọi phương thức processRequest để xử lý yêu cầu và trả về phản hồi tương ứng.
    }

}