CREATE DATABASE IF NOT EXISTS jiancha_car_rental;
USE jiancha_car_rental;

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('member', 'staff') DEFAULT 'member',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cars (
  id INT AUTO_INCREMENT PRIMARY KEY,
  brand VARCHAR(100) NOT NULL,
  model VARCHAR(100) NOT NULL,
  type ENUM('sedan', 'suv', 'van') NOT NULL,
  license_plate VARCHAR(20) UNIQUE NOT NULL,
  price_per_day DECIMAL(10,2) NOT NULL,
  location VARCHAR(100) NOT NULL,
  is_available BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bookings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  car_id INT NOT NULL,
  pickup_date DATE NOT NULL,
  return_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (car_id) REFERENCES cars(id)
);

INSERT INTO cars (brand, model, type, license_plate, price_per_day, location) VALUES
('Toyota', 'Camry', 'sedan', 'ABC-1234', 1500.00, 'Bangkok'),
('Honda', 'CR-V', 'suv', 'XYZ-5678', 2000.00, 'Bangkok'),
('Toyota', 'Alphard', 'van', 'DEF-9012', 3500.00, 'Chiang Mai');
