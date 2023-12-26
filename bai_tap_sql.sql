CREATE DATABASE app_food;

use app_food;

CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	password VARCHAR(255)
);

INSERT INTO users (full_name, email, password) VALUES
('John Doe', 'john.doe@email.com', 'password123'),
('Jane Smith', 'jane.smith@email.com', 'securepassword'),
('Bob Johnson', 'bob.johnson@email.com', 'mypassword'),
('Alice Williams', 'alice.williams@email.com', 'p@ssw0rd'),
('Charlie Brown', 'charlie.brown@email.com', 'brownie123'),
('Emma Davis', 'emma.davis@email.com', 'ilovecoding'),
('Michael Miller', 'michael.miller@email.com', 'miller123'),
('Olivia Taylor', 'olivia.taylor@email.com', 'taylorpass'),
('David Wilson', 'david.wilson@email.com', 'wilson321'),
('Sophia Lee', 'sophia.lee@email.com', 'leesophia');

SELECT * FROM users;


CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)
);

INSERT INTO restaurants (res_name, image, description) VALUES
('Restaurant A', 'restaurant_a.jpg', 'A cozy place with a diverse menu.'),
('Restaurant B', 'restaurant_b.jpg', 'Specializing in local and organic ingredients.'),
('Restaurant C', 'restaurant_c.jpg', 'Family-friendly atmosphere with a kids menu.'),
('Restaurant D', 'restaurant_d.jpg', 'Famous for its chef\'s specials and unique flavors.'),
('Restaurant E', 'restaurant_e.jpg', 'A trendy spot with a modern and stylish interior.'),
('Restaurant F', 'restaurant_f.jpg', 'Known for its live music and entertainment.'),
('Restaurant G', 'restaurant_g.jpg', 'Traditional cuisine with a modern twist.'),
('Restaurant H', 'restaurant_h.jpg', 'Panoramic views and outdoor seating.');

SELECT * FROM restaurants;

CREATE TABLE rate_res(
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),
	amount int NOT NULL,
	date_rate DATETIME
);

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 2, 4, '2023-01-01 12:30:00'),
(2, 4, 5, '2023-01-02 15:45:00'),
(3, 1, 3, '2023-01-03 18:20:00'),
(4, 3, 4, '2023-01-04 21:10:00'),
(5, 6, 5, '2023-01-05 14:00:00'),
(6, 8, 4, '2023-01-06 17:30:00'),
(7, 5, 3, '2023-01-07 20:15:00');

SELECT * FROM rate_res;

CREATE TABLE like_res(
	id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurants(res_id),
	date_like DATETIME
);

INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 2, '2023-01-01 08:45:00'),
(3, 4, '2023-01-02 10:20:00'),
(2, 1, '2023-01-03 12:15:00'),
(5, 3, '2023-01-04 14:30:00'),
(4, 6, '2023-01-05 16:45:00');

SELECT * FROM like_res;

CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
);

INSERT INTO food_type (type_name) VALUES
('Italian'),
('Mexican'),
('Japanese'),
('Vegetarian'),
('Seafood'),
('Steakhouse');

SELECT * FROM food_type;

CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES food_type(type_id)
);

INSERT INTO food (food_name, image, price, description, type_id) VALUES
('Spaghetti Bolognese', 'spaghetti_bolognese.jpg', 12.99, 'Classic Italian pasta dish with meat sauce.', 1),
('Tacos', 'tacos.jpg', 8.99, 'Traditional Mexican street food with various fillings.', 2),
('Sushi Combo', 'sushi_combo.jpg', 22.50, 'Assorted sushi rolls and sashimi.', 3),
('Vegetarian Pizza', 'vegetarian_pizza.jpg', 15.50, 'Pizza topped with a variety of fresh vegetables.', 4),
('Grilled Salmon', 'grilled_salmon.jpg', 18.75, 'Salmon fillet grilled to perfection.', 5),
('Ribeye Steak', 'ribeye_steak.jpg', 29.99, 'Juicy and flavorful ribeye steak.', 6),
('Caprese Salad', 'caprese_salad.jpg', 9.75, 'Fresh tomato, mozzarella, and basil salad.', 1),
('Enchiladas', 'enchiladas.jpg', 11.25, 'Rolled tortillas filled with meat and covered in sauce.', 2),
('Tempura Udon', 'tempura_udon.jpg', 13.50, 'Udon noodles with tempura (battered and fried seafood or vegetables).', 3),
('Quinoa Salad', 'quinoa_salad.jpg', 10.99, 'Healthy salad with quinoa, vegetables, and vinaigrette dressing.', 4),
('Seafood Paella', 'seafood_paella.jpg', 25.50, 'Spanish dish with rice and a variety of seafood.', 5),
('New York Strip Steak', 'ny_strip_steak.jpg', 32.50, 'Premium cut of New York strip steak.', 6),
('Margherita Pizza', 'margherita_pizza.jpg', 14.50, 'Classic pizza with tomato, mozzarella, and basil.', 1),
('Burrito Bowl', 'burrito_bowl.jpg', 9.99, 'Burrito ingredients served in a bowl for a convenient meal.', 2),
('Dragon Roll', 'dragon_roll.jpg', 18.99, 'Sushi roll with eel, avocado, and eel sauce.', 3);

SELECT * FROM food;

CREATE TABLE sub_food(
	sub_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id)
);

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Garlic Bread', 3.99, 1),
('Guacamole', 2.50, 2),
('Miso Soup', 1.99, 3),
('Bruschetta', 4.25, 7),
('Churros', 3.75, 8),
('Edamame', 2.99, 9),
('Caesar Salad', 5.50, 10),
('Calamari', 6.99, 11),
('Cheesecake', 7.50, 12);

SELECT * FROM sub_food;

CREATE TABLE orders(
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255)
);

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORDER123', '1,2'),
(2, 5, 1, 'ORDER456', '5'),
(3, 9, 3, 'ORDER789', '9,10,11'),
(4, 14, 2, 'ORDERABC', '14,15'),
(5, 3, 1, 'ORDERDEF', '3'),
(1, 6, 2, 'ORDERGHI', '6,7'),
(2, 12, 1, 'ORDERJKL', '12'),
(3, 4, 3, 'ORDERMNO', '4,5,8'),
(4, 10, 2, 'ORDERPQR', '10,11'),
(5, 2, 1, 'ORDERSTU', '2'),
(1, 8, 2, 'ORDERVWX', '8,9'),
(2, 11, 1, 'ORDERYZA', '11'),
(3, 13, 3, 'ORDERBCD', '13,14,15'),
(4, 6, 2, 'ORDEREFG', '6,7'),
(5, 7, 1, 'ORDERHIJ', '7'),
(1, 10, 2, 'ORDERKLM', '10,11'),
(2, 14, 1, 'ORDERNOP', '14'),
(3, 15, 3, 'ORDERQRS', '15,10,11'),
(4, 3, 2, 'ORDERTUV', '3,4');


SELECT * FROM orders;
