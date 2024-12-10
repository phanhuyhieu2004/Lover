package com.example.lover2.control;


import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;
import com.example.lover2.model.Role;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
//XỬ LÝ LOGIC PHẦN SỬA THÔNG TIN TÀI KHOẢN

@WebServlet(name = "EditUserInformation", urlPatterns = {"/editUser"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 *600,
        maxFileSize = 1024 *1024 *600,
        maxRequestSize = 1024 * 1024 *600)
public class    EditUserInformation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            // Lấy thông tin từ request
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

            int depositMoney= Integer.parseInt(request.getParameter("depositMoney"));
            String priceStr = request.getParameter("price");
            int price = 0; // Hoặc giá trị mặc định khác bạn muốn
            if (priceStr != null && !priceStr.isEmpty()) {
                price = Integer.parseInt(priceStr);
            }
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            int account_id = account.getAccountDetail().getAccount_id();

            // Kiểm tra và gán giá trị nếu không có tệp tải lên (filePath)
            Part filePath = request.getPart("image");
            String avatar = account.getAccountDetail().getAvatar(); // Lấy avatar hiện tại
            if (filePath != null && filePath.getSize() > 0) {
                String fileName = extractFileName(filePath);
                if (fileName != null && !fileName.isEmpty()) {
                    String uploadDirectory = getServletContext().getRealPath("") + File.separator + "fileImage";
                    filePath.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);

                    // Lưu tệp đã tải lên vào thư mục
                    filePath.write(uploadDirectory + File.separator + fileName);
                    avatar = "/fileImage/" + fileName;
                }
            } else {
                avatar = (avatar != null && !avatar.isEmpty()) ? avatar : "/fileImage/default-avatar.png";
            }

            Part portraitFile = request.getPart("portrait");
            String portrait = account.getAccountDetail().getPortrait();
            if (portraitFile != null && portraitFile.getSize() > 0) {
                String portraitFileName = extractFileName(portraitFile);
                if (portraitFileName != null && !portraitFileName.isEmpty()) {
                    String portraitUploadDirectory = getServletContext().getRealPath("") + File.separator + "fileImage";
                    portraitFile.write(this.getFolderUpload().getAbsolutePath() + File.separator + portraitFileName);
                    portrait = "/fileImage/" + portraitFileName;
                }
            } else {
                // Nếu không có tệp, gán portrait hiện tại hoặc giá trị mặc định
                portrait = (portrait != null && !portrait.isEmpty()) ? portrait : "/fileImage/default-portrait.png";
            }

// Kiểm tra và gán giá trị cho portraitFile1
            Part portraitFile1 = request.getPart("portrait1");
            String portrait1 = account.getAccountDetail().getPortrait1(); // Lấy portrait1 hiện tại
            if (portraitFile1 != null && portraitFile1.getSize() > 0) {
                String portraitFileName1 = extractFileName(portraitFile1);
                if (portraitFileName1 != null && !portraitFileName1.isEmpty()) {
                    String portraitUploadDirectory1 = getServletContext().getRealPath("") + File.separator + "fileImage";
                    portraitFile1.write(this.getFolderUpload().getAbsolutePath() + File.separator + portraitFileName1);
                    portrait1 = "/fileImage/" + portraitFileName1;
                }
            } else {
                // Nếu không có tệp, gán portrait1 hiện tại hoặc giá trị mặc định
                portrait1 = (portrait1 != null && !portrait1.isEmpty()) ? portrait1 : "/fileImage/default-portrait1.png";
            }

// Kiểm tra và gán giá trị cho portraitFile2
            Part portraitFile2 = request.getPart("portrait2");
            String portrait2 = account.getAccountDetail().getPortrait2(); // Lấy portrait2 hiện tại
            if (portraitFile2 != null && portraitFile2.getSize() > 0) {
                String portraitFileName2 = extractFileName(portraitFile2);
                if (portraitFileName2 != null && !portraitFileName2.isEmpty()) {
                    String portraitUploadDirectory2 = getServletContext().getRealPath("") + File.separator + "fileImage";
                    portraitFile2.write(this.getFolderUpload().getAbsolutePath() + File.separator + portraitFileName2);
                    portrait2 = "/fileImage/" + portraitFileName2;
                }
            } else {
                // Nếu không có tệp, gán portrait2 hiện tại hoặc giá trị mặc định
                portrait2 = (portrait2 != null && !portrait2.isEmpty()) ? portrait2 : "/fileImage/default-portrait2.png";
            }

// Kiểm tra tương tự cho portraitFile1 và portraitFile2

            // Cập nhật thông tin tài khoản và chi tiết tài khoản
            account.getAccountDetail().setGender(gender);
            account.getAccountDetail().setCity(city);
            account.getAccountDetail().setAvatar(avatar);
            account.getAccountDetail().setPortrait(portrait);
            account.getAccountDetail().setPortrait1(portrait1);
            account.getAccountDetail().setPortrait2(portrait2);
            account.getAccountDetail().setPrice(price);
            account.getAccountDetail().setDepositMoney(depositMoney);
//            Thiết lập các giá trị cho các thuộc tính của đối tượng AccountDetail trong đối tượng account. Các giá trị này được lấy từ các biến ,ý là nếu có cập nhật ở phần nào thì sẽ lấy giá trị của phần đó thêm vào cho đối tượng account.
//
//            gender, city, avatar, portrait, portrait1, portrait2 là các giá trị được truyền vào từ các biến đã được khai báo và nếu có cập nhật thì sẽ lấy giá trị vào thuộc tính AccountDetail của đối tượng Account
            session.setAttribute("acc", account);
//            cập nhật session mới đã chứa thông tin của các gi trị vừa thay đổi
            accountDAO.updateAccountDetailByAccountId(dateOfBirth, fullName, gender, city, nationality, avatar,portrait,portrait1,portrait2, height, weight, interest, describeYourself, regulations, facebook, joinDate,price,depositMoney,account_id);

            response.sendRedirect("userInformation?success=true");
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            // Xử lý lỗi và gửi trả lỗi về cho người dùng
            response.getWriter().println("Có lỗi xảy ra: " + e.getMessage());
        }
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
        File folderUpload = new File("D:\\Lover\\src\\main\\webapp\\fileImage");
        if (!folderUpload.exists()){
            folderUpload.mkdirs();
        }
        return folderUpload;
    }





    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("userInformation");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}