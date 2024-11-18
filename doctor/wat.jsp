<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession, java.util.*" %>
<%
    // Retrieve session and check if doctor is logged in
    HttpSession session1 = request.getSession(false);
    String doctorName = (session1 != null) ? (String) session1.getAttribute("name") : null;
    Integer doctorId = (session1 != null) ? (Integer) session1.getAttribute("id") : null;

    if (doctorName == null || doctorId == null) {
        response.sendRedirect("login.jsp");  // Redirect to login if no doctor is logged in
        return;
    }

    String message = "";

    // Query to get all orders with doctor_name as NULL
    String query = "SELECT order_id, owner_name, animal FROM `order` WHERE doctor_name IS NULL";
    List<Map<String, String>> ordersList = new ArrayList<>();

    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password")) {
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            Map<String, String> order = new HashMap<>();
            order.put("order_id", String.valueOf(rs.getInt("order_id")));
            order.put("owner_name", rs.getString("owner_name"));
            order.put("animal", rs.getString("animal"));
            ordersList.add(order);
        }
    } catch (Exception e) {
        message = "Error retrieving orders: " + e.getMessage();
    }

    // Process accepting order if POST request received
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String orderId = request.getParameter("order_id");
        if (orderId != null && !orderId.isEmpty()) {
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password")) {
                PreparedStatement ps = con.prepareStatement("UPDATE `order` SET doctor_name = ?, doctor_id = ? WHERE order_id = ? AND doctor_name IS NULL");
                ps.setString(1, doctorName);             // doctor_name
                ps.setInt(2, doctorId);                  // doctor_id
                ps.setInt(3, Integer.parseInt(orderId)); // order_id
                int result = ps.executeUpdate();

                if (result > 0) {
                    message = "Patient assigned successfully!";
                    response.sendRedirect("watRedirect.jsp" ); // Redirect with success message
                } 
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
                response.sendRedirect("watRedirect.jsp?message=" + message); // Redirect with error message
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patients Waiting for Doctor</title>
    <style>
        .navbar {
            display: flex;
            justify-content: center;
            background: #2c3e50; /* Darker blue-gray for navbar */
            padding: 12px 0;
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
            color: #ecf0f1; /* Light gray color on hover */
        }
        header {
            background-color: #388e3c; /* Darker green for header */
            color: white;
            padding: 20px;
            text-align: center;
        }
        header h1 {
            font-size: 2.5em;
            margin: 0;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        .action-button {
            background-color: #4CAF50;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            border-radius: 4px;
        }
        .action-button:hover {
            background-color: #45a049;
        }
        .form-container {
            margin-top: 20px;
        }
        .form-container input {
            padding: 8px;
            margin: 5px;
            border-radius: 4px;
            width: 100%;
            max-width: 300px;
        }
        .form-container button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #45a049;
        }
        .message {
            color: green;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<header>
    <h1>Welcome to Pet Clinic</h1>
</header>

<nav class="navbar">
    <a href="home.jsp">Home</a>
    <a href="wat.jsp">Patients Waiting</a>
    <a href="cured.jsp">Patients Cured</a>
    <a href="../index.jsp">LogOut</a>
</nav>

<div class="container">
    <h1>Patients Waiting for Doctor</h1>

    <!-- Message for actions -->
    <% if (message != null && !message.isEmpty()) { %>
        <p class="message"><%= message %></p>
    <% } %>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Owner Name</th>
                <th>Animal</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% for (Map<String, String> order : ordersList) { %>
                <tr>
                    <td><%= order.get("order_id") %></td>
                    <td><%= order.get("owner_name") %></td>
                    <td><%= order.get("animal") %></td>
                    <td>
                        <!-- Accept button with a form -->
                        <form action="wat.jsp" method="POST">
                            <input type="hidden" name="order_id" value="<%= order.get("order_id") %>">
                            <button type="submit" class="action-button">Accept</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
