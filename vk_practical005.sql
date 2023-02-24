# создайте представление с произвольным SELECT-запросом
CREATE VIEW may_users AS
SELECT user_id, birthday, hometown
FROM profiles
WHERE user_id LIKE "_5";

# выведите данные, используя написанное представление
SELECT *
FROM may_users;

# удалите представление
DROP VIEW may_users;

# сколько новостей в таблице media у каждого пользователя, вывести поля: номер пользователя, количество новостей, email пользователя
SELECT user_id, COUNT(*) AS amount_news, email
FROM media
JOIN users ON users.id = media.user_id
GROUP BY user_id
ORDER BY user_id;
