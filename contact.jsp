<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Pet Clinic Management</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom, #e8f5e9, #c8e6c9);
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
            margin-bottom: 20px;
            text-align: center;
        }

        .contact-details {
            font-size: 1.2em;
            line-height: 1.8;
        }

        .contact-details p {
            margin: 10px 0;
        }

        .contact-details strong {
            color: #4CAF50;
        }

        .why-contact {
            margin: 30px 0;
        }

        .why-contact ul {
            list-style-type: disc;
            padding-left: 40px;
            font-size: 1.1em;
        }

        .map {
            margin: 30px 0;
            text-align: center;
        }

        .map iframe {
            width: 100%;
            height: 300px;
            border: none;
            border-radius: 10px;
        }

        .faqs {
            margin: 30px 0;
        }

        .faqs h3 {
            color: #4CAF50;
            font-size: 1.8em;
        }

        .faqs p {
            font-size: 1.1em;
            margin: 10px 0;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
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
        <h1>Contact Us</h1>
    </header>
 <nav class="navbar">
    <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="services.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </nav>
    <div class="content">
        <h2>We're Here to Help</h2>

        <div class="contact-details">
            <p><strong>Address:</strong> 123 Pet Care Avenue, Happy Paws City, Country</p>
            <p><strong>Phone:</strong> +1 (123) 456-7890</p>
            <p><strong>Email:</strong> support@petclinic.com</p>
            <p><strong>Hours:</strong> Mon-Sat: 9:00 AM - 6:00 PM</p>
            <p><strong>Emergency Line:</strong> +1 (987) 654-3210 (Available 24/7)</p>
        </div>

        <div class="why-contact">
            <h2>Why Contact Us?</h2>
            <ul>
                <li>Expert care for your pets by certified veterinarians.</li>
                <li>24/7 emergency services for critical cases.</li>
                <li>Personalized advice for pet nutrition and wellness.</li>
                <li>Routine check-ups, vaccinations, and grooming services.</li>
                <li>Support for all your pet-related concerns.</li>
            </ul>
        </div>

      

        <div class="faqs">
           <center> <h3>Frequently Asked Questions</h3></center>
            <p><strong>Q:</strong> What should I bring to my first pet appointment?</p>
            <p><strong>A:</strong> Please bring any medical history of your pet, vaccination records, and a list of any symptoms or concerns you have.</p>
            
            <p><strong>Q:</strong> Do you offer grooming services?</p>
            <p><strong>A:</strong> Yes, we provide grooming services including haircuts, nail trimming, and bathing for all breeds.</p>
            
            <p><strong>Q:</strong> How can I book an appointment?</p>
            <p><strong>A:</strong> You can call us directly at +1 (123) 456-7890 or email us at support@petclinic.com to schedule an appointment.</p>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Pet Clinic Management. All Rights Reserved. | <a href="index.jsp">Home</a></p>
    </footer>
</body>
</html>
