<%@page errorPage="/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div style="text-align: center" class="topnav sticky">
   <%String email = session.getAttribute("email").toString(); %>
            <center><h2>Oyeks Store</h2></center>
            <a href="addNewProduct.jsp">Add New Product</a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products</a>
            <a href="../login.jsp">Logout</a>
          </div>
           <br>
           <!--table-->
