<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session1 = request.getSession(false);
    String name = (session1 != null) ? (String) session1.getAttribute("name") : null;
    String id = (session1 != null) ? String.valueOf(session1.getAttribute("id")) : null;
    String username = (session1 != null) ? (String) session1.getAttribute("username") : null;
    String password = (session1 != null) ? (String) session1.getAttribute("password") : null;
    String phoneNumber = (session1 != null) ? (String) session1.getAttribute("phone_number") : null;

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
    <title>Contact Details</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #E8F6EF; /* Light mint green background */
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(90deg, #2D6A4F, #52B788); /* Green gradient */
            padding: 20px;
            color: white;
            text-align: center;
            margin: 0; /* Remove margin to avoid gap */
        }

        .navbar {
            display: flex;
            justify-content: center;
            background: #2c3e50; /* Darker blue-gray for navbar */
            padding: 12px 0;
            margin: 0; /* Remove margin to avoid gap */
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

        main {
            padding: 20px;
            max-width: 1100px;
            margin: auto;
        }

        section {
            margin: 20px 0;
            padding: 30px;
            background: #FFF;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            border-left: 5px solid #52B788;
        }

        .container {
            padding: 20px;
            max-width: 800px;
            margin: 40px auto;
            background: #A8D5BA; /* Soft green container */
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #2C3E50;
        }

        .detail {
            margin: 10px 0;
            font-size: 18px;
            color: #555;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #f0f0f0;
            padding-bottom: 8px;
        }

        .detail span {
            font-weight: bold;
            color: #2D6A4F; /* Dark green */
        }

        footer {
            text-align: center;
            padding: 15px 0;
            background: #2D6A4F; /* Dark green */
            color: #F4F6F6;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        .logout-button {
            display: block;
            margin-top: 30px;
            width: 100%;
            padding: 12px;
            background-color: #2D6A4F;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            box-shadow: 0 5px 10px rgba(52, 73, 94, 0.3);
            transition: background-color 0.3s, transform 0.3s;
        }

        .logout-button:hover {
            background-color: #388E3C; /* Slightly lighter green */
            transform: translateY(-3px);
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
        .logout-button:active {
            transform: translateY(1px);
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome</h1>
    </header>

    <nav class="navbar">
        <a href="home.jsp">Home</a>
        <a href="wat.jsp">Patients Waiting</a>
        <a href="cured.jsp">Patients Cured</a>
        <a href="../index.jsp">LogOut</a>
    </nav>

    <div class="container">
        <h1>Contact Details</h1>
        <div class="detail"><span>ID:</span> <%= id %></div>
        <div class="detail"><span>Name:</span> <%= name %></div>
        <div class="detail"><span>Username:</span> <%= username %></div>
        <div class="detail"><span>Password:</span> <%= password %></div>

        <a href="../index.jsp" class="logout-button">Logout</a>
    </div>

    <footer>
        <p>&copy; 2024 Pet Clinic. All rights reserved.</p>
    </footer>
</body>
</html>
