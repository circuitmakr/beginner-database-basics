--TABLE person
-- 1. Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color. 
CREATE TABLE people
(
    people_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    height DECIMAL,
    city VARCHAR(25),
    favorite_color VARCHAR(35)
)
--     * id should be an auto-incrementing id/primary key - Use type: SERIAL
-- 2. Add 5 different people into the person database. 
--     * Remember to not include the person_id because it should auto-increment.
INSERT INTO people
(name, age, height, city, favorite_color)
    VALUES
('Joe',54, 45.3, 'Oakland','Red'),
('Clarissa',31, 62.3, 'San Francisco', 'Black'),
('Melisa',39, 70, 'Union City', 'Orange'),
('Billy',34, 17, 'Oakland','Pink'),
('Kendal',44, 55.2,'Oakland', 'Blue');
-- 3. List all the people in the person table by height from tallest to shortest.
SELECT*FROM people
ORDER BY height DESC;
-- 4. List all the people in the person table by height from shortest to tallest.
SELECT*FROM people
ORDER BY height ASC;
-- 5. List all the people in the person table by age from oldest to youngest.
SELECT*FROM people
ORDER BY age DESC;
-- 6. List all the people in the person table older than age 20.
SELECT*FROM people
WHERE age>20;
-- 7. List all the people in the person table that are exactly 18.
SELECT*FROM people
WHERE age=18;
-- 8. List all the people in the person table that are less than 20 and older than 30.
SELECT*FROM people
WHERE age<20 OR age>30;
-- 9. List all the people in the person table that are not 27 (Use not equals).
SELECT*FROM people
WHERE age !=27;
-- 10. List all the people in the person table where their favorite color is not red.
SELECT*FROM people
WHERE favorite_color !='Red';
-- 11. List all the people in the person table where their favorite color is not red and is not blue.
SELECT*FROM people
WHERE favorite_color !='Red' AND favorite_color !='Blue';
-- 12. List all the people in the person table where their favorite color is orange or green.
SELECT*FROM people
WHERE favorite_color='Orange' OR favorite_color ='Green' OR favorite_color ='Blue';
-- 13. List all the people in the person table where their favorite color is orange, green or blue (use IN).
SELECT*FROM people
WHERE favorite_color IN ('Orange','Green','Blue')
-- 14. List all the people in the person table where their favorite color is yellow or purple (use IN).
SELECT*FROM people
WHERE favorite_color IN ('Yellow','Purple')

-- TABLE orders
-- Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
CREATE TABLE orders
(
    order_id SERIAL PRIMARY KEY,
    person_id INT,
    product_name VARCHAR(35),
    product_price DECIMAL,
    quantity INT
)
-- Add 5 orders to the orders table.
INSERT INTO orders
(person_id, product_name, product_price, quantity)
VALUES
(2,'Computer Game', 49.95, 3),
(3,'Computer Part', 55.98, 7),
(4,'Computer Monitor', 125.89, 2),
(5,'Computer Cord', 79.99, 12),
(6,'Computer Camera', 35.98, 1);
-- Make orders for at least two different people.
-- person_id should be different for different people.
INSERT INTO orders
(person_id, product_name, product_price, quantity)
VALUES
(7, 'Keyboard', 120.00,1),
(8, 'Mouse', 12.35,1);
-- Select all the records from the orders table.
SELECT*FROM orders
-- Calculate the total number of products ordered.
SELECT SUM(quantity) FROM orders
-- Calculate the total order price.
SELECT SUM(product_price) FROM orders
-- Calculate the total order price by a single person_id.
SELECT SUM(product_price) FROM orders
WHERE person_id = 5;

-- TABLE artist
-- Add 3 new artists to the artist table. ( It's already created )
INSERT INTO artist
(name)
VALUES
('Johnny Paycheck'),
('NickelBack');
-- Select 10 artists in reverse alphabetical order.
SELECT*FROM artist
ORDER BY name DESC LIMIT 10;
-- Select 5 artists in alphabetical order.
SELECT*FROM artist
ORDER BY name ASC LIMIT 5;
-- Select all artists that start with the word 'Black'.
SELECT*FROM artist
WHERE name LIKE 'Black%';
-- Select all artists that contain the word 'Black'.
SELECT*FROM artist
WHERE name LIKE '%Black%';

-- TABLE-employee
-- List all employee first and last names only that live in Calgary.
SELECT*FROM employee
WHERE city='Calgary';
-- Find the birthdate for the youngest employee.
SELECT*FROM employee
ORDER BY birth_date DESC LIMIT 1;
-- Find the birthdate for the oldest employee.
SELECT*FROM employee
ORDER BY birth_date ASC LIMIT 1;
-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
-- You will need to query the employee table to find the Id for Nancy Edwards
SELECT*FROM employee
WHERE reports_to = 2;
-- Count how many people live in Lethbridge.
SELECT COUNT(*) FROM employee
WHERE city = 'Lethbridge';

-- TABLE-invoice
-- Count how many orders were made from the USA.
SELECT COUNT(*) FROM invoice
WHERE billing_country = 'USA';
-- Find the largest order total amount.
SELECT MAX(total) FROM invoice;
-- Find the smallest order total amount.
SELECT MIN(total) FROM invoice;
-- Find all orders bigger than $5.
SELECT*FROM invoice
WHERE total>5;
-- Count how many orders were smaller than $5.
SELECT COUNT(*) FROM invoice
WHERE total<5;
-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) FROM invoice
WHERE billing_state IN('CA','TX','AZ');
-- Get the average total of the orders.
SELECT AVG(total) FROM invoice;
-- Get the total sum of the orders.
SELECT SUM(total) FROM invoice;