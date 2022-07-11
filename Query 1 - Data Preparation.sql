--GENERATE TABLE AND DEFINE PRIMARY KEY ON EACH TABLE

CREATE TABLE customers(
	customer_id VARCHAR PRIMARY KEY, 
	customer_unique_id VARCHAR,
	customer_zip_code_prefix INT,
	customer_city VARCHAR,
	customer_state VARCHAR
)
COPY customers(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\customers_dataset.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE geolocation(
	geolocation_zip_code_prefix INT,
	geolocation_lat DECIMAL,
	geolocation_lng DECIMAL,
	geolocation_city VARCHAR, 
	geolocation_state VARCHAR
)
COPY geolocation(geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE order_items(
	order_id VARCHAR,
	order_item_id INT,
	product_id VARCHAR,
	seller_id VARCHAR, 
	shipping_limit_date TIMESTAMP, 
	price FLOAT, 
	freight_value FLOAT
)
COPY order_items(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\order_items_dataset.csv'
DELIMITER ','
CSV HEADER
ALTER TABLE order_items ADD FOREIGN KEY (order_id) REFERENCES orders
ALTER TABLE order_items ADD FOREIGN KEY (product_id) REFERENCES product
ALTER TABLE order_items ADD FOREIGN KEY (seller_id) REFERENCES sellers;

CREATE TABLE order_payments(
	order_id VARCHAR,
	payment_sequential INT,
	payment_type VARCHAR,
	payment_installments INT, 
	payment_value FLOAT
)
COPY order_payments(order_id, payment_sequential, payment_type, payment_installments, payment_value)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\order_payments_dataset.csv'
DELIMITER ','
CSV HEADER
ALTER TABLE order_payments ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

CREATE TABLE order_reviews(
	review_id VARCHAR, 
	order_id VARCHAR, 
	review_score INT, 
	review_comment_title VARCHAR,
	review_comment_message VARCHAR, 
	review_creation_date DATE, 
	review_answer_timestamp TIMESTAMP
)
COPY order_reviews(review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER
ALTER TABLE order_reviews ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

CREATE TABLE orders(
	order_id VARCHAR PRIMARY KEY,
	customer_id VARCHAR,
	order_status VARCHAR, 
	order_purchase_timestamp TIMESTAMP,
	order_approved_at TIMESTAMP,
	order_delivered_carrier_date TIMESTAMP,
	order_delivered_customer_date TIMESTAMP,
	order_estimated_delivery_date DATE
)
COPY orders(order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\orders_dataset.csv'
DELIMITER ','
CSV HEADER
ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

CREATE TABLE product(
	idx INT,
	product_id VARCHAR PRIMARY KEY,
	product_category_name VARCHAR,
	product_name_lenght FLOAT,
	product_description_lenght FLOAT,
	product_photos_qty FLOAT,
	product_weight_g FLOAT,
	product_length_cm FLOAT,
	product_height_cm FLOAT, 
	product_width_cm FLOAT
)
COPY product(idx, product_id, product_category_name, product_name_lenght,
	product_description_lenght,
	product_photos_qty,
	product_weight_g,
	product_length_cm,
	product_height_cm, 
	product_width_cm)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\product_dataset.csv'
DELIMITER ','
CSV HEADER;

	
CREATE TABLE sellers(
	seller_id VARCHAR PRIMARY KEY,
	seller_zip_code_prefix INT, 
	seller_city VARCHAR,
	seller_state VARCHAR
)
COPY sellers(seller_id, seller_zip_code_prefix, seller_city, seller_state)
FROM 'E:\DIKA\DATA PRODUKTIF DIKA\DATA SCIENCE\Rakamin\Mini project\Analyzing eCommerce Business Performance with SQL\Dataset\sellers_dataset.csv'
DELIMITER ','
CSV HEADER;