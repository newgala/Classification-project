-- 1. Create a database called credit_card_classification.
DROP DATABASE IF EXISTS credit_card_classification;
CREATE DATABASE credit_card_classification;
USE credit_card_classification;

-- 2. Create a table credit_card_data with the same columns as given in the csv file. Please make sure you use the correct data types for each of the columns.
DROP TABLE IF EXISTS  credit_card_data;
CREATE TABLE credit_card_data
(Customer_Number INT PRIMARY KEY, 
Offer_Accepted varchar(3), 
Reward varchar(30),
Mailer_Type varchar(30), 
Income_Level varchar(30), 
Bank_Accounts_Open INT NOT NULL,
Overdraft_Protection varchar(3),
Credit_Rating varchar(30),
Credit_Cards_Held INT NOT NULL,
Homes_Owned INT NOT NULL,
Household_Size INT NOT NULL,
Own_Your_Home varchar(3),
Average_Balance REAL,
Q1_Balance REAL,
Q2_Balance REAL,
Q3_Balance REAL,
Q4_Balance REAL);

-- 3. Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. To not modify the original data, if you want you can create a copy of the csv file as well. 
# R: imported using table data import wizard

-- 4. Select all the data from table credit_card_data to check if the data was imported correctly.
SELECT * FROM credit_card_data; -- 18 000 rows
SELECT * FROM credit_card_data WHERE Average_Balance = 0; -- same dataframe with 24 empty values.

-- 5. Use the alter table command to drop the column q4_balance from the database, as we would not use it in the analysis with SQL. Select all the data from the table to verify if the command worked. Limit your returned results to 10.
ALTER TABLE credit_card_data
DROP COLUMN Q4_Balance;
SELECT * FROM credit_card_data LIMIT 10;

-- 6. Use sql query to find how many rows of data you have.
SELECT COUNT(*) FROM credit_card_data;

-- 7. Now we will try to find the unique values in some of the categorical columns:
-- What are the unique values in the column Offer_accepted?
SELECT DISTINCT(offer_accepted) FROM credit_card_data;
-- What are the unique values in the column Reward?
SELECT DISTINCT(Reward) FROM credit_card_data;
-- What are the unique values in the column mailer_type?
SELECT DISTINCT(mailer_type) FROM credit_card_data;
-- What are the unique values in the column credit_cards_held?
SELECT DISTINCT(credit_cards_held) FROM credit_card_data;
-- What are the unique values in the column household_size?
SELECT DISTINCT(household_size) FROM credit_card_data;

-- 8. Arrange the data in a decreasing order by the average_balance of the house. Return only the customer_number of the top 10 customers with the highest average_balances in your data.
SELECT customer_number FROM credit_card_data
ORDER BY average_balance DESC
LIMIT 10;

-- 9. What is the average balance of all the customers in your data?
## the null values were filled with 0, so for the SQL query we are going to ignore them. On pynthon we deal with them.
SELECT avg(average_balance) FROM credit_card_data;

-- 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data. Note wherever average_balance is asked, please take the average of the column average_balance:
-- What is the average balance of the customers grouped by Income Level? The returned result should have only two columns, income level and Average balance of the customers. Use an alias to change the name of the second column.
SELECT income_level, avg(average_balance) FROM credit_card_data
GROUP BY Income_Level;

-- What is the average balance of the customers grouped by number_of_bank_accounts_open? The returned result should have only two columns, number_of_bank_accounts_open and Average balance of the customers. Use an alias to change the name of the second column.
SELECT bank_accounts_open, avg(average_balance) as avg_balance_of_the_customers FROM credit_card_data
GROUP BY Bank_Accounts_Open; ## check if the name of the column is right.

-- What is the average number of credit cards held by customers for each of the credit card ratings? The returned result should have only two columns, rating and average number of credit cards held. Use an alias to change the name of the second column. 
SELECT credit_rating, avg(credit_cards_held) as number_of_credit_cards_held FROM credit_card_data
GROUP BY credit_rating;

-- Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
SELECT bank_accounts_open, avg(credit_cards_held) FROM credit_card_data
GROUP BY Bank_Accounts_Open;

-- 11. Your managers are only interested in the customers with the following properties:
-- Credit rating medium or high
SELECT customer_number FROM credit_card_data WHERE credit_rating ='High' OR credit_rating ='Medium';

-- Credit cards held 2 or less
SELECT customer_number FROM credit_card_data WHERE Credit_Cards_Held<=2;

-- Owns their own home
SELECT customer_number FROM credit_card_data WHERE Own_Your_Home='Yes';

-- Household size 3 or more
SELECT customer_number FROM credit_card_data WHERE household_size>=3;

-- For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them? Can you filter the customers who accepted the offers here?
SELECT * FROM credit_card_data WHERE offer_accepted='Yes';

-- 12. Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. Write a query to show them the list of such customers. You might need to use a subquery for this problem.
SELECT customer_number FROM credit_card_data 
WHERE Average_Balance<(SELECT avg(Average_Balance) FROM credit_card_data);

-- 13. Since this is something that the senior management is regularly interested in, create a view of the same query.
create or replace view customer_less_than_full_average as
SELECT customer_number FROM credit_card_data 
WHERE Average_Balance<(SELECT avg(Average_Balance) FROM credit_card_data);

-- 14. What is the number of people who accepted the offer vs number of people who did not?
SELECT ((SELECT count(offer_accepted) FROM credit_card_data WHERE offer_accepted='Yes')/count(offer_accepted))*100
AS percentage_total_of_yes FROM credit_card_data;

-- 15. Your managers are more interested in customers with a credit rating of high or medium. What is the difference in average balances of the customers with high credit card rating and low credit card rating?
SELECT (SELECT avg(average_balance) FROM credit_card_data WHERE Credit_Rating = 'High') -
(SELECT avg(average_balance) FROM credit_card_data WHERE Credit_Rating = 'Low') AS diff_high_low;

-- 16. In the database, which all types of communication (mailer_type) were used and with how many customers?
SELECT mailer_type, count(customer_number) as number_of_customers FROM credit_card_data GROUP BY mailer_type;

-- 17. Provide the details of the customer that is the 11th least Q1_balance in your database.
SELECT * FROM (SELECT *, DENSE_RANK() OVER(ORDER BY q1_balance ASC) ranked_q1 FROM credit_card_data)  q1_rank
WHERE q1_rank.ranked_q1 = 11;




