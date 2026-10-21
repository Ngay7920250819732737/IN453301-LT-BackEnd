-- Câu 1: Liệt kê tên các khoá học mà Nguyễn An đã đăng ký[cite: 4]
SELECT c.name 
FROM courses c
JOIN registrations r ON c.id = r.course_id
JOIN members m ON r.member_id = m.id
WHERE m.full_name = 'Nguyễn An';

-- Câu 2: Đếm số thành viên của mỗi khoá, khoá nhiều người nhất đứng đầu[cite: 4]
SELECT c.id, c.name, COUNT(*) AS total_members
FROM courses c
JOIN registrations r ON c.id = r.course_id
GROUP BY c.id, c.name
ORDER BY COUNT(*) DESC;

-- Câu 3: Chuyển Lê Chi vào khoá "Cơ sở dữ liệu" bằng 1 transaction[cite: 4]
BEGIN;

INSERT INTO registrations (member_id, course_id)
SELECT m.id, c.id 
FROM members m, courses c 
WHERE m.full_name = 'Lê Chi' AND c.name = 'Cơ sở dữ liệu';

COMMIT;

-- Kiểm tra lại kết quả
SELECT * FROM registrations r 
JOIN members m ON r.member_id = m.id 
WHERE m.full_name = 'Lê Chi';