CREATE DATABASE IF NOT EXISTS laptrinhweb;

USE laptrinhweb;

CREATE TABLE users(
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50),
password VARCHAR(50),
email VARCHAR(100)
);

INSERT INTO users(username,password,email) VALUES
('UPVH','123456','upvh@gmail.com'),
('IFUK','123456','ifuk@gmail.com'),
('DZZQ','123456','dzzq@gmail.com'),
('NJYY','123456','njyy@gmail.com'),
('YUMG','123456','yumg@gmail.com');