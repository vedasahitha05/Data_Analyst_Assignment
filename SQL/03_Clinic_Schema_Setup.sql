CREATE DATABASE clinic_management;
USE clinic_management;
CREATE TABLE clinics (
    cid VARCHAR(50),
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);
CREATE TABLE customer (
    uid VARCHAR(50),
    name VARCHAR(100),
    mobile VARCHAR(15)
);
CREATE TABLE clinic_sales (
    oid VARCHAR(50),
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount INT,
    datetime DATETIME,
    sales_channel VARCHAR(50)
);
CREATE TABLE expenses (
    eid VARCHAR(50),
    cid VARCHAR(50),
    description VARCHAR(100),
    amount INT,
    datetime DATETIME
);
INSERT INTO clinics VALUES
('cnc-0100001', 'ABC Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100002', 'XYZ Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100003', 'Care Clinic', 'Chennai', 'Tamil Nadu', 'India'),
('cnc-0100004', 'HealthPlus', 'Bangalore', 'Karnataka', 'India');
INSERT INTO customer VALUES
('bk-09f3e-95hj', 'Rahul', '9999999991'),
('bk-11ab2-88cd', 'Sneha', '9999999992'),
('bk-22cd3-77ef', 'Arjun', '9999999993'),
('bk-33ef4-66gh', 'Priya', '9999999994'),
('bk-44gh5-55ij', 'Kiran', '9999999995');
INSERT INTO clinic_sales VALUES
('ord-00100-00100', 'bk-09f3e-95hj', 'cnc-0100001', 25000, '2021-05-10 10:00:00', 'sodat'),
('ord-00100-00101', 'bk-11ab2-88cd', 'cnc-0100001', 30000, '2021-05-15 12:00:00', 'walkin'),

('ord-00100-00102', 'bk-22cd3-77ef', 'cnc-0100002', 15000, '2021-05-20 14:00:00', 'sodat'),
('ord-00100-00103', 'bk-33ef4-66gh', 'cnc-0100003', 40000, '2021-06-05 16:00:00', 'partner_app'),

('ord-00100-00104', 'bk-44gh5-55ij', 'cnc-0100004', 25000, '2021-06-10 18:00:00', 'referral'),
('ord-00100-00105', 'bk-09f3e-95hj', 'cnc-0100002', 35000, '2021-05-25 11:00:00', 'sodat');
INSERT INTO expenses VALUES
('exp-0100-00100', 'cnc-0100001', 'Medicines', 5000, '2021-05-10 08:00:00'),
('exp-0100-00101', 'cnc-0100002', 'Equipment', 8000, '2021-05-20 09:00:00'),
('exp-0100-00102', 'cnc-0100003', 'Staff Salary', 15000, '2021-06-05 10:00:00'),
('exp-0100-00103', 'cnc-0100004', 'Maintenance', 7000, '2021-06-10 11:00:00'),
('exp-0100-00104', 'cnc-0100001', 'Supplies', 3000, '2021-05-15 07:00:00');
SELECT * FROM clinics;
SELECT * FROM customer;
SELECT * FROM clinic_sales;
SELECT * FROM expenses;
