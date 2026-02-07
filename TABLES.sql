-- # CREATE STORES TABLE

CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    opened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




-- # CREATE INGREDIENTS TABLE
CREATE TABLE ingredients(
    ingredient_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    stock_quantity NUMERIC(10, 2) NOT NULL,
    unit VARCHAR(50) NOT NULL
);

-- # CREATE CUSTOMERS TABLE
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- # CREATE MENU_ITEMS TABLE
CREATE TABLE menu_items(
    item_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    item_price NUMERIC(10, 2) NOT NULL,
    size VARCHAR(50) NOT NULL
);


-- # CREATE ORDERS TABLE
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    store_id INTEGER,
    order_timestamp TIMESTAMP NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    
    CONSTRAINT fk_customer
        FOREIGN KEY(customer_id) 
        REFERENCES customers(customer_id) 
        ON DELETE CASCADE,

    CONSTRAINT fk_store
        FOREIGN KEY(store_id) 
        REFERENCES stores(store_id) 
        ON DELETE CASCADE
);

-- # CREATE ORDER_ITEMS TABLE
CREATE TABLE order_items(
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(10, 2) NOT NULL,
    
    CONSTRAINT fk_order
        FOREIGN KEY(order_id) 
        REFERENCES orders(order_id) 
        ON  DELETE CASCADE,

    CONSTRAINT fk_menu_item
        FOREIGN KEY(item_id)
        REFERENCES menu_items(item_id)
        ON DELETE CASCADE
);


SELECT
  current_user,
  current_database(),
  current_schema;


SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
ORDER BY table_schema, table_name;

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_schema = 'public';