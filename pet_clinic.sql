-- Step 1: Create the Database
CREATE DATABASE IF NOT EXISTS pet_clinic;

-- Step 2: Use the Created Database
USE pet_clinic;

-- Step 3: Create the order Table
CREATE TABLE IF NOT EXISTS order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,       -- Primary Key for Orders
    owner_name VARCHAR(100) NOT NULL,              -- Name of the Pet Owner
    animal VARCHAR(50) NOT NULL,                   -- Type of Animal
    owner_number BIGINT NOT NULL,                  -- Contact Number of the Owner
    doctor_name VARCHAR(100), 
    doctor_id int,-- Name of the Assigned Doctor (Optional)
    cost DECIMAL(10, 2),                           -- Cost of Appointment (Optional)
    next_appointment_date DATE,                    -- Next Appointment Date (Optional)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP  -- Date and Time of Order Creation
);


-- Step 4: View Table Structure
drop table order;

-- Step 5: Select All Data from order Table
SELECT * FROM order;

CREATE TABLE IF NOT EXISTS doctor(
id int auto_increment primary key,
name varchar(100) ,
username varchar(100) unique,
password varchar(100),
phone_number int(10));

select * from doctor;
