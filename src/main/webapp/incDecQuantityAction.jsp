<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 21/03/2023
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
    String email = session.getAttribute("email").toString();
    String id = request.getParameter("id");
    String incDec = request.getParameter("quantity");
    int price = 0;
    int total = 0;
    int quantity = 0;
    int final_total = 0;

    try
    {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM cart WHERE email = '"+email+"' AND product_id = '"+id+"' AND address is NULL");
        while (rs.next())
        {
            price = rs.getInt(4);
            total = rs.getInt(5);
            quantity = rs.getInt(3);
        }
        if(quantity == 1 && incDec.equals("dec")){
            response.sendRedirect("myCart.jsp?msg=notPossible");
        }
        else if (quantity !=1 && incDec.equals("dec")) {
            total += price;
            quantity--;
            st.executeUpdate("UPDATE cart SET total = '"+total+"', quantity = '"+quantity+"' WHERE email = '"+email+"' AND product_id ='"+id+"' AND address is NULL");
            response.sendRedirect("myCart.jsp?msg=dec");
        }
        else {
            total += price;
            quantity++;
            st.executeUpdate("UPDATE cart SET total = '"+total+"', quantity = '"+quantity+"' WHERE email = '"+email+"' AND product_id ='"+id+"' AND address is NULL");
            response.sendRedirect("myCart.jsp?msg=inc");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>