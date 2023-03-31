package dao;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;


class UserDAOTest {
    UserDAO userDAO = new UserDAO();
    @Test
    public void testCheckUser() {
        boolean expectedStatus = true;
        boolean actualStatus = userDAO.checkUser("oyeks@email.com", "1234");
        assertEquals(expectedStatus, actualStatus);
    }

}