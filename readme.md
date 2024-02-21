# Design Document

By Radian Yusuf Mahendra

Video overview: https://www.youtube.com/watch?v=fNl2qNn9Apo

## Scope

This is a clontong shop database, covering the basic operational matters of a clontong shop, as follows:

* Categories, includes a product category
* Product, includes basic product names, product categories, prices and product stock
* Transactions, includes basic buying and selling transactions, product type, date, quantity and total price
* Transaction_history, includes tracking of each buying and selling transaction, product details and date

outside the scope are customer records, product expiration, discounts

## Functional Requirements

This database will support:

* CRUD category product, product, transaction
* Informasi riwayat transaksi

## Representation

Entities are captured in SQLite tables with the following schema.

### Entities

The database includes the following entities:

### categories

The `categories` table includes:

* `id`, this represents a unique id for each category data type is INTEGER, this is the primary key of the category table
* `name`, this is the name of the category type with data types TEXT and NOT NULL

### products

The `products` table includes:

* `id`, this represents a unique id for each product with INTEGER data type, this is the primary key of the categories table
* `category_id`, this is a foreign key from the categories table with INTEGER data type, this is used to determine the category type of the product
* `name`, this is the product name with type TEXT
* `price`, this is the price of the product with the data type INTEGER and the limit is greater than or equal to zero
* `stock_quantity`, this is the stock of products with data type INTEGER and the limit is greater than or equal to zero


### transactions

The `transactions` table includes:

* `id`, this is the PRIMARY KEY of the transactions table, data type INTEGER
* `product_id` this is the FOREIGN KEY of the product table, this is used to track information about the product
* `date`, this is the date information for each transaction with the NUMERIC data type and the default current time
* `payment_method`, this is the type of payment, recording 2 categories of payment types between cash and credit, TEXT data type with cash or credit input limits
* `quantity`, this is the amount of stock that will be transacted, the data type is INTEGER and the input must be greater than or equal to zero
* `total_price` , this is the total price of the product that must be paid by the customer, the data type is INTEGER and the input must be greater than or equal to zero


### transaction_history

The `transaction_history` table includes:

* `id`, this is the PRIMARY KEY of the transaction_history table, data type INTEGER
* `transaction_id ` this is the FOREIGN KEY of the transaction table, this is used to track information from the transaction
* `date`, this is the date information for each transaction history with the NUMERIC data type and the default current time


### Relationships

The below entity relationship diagram describes the relationships among the entities in the database.

![ER Diagram](diagram.png)

As detailed by the diagram:

* Category, this represents the category of each product, there is only 1 category in each product, 1 category can have many products
* Product, it is associated with category table, this product has 1 category
* Transactions, this is linked to the product table, 1 product has many transactions
* Transaction_history, this is associated with the transaction table, each transaction has 1 transaction history


## Optimizations

- Reduction of stock for each item sold
- Automatic recording of every transaction history
- detailed historical information including product name, date and price

## Limitations

The Klontong shop database only includes basic things such as product categories, product names, buying and selling transactions and transaction history
