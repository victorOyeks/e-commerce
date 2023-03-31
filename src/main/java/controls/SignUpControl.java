package controls;

import project.ConnectionProvider;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "SignUpControl", value = "/signUp")
public class SignUpControl extends HttpServlet {

    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobileNumber");
        String securityQuestion = request.getParameter("securityQuestion");
        String answer = request.getParameter("answer");
        String password = request.getParameter("password");
        String address = "";
        String city = "";
        String state = "";
        String country = "";

        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("INSERT INTO users VALUES(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobileNumber);
            ps.setString(4, securityQuestion);
            ps.setString(5, answer);
            ps.setString(6, password);
            ps.setString(7, address);
            ps.setString(8, city);
            ps.setString(9, state);
            ps.setString(10, country);
            ps.execute();
            response.sendRedirect("signup.jsp?msg=valid");
        } catch (Exception e) {
            System.out.println(e);
            response.sendRedirect("signup.jsp?msg=invalid");
        }
    }
}
