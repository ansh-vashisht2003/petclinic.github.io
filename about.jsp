<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Pet Clinic Management</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #e3f2fd, #bbdefb);
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

        .content {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
        }

        .content h2 {
            color: #4CAF50;
            font-size: 2em;
            margin-bottom: 10px;
        }

        .content p {
            font-size: 1.2em;
            line-height: 1.6;
            margin: 10px 0;
        }

        .team-section {
            margin: 20px 0;
        }

        .team-section h3 {
            color: #4CAF50;
            font-size: 1.8em;
        }

        .team-gallery {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 20px 0;
        }

        .team-gallery img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
        }

        .team-gallery img:hover {
            transform: scale(1.1);
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
        
    </style>
</head>
<body>
    <header>
        <h1>About Us</h1>
    </header>
      

    <nav class="navbar">
    <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="services.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </nav>

    <div class="content">
        <h2>Our Mission</h2>
        <p>At Pet Clinic Management, our mission is to provide the highest quality care for your beloved pets. We believe that every pet deserves compassion, love, and excellent medical attention. Whether it's a routine checkup or an emergency, we are here to help.</p>

        <h2>Our Values</h2>
        <p>We are committed to:
            <ul>
                <li>Providing exceptional healthcare for pets</li>
                <li>Ensuring a safe and comfortable environment</li>
                <li>Building long-lasting relationships with pet owners</li>
                <li>Promoting preventive care and education</li>
            </ul>
        </p>

         <div class="image-galley">
            <h2>Our Achievements</h2>
            <p>Over the years, we have successfully:
                <ul>
                    <li>Cared for over 5,000 pets</li>
                    <li>Provided 24/7 emergency services</li>
                    <li>Partnered with leading veterinary organizations</li>
                    <li>Introduced advanced pet healthcare technologies</li>
                </ul>
            </p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Pet Clinic Management. All Rights Reserved. | <a href="index.jsp">Home</a></p>
    </footer>
</body>
</html>
