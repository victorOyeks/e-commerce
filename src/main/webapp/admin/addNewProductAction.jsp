<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 21/03/2023
  Time: 02:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    String price = request.getParameter("price");
    String active = request.getParameter("active");

    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("INSERT INTO product VALUES (?,?,?,?,?)");
        ps.setString(1, id);
        ps.setString(2, name);
        ps.setString(3, category);
        ps.setString(4, price);
        ps.setString(5, active);
        ps.executeUpdate();
        response.sendRedirect("addNewProduct.jsp?msg=done");
     } catch (Exception e) {
        System.out.println(e);
        response.sendRedirect("addNewProduct.jsp?msg=wrong");
    }
%>