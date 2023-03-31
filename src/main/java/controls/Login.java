package controls;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.UserDAO;

@WebServlet(name = "Login", value = "/login")
public class Login extends HttpServlet {

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            session.setAttribute("email", email);
            response.sendRedirect("admin/adminHome.jsp");
        }
        else {
            if (UserDAO.checkUser(email, password)) {
                session.setAttribute("email", email);
                response.sendRedirect("home.jsp");
            }
            else {
                response.sendRedirect("login.jsp?msg=notexist");
            }
        }
    }
}

