<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 20/03/2023
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        String q1 = "CREATE TABLE users (name VARCHAR(100), email VARCHAR(100) PRIMARY KEY,mobileNumber VARCHAR(20), securityQuestion VARCHAR(200), answer VARCHAR(200), password VARCHAR(100), address VARCHAR(200), city VARCHAR(200), state VARCHAR(200), country VARCHAR(200))";
        String q2 = "CREATE TABLE product(id INT, name VARCHAR(500), category VARCHAR(200), price INT, active VARCHAR(100))";
        String q3 = "CREATE TABLE cart(email VARCHAR(100), product_id INT, quantity INT, price INT, total INT, address VARCHAR(100), city VARCHAR(100), state VARCHAR(100), country VARCHAR(100), mobileNumber INT, orderDate VARCHAR(100), deliveryDate VARCHAR(100), paymentMethod VARCHAR(100), transactionId VARCHAR(100), status VARCHAR(10))";
        System.out.println(q1);
        System.out.println(q2);
        System.out.println(q3);

//        st.execute(q1);
//        st.execute(q2);
        st.execute(q3);
        System.out.print("Table created");
        con.close();
    } catch (Exception e) {
        System.out.println(e);
    }
    %>
