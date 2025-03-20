USE HMBank

-- 1. Retrieve the name, account type, and email of all customers.

SELECT c.first_name, c.last_name, a.account_type, c.email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id

-- 2. List all transactions corresponding to each customer.

SELECT c.first_name, c.last_name, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id

-- 3. Increase the balance of a specific account by a certain amount.

UPDATE Accounts 
SET balance = balance + 500 
WHERE account_id = 101

-- 4. Combine first and last names of customers as full_name.

SELECT first_name + ' ' + last_name AS full_name FROM Customers

-- 5. Remove accounts with a balance of zero where the account type is 'savings'.

DELETE FROM Accounts 
WHERE balance = 0 AND account_type = 'savings'

-- 6. Find customers living in a specific city.

SELECT * FROM Customers 
WHERE address LIKE '%Chennai%'

-- 7. Get the account balance for a specific account.

SELECT balance FROM Accounts 
WHERE account_id = 101

-- 8. List all current accounts with a balance greater than $1,000.

SELECT * FROM Accounts 
WHERE account_type = 'current' AND balance > 1000

-- 9. Retrieve all transactions for a specific account.

SELECT * FROM Transactions 
WHERE account_id = 101

-- 10. Calculate the interest accrued on savings accounts based on a given interest rate.

SELECT account_id, balance, (balance * 0.05) AS interest_accrued
FROM Accounts 
WHERE account_type = 'savings'

-- 11. Identify accounts where the balance is less than a specified overdraft limit.

SELECT * FROM Accounts 
WHERE balance < -500

-- 12. Find customers not living in a specific city.

SELECT * FROM Customers 
WHERE address NOT LIKE '%Chennai%'
