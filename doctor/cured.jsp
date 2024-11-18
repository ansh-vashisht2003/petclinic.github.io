<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%
HttpSession session1 = request.getSession(false);
if (session1 == null || session1.getAttribute("id") == null) {
    response.sendRedirect("login.jsp"); // Redirect to login if doctor is not logged in
    return;
}

int doctorId = (Integer) session1.getAttribute("id"); // Get doctor_id from session

String jdbcURL = "jdbc:mysql://localhost:3306/pet_clinic";
String dbUser = "root";
String dbPassword = "password"; // Replace with your actual DB password

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

    // SQL Query to get orders assigned to the logged-in doctor
    String sql = "SELECT o.order_id, o.owner_name, o.animal, o.owner_number, o.cost, o.next_appointment_date " +
                 "FROM `order` o " +
                 "WHERE o.doctor_id = ?";
    
    ps = conn.prepareStatement(sql);
    ps.setInt(1, doctorId);  // Set the logged-in doctor's ID in the query
    rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animals Treated by You</title>
    <style>
        /* Basic Styling */
         body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6; /* Light gray background */
            color: #333;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
  <header>
        <h1>Welcome</h1>
    </header>

    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="wat.jsp">Patients Waiting </a>
        <a href="cured.jsp">Patients Cured</a>
        <a href="../index.jsp">LogOut</a>
    </nav>

<table>
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Owner Name</th>
            <th>Animal Type</th>
            <th>Owner Number</th>
           
        </tr>
    </thead>
    <tbody>
        <%
            boolean hasOrders = false;
            while (rs.next()) {
                hasOrders = true;
                int orderId = rs.getInt("order_id");
                String ownerName = rs.getString("owner_name");
                String animal = rs.getString("animal");
                long ownerNumber = rs.getLong("owner_number");
                float cost = rs.getFloat("cost");
                Date nextAppointment = rs.getDate("next_appointment_date");
        %>
        <tr>
            <td><%= orderId %></td>
            <td><%= ownerName %></td>
            <td><%= animal %></td>
            <td><%= ownerNumber %></td>
           
        </tr>
        <%
            }
            if (!hasOrders) {
                out.println("<tr><td colspan='6'>No animals have been treated by you yet.</td></tr>");
            }
        %>
    </tbody>
</table>

</body>
</html>

<%
} catch (Exception e) {
    e.printStackTrace();
    out.println("<p>Error: " + e.getMessage() + "</p>");
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
    if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
}
%>
