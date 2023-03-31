package controls;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ForgetPasswordDAO;

@WebServlet(name = "ForgetPassword", value = "/forgetPassword")

public class ForgetPassword extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String email = request.getParameter("email");
            String mobileNumber = request.getParameter("mobileNumber");
            String securityQuestion = request.getParameter("securityQuestion");
            String answer = request.getParameter("answer");
            String newPassword = request.getParameter("newPassword");

            if(ForgetPasswordDAO.checkDetails(email, mobileNumber, securityQuestion, answer, newPassword)) {
                response.sendRedirect("forgotPassword.jsp?msg=done");
            } else {
                response.sendRedirect("forgotPassword.jsp?msg=invalid");
            }
        }
}