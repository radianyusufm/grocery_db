-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Table to store categories of products
CREATE TABLE categories(
    id INTEGER,
    name TEXT NOT NULL,
    PRIMARY KEY(id)
);

-- Table to store products
CREATE TABLE products(
    id INTEGER,
    category_id INTEGER,
    name TEXT NOT NULL,
    price INTEGER NOT NULL CHECK(price >= 0),
    stock_quantity INTEGER NOT NULL CHECK(stock_quantity >= 0),
    PRIMARY KEY(id),
    FOREIGN KEY(category_id) REFERENCES categories(id)
);

-- Table to store transactions
CREATE TABLE transactions(
    id INTEGER,
    product_id INTEGER,
    date NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method TEXT CHECK(payment_method  IN ('cash', 'credit')),
    quantity INTEGER NOT NULL CHECK(quantity >= 0),
    total_price INTEGER NOT NULL CHECK(quantity >= 0),
    PRIMARY KEY(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);


-- Table to store transaction history
CREATE TABLE transaction_history(
    id INTEGER,
    transaction_id INTEGER,
    date NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(transaction_id) REFERENCES transactions(id)
);

-- trigger after transactions
CREATE TRIGGER insert_transaction_history
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    INSERT INTO transaction_history (transaction_id, date)
    VALUES (NEW.id, NEW.date);
END;


-- trigger update stock product
CREATE TRIGGER update_product_stock
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE id = NEW.product_id;
END;

-- View detailed transactions
CREATE VIEW view_detailed_transactions AS
SELECT products.name, transactions.total_price, transaction_history.date
FROM transaction_history
JOIN transactions ON transactions.id = transaction_history.transaction_id
JOIN products ON products.id = transactions.product_id;
