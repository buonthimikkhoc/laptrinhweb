-- 1. Danh sách người dùng theo Alphabet
SELECT * 
FROM users
ORDER BY user_name ASC;

-- 2. Lấy 7 người dùng đầu tiên
SELECT *
FROM users
ORDER BY user_name ASC
LIMIT 7;

-- 3. Người dùng có chữ 'a'
SELECT *
FROM users
WHERE user_name LIKE '%a%'
ORDER BY user_name ASC;

-- 4. Tên bắt đầu bằng m
SELECT *
FROM users
WHERE user_name LIKE 'm%';

-- 5. Tên kết thúc bằng i
SELECT *
FROM users
WHERE user_name LIKE '%i';

-- 6. Email Gmail
SELECT *
FROM users
WHERE user_email LIKE '%@gmail.com';

-- 7. Gmail và tên bắt đầu bằng m
SELECT *
FROM users
WHERE user_email LIKE '%@gmail.com'
AND user_name LIKE 'm%';

-- 8. Gmail + có chữ i + tên dài > 5
SELECT *
FROM users
WHERE user_email LIKE '%@gmail.com'
AND user_name LIKE '%i%'
AND LENGTH(user_name) > 5;

-- 9. Có chữ a, độ dài 5-9, Gmail, email có chữ i
SELECT *
FROM users
WHERE user_name LIKE '%a%'
AND LENGTH(user_name) BETWEEN 5 AND 9
AND user_email LIKE '%@gmail.com'
AND user_email LIKE '%i%';

-- 10. Điều kiện OR
SELECT *
FROM users
WHERE (
user_name LIKE '%a%'
AND LENGTH(user_name) BETWEEN 5 AND 9
)
OR (
user_name LIKE '%i%'
AND LENGTH(user_name) < 9
)
OR (
user_email LIKE '%@gmail.com'
AND user_email LIKE '%i%'
);