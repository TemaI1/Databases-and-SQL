# написать функцию, которая удаляет всю информацию об указанном пользователе из БД
CREATE DEFINER=`root`@`localhost` FUNCTION `drop_user`(number BIGINT UNSIGNED) RETURNS int
    DETERMINISTIC
BEGIN
    DELETE FROM vk.friend_requests WHERE initiator_user_id = number;
	DELETE FROM vk.media WHERE user_id = number;
    DELETE FROM vk.messages WHERE from_user_id = number;
    DELETE FROM vk.likes WHERE user_id = number;
    DELETE FROM vk.users_communities WHERE user_id = number;
    DELETE FROM vk.profiles WHERE user_id = number;
    DELETE FROM vk.users WHERE id = number;
RETURN number;
END

SELECT drop_user(number); -- Обращение к функции

# написать процедуру, которая удаляет всю информацию об указанном пользователе из БД
CREATE DEFINER=`root`@`localhost` PROCEDURE `drop_user`(in number BIGINT UNSIGNED)
BEGIN
    DELETE FROM vk.friend_requests WHERE initiator_user_id = number;
	DELETE FROM vk.media WHERE user_id = number;
    DELETE FROM vk.messages WHERE from_user_id = number;
    DELETE FROM vk.likes WHERE user_id = number;
    DELETE FROM vk.users_communities WHERE user_id = number;
    DELETE FROM vk.profiles WHERE user_id = number;
    DELETE FROM vk.users WHERE id = number;
END

CALL drop_user(number); -- Обращение к процедуре

# написать транзакцию, которая удаляет всю информацию об указанном пользователе из БД
START TRANSACTION;
	SELECT @number := 1;
    DELETE FROM vk.friend_requests WHERE initiator_user_id = number;
	DELETE FROM vk.media WHERE user_id = number;
    DELETE FROM vk.messages WHERE from_user_id = number;
    DELETE FROM vk.likes WHERE user_id = number;
    DELETE FROM vk.users_communities WHERE user_id = number;
    DELETE FROM vk.profiles WHERE user_id = number;
    DELETE FROM vk.users WHERE id = number;
COMMIT;

# написать триггер, длина сообщества (поле name) должна быть не менее 5 символов
DELIMITER // 
CREATE TRIGGER may_trg
BEFORE INSERT ON communities
FOR EACH ROW 
BEGIN 
	IF (name < 5) THEN
		CALL ERROR;
	END IF; 
END //
DELIMITER ;