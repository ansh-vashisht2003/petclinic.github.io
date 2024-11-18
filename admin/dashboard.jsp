<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f7f6;
        color: #333;
    }

    header {
        background-color: #2e7d32; /* Dark green */
        color: white;
        padding: 15px 0;
        text-align: center;
    }

    header h1 {
        margin: 0;
        font-size: 2.5em;
    }

    .navbar {
        display: flex;
        justify-content: center;
        background: #1b5e20; /* Darker green for navbar */
        padding: 12px 0;
    }

    .navbar a {
        text-decoration: none;
        color: white;
        margin: 0 15px;
        font-weight: bold;
        font-size: 1.1em;
        transition: color 0.3s;
    }

    .navbar a:hover {
        color: #a5d6a7; /* Light green on hover */
    }

    .main-container {
        padding: 20px;
        max-width: 1200px;
        margin: 20px auto;
        background: white;
        border-radius: 8px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    }

    .card-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-top: 30px;
        justify-content: space-between;
    }

    .card {
        flex: 1 1 calc(30% - 20px);
        background: #1e88e5; /* Blue color */
        color: white;
        text-align: center;
        padding: 30px 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        transition: transform 0.3s;
    }

    .card:hover {
        transform: scale(1.05);
    }

    .card h2 {
        font-size: 3em;
        margin: 10px 0;
    }

    .card p {
        font-size: 1.2em;
    }

    .data-section {
        margin-top: 40px;
    }

    .data-section table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .data-section table th,
    .data-section table td {
        padding: 15px;
        text-align: left;
        border: 1px solid #ddd;
    }

    .data-section table th {
        background-color: #388e3c; /* Green header */
        color: white;
    }

    .footer {
        text-align: center;
        margin-top: 50px;
        padding: 15px;
        background-color: #1b5e20;
        color: white;
    }
</style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>

    <nav class="navbar">
        <a href="dshboard.jsp">Home</a>
        <a href="doc.jsp">Doctors</a>
       
        <a href="../index.jsp">Logout</a>
    </nav>

    <div class="main-container">
        <div class="card-container">
            <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                int doctorCount = 0, curedPatients = 0, notCuredPatients = 0;

                try {
                    // Connect to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password");

                    // Count number of doctors
                    ps = conn.prepareStatement("SELECT COUNT(*) FROM doctor");
                    rs = ps.executeQuery();
                    if (rs.next()) doctorCount = rs.getInt(1);

                    // Count number of patients cured
                    ps = conn.prepareStatement("SELECT COUNT(*) FROM `order` WHERE doctor_id IS NOT NULL");
                    rs = ps.executeQuery();
                    if (rs.next()) curedPatients = rs.getInt(1);

                    // Count number of patients not cured
                    ps = conn.prepareStatement("SELECT COUNT(*) FROM `order` WHERE doctor_id IS NULL");
                    rs = ps.executeQuery();
                    if (rs.next()) notCuredPatients = rs.getInt(1);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
            <div class="card">
                <h2><%= doctorCount %></h2>
                <p>Total Doctors</p>
            </div>
            <div class="card">
                <h2><%= curedPatients %></h2>
                <p>Patients Cured</p>
            </div>
            <div class="card">
                <h2><%= notCuredPatients %></h2>
                <p>Patients Waiting</p>
            </div>
        </div>

        <div class="data-section">
            <h2>Recent Patient Records</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Owner Name</th>
                        <th>Animal</th>
                        <th>Doctor Name</th>
                        <th>Status</th>
                      
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            // Fetch recent records from the order table
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password");
                            ps = conn.prepareStatement("SELECT order_id, owner_name, animal, doctor_name, doctor_id, next_appointment_date FROM `order` ORDER BY created_at DESC LIMIT 10");
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                int orderId = rs.getInt("order_id");
                                String ownerName = rs.getString("owner_name");
                                String animal = rs.getString("animal");
                                String doctorName = rs.getString("doctor_name");
                                String status = rs.getInt("doctor_id") == 0 ? "Pending" : "Assigned";
                                String nextAppointment = rs.getDate("next_appointment_date") != null ? rs.getDate("next_appointment_date").toString() : "N/A";

                                out.println("<tr>");
                                out.println("<td>" + orderId + "</td>");
                                out.println("<td>" + ownerName + "</td>");
                                out.println("<td>" + animal + "</td>");
                                out.println("<td>" + (doctorName != null ? doctorName : "N/A") + "</td>");
                                out.println("<td>" + status + "</td>");
                               
                                out.println("</tr>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <footer class="footer">
        © 2024 Pet Clinic Dashboard
    </footer>
</body>
</html>
