package com.example.lover2.control;


import com.example.lover2.dao.AccountDAO;
import com.example.lover2.model.Account;
import com.example.lover2.model.AccountDetail;
import com.example.lover2.model.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
//XỬ LÝ LOGIC PHẦN SỬA THÔNG TIN TÀI KHOẢN

@WebServlet(name = "EditServiceProviderInformation.java", urlPatterns = {"/edit"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 *600,
        maxFileSize = 1024 *1024 *600,
        maxRequestSize = 1024 * 1024 *600)
public class EditServiceProviderInformation extends HttpServlet {
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

            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("acc");
            int account_id = account.getAccountDetail().getAccount_id();

            // Kiểm tra xem có tệp tin ảnh đã tải lên hay không
            Part filePath = request.getPart("image");
            String fileName = extractFileName(filePath);
            String avatar = account.getAccountDetail().getAvatar(); // Giữ nguyên ảnh cũ
            if (fileName != null && !fileName.isEmpty()) {
                // Có tệp tin ảnh đã tải lên, tiến hành xử lý ảnh và cập nhật thông tin tài khoản
                String uploadDirectory = getServletContext().getRealPath("") + File.separator + "fileImage";
                filePath.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
                // Tạo thư mục tồn tại nếu chưa có
                File uploadDirectoryFile = new File(uploadDirectory);
                if (!uploadDirectoryFile.exists()) {
                    uploadDirectoryFile.mkdirs();
                }

                // Lưu tệp đã tải lên vào thư mục
                filePath.write(uploadDirectory + File.separator + fileName);
                avatar = "/fileImage/" + fileName;
            }
            Part portraitFile = request.getPart("portrait");
            String portraitFileName = extractFileName(portraitFile);
            String portrait = account.getAccountDetail().getPortrait(); // Giữ nguyên ảnh cũ
            if (portraitFileName != null && !portraitFileName.isEmpty()) {
                String portraitUploadDirectory = getServletContext().getRealPath("") + File.separator + "fileImage";
                portraitFile.write(this.getFolderUpload().getAbsolutePath() + File.separator + portraitFileName);
                // Tạo thư mục tồn tại nếu chưa có
                File portraitUploadDirectoryFile = new File(portraitUploadDirectory);
                if (!portraitUploadDirectoryFile.exists()) {
                    portraitUploadDirectoryFile.mkdirs();
                }
                // Lưu tệp đã tải lên vào thư mục
                portraitFile.write(portraitUploadDirectory + File.separator + portraitFileName);
                portrait = "/fileImage/" + portraitFileName;
            }
            Part portraitFile1 = request.getPart("portrait1");
            String portraitFileName1 = extractFileName(portraitFile1);
            String portrait1 = account.getAccountDetail().getPortrait1(); // Giữ nguyên ảnh cũ
            if (portraitFileName1 != null && !portraitFileName1.isEmpty()) {
                String portraitUploadDirectory = getServletContext().getRealPath("") + File.separator + "fileImage";
                portraitFile1.write(this.getFolderUpload().getAbsolutePath() + File.separator + portraitFileName1);
                // Tạo thư mục tồn tại nếu chưa có
                File portraitUploadDirectoryFile = new File(portraitUploadDirectory);
                if (!portraitUploadDirectoryFile.exists()) {
                    portraitUploadDirectoryFile.mkdirs();
                }
                // Lưu tệp đã tải lên vào thư mục
                portraitFile1.write(portraitUploadDirectory + File.separator + portraitFileName1);
                portrait1 = "/fileImage/" + portraitFileName1;
            }
            Part portraitFile2 = request.getPart("portrait2");
            String portraitFileName2 = extractFileName(portraitFile2);
            String portrait2 = account.getAccountDetail().getPortrait2(); // Giữ nguyên ảnh cũ
            if (portraitFileName2 != null && !portraitFileName2.isEmpty()) {
                String portraitUploadDirectory = getServletContext().getRealPath("") + File.separator +"fileImage";
                portraitFile2.write(this.getFolderUpload().getAbsolutePath() + File.separator + portraitFileName2);
                // Tạo thư mục tồn tại nếu chưa có
                File portraitUploadDirectoryFile = new File(portraitUploadDirectory);
                if (!portraitUploadDirectoryFile.exists()) {
                    portraitUploadDirectoryFile.mkdirs();
                }
                // Lưu tệp đã tải lên vào thư mục
                portraitFile2.write(portraitUploadDirectory + File.separator + portraitFileName2);
                portrait2 = "/fileImage/" + portraitFileName2;
            }
            // Cập nhật thông tin tài khoản và chi tiết tài khoản
            account.getAccountDetail().setGender(gender);
            account.getAccountDetail().setCity(city);
            account.getAccountDetail().setAvatar(avatar);
            account.getAccountDetail().setPortrait(portrait);
            account.getAccountDetail().setPortrait1(portrait1);
            account.getAccountDetail().setPortrait2(portrait2);
//            Thiết lập các giá trị cho các thuộc tính của đối tượng AccountDetail trong đối tượng account. Các giá trị này được lấy từ các biến ,ý là nếu có cập nhật ở phần nào thì sẽ lấy giá trị của phần đó thêm vào cho đối tượng account.
//
//            gender, city, avatar, portrait, portrait1, portrait2 là các giá trị được truyền vào từ các biến đã được khai báo và nếu có cập nhật thì sẽ lấy giá trị vào thuộc tính AccountDetail của đối tượng Account
            session.setAttribute("acc", account);
//            cập nhật session mới đã chứa thông tin của các gi trị vừa thay đổi
            accountDAO.updateAccountDetailByAccountId(dateOfBirth, fullName, gender, city, nationality, avatar,portrait,portrait1,portrait2, height, weight, interest, describeYourself, regulations, facebook, joinDate, account_id);

            response.sendRedirect("serviceProviderInformation?success=true");
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
        File folderUpload = new File(System.getProperty("user.home") + "/IdeaProjects/Lover2/src/main/webapp/fileImage");
        if (!folderUpload.exists()){
            folderUpload.mkdirs();
        }
        return folderUpload;
    }





    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        // Phương thức doGet được ghi đè để xử lý yêu cầu "GET" và chuyển hướng người dùng đến trang "register.jsp".
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        // Phương thức doPost được ghi đè để xử lý yêu cầu "POST". Nó gọi phương thức processRequest để xử lý yêu cầu và trả về phản hồi tương ứng.
    }

}