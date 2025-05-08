# Multi-Branch Restaurant Performance Monitoring System

## 📋 Project Overview

This project is a centralized **database-driven system** designed to monitor the performance of multiple restaurant branches in real-time. It supports tracking of **sales**, **inventory**, **customer feedback**, **government compliance**, and **third-party services** across branches.

The platform is built using **MySQL** and follows a normalized schema to ensure data consistency and integrity. It is role-based, supporting different user roles like Admin, Branch Manager, Chef, Cashier, etc.

---

## 🛠️ Features

- Track restaurant sales and branch performance
- Manage employees and their roles
- Store customer orders, payments, and feedback
- Monitor inventory levels and supplier restocks
- Record transactions with third-party services and government agencies
- Role-based access control for secure data interaction
- Generate reports and performance metrics per branch

---

## 🧱 Technologies Used

- **Database**: MySQL 8.0+
- **Interface Tools**: MySQL Workbench / phpMyAdmin
- **Optional Editors**: VS Code / Notepad++
- **Platform**: Cross-platform (Windows, Linux, macOS)

---

## 🗃️ Database Schema

### Entities and Relationships

- **Restaurant** → oversees → **Branches**
- **Branch** → employs → **Employees**
- **Customer** → places → **Orders** → contains → **Products**
- **Orders** → paid via → **Payments**
- **Customers** → give → **Feedback**
- **Branch** → manages → **Inventory** → restocked by → **Suppliers**
- **Branch** → uses → **ThirdPartyService**
- **Branch** → interacts with → **Government**
- **Users** → manage and log in → system (LoginLogs)

> See `Creating Table.txt` for full SQL schema.

---

## 🧪 Sample Data

The database is preloaded with:

- Restaurants: 3
- Branches: 5 (Hyderabad, Chennai, Delhi, Bengaluru)
- Employees: 8 across different roles
- Customers: 3 sample users
- Orders, Payments, and Feedback records
- Sample reports and login logs

> See `indian_sample_data.sql` or appended INSERTs in `Creating Table.txt` for full dataset.

---

## 🚀 Setup Instructions

1. **Install MySQL 8.0 or above**
2. **Open MySQL Workbench** and run the SQL script:
   - `Creating Table.txt` → to create schema and insert data
   - Optional: `sprint2_schema.sql` for alternate schema
3. **Verify schema** in your MySQL GUI (Workbench/phpMyAdmin)

---

## 👤 User Roles

- `Admin`: Full access to the system, reports, and user management
- `Branch_Manager`: View branch performance, manage staff and operations
- `Chef / Helper`: View orders, kitchen operations
- `Cashier`: Handle payments and billing
- `Customer`: Place orders, give feedback

---

## 📈 Reports & Dashboards

- Sales Reports (daily/branch-level)
- Inventory Restock Logs
- Government Transaction Records
- Customer Feedback Summary
- Staff Performance Metrics

---

## 📎 File Structure

