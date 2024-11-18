<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String message = "";
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password"); // Update database connection info if needed

            // Validate username and password
            ps = con.prepareStatement("SELECT * FROM doctor WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Successful login, redirect to home.jsp
                HttpSession session1 = request.getSession();
                session1.setAttribute("id", rs.getInt("id"));
                session1.setAttribute("name", rs.getString("name"));
                session1.setAttribute("username", rs.getString("username"));
                session1.setAttribute("password", rs.getString("password"));
                session1.setAttribute("phone_number", rs.getString("phone_number"));
              
                
                // Redirect to dashboard
                
                session.setAttribute("doctorId", rs.getInt("id")); // Store doctor id in session for future use
                session.setAttribute("doctorName", rs.getString("name"));
                response.sendRedirect("home.jsp");
            } else {
                // Incorrect credentials
                message = "Invalid username or password. Please try again.";
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
    <title>Doctor Login</title>
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
        <h2>Doctor Login</h2>
        <form action="login.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>

        <p class="message"><%= message %></p>
        <p>Don't have an account? <a href="signup.jsp">Signup here</a></p>
    </div>

</body>
</html>
