USE vk;

# написать скрипт, возвращающий список имен пользователей без повторений в алфавитном порядке
SELECT firstname 
FROM users 
ORDER BY firstname ASC;

# вывел количество мужчин старше 35 лет
SELECT COUNT(*)
FROM profiles
WHERE birthday <= NOW() - INTERVAL 35 YEAR;

# вывел колличество заявок каждого статуса
SELECT status, COUNT(*) AS quantity
FROM friend_requests
GROUP BY status;

# вывел первые три строки со статусом 'requested'
SELECT * 
FROM friend_requests
WHERE status = 'requested'
LIMIT 3;

# вывел номера и имена пользователей, фамилия которых состоят из 5 символов
SELECT id, firstname
FROM users
WHERE lastname LIKE '_____';
