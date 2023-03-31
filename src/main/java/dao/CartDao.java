package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import project.ConnectionProvider;

public class CartDao {
    Connection con = ConnectionProvider.getCon();

    public ResultSet getProductById(String productId) throws SQLException {
        Statement st = con.createStatement();
        return st.executeQuery("SELECT * FROM product WHERE id = '" + productId + "'");
    }

    public ResultSet getCartByEmailAndProductId(String email, String productId) throws SQLException {
        Statement st = con.createStatement();
        return st.executeQuery("SELECT * FROM cart WHERE product_id = '" + productId + "' AND email = '" + email + "' AND address IS NULL ");
    }

    public void updateCartTotalAndQuantity(int cartTotal, int quantity, String  productId, String email) throws SQLException {
        Statement st = con.createStatement();
        st.executeUpdate("UPDATE cart SET total = '" + cartTotal +"', quantity = '"+ quantity+"' WHERE product_id = '" + productId + "' AND email = '" + email + "' AND address IS NULL");
    }

    public void addCartItem(String email, String productId, int quantity, int productPrice, int productTotal) throws SQLException {
        PreparedStatement ps = con.prepareStatement("INSERT INTO cart (email, product_id, quantity, price, total) VALUES(?,?,?,?,?)");
        ps.setString(1, email);
        ps.setString(2, productId);
        ps.setInt(3, quantity);
        ps.setInt(4, productPrice);
        ps.setInt(5, productTotal);
        ps.executeUpdate();
    }
}
