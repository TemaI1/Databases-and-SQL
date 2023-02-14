# выводит всю таблицу
SELECT * FROM db001.mobile_phones;

# выводит название товара, производителя и цену для товаров, количество которых превышает 2
SELECT product_name, manufacturer, price FROM db001.mobile_phones WHERE product_count > '2';

# выводит весь ассортимент товаров марки Samsung
SELECT * FROM db001.mobile_phones WHERE manufacturer = 'Samsung';

# работа с оператором LIKE / REGEXP
SELECT * FROM db001.mobile_phones WHERE product_name LIKE 'iPhone%';
SELECT * FROM db001.mobile_phones WHERE product_name LIKE 'Galaxy%';
SELECT * FROM db001.mobile_phones WHERE product_name REGEXP '8';
