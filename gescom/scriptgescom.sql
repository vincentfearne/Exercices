CREATE TABLE suppliers(
   sup_id INT,
   sup_name VARCHAR(50) NOT NULL,
   sup_city VARCHAR(50) NOT NULL,
   sup_address VARCHAR(150) NOT NULL,
   sup_mail VARCHAR(75),
   sup_phone VARCHAR(10),
   PRIMARY KEY(sup_id)
);

CREATE TABLE customers(
   cus_id INT,
   cus_lastname VARCHAR(50) NOT NULL,
   cus_firstname VARCHAR(50) NOT NULL,
   cus_address VARCHAR(150) NOT NULL,
   cus_zipcode VARCHAR(50) NOT NULL,
   cus_city VARCHAR(50) NOT NULL,
   cus_mail VARCHAR(75),
   cus_phone VARCHAR(10),
   PRIMARY KEY(cus_id)
);

CREATE TABLE orders(
   ord_id INT,
   ord_order_date DATE NOT NULL,
   ord_ship_date DATE,
   ord_bill_date DATE,
   ord_reception_date DATE,
   ord_status VARCHAR(25) NOT NULL,
   cus_id INT NOT NULL,
   PRIMARY KEY(ord_id),
   FOREIGN KEY(cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE categories(
   cat_id INT,
   cat_name VARCHAR(200) NOT NULL,
   cat_parent_id INT NOT NULL,
   PRIMARY KEY(cat_id)
);

CREATE TABLE products(
   prod_id INT NOT NULL AUTO_INCREMENT,
   prod_ref VARCHAR(10) NOT NULL,
   prod_name VARCHAR(200),
   prod_desc VARCHAR(1000),
   prod_price DECIMAL(6,2) NOT NULL,
   prod_stock SMALLINT,
   prod_color VARCHAR(30),
   prod_picture VARCHAR(40),
   prod_add_date DATE NOT NULL,
   prod_update_date DATETIME NOT NULL,
   prod_publish SMALLINT NOT NULL,
   cat_id INT NOT NULL,
   sup_id INT NOT NULL,
   PRIMARY KEY(prod_id),
   FOREIGN KEY(cat_id) REFERENCES categories(cat_id),
   FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
);

CREATE TABLE details(
   det_id INT,
   det_price DECIMAL(6,2) NOT NULL,
   det_quantity INT CHECK (det_quantity BETWEEN 1 and 100),
   prod_id INT NOT NULL,
   ord_id INT NOT NULL,
   PRIMARY KEY(det_id),
   FOREIGN KEY(prod_id) REFERENCES products(prod_id),
   FOREIGN KEY(ord_id) REFERENCES orders(ord_id)
);

CREATE INDEX prod_ref_on_products
ON products ( prod_ref );