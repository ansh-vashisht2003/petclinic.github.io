<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
HttpSession session1 = request.getSession(false);
String name = (session1 != null) ? (String) session1.getAttribute("doctorName") : null;
if (name == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard - Pet Clinic</title>
    <style>
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
        .main-box {
            background: #ffffff; /* White background for the main content */
            border-radius: 8px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 20px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }
        .welcome-message {
            font-size: 2em;
            margin-bottom: 30px;
            color: #388e3c; /* Green for welcome text */
        }
        .content p {
            font-size: 1.1em;
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .info-box {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        .info-card {
            background-color: #f9f9f9; /* Soft light gray */
            padding: 20px;
            border-radius: 10px;
            width: 48%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .info-card h3 {
            color: #388e3c; /* Green color for headers in the cards */
            margin-bottom: 15px;
        }
        .info-card p {
            font-size: 1em;
            line-height: 1.5;
            margin-bottom: 20px;
        }
        .info-card a {
            text-decoration: none;
            font-weight: bold;
            color: #388e3c;
            font-size: 1.1em;
            transition: color 0.3s;
        }
        .info-card a:hover {
            color: #2c3e50; /* Darker blue-gray on hover */
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            background-color: #388e3c; /* Green footer */
            color: white;
            font-size: 1.1em;
        }
        @media (max-width: 768px) {
            .info-card {
                width: 100%;
            }
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

    <!-- Main Content Box -->
    <div class="main-box">
        <!-- Welcome Message -->
        <center><b><p class="welcome-message">Welcome to the Pet Clinic Dashboard</p></b></center> 
        <div class="content">
            <p>As a veterinary professional, you can manage your tasks, monitor pet health, and keep track of your upcoming appointments. Use the information below to streamline your daily operations.</p>
        </div>

        <!-- Info Cards Section -->
        <div class="info-box">
            <div class="info-card">
                <h3>Your Patients</h3>
                <p>Manage the medical records of pets under your care. Track treatments, vaccinations, and overall health to ensure optimal care.</p>
            </div>

            <div class="info-card">
                <h3>Appointments</h3>
                <p>Review your upcoming appointments, manage your schedule, and stay organized for each consultation. You can also reschedule or cancel appointments.</p>
            </div>

            <div class="info-card">
                <h3>Your Tasks</h3>
                <p>Keep track of your daily responsibilities, from checking up on patients to reviewing diagnostic results, to ensure smooth operations.</p>
            </div>

            <div class="info-card">
                <h3>Report And Analytics</h3>
                <p>Review detailed reports on pet health, treatments, and recovery progress. Analyze trends to identify areas for improvement in care.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Pet Clinic. All rights reserved.</p>
    </div>
</body>
</html>
