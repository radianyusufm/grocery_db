-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- add new categories product
INSERT INTO categories(name)
VALUES ('food'),
       ('drink');


-- add new product
INSERT INTO products(category_id, name, price, stock_quantity)
VALUES  (1, 'rice', 14, 50),
        (2, 'milk', 10, 50),
        (1, 'eggs', 25, 50);


-- show categories and products
SELECT * FROM categories;
SELECT * FROM products;


-- add new transactions
INSERT INTO transactions(product_id, payment_method, quantity, total_price)
VALUES  (1, 'cash', 2, (SELECT price FROM products WHERE id = 1) * 2),
        (2, 'cash', 3, (SELECT price FROM products WHERE id = 2) * 3),
        (3, 'cash', 4, (SELECT price FROM products WHERE id = 3) * 4);


-- show stock products and transaction_history
SELECT * FROM products;
SELECT * FROM transaction_history;


-- show detail transactions
SELECT * FROM view_detailed_transactions;
