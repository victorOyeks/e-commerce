package dao;

import org.junit.jupiter.api.Test;

import java.sql.ResultSet;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class CartDaoTest {

    CartDao cartDao = new CartDao();
    @Test
    void getProductById() throws SQLException {
            ResultSet result = cartDao.getProductById("2");
            assertNotNull(result);
            assertTrue(result.next());
            assertEquals("Orange", result.getString("name"));
        }

    @Test
    public void getCartByEmailAndProductId() throws SQLException {
        ResultSet rs = cartDao.getCartByEmailAndProductId("oyeks@email.com", "1");
        assertTrue(rs.next());
        assertEquals("oyeks@email.com", rs.getString("email"));
        assertEquals(2, rs.getInt("quantity"));
        assertNull(rs.getString("address"));
        assertFalse(rs.next());
    }
}