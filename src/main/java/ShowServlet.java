import com.example.lover.dao.AccountDAO;
import com.example.lover.model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Show", urlPatterns = "/show")
public class ShowServlet extends HttpServlet {
    private AccountDAO accountDAO;

    public void init() {
        accountDAO = new AccountDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "ccdv":
                selectUser(resp, req);
                break;
            default:
                listUser(req, resp);
                break;
        }

    }

    private void listUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Account> listUser = accountDAO.selectAllUsers();
        RequestDispatcher dispatcher = req.getRequestDispatcher("AllUserShow.jsp");
        req.setAttribute("listUser", listUser);
        dispatcher.forward(req, resp);
    }

    private void selectUser(HttpServletResponse resp, HttpServletRequest req) throws ServletException, IOException {
        List<Account> ccdv = accountDAO.selectUser();
        RequestDispatcher dispatcher = req.getRequestDispatcher("CCDV.jsp");
        req.setAttribute("ccdv" , ccdv);
        dispatcher.forward(req , resp);
    }
}

