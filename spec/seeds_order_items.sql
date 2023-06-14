TRUNCATE TABLE orders, items CASCADE;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO orders (id, customer_name, date_ordered) VALUES (1, 'Customer_name1', '2013-04-06');
INSERT INTO orders (id, customer_name, date_ordered) VALUES (2, 'Customer_name2', '2006-07-14');
INSERT INTO orders (id, customer_name, date_ordered) VALUES (3, 'Customer_name3', '2015-02-04');
INSERT INTO orders (id, customer_name, date_ordered) VALUES (4, 'Customer_name4', '2007-04-11');

INSERT INTO items (id, item_name, unit_price, quantity, order_id) VALUES (1, 'Item_test1', 11.56, 3, 1);
INSERT INTO items (id, item_name, unit_price, quantity, order_id) VALUES (2, 'Item_test2', 12.66, 2, 2);
INSERT INTO items (id, item_name, unit_price, quantity, order_id) VALUES (3, 'Item_test3', 13.56, 3, 3);
INSERT INTO items (id, item_name, unit_price, quantity, order_id) VALUES (4, 'Item_test4', 14.66, 2, 3);