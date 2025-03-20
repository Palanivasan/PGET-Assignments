CREATE DATABASE HMBank

USE HMBank

-- Creation of Customers table

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(10) UNIQUE NOT NULL,
    address VARCHAR(255)
)

-- Creation of Accounts Table

CREATE TABLE Accounts (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    balance MONEY,
    account_type VARCHAR(20) NOT NULL DEFAULT 'Savings'
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
)

-- Creation of Transactions Table
CREATE TABLE Transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')),
    amount MONEY NOT NULL CHECK (amount > 0),
    transaction_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
)

-- Insertion of Records in Customers Table

INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address) VALUES 
('Arun', 'Kumar', '1992-04-10', 'arun.kumar@email.com', '9876543210', 'Chennai, Tamil Nadu'),
('Priya', 'Shankar', '1995-08-25', 'priya.shankar@email.com', '9787654321', 'Coimbatore, Tamil Nadu'),
('Vignesh', 'Rajan', '1990-06-15', 'vignesh.rajan@email.com', '9765432109', 'Madurai, Tamil Nadu'),
('Swathi', 'Mohan', '1998-03-30', 'swathi.mohan@email.com', '9654321098', 'Trichy, Tamil Nadu'),
('Karthik', 'Balan', '1988-11-20', 'karthik.balan@email.com', '9543210987', 'Salem, Tamil Nadu'),
('Divya', 'Suresh', '1994-09-05', 'divya.suresh@email.com', '9432109876', 'Erode, Tamil Nadu'),
('Saravanan', 'V', '1986-07-18', 'saravanan.v@email.com', '9321098765', 'Vellore, Tamil Nadu'),
('Meena', 'Krishnan', '1999-12-12', 'meena.krishnan@email.com', '9210987654', 'Thanjavur, Tamil Nadu'),
('Ramesh', 'K', '1991-05-08', 'ramesh.k@email.com', '9109876543', 'Tirunelveli, Tamil Nadu'),
('Lakshmi', 'Vijay', '1993-02-28', 'lakshmi.vijay@email.com', '9098765432', 'Thoothukudi, Tamil Nadu')

-- Insertion of Records in Accounts Table

INSERT INTO Accounts (customer_id, balance, account_type) VALUES 
(1, 25000, 'Savings'),
(2, 15000, 'Current'),
(3, 500, 'Zero Balance'),
(4, 18000, 'Current'),
(5, 30000, 'Savings'),
(6, 0, 'Zero Balance'),
(7, 22000, 'Savings'),
(8, 7000, 'Current'),
(9, 19500, 'Current'),
(10, 0, 'Zero Balance')

-- Insertion of Records in Transactions Table

INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date) VALUES 
(1, 'deposit', 5000, '2025-03-18'),
(2, 'withdrawal', 2000, '2025-03-15'),
(3, 'deposit', 1000, '2025-03-12'),
(4, 'deposit', 3000, '2025-03-10'),
(5, 'withdrawal', 4000, '2025-03-08'),
(6, 'deposit', 1500, '2025-03-05'),
(7, 'transfer', 2500, '2025-03-02'),
(8, 'deposit', 800, '2025-03-01'),
(9, 'withdrawal', 1200, '2025-02-28'),
(10, 'deposit', 200, '2025-02-25')



