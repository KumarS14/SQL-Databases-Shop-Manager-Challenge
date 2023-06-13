DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS orders;

CREATE SEQUENCE IF NOT EXISTS orders_id_seq;
CREATE SEQUENCE IF NOT EXISTS items_id_seq;

-- Create the table without the foreign key first.
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_name text,
  date_ordered DATE
);

-- Then the table with the foreign key first.
CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  item_name text,
  unit_price float,
  quantity int,
  order_id int,
  CONSTRAINT fk_order FOREIGN KEY (order_id)
    REFERENCES orders (id)
    ON DELETE CASCADE
);

INSERT INTO orders (customer_name, date_ordered) VALUES
    ('John', '2015-06-14'), 
    ('Johnmy', '2013-04-06'),
    ('Johnson', '2006-07-16'),
    ('Johnatan', '2013-08-12'),
    ('Johanila', '2003-04-14');

INSERT INTO items (item_name, unit_price, quantity, order_id) VALUES
    ('Bannana', 10.99, 5, 1),
    ('Pear', 5.99, 3, 1),
    ('Orange', 8.5, 2, 2),
    ('Grape', 15.75, 1, 3),
    ('Chicken_breast', 12.25, 4, 3);




