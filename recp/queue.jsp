<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waiting Queue - Pet Clinic Management</title>
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

        table {
            width: 90%;
            margin: 20px 0;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        table th, table td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 12px;
        }

        table th {
            background-color: #4CAF50;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
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
        <h1>Waiting Queue</h1>
    </header>
    <nav class="navbar">
        <a href="home.jsp">Registration</a>
        <a href="queue.jsp">Queue</a>
        <a href="../services.jsp">Logout</a>
    </nav>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Owner Name</th>
                <th>Animal</th>
                <th>Contact Number</th>
               
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    // Establish Database Connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password");

                    // Query to Retrieve Waiting Orders
                    String sql = "SELECT order_id, owner_name, animal, owner_number, next_appointment_date FROM `order` WHERE doctor_name IS NULL";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    // Display the Records in the Table
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("order_id") %></td>
                <td><%= rs.getString("owner_name") %></td>
                <td><%= rs.getString("animal") %></td>
                <td><%= rs.getString("owner_number") %></td>
            </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
            %>
            <tr>
                <td colspan="5" style="text-align: center; color: red;">Error: <%= e.getMessage() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <footer>
        <p>&copy; 2024 Pet Clinic Management. All Rights Reserved. | <a href="../index.jsp">Home</a></p>
    </footer>
</body>
</html>
