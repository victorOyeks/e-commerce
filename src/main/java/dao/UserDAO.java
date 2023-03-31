package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import project.ConnectionProvider;

public class UserDAO {
    public static boolean checkUser(String email, String password) {
        boolean status = false;
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email = '"+email+"' AND password = '"+password+"'");
            if (rs.next()){
                status = true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
}
