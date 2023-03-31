<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signUp" method="post">
        <input type="text" name = "name" placeholder="Enter Name" required>
        <input type="email" name = "email" placeholder="Enter Email" required>
        <input type="number" name = "mobileNumber" placeholder="Enter Mobile Number" required>
        <select name="securityQuestion" required>
            <option value="What is your first car?">What is your first car?</option>
            <option value="What is the name of your first pet?">What is the name of your first pet?</option>
            <option value="What elementary school did you attend?">What elementary school did you attend?</option>
            <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
        </select>
        <input type="text" name="answer" placeholder="Enter Answer" required>
        <input type="password" name = "password" placeholder="Enter Password" required>
        <input type="submit" value="signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
      <%
          String msg = request.getParameter("msg");
          if ("valid".equals(msg)) {
      %>
      <h3>Signup successful!</h3>
      <%
      } else if ("invalid".equals(msg)) {
      %>
      <h3>Something went wrong! Try Again!</h3>
      <%}%>

      <h2>Oyeks Store</h2>
    <p>Welcome to Oyeks Store</p>
  </div>
</div>

</body>
</html>