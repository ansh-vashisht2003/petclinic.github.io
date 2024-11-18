<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String message = "";
    String name = request.getParameter("name");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String phone_number = request.getParameter("phone_number");

    if (name != null && username != null && password != null && phone_number != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password");

            // Check if the username already exists
            ps = con.prepareStatement("SELECT * FROM doctor WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Username already exists, show error message
                message = "Username already exists. Please choose another username.";
            } else {
                // Insert into doctor table
                ps = con.prepareStatement("INSERT INTO doctor (name, username, password, phone_number) VALUES (?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, username);
                ps.setString(3, password);  // Consider hashing the password before saving in production
                ps.setString(4, phone_number);

                int result = ps.executeUpdate();
                if (result > 0) {
                    message = "Registration successful! You can now login.";
                    response.sendRedirect("login.jsp"); // Redirect to login page after successful registration
                } else {
                    message = "Registration failed. Please try again.";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "An error occurred: " + e.getMessage();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Signup</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6c9fd4, #f4e1d2);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 50px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: #f9f9f9;
            transition: border 0.3s ease, background-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus {
            border-color: #4CAF50;
            background-color: #fff;
        }

        button {
            width: 100%;
            padding: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            font-size: 1.1em;
            color: red;
            font-weight: bold;
        }

        p {
            text-align: center;
            font-size: 1.1em;
            margin-top: 20px;
        }

        p a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        p a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Doctor Signup</h2>
        <form action="signup.jsp" method="post">
            <input type="text" name="name" placeholder="Full Name" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="number" name="phone_number" placeholder="Phone Number" required>
            <button type="submit">Register</button>
        </form>

        <p class="message"><%= message %></p>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>

</body>
</html>
