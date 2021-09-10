CREATE TABLE stores (
	id INT AUTO_INCREMENT PRIMARY KEY
	,store_name VARCHAR(100) NOT NULL
	,phone_number VARCHAR(50)
	,email VARCHAR(255)
	,adress VARCHAR(255)
	,city VARCHAR(255)
	,STATE VARCHAR(50)
	,postal_code VARCHAR(20)
	);

CREATE TABLE categories (
	id INT AUTO_INCREMENT PRIMARY KEY
	,category_name VARCHAR(255) NOT NULL
	);

CREATE TABLE brands (
	id INT AUTO_INCREMENT PRIMARY KEY
	,brand_name VARCHAR(255) NOT NULL
	);

CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY
	,product_name VARCHAR(255) NOT NULL
	,brand_id INT NOT NULL
	,category_id INT NOT NULL
	,gender_model VARCHAR(8) NOT NULL DEFAULT 'unisex'
	,color VARCHAR(20) NOT NULL
	,size VARCHAR(20) NOT NULL
	,price DECIMAL(10, 2) NOT NULL
	,FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE
	,FOREIGN KEY (brand_id) REFERENCES brands(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY
	,frist_name VARCHAR(255) NOT NULL
	,last_name VARCHAR(255) NOT NULL
	,email VARCHAR(255) NOT NULL
	,phone_number VARCHAR(50)
	,adress VARCHAR(255)
	,city VARCHAR(255)
	,STATE VARCHAR(50)
	,postal_code VARCHAR(20)
	);

CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY
	,customer_id INT NOT NULL
	,store_id INT NOT NULL
	,created_at TIMESTAMP DEFAULT now()
	,FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE
	,FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE order_items (
	order_id INT PRIMARY KEY
	,product_id INT NOT NULL
	,quantity INT NOT NULL
	,amount DECIMAL(10.2) NOT NULL
	,discount DECIMAL(10.2) NOT NULL DEFAULT 0
	,FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE
	,FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE
	);

CREATE TABLE stocks (
	store_id INT
	,product_id INT
	,quantity INT
	,PRIMARY KEY (
		store_id
		,product_id
		)
	,FOREIGN KEY (store_id) REFERENCES stores(id) ON DELETE CASCADE ON UPDATE CASCADE
	,FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE
	);