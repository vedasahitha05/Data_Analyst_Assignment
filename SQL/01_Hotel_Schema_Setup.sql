CREATE DATABASE hotel_management;
USE hotel_management;
CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(100),
    phone_number VARCHAR(15),
    mail_id VARCHAR(100),
    billing_address TEXT
);
CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);
CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity FLOAT
);
CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate INT
);
INSERT INTO users VALUES
('21wrcxuy-67erfn', 'John Doe', '9876543210', 'john.doe@example.com', 'Street A'),
('32abcxyz-98klmn', 'Alice Smith', '9123456780', 'alice.smith@example.com', 'Street B'),
('45pqrsuv-12wxyz', 'Bob Johnson', '9988776655', 'bob.johnson@example.com', 'Street C'),
('78lmnopq-34rstu', 'Emma Davis', '9090909090', 'emma.davis@example.com', 'Street D'),
('90ghijkl-56mnop', 'Michael Lee', '9871234567', 'michael.lee@example.com', 'Street E');
INSERT INTO bookings VALUES
('bk-09f3e-95hj', '2021-10-05 10:30:00', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-11ab2-88cd', '2021-11-10 12:00:00', 'rm-xy12-zabc', '21wrcxuy-67erfn'),
('bk-22cd3-77ef', '2021-11-15 09:15:00', 'rm-uv45-ghij', '32abcxyz-98klmn'),
('bk-33ef4-66gh', '2021-10-20 18:45:00', 'rm-kl78-mnop', '45pqrsuv-12wxyz'),
('bk-44gh5-55ij', '2021-12-01 14:20:00', 'rm-qr90-stuv', '78lmnopq-34rstu'),
('bk-55ij6-44kl', '2021-11-25 16:00:00', 'rm-wx12-yzab', '90ghijkl-56mnop');
INSERT INTO booking_commercials VALUES
('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-10-05 11:00:00', 'itm-a9e8-q8fu', 3),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-10-05 11:00:00', 'itm-a07vh-aer8', 1.5),

('134lr-oyfo8-3qk4', 'bk-11ab2-88cd', 'bl-34qhd-r7h8', '2021-11-10 13:00:00', 'itm-b12cd-34ef', 1),
('234lr-oyfo8-3qk5', 'bk-11ab2-88cd', 'bl-34qhd-r7h8', '2021-11-10 13:00:00', 'itm-c56gh-78ij', 2.5),

('345lr-oyfo8-3qk6', 'bk-22cd3-77ef', 'bl-56xyz-12ab', '2021-11-15 10:00:00', 'itm-d90kl-12mn', 4),

('456lr-oyfo8-3qk7', 'bk-33ef4-66gh', 'bl-78abc-34cd', '2021-10-20 19:00:00', 'itm-a07vh-aer8', 0.5),

('567lr-oyfo8-3qk8', 'bk-44gh5-55ij', 'bl-90def-56gh', '2021-12-01 15:00:00', 'itm-b12cd-34ef', 2),

('678lr-oyfo8-3qk9', 'bk-55ij6-44kl', 'bl-12ghi-78ij', '2021-11-25 17:00:00', 'itm-a9e8-q8fu', 6.5);
INSERT INTO items VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18),
('itm-a07vh-aer8', 'Mix Veg', 89),
('itm-b12cd-34ef', 'Paneer Butter Masala', 150),
('itm-c56gh-78ij', 'Rice', 60),
('itm-d90kl-12mn', 'Dal Fry', 90);
SELECT * FROM users;
SELECT * FROM bookings;
SELECT * FROM booking_commercials;
SELECT * FROM items;
