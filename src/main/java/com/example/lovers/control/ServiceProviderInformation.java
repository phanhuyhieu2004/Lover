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

@WebServlet(name = "ServiceProviderInformation", urlPatterns = {"/serviceProviderInformation"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 20,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 50)
public class ServiceProviderInformation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
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
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String interest = request.getParameter("interest");
        String describeYourself = request.getParameter("describeYourself");
        String regulations = request.getParameter("regulations");
        String facebook = request.getParameter("facebook");
        String joinDate = request.getParameter("joinDate");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int account_id = account.getIdAccount();

        Part filePath = request.getPart("image");
        String fileName = extractFileName(filePath);
        filePath.write(getFolderUpload().getAbsolutePath() + File.separator + fileName);

        String avatar = "/fileImage/" + fileName;
        AccountDetail newAccountDetail = new AccountDetail();
        newAccountDetail.setDateOfBirth(dateOfBirth);
        newAccountDetail.setFullName(fullName);
        newAccountDetail.setGender(gender);
        newAccountDetail.setCity(city);
        newAccountDetail.setNationality(nationality);
        newAccountDetail.setAvatar(avatar);
        newAccountDetail.setHeight(height);
        newAccountDetail.setWeight(weight);
        newAccountDetail.setInterest(interest);
        newAccountDetail.setDescribeYourself(describeYourself);
        newAccountDetail.setRegulations(regulations);
        newAccountDetail.setFacebook(facebook);
        newAccountDetail.setJoinDate(joinDate);
        newAccountDetail.setAccount_id(account_id);
     accountDAO.addAccountDetail(newAccountDetail);
        request.setAttribute("messSuccess", "Successfully registered for the service");

        request.getRequestDispatcher("serviceProviderInformation.jsp").forward(request, response);
    }

    private String extractFileName(Part filePath) {
        String contentDisp = filePath.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        String uploadPath = getServletContext().getRealPath("/") + File.separator + "fileImage";
        File folderUpload = new File(uploadPath);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("serviceProviderInformation.jsp").forward(request, response);
//        Phương thức doGet được ghi đè để xử lý yêu cầu "GET" và chuyển hướng người dùng đến trang "register.jsp".
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
//        Phương thức doPost được ghi đè để xử lý yêu cầu "POST". Nó gọi phương thức processRequest để xử lý yêu cầu và trả về phản hồi tương ứng.
    }

}
