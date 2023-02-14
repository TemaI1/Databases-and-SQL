USE vk;

# создал таблицу market
DROP TABLE IF EXISTS market;
CREATE TABLE market(
	id SERIAL,
    market_user_id BIGINT UNSIGNED NOT NULL,
    product_name VARCHAR(100),
    product_description VARCHAR(255),
    price INT,
    
	FOREIGN KEY (market_user_id) REFERENCES users(id)
);

# создал таблицу music
DROP TABLE IF EXISTS music;
CREATE TABLE music(
	id SERIAL,
    music_user_id BIGINT UNSIGNED NOT NULL,
  	music_description text,
    music_name VARCHAR(100),
    duration FLOAT,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (music_user_id) REFERENCES users(id)
);

# заполнил таблицу music
INSERT INTO music (music_description, music_name, duration)
VALUES
('music artist Megan Thee Stallion, Dua Lipa', 'Sweetest Pie', 3.21),
('music artist Imanbek, BYOR', 'Belly Dancer', 2.31),
('music artist Clean Bandit, A7S', 'Everything But You', 3.18),
('music artist Imanbek, Wiz Khalifa, KDDK, KIDDO', 'Ordinary Life', 2.46),
('music artist Topic, Robin Schulz, Nico Santos, Paul Van Dyk', 'In Your Arms', 2.30),
('music artist Tove Lo', 'How Long', 3.19),
('music artist Sorana, David Guetta', 'redruM', 2.52),
('music artist Pitbull, IAMCHINO', 'Discoteca', 3.45),
('music artist Alok, Nonô', 'Sky High', 2.14),
('music artist DVBBS, Benny Benassi, Kyle Reynolds', 'Body Mind Soul', 2.01);

# заполнил таблицу market
INSERT INTO market (product_name, product_description, price)
VALUES
('two-chamber refrigerator', 'Beko B3RCNK402HW', 39950),
('a microwave', 'MAUNFELD MBMO.20.2PGB', 16760),
('coffee machine', 'DeLonghi Autentica ETAM29.510.B', 41960),
('ironing', 'Hyundai H-SI01571', 1770),
('Split system', 'SunWind SW-12/IN-SW-12/OUT', 26300),
('two-chamber refrigerator v2', 'Beko B3RCNK402HW v2', 43970),
('a microwave v2', 'MAUNFELD MBMO.20.2PGB v2', 22710),
('coffee machine v2', 'DeLonghi Autentica ETAM29.510.B v2', 60980),
('ironing v2', 'Hyundai H-SI01571 v2', 3470),
('Split system v2', 'SunWind SW-12/IN-SW-12/OUT v2', 31320);

# удалил сообщения, дата которых позже сегодняшней
DELETE FROM messages
WHERE created_at > NOW();