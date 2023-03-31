package dao;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ForgetPasswordDAOTest {
    ForgetPasswordDAO forgetPasswordDAO = new ForgetPasswordDAO();
    @Test
    void checkDetails() {
        boolean expectedStatus = true;
        boolean actualStatus = forgetPasswordDAO.checkDetails("oyeks@email.com", "09035911994", "What is your first car?", "Benz", "1234");
        assertEquals(expectedStatus, actualStatus);
    }
}