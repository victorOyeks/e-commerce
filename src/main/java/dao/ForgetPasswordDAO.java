package dao;

import project.ConnectionProvider;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ForgetPasswordDAO {

    public static boolean checkDetails(String email, String mobileNumber, String securityQuestion, String answer, String newPassword) {
        boolean status = false;

        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email = '" + email + "' AND mobileNumber = '" + mobileNumber + "' AND securityQuestion = '" + securityQuestion + "' AND answer = '" + answer + "'");

            if (rs.next()){
                st.execute(("UPDATE users SET password = '"+newPassword+"' WHERE email = '"+email+"'"));
                status = true;
            }

        }catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
