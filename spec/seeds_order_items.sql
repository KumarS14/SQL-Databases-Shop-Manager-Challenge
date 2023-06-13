TRUNCATE TABLE orders, items CASCADE;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO orders (id, customer_name, date_ordered) VALUES (1, 'Test1', '2013-04-06');
INSERT INTO orders (id, customer_name, date_ordered) VALUES (2, 'Test2', '2006-07-14');

INSERT INTO items (item_name, unit_price, quantity, order_id) VALUES ('Test1', 11.56, 3, 1);
INSERT INTO items (item_name, unit_price, quantity, order_id) VALUES ('Test2', 11.66, 2, 2);