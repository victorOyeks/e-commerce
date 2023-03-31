package controls;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.CartDao;

@WebServlet(name = "controls.AddToCart", value = "/addToCart")

public class AddToCartControl extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        CartDao cartDao = new CartDao();

        HttpSession session = request.getSession();

        String email = session.getAttribute("email").toString();
        String productId = request.getParameter("id");
        int quantity = 1;
        int productPrice = 0;
        int productTotal = 0;
        int cartTotal = 0;

        int z = 0;

        try {
            ResultSet productRs = cartDao.getProductById(productId);
            while (productRs.next()) {
                productPrice = productRs.getInt(4);
                productTotal = productPrice;
            }
            ResultSet cartRs = cartDao.getCartByEmailAndProductId(email, productId);
            while (cartRs.next()) {
                cartTotal = cartRs.getInt(5);
                cartTotal = cartTotal + productTotal;
                quantity = cartRs.getInt(3);
                quantity++;
                z = 1;
            }
            if (z == 1) {
                cartDao.updateCartTotalAndQuantity(cartTotal, quantity, productId, email);
                response.sendRedirect("home.jsp?msg=exist");
            }
            if (z == 0) {
                cartDao.addCartItem(email, productId, quantity, productPrice, productTotal);
                response.sendRedirect("home.jsp?msg=added");
            }
        } catch (SQLException e) {
            System.out.println(e);
            response.sendRedirect("home.jsp?msg=invalid");
        }
    }
}