<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receptionist Home - Pet Clinic Management</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #e8f5e9, #c8e6c9);
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            width: 100%;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            font-size: 2em;
            margin: 0;
        }

        .navbar {
            display: flex;
            justify-content: center;
            background: #2c3e50;
            padding: 10px 0;
            width: 100%;
        }

        .navbar a {
            text-decoration: none;
            color: white;
            margin: 0 15px;
            font-weight: bold;
            font-size: 1.1em;
        }

        .navbar a:hover {
            text-decoration: underline;
        }
        form {
            background: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 400px;
            margin-top: 30px;
        }

        form h2 {
            color: #4CAF50;
            text-align: center;
        }

        form .form-group {
            margin-bottom: 15px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        form input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 1em;
        }

        form button:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            margin-top: 20px;
        }

        .message button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin: 5px;
        }

        .message button:hover {
            background-color: #45a049;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
            width: 100%;
            margin-top: auto;
        }

        footer p {
            margin: 0;
            font-size: 0.9em;
        }

        footer a {
            color: #4CAF50;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Receptionist Dashboard</h1>
    </header>

    <nav class="navbar">
        <a href="home.jsp">Registration</a>
        <a href="queue.jsp">Queue</a>
        <a href="../services.jsp">Logout</a>
    </nav>

    <%
        String message = "";
        boolean showMessage = false;
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String ownerName = request.getParameter("ownerName");
            String animal = request.getParameter("animal");
            String ownerNumber = request.getParameter("ownerNumber");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password");

                String sql = "INSERT INTO `order` (owner_name, animal, owner_number) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);

                stmt.setString(1, ownerName);
                stmt.setString(2, animal);
                stmt.setString(3, ownerNumber);

                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    message = "Record submitted! Please wait for your turn.";
                    showMessage = true;
                } else {
                    message = "Failed to insert the record.";
                }

                stmt.close();
                conn.close();
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            }
        }
    %>

    <%
        if (!showMessage) {
    %>
    <form method="post" action="">
        <h2>Record Appointment</h2>
        <div class="form-group">
            <label for="ownerName">Owner Name:</label>
            <input type="text" id="ownerName" name="ownerName" required>
        </div>
        <div class="form-group">
            <label for="animal">Animal:</label>
            <input type="text" id="animal" name="animal" required>
        </div>
        <div class="form-group">
            <label for="ownerNumber">Owner Contact Number:</label>
            <input type="text" id="ownerNumber" name="ownerNumber" required>
        </div>
        <button type="submit">Submit</button>
    </form>
    <%
        } else {
    %>
    <div class="message">
        <h2><%= message %></h2>
        <button onclick="location.href='home.jsp'">Registration Form</button>
        <button onclick="location.href='services.jsp'">Services</button>
    </div>
    <%
        }
    %>

    <footer>
        <p>&copy; 2024 Pet Clinic Management. All Rights Reserved. | <a href="../index.jsp">Home</a></p>
    </footer>
</body>
</html>
