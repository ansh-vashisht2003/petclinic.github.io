<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctors With Us</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6; /* Light gray background */
            color: #333;
        }
        header {
            background-color: #388e3c; /* Green for header */
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
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 20px;
        }
        h1 {
            text-align: center;
            color: #388e3c; /* Green for title */
            margin-bottom: 20px;
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
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #388e3c; /* Green for header */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            background-color: #388e3c; /* Green footer */
            color: white;
            font-size: 1.1em;
        }
    </style>
</head>
<body>
    <header>
        <h1>Doctors With Us</h1>
    </header>

    <nav class="navbar">
        <a href="dashboard.jsp">Home</a>
        <a href="doc.jsp">Doctors</a>
        <a href="../index.jsp">Logout</a>
    </nav>

    <div class="container">
        <h1>Our Dedicated Doctors</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Phone Number</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {
                        // Connect to the database
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet_clinic", "root", "password");
                        
                        // Query to fetch doctor data
                        String sql = "SELECT id, name, username, phone_number FROM doctor";
                        ps = conn.prepareStatement(sql);
                        rs = ps.executeQuery();

                        // Loop through the result set and display data
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String username = rs.getString("username");
                            String phoneNumber = rs.getString("phone_number");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= username %></td>
                    <td><%= phoneNumber %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                <tr>
                    <td colspan="4">Error loading data. Please try again later.</td>
                </tr>
                <%
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>

    <footer class="footer">
        <p>&copy; 2024 Pet Clinic. All Rights Reserved.</p>
    </footer>
</body>
</html>
