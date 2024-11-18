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

    // Query to get all orders where the doctor_name is not NULL (i.e., already assigned to a doctor)
    String query = "SELECT order_id, owner_name, animal, next_appointment_date, cost FROM `order` WHERE doctor_id = ?";
    List<Map<String, String>> ordersList = new ArrayList<>();

    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password")) {
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, doctorId);  // Ensure you fetch orders assigned to the logged-in doctor
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, String> order = new HashMap<>();
            order.put("order_id", String.valueOf(rs.getInt("order_id")));
            order.put("owner_name", rs.getString("owner_name"));
            order.put("animal", rs.getString("animal"));
            order.put("next_appointment_date", rs.getString("next_appointment_date"));
            order.put("cost", rs.getString("cost"));
            ordersList.add(order);
        }
    } catch (Exception e) {
        message = "Error retrieving orders: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders Assigned to You</title>
    <style>
        /* Styling code goes here */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function acceptOrder(orderId) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "acceptOrder.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText === "success") {
                        alert("Order accepted successfully!");
                        document.getElementById("order_row_" + orderId).style.display = 'none'; // Hide the row
                    } else {
                        alert("Failed to accept the order.");
                    }
                }
            };

            xhr.send("order_id=" + orderId); // Send the order ID to the server
        }
    </script>
</head>
<body>

<header>
    <h1>Orders Assigned to You</h1>
</header>

<nav class="navbar">
    <a href="home.jsp">Home</a>
    <a href="wat.jsp">Patients Waiting</a>
    <a href="cured.jsp">Patients Cured</a>
    <a href="../index.jsp">LogOut</a>
</nav>

<div class="container">
    <h1>Orders for Doctor</h1>

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
                <tr id="order_row_<%= order.get("order_id") %>">
                    <td><%= order.get("order_id") %></td>
                    <td><%= order.get("owner_name") %></td>
                    <td><%= order.get("animal") %></td>
                    <td>
                        <button type="button" onclick="acceptOrder(<%= order.get("order_id") %>)">Accept</button>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
