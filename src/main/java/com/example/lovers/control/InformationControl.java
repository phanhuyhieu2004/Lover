package com.example.lovers.control;

import com.example.lovers.dao.AccountDAO;
import com.example.lovers.model.Account;
import com.example.lovers.model.AccountDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "InformationControl", urlPatterns = {"/information"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 *20,
maxFileSize = 1024 *1024 *50,
maxRequestSize = 1024 * 1024 *50)
public class InformationControl extends HttpServlet {
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
        request.setCharacterEncoding("UTF-8");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String nationality = request.getParameter("nationality");
        String  portrait = request.getParameter("portrait");
        String  portrait1 = request.getParameter("portrait1");
        String  portrait2 = request.getParameter("portrait2");
        String  height= request.getParameter("height");
        String  weight= request.getParameter("weight");
        String  interest= request.getParameter("interest");
        String  describeYourself= request.getParameter("describeYourself");
        String  requestWithUser= request.getParameter("requestWithUser");
        String  facebook= request.getParameter("facebook");
        String  joinDate= request.getParameter("joinDate");
        String  price= request.getParameter("price");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int account_id = account.getIdAccount();


        Part filePath = request.getPart("image");
        String fileName = extractFileName(filePath);
        filePath.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);

        String avatar = "/fileImage/" + fileName;


// Sử dụng giá trị accountId để lưu vào bảng Account Detail
        AccountDetail newAccountDetail = new AccountDetail();
        newAccountDetail.setDateOfBirth(dateOfBirth);
        newAccountDetail.setFullName(fullName);
        newAccountDetail.setGender(gender);
        newAccountDetail.setCity(city);
        newAccountDetail.setNationality(nationality);
        newAccountDetail.setAvatar(avatar);
        newAccountDetail.setPortrait(portrait);
        newAccountDetail.setPortrait1(portrait1);
        newAccountDetail.setPortrait2(portrait2);
        newAccountDetail.setHeight(height);
        newAccountDetail.setWeight(weight);
        newAccountDetail.setInterest(interest);
        newAccountDetail.setDescribeYourself(describeYourself);
        newAccountDetail.setRequestWithUser(requestWithUser);
        newAccountDetail.setFacebook(facebook);
        newAccountDetail.setJoinDate(joinDate);
        newAccountDetail.setAccount_id(account_id);
        newAccountDetail.setPrice(price);
        accountDAO.addAccountDetail(newAccountDetail);;
        request.setAttribute("messSuccess", "Successfully registered for the service");

        request.getRequestDispatcher("information.jsp").forward(request, response);
    }

    private String extractFileName(Part filePath) {
        String contentDisp = filePath.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items){
            if (s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload(){
        File folderUpload = new File(System.getProperty("user.home") + "/IdeaProjects/Lovers/src/main/webapp/fileImage");
        if (!folderUpload.exists()){
            folderUpload.mkdirs();
        }
        return folderUpload;
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("information.jsp").forward(request, response);
//        Phương thức doGet được ghi đè để xử lý yêu cầu "GET" và chuyển hướng người dùng đến trang "register.jsp".
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        Phương thức doPost được ghi đè để xử lý yêu cầu "POST". Nó gọi phương thức processRequest để xử lý yêu cầu và trả về phản hồi tương ứng.
    }

}
