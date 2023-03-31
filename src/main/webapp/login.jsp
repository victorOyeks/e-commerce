
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="login" method="post">
          <input type="email" name="email" placeholder="Enter Email" required>
          <input type="password" name="password" placeholder="Enter Password" required>
          <input type="submit" value="Login">
      </form>
      <h3><a href="signup.jsp">SignUp</a></h3>
       <h3><a href="forgotPassword.jsp">Forgot Password?</a></h3>
  </div>
  <div class='whysignLogin'>
      <%
          String msg = request.getParameter("msg");
          if("notexist".equals(msg))
          {
              %>
      <h3>Incorrect Username or Password </h3>
      <%}%>
<%--      <%--%>
<%--          if("invalid".equals(msg)){--%>
<%--      %>--%>
<%--      <h3>Incorrect Details! Try Again!</h3>--%>
<%--          <%}%>--%>

    <h2>Oyeks Store</h2>
    <p>Welcome to Oyeks Store.</p>
  </div>
</div>
</body>
</html>