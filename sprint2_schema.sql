
-- Drop if already exists for clean start
DROP DATABASE IF EXISTS restaurant_monitoring_sprint2;
CREATE DATABASE restaurant_monitoring_sprint2;
USE restaurant_monitoring_sprint2;

-- Restaurant Table
CREATE TABLE Restaurant (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    branding TEXT NOT NULL
);

-- Branch Table
CREATE TABLE Branch (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    manager_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

-- Employee Table
CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role ENUM('Manager', 'Cashier', 'Chef', 'Chef_Helper', 'Waiter/Waitress') NOT NULL,
    payroll DECIMAL(10,2) NOT NULL,
    performance_score DECIMAL(5,2),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Customer Table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Product/Menu Items Table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status ENUM('Available', 'Out of Stock') DEFAULT 'Available',
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Order Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    order_time DATETIME NOT NULL,
    order_mode ENUM('Dine-in', 'Takeout', 'Delivery') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    method ENUM('Cash', 'Card', 'Online') NOT NULL,
    payment_time DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Inventory Table
CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity_available INT NOT NULL,
    threshold_level INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Supplier Table
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    contact_info VARCHAR(100) NOT NULL
);

-- Supplier Inventory Supply Table
CREATE TABLE Supplier_Inventory (
    supplier_id INT NOT NULL,
    inventory_id INT NOT NULL,
    supply_date DATE NOT NULL,
    quantity_supplied INT NOT NULL,
    invoice_number VARCHAR(50) NOT NULL,
    PRIMARY KEY (supplier_id, inventory_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)
);

-- Feedback Table
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_id INT NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    feedback_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Government Table
CREATE TABLE Government (
    gov_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100)
);

-- Branch Government Transactions
CREATE TABLE Branch_Gov_Transaction (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    gov_id INT NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    transaction_date DATE NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    FOREIGN KEY (gov_id) REFERENCES Government(gov_id)
);

-- Third Party Services Table
CREATE TABLE ThirdPartyService (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    service_type VARCHAR(50) NOT NULL,
    contact_info VARCHAR(100)
);

-- Branch Third Party Service Table
CREATE TABLE Branch_Service (
    branch_id INT NOT NULL,
    service_id INT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    service_date DATE NOT NULL,
    PRIMARY KEY (branch_id, service_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    FOREIGN KEY (service_id) REFERENCES ThirdPartyService(service_id)
);

-- User/Admin Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Branch_Manager', 'Viewer') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Reports Table
CREATE TABLE Reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    report_type ENUM('Sales', 'Inventory', 'Performance') NOT NULL,
    report_date DATE NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Performance Metrics Table
CREATE TABLE PerformanceMetrics (
    metric_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT NOT NULL,
    month_year VARCHAR(7) NOT NULL,
    sales_volume DECIMAL(10,2),
    customer_count INT,
    avg_feedback_score DECIMAL(4,2),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Login Logs Table
CREATE TABLE LoginLogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
