USE vk;

# подсчитать количество групп у каждого пользователя
SELECT users.id AS user_id, COUNT(*) AS number_groups
FROM users
JOIN users_communities ON users_communities.user_id = users.id
GROUP BY user_id
ORDER BY user_id;

# подсчитать количество пользователей в каждом сообществе
SELECT communities.name AS group_name, COUNT(*) AS number_users
FROM users_communities
JOIN communities ON communities.id = users_communities.community_id
GROUP BY group_name;

# найдите человека, который больше всех общался с выбранным пользователем
SELECT users.id AS user_id, COUNT(*) AS number_messages
FROM messages
JOIN users ON users.id = messages.from_user_id
WHERE to_user_id = 1
GROUP BY user_id
ORDER BY number_messages DESC
LIMIT 1;

# подсчитать общее количество лайков, которые получили пользователи младше 18 лет
SELECT COUNT(*) AS number_likes
FROM likes
JOIN media ON likes.media_id = media.id
JOIN profiles ON profiles.user_id = media.user_id
WHERE birthday >= NOW() - INTERVAL 18 YEAR;

# определить, кто больше поставил лайков мужчины или женщины
SELECT gender, COUNT(*) AS number_likes
FROM likes
JOIN profiles ON likes.user_id = profiles.user_id 
GROUP BY gender;
