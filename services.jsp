<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services - Pet Clinic Management</title>
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
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            width: 100%;
            text-align: center;
            position: relative;
        }

        header h1 {
            font-size: 2.5em;
            margin: 0;
        }

        .navbar {
            display: flex;
            justify-content: center;
            background: #2c3e50;
            padding: 10px 0;
            width: 100%;
            position: relative;
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

        .services-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            margin-top: 50px;
        }

        .service-card {
            width: 200px;
            height: 200px;
            background: white;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
            text-decoration: none;
            color: #333;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .service-card h2 {
            color: #4CAF50;
            margin-bottom: 10px;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
            width: 100%;
            position: relative;
            bottom: 0;
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
        <h1>Our Services</h1>
    </header>
    
    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="services.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </nav>
<br><br><br><br><br><br><br><br>
    <div class="services-container">
        <a href="admin/login.jsp" class="service-card">
            <h2>Admin</h2>
        </a>

        <a href="doctor/signup.jsp" class="service-card">
            <h2>Doctor</h2>
        </a>

        <a href="recp/home.jsp" class="service-card">
            <h2>Receptionist</h2>
        </a>
    </div>
<br><br><br><br><br><br><br><br><br><br>
    <footer>
        <p>&copy; 2024 Pet Clinic Management. All Rights Reserved.</p>
    </footer>
</body>
</html>
