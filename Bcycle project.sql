CREATE TABLE categoryy (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(100) NOT NULL
);

CREATE TABLE producttt (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    brand_id NUMBER,
    category_id NUMBER,
    model_year NUMBER,
    list_price NUMBER,
    CONSTRAINT fk_producttt_category FOREIGN KEY (category_id) REFERENCES categoryy(category_id)
);

CREATE TABLE customerrrr (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    phone VARCHAR2(20),
    email VARCHAR2(100),
    street VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(50),
    zip_code VARCHAR2(20)
);

CREATE TABLE storeee (
    store_id NUMBER PRIMARY KEY,
    store_name VARCHAR2(100),
    phone VARCHAR2(20),
    email VARCHAR2(100),
    street VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(50),
    zip_code VARCHAR2(20)
);

CREATE TABLE stafff (
    staff_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    phone VARCHAR2(20),
    active NUMBER(1),
    store_id NUMBER,
    manager_id NUMBER,
    CONSTRAINT fk_staff_store FOREIGN KEY (store_id) REFERENCES storeee(store_id)
);

CREATE TABLE ore (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_status NUMBER,
    order_date VARCHAR2(20),
    required_date VARCHAR2(20),
    shipped_date VARCHAR2(20),
    store_id NUMBER,
    staff_id NUMBER,
    CONSTRAINT fk_order_customerrrrr FOREIGN KEY (customer_id) REFERENCES customerrrr(customer_id),
    CONSTRAINT fk_order_storeeeee FOREIGN KEY (store_id) REFERENCES storeee(store_id),
    CONSTRAINT fk_order_staffffff FOREIGN KEY (staff_id) REFERENCES stafff(staff_id)
);

CREATE TABLE order_it (
    order_id NUMBER,
    item_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    list_price NUMBER,
    discount NUMBER,
    PRIMARY KEY (order_id, item_id),
    CONSTRAINT fk_oi_orderrrrrrr FOREIGN KEY (order_id) REFERENCES ore(order_id),
    CONSTRAINT fk_oi_producttttt FOREIGN KEY (product_id) REFERENCES producttt(product_id)
);

select *from categoryy FOR UPDATE;
select * from categoryy
select *from producttt FOR UPDATE;
select * from producttt
select * from customerrrr FOR UPDATE;
SELECT * FROM CUSTOMERRRR
SELECT * FROM storeee FOR UPDATE;
SELECT *FROM storeee
select * from stafff FOR UPDATE;
SELECT * FROM STAFFF
select * from ore FOR UPDATE;
commit
select * from ore;
select* from order_it FOR UPDATE;
SELECT* FROM order_it;
commit


------------------suallar

---Task 1  Which store has the most orders? The store name and order count should be reflected.
SELECT * FROM (
    SELECT s.STORE_NAME, COUNT(o.ORDER_ID) AS ORDER_COUNT
    FROM ore o
    JOIN storeee s ON o.STORE_ID = s.STORE_ID
    GROUP BY s.STORE_NAME
    ORDER BY ORDER_COUNT DESC
)
WHERE ROWNUM <= 3;  
----Task 2.Use subquery to find the product whose average market price is higher than the price.
SELECT p.product_name, p.list_price, c.category_name
FROM producttt p
JOIN categoryy c ON p.category_id = c.category_id
WHERE p.list_price > (
    SELECT AVG(list_price) 
    FROM producttt
    WHERE category_id = p.category_id
);
 ---Task Find the best-selling product in each store.
 SELECT *
FROM (
    SELECT 
        s.store_name,
        p.product_name,
        SUM(oi.quantity) AS total_quantity,
        ROW_NUMBER() OVER (
            PARTITION BY s.store_id
            ORDER BY SUM(oi.quantity) DESC
        ) AS rn
    FROM storeee s
    JOIN ore o ON s.store_id = o.store_id
    JOIN order_it oi ON o.order_id = oi.order_id
    JOIN producttt p ON oi.product_id = p.product_id
    GROUP BY s.store_id, s.store_name, p.product_id, p.product_name
)
WHERE rn = 1; 

--Task 4 Show the names, order numbers, and total order amount of the 6 Customers who placed the least orders
SELECT *
FROM (
    SELECT 
        c.first_name || ' ' || c.last_name AS customer_name,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.quantity * oi.list_price ) AS total_order_amount,
        ROW_NUMBER() OVER (ORDER BY COUNT(DISTINCT o.order_id) ASC) AS rn
    FROM customerrrr c
    JOIN ore o ON c.customer_id = o.customer_id
    JOIN order_it oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
WHERE rn <= 6;  
 --task 5  Display the name of the person who ordered the largest amount of product, the date the order was placed, and the email address
 SELECT *
FROM (
    SELECT 
        c.first_name || ' ' || c.last_name AS customer_name,
        c.email,
        o.shipped_date,
        oi.quantity * oi.list_price * (1 - oi.discount) AS order_amount,
        ROW_NUMBER() OVER (ORDER BY oi.quantity * oi.list_price * (1 - oi.discount) DESC) AS rn
    FROM customerrrr c
    JOIN ore o ON c.customer_id = o.customer_id
    JOIN order_it oi ON o.order_id = oi.order_id
)
WHERE rn = 1; 
---task 6.Form a list of how many products were ordered from which category as follows
--For example, category A -1000 pieces
--Category B -500 pieces

SELECT 
    cat.category_name,
    SUM(oi.quantity) AS total_quantity
FROM categoryy cat
JOIN producttt p ON cat.category_id = p.category_id
JOIN order_it oi ON p.product_id = oi.product_id
GROUP BY cat.category_name
ORDER BY total_quantity DESC;

----task 7 Combine the top 10 most ordered category names and order numbers with the top 10 least ordered category names and order numbers and form a list as shown below

--For example, category A -1000 units "Highly demanded category"
---Category B-500 units "Highly demanded category"
—--------------------------------------------------------------------------------
-- Category Y -10 units "Lowly demanded category"
--- Category Z-3 units "Lowly demanded category"
--The data should be reflected in the form specified in the 3rd column.

-- 10 most requested
SELECT category_name, total_quantity, 'Çox tələb görən kateqoriya' AS status
FROM (
    SELECT 
        cat.category_name,
        SUM(oi.quantity) AS total_quantity,
        ROW_NUMBER() OVER (ORDER BY SUM(oi.quantity) DESC) AS rn
    FROM categoryy cat
    JOIN producttt p ON cat.category_id = p.category_id
    JOIN order_it oi ON p.product_id = oi.product_id
    GROUP BY cat.category_name
)
WHERE rn <= 10

UNION ALL

-- at least 10 required
SELECT category_name, total_quantity, 'Az tələb görən kateqoriya' AS status
FROM (
    SELECT 
        cat.category_name,
        SUM(oi.quantity) AS total_quantity,
        ROW_NUMBER() OVER (ORDER BY SUM(oi.quantity) ASC) AS rn
    FROM categoryy cat
    JOIN producttt p ON cat.category_id = p.category_id
    JOIN order_it oi ON p.product_id = oi.product_id
    GROUP BY cat.category_name
)
WHERE rn <= 10;
--8 . Finding the average of the product amount ordered for each category and displaying only the whole amounts on the screen without any fractions by rounding them. Here, when displaying the category names on the screen, all the characters of all the names should be written in uppercase and vice versa.
SELECT 
    REVERSE(UPPER(cat.category_name)) AS reversed_upper_category,
    ROUND(AVG(oi.quantity * oi.list_price * (1 - oi.discount))) AS average_order_amount
FROM categoryy cat
JOIN producttt p ON cat.category_id = p.category_id
JOIN order_it oi ON p.product_id = oi.product_id
GROUP BY cat.category_name
ORDER BY average_order_amount DESC; 

--9  Identify the next 5 customers from the customers who placed the most orders. Find the customer's most basic information, number of orders, and total order amount.
SELECT *
FROM (
    SELECT 
        c.first_name || ' ' || c.last_name AS customer_name,
        c.email,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_order_amount,
        ROW_NUMBER() OVER (ORDER BY COUNT(DISTINCT o.order_id) DESC) AS rn
    FROM customerrrr c
    JOIN ore o ON c.customer_id = o.customer_id
    JOIN order_it oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.email
) 
WHERE rn BETWEEN 2 AND 6; 









