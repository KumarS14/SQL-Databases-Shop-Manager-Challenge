TRUNCATE TABLE orders, items CASCADE;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO orders (id, customer_name, date_ordered) VALUES (1, 'ItemTest1', '2013-04-06');
INSERT INTO orders (id, customer_name, date_ordered) VALUES (2, 'ItemTest2', '2006-07-14');
INSERT INTO orders (id, customer_name, date_ordered) VALUES (3, 'ItemTest3', '2015-02-04');
INSERT INTO orders (id, customer_name, date_ordered) VALUES (4, 'ItemTest4', '2007-04-11');

INSERT INTO items (item_name, unit_price, quantity, order_id) VALUES ('OrderTest1', 11.56, 3, 1);
INSERT INTO items (item_name, unit_price, quantity, order_id) VALUES ('OrderTest2', 12.66, 2, 2);
INSERT INTO items (item_name, unit_price, quantity, order_id) VALUES ('OrderTest3', 13.56, 3, 3);
INSERT INTO items (item_name, unit_price, quantity, order_id) VALUES ('OrderTest4', 14.66, 2, 3);