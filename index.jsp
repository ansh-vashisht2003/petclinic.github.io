<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Clinic Management</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #f5f7fa, #c3d4f0);
            color: #333;
        }

        header {
            background-color: #4CAF50;
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
            background: #2c3e50;
            padding: 10px 0;
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

        .main-content {
            text-align: center;
            padding: 50px 20px;
        }

        .main-content h2 {
            color: #4CAF50;
            font-size: 2em;
        }

        .main-content p {
            font-size: 1.2em;
            margin: 20px 0;
        }

        .image-gallery {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 20px auto;
            gap: 20px;
        }

        .image-gallery img {
            width: 300px;
            height: 200px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }

        .image-gallery img:hover {
            transform: scale(1.05);
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
            bottom: 0;
            width: 100%;
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
        <h1>Welcome to Pet Clinic Management</h1>
    </header>

    <nav class="navbar">
    	 <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="services.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </nav>

    <div class="main-content">
        <h2>Your Pet's Health is Our Priority</h2>
        <p>We provide exceptional care for your furry friends. Book an appointment or learn more about our services today!</p>
        
        <div class="image-gallery">
            <img src="https://guardiananimal.com/wp-content/uploads/2019/04/dog-1194077_1280-1080x675.jpg" alt="Happy Dog">
            <img src="https://www.foundanimals.org/wp-content/uploads/2023/02/2000-cat-hero.jpg" alt="Healthy Cat">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIYkae_9Fg5Ufu0KY0VEl37mMVLEpw1hcjQ&s" alt="Veterinarian with a Dog">
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Pet Clinic Management. All Rights Reserved. | <a href="privacy.jsp">Privacy Policy</a></p>
    </footer>
</body>
</html>
