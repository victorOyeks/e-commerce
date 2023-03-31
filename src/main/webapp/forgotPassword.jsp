<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="forgetPassword" method="post">
          <input type="email" name="email" placeholder="Enter Email" required>
          <input type="number" name="mobileNumber" placeholder="Enter Mobile Number" required>
          <select name="securityQuestion">
              <option value="What is your first car?">What is your first car?</option>
              <option value="What is the name of your first pet?">What is the name of your first pet?</option>
              <option value="What elementary school did you attend?">What elementary school did you attend?</option>
              <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
          </select>
          <input type="text" name="answer" placeholder="Enter Answer" required>
          <input type="password" name="newPassword" placeholder= "Enter Your New Password" required>
          <input type="submit" value="Save">
      </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
      <%
          String msg = request.getParameter("msg");

          if ("done".equals(msg)) {
      %>
      <h3>Password Changed Successfully!</h3>
      <%
      } else if ("invalid".equals(msg)) {
      %>
      <h3>Incorrect Details! Try Again!</h3>
      <%
          }
      %>
      <h2>Oyeks Store</h2>
    <p>Welcome to Oyeks Store</p>
  </div>
</div>
</body>
</html>