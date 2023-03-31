<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 21/03/2023
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    String price = request.getParameter("price");
    String active = request.getParameter("active");

    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        st.executeUpdate("UPDATE product SET name = '"+ name+"', category = '"+category+"', price='"+price+"', active = '"+active+"' WHERE id = '"+id+"'");

        if(active.equals("No"))
        {
            st.executeUpdate("DELETE FROM cart WHERE product_id = '"+id+"' AND address IS NULL");
        }
        response.sendRedirect("allProductEditProduct.jsp?msg=done");
    } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
    }
%>
