-- 1. Hóa đơn khách hàng
SELECT users.user_id, users.user_name, orders.order_id
FROM users
JOIN orders ON users.user_id = orders.user_id;

-- 2. Số lượng hóa đơn của mỗi user
SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS so_don_hang
FROM users
LEFT JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id;

-- 3. Mã đơn hàng và số sản phẩm
SELECT order_id, COUNT(product_id) AS so_san_pham
FROM order_details
GROUP BY order_id;

-- 4. Thông tin mua hàng
SELECT users.user_id, users.user_name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
ORDER BY orders.order_id;

-- 5. Top 7 user có nhiều đơn hàng nhất
SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS so_don
FROM users
JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id
ORDER BY so_don DESC
LIMIT 7;

-- 6. User mua Samsung hoặc Apple
SELECT users.user_id, users.user_name, orders.order_id, products.product_name
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
WHERE products.product_name LIKE '%Samsung%'
OR products.product_name LIKE '%Apple%';

-- 7. Tổng tiền mỗi đơn hàng
SELECT users.user_id, users.user_name, orders.order_id,
SUM(products.product_price) AS tong_tien
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
GROUP BY orders.order_id;

-- 8. Mỗi user lấy đơn hàng có tổng tiền lớn nhất
SELECT users.user_id, users.user_name, orders.order_id,
SUM(products.product_price) AS tong_tien
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
GROUP BY users.user_id, orders.order_id
ORDER BY tong_tien DESC;

-- 9. Mỗi user đơn hàng có tổng tiền nhỏ nhất
SELECT users.user_id, users.user_name, orders.order_id,
SUM(products.product_price) AS tong_tien,
COUNT(products.product_id) AS so_san_pham
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
GROUP BY users.user_id, orders.order_id
ORDER BY tong_tien ASC;

-- 10. Đơn hàng có nhiều sản phẩm nhất
SELECT users.user_id, users.user_name, orders.order_id,
SUM(products.product_price) AS tong_tien,
COUNT(products.product_id) AS so_san_pham
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
GROUP BY users.user_id, orders.order_id
ORDER BY so_san_pham DESC;