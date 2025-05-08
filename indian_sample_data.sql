
-- 1. Restaurants
INSERT INTO Restaurant (name, branding) VALUES 
('Spicy Rasoi', 'Authentic Indian Veg Cuisine'),
('Biryani Bhavan', 'Hyderabadi Dum Biryani Specialists'),
('Tandoori Trails', 'North Indian Grilled Delights');

-- 2. Branches
INSERT INTO Branch (restaurant_id, location, manager_name, contact_info) VALUES 
(1, 'Banjara Hills, Hyderabad', 'Ramesh Iyer', '040-6789012'),
(1, 'T. Nagar, Chennai', 'Meera Subramaniam', '044-2388123'),
(2, 'Gachibowli, Hyderabad', 'Syed Akbar', '040-2221100'),
(2, 'Indiranagar, Bengaluru', 'Nisha Reddy', '080-5544332'),
(3, 'Connaught Place, Delhi', 'Raj Malhotra', '011-9988776');

-- 3. Employees
INSERT INTO Employee (branch_id, first_name, last_name, role, payroll, performance_score) VALUES 
(1, 'Anita', 'Sharma', 'Manager', 55000.00, 9.2),
(1, 'Manoj', 'Kumar', 'Chef', 32000.00, 8.5),
(2, 'Priya', 'Rao', 'Cashier', 25000.00, 8.9),
(3, 'Ahmed', 'Khan', 'Manager', 58000.00, 9.0),
(4, 'Ravi', 'Shankar', 'Chef', 30000.00, 8.0),
(4, 'Geeta', 'Mishra', 'Waiter/Waitress', 18000.00, 7.5),
(5, 'Kunal', 'Verma', 'Manager', 60000.00, 9.1),
(5, 'Deepa', 'Joshi', 'Chef_Helper', 16000.00, 7.8);

-- 4. Customers
INSERT INTO Customer (name, phone, email) VALUES 
('Rahul Mehta', '9876543210', 'rahul@example.com'),
('Sneha Agarwal', '9123456789', 'sneha@example.com'),
('Vikram Desai', '9345678912', 'vikram@example.com');

-- 5. Products
INSERT INTO Product (branch_id, name, description, price, status) VALUES 
(1, 'Paneer Butter Masala', 'Creamy cottage cheese curry', 250.00, 'Available'),
(2, 'Masala Dosa', 'Crispy dosa with spicy potato filling', 120.00, 'Available'),
(3, 'Hyderabadi Chicken Biryani', 'Traditional dum biryani', 300.00, 'Available'),
(4, 'Veg Thali', 'Assorted veg dishes with roti and rice', 200.00, 'Available'),
(5, 'Tandoori Chicken', 'Spicy grilled chicken', 280.00, 'Available');

-- 6. Orders
INSERT INTO Orders (customer_id, branch_id, order_time, order_mode) VALUES 
(1, 1, '2025-04-20 13:00:00', 'Dine-in'),
(2, 3, '2025-04-20 14:00:00', 'Takeout'),
(3, 5, '2025-04-20 19:30:00', 'Delivery');

-- 7. Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES 
(1, 1, 2),
(2, 3, 1),
(3, 5, 2);

-- 8. Payments
INSERT INTO Payments (order_id, amount, method, payment_time) VALUES 
(1, 500.00, 'Card', '2025-04-20 13:15:00'),
(2, 300.00, 'Cash', '2025-04-20 14:05:00'),
(3, 560.00, 'Online', '2025-04-20 19:45:00');

-- 9. Feedback
INSERT INTO Feedback (customer_id, order_id, rating, comment, feedback_date) VALUES 
(1, 1, 5, 'Delicious and authentic taste!', '2025-04-20'),
(2, 2, 4, 'Good biryani, could be spicier.', '2025-04-20'),
(3, 3, 5, 'Excellent delivery and taste!', '2025-04-20');

-- 10. Inventory
INSERT INTO Inventory (branch_id, product_id, quantity_available, threshold_level) VALUES 
(1, 1, 100, 20),
(2, 2, 150, 30),
(3, 3, 200, 25),
(4, 4, 80, 15),
(5, 5, 120, 25);

-- 11. Supplier
INSERT INTO Supplier (name, contact_info) VALUES 
('Fresh Farms India', '040-4445556'),
('Spice World Traders', '080-3344556');

-- 12. Supplier_Inventory
INSERT INTO Supplier_Inventory (supplier_id, inventory_id, supply_date, quantity_supplied, invoice_number) VALUES 
(1, 1, '2025-04-19', 50, 'INV001'),
(2, 2, '2025-04-19', 60, 'INV002');

-- 13. Government
INSERT INTO Government (department_name, contact_info) VALUES 
('GST Department', 'gst@gov.in'),
('Food Safety Authority', 'foodsafety@gov.in');

-- 14. Branch_Gov_Transaction
INSERT INTO Branch_Gov_Transaction (branch_id, gov_id, payment_amount, transaction_date) VALUES 
(1, 1, 10000.00, '2025-04-01'),
(3, 2, 5000.00, '2025-04-02');

-- 15. ThirdPartyService
INSERT INTO ThirdPartyService (name, service_type, contact_info) VALUES 
('BBMP Water Supply', 'Utility', 'bbmp@services.in'),
('KitchenFix Pvt Ltd', 'Maintenance', 'support@kitchenfix.in');

-- 16. Branch_Service
INSERT INTO Branch_Service (branch_id, service_id, cost, service_date) VALUES 
(2, 1, 2000.00, '2025-04-15'),
(4, 2, 3500.00, '2025-04-18');

-- 17. Users
INSERT INTO Users (username, password_hash, role) VALUES 
('admin1', 'hash_admin', 'Admin'),
('manager_hyd', 'hash_mngr1', 'Branch_Manager'),
('manager_delhi', 'hash_mngr2', 'Branch_Manager');

-- 18. Reports
INSERT INTO Reports (branch_id, report_type, report_date, content) VALUES 
(1, 'Sales', '2025-04-20', 'Total sales: ₹50000'),
(3, 'Inventory', '2025-04-19', 'Restocked 60 biryanis');

-- 19. PerformanceMetrics
INSERT INTO PerformanceMetrics (branch_id, month_year, sales_volume, customer_count, avg_feedback_score) VALUES 
(1, '2025-04', 120000.00, 500, 4.7),
(3, '2025-04', 95000.00, 420, 4.4);

-- 20. LoginLogs
INSERT INTO LoginLogs (user_id, action) VALUES 
(1, 'Logged in as Admin'),
(2, 'Viewed Sales Report');
