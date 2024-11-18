<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #8e9eab, #eef2f3);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .login-container {
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        width: 350px;
        text-align: center;
    }
    .login-container h2 {
        margin-bottom: 20px;
        font-size: 1.8em;
        color: #333;
    }
    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: 100%;
        padding: 12px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        transition: border-color 0.3s;
    }
    .login-container input[type="text"]:focus,
    .login-container input[type="password"]:focus {
        border-color: #5cb85c;
        outline: none;
    }
    .login-container input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #5cb85c;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s, box-shadow 0.3s;
    }
    .login-container input[type="submit"]:hover {
        background-color: #4cae4c;
        box-shadow: 0 5px 10px rgba(92, 184, 92, 0.3);
    }
    .error {
        color: red;
        font-size: 14px;
        margin-top: 10px;
    }
    .footer {
        margin-top: 15px;
        font-size: 0.9em;
        color: #555;
    }
    .footer a {
        color: #5cb85c;
        text-decoration: none;
    }
    .footer a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="login-container">
    <h2>Admin Login</h2>
    <form method="post" action="">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            if (username.equals("admin") && password.equals("admin")) {
                response.sendRedirect("dashboard.jsp");
            } else {
                out.println("<p class='error'>Invalid username or password</p>");
            }
        }
    %>
    <div class="footer">
        <p>Need help? <a href="support.jsp">Contact Support</a></p>
    </div>
</div>
</body>
</html>
