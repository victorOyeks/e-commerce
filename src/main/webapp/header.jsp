<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">

        <%String email = session.getAttribute("email").toString();%>
            <center><h2>OYEKS STORE</h2></center>
            <h2><a href=""><%=email%></a></h2>
            <a href="home.jsp">Home</a>
            <a href="myCart.jsp">My Cart</a>
            <a href="logout.jsp">Logout</a>
            <div class="search-container">
             <form action="searchHome.jsp" method="post">
                 <input type="search" placeholder="Search" name = "search">
                 <button type="submit"><i type="fa" </i></button>

             </form>

            </div>
          </div>
           <br>
           <!--table-->
