-- 1. Find the average account balance for all customers
 
SELECT AVG(balance) AS average_balance 
FROM Accounts

-- 2. Retrieve the top 10 highest account balances

SELECT TOP 10 account_id, customer_id, balance 
FROM Accounts
ORDER BY balance DESC

-- 3. Calculate Total Deposits for All Customers on a Specific Date

SELECT SUM(amount) AS total_deposits 
FROM Transactions
WHERE transaction_type = 'deposit' AND transaction_date = '2025-03-19'

-- 4. Find the Oldest and Newest Customers

SELECT TOP 1 first_name + SPACE(1) + last_name AS 'Newest Customer' 
FROM Customers 
ORDER BY DOB ASC

SELECT TOP 1 first_name + SPACE(1) + last_name AS 'Oldest Customer'
FROM Customers
ORDER BY DOB DESC 

-- 5. Retrieve transaction details along with the account type

SELECT t.transaction_id, t.account_id, t.transaction_type, t.amount, t.transaction_date, a.account_type
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id

-- 6. Get a list of customers along with their account details

SELECT c.customer_id, c.first_name, c.last_name, a.account_id, a.account_type, a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id

-- 7. Retrieve transaction details along with customer information for a specific account

SELECT t.transaction_id, t.transaction_type, t.amount, t.transaction_date, c.first_name, c.last_name, c.email
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.account_id = 2

-- 8. Identify customers who have more than one account

SELECT customer_id, COUNT(account_id) AS account_count
FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1

-- 9. Calculate the difference in transaction amounts between deposits and withdrawals

SELECT 
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) AS TotalDeposits,
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS TotalWithdrawals,
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) - 
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS Difference
FROM Transactions

-- 10. Calculate the average daily balance for each account over a specified period

SELECT account_id, AVG(balance) AS average_daily_balance
FROM Accounts
WHERE account_id IN (SELECT DISTINCT account_id FROM Transactions WHERE transaction_date BETWEEN '2024-01-01' AND '2024-03-20')
GROUP BY account_id

-- 11. Calculate the total balance for each account type

SELECT account_type, SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type

-- 12. Identify accounts with the highest number of transactions order by descending order

SELECT account_id, COUNT(transaction_id) AS transaction_count
FROM Transactions
GROUP BY account_id
ORDER BY transaction_count DESC

-- 13. List customers with high aggregate account balances, along with their account types 

SELECT c.customer_id, c.first_name, c.last_name, a.account_type, SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.account_type
HAVING SUM(a.balance) > 50000 

-- 14. Identify and list duplicate transactions based on transaction amount, date, and account

SELECT account_id, amount, transaction_date, COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, amount, transaction_date
HAVING COUNT(*) > 1
