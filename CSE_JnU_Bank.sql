CREATE DATABASE CSE_JnU_Bank;

USE CSE_JnU_Bank;

CREATE TABLE Branch (
    branch_name VARCHAR(30),
    branch_city VARCHAR(20),
    assets NUMERIC(15,3),
    PRIMARY KEY (branch_name)
);

CREATE TABLE Customer (
    customer_name VARCHAR(30),
    customer_street VARCHAR(50),
    customer_city VARCHAR(20),
    PRIMARY KEY (customer_name)
);

CREATE TABLE Loan (
    loan_number VARCHAR(15),
    branch_name VARCHAR(30),
    amount NUMERIC(8,3),
    PRIMARY KEY (loan_number),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

CREATE TABLE Borrower (
    customer_name VARCHAR(30),
    loan_number VARCHAR(15),
    PRIMARY KEY (customer_name, loan_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (loan_number) REFERENCES Loan(loan_number)
);

CREATE TABLE Account (
    account_number VARCHAR(15),
    branch_name VARCHAR(30),
    balance NUMERIC(12,3),
    PRIMARY KEY (account_number),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

CREATE TABLE Depositor (
    customer_name VARCHAR(30),
    account_number VARCHAR(15),
    PRIMARY KEY (customer_name, account_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (account_number) REFERENCES Account(account_number)
);

INSERT INTO branch
VALUES('ISLAMPUR', 'DHAKA', 2000000);

INSERT INTO branch
VALUES('Jatrabari', 'DHAKA', 5000000);

INSERT INTO branch
VALUES('Agrabad', 'Chattagram', 1500000);

INSERT INTO branch
VALUES('Jalalabad', 'Sylhet', 3450000);

INSERT INTO branch
VALUES('Mirpur', 'DHAKA', 1000000);

INSERT INTO Customer
VALUES('Ahsanul Hoque Abir', 'Rampura', 'DHAKA'),
      ('Prithbiraj Sarker', 'Malibagh', 'DHAKA'),
      ('Fabiha Islam', 'Halishohor', 'Chattagram'),
      ('Ahmed Bin Mustafa', 'Shahjalal Uposhohor', 'Sylhet'),
      ('Khushbul Alam', 'Mirpur', 'Khulna');
      
INSERT INTO Loan
VALUES('LN1001', 'ISLAMPUR', 50000),
      ('LN1002', 'Jatrabari', 2000),
      ('LN1003', 'Agrabad', 10000),
      ('LN1004', 'Jalalabad', 750),
      ('LN1005', 'Mirpur', 1500);

INSERT INTO Borrower
VALUES('Ahsanul Hoque Abir', 'LN1001'),
      ('Prithbiraj Sarker', 'LN1002'),
      ('Fabiha Islam', 'LN1003'),
      ('Ahmed Bin Mustafa', 'LN1004'),
      ('Khushbul Alam', 'LN1005');
      
INSERT INTO Account
VALUES('ACC1001', 'ISLAMPUR', 25000),
      ('ACC1002', 'Jatrabari', 50000),
      ('ACC1003', 'Agrabad', 30000),
      ('ACC1004', 'Jalalabad', 45000),
      ('ACC1005', 'Mirpur', 60000);

INSERT INTO Depositor
VALUES('Ahsanul Hoque Abir', 'ACC1001'),
      ('Prithbiraj Sarker', 'ACC1002'),
      ('Fabiha Islam', 'ACC1003'),
      ('Ahmed Bin Mustafa', 'ACC1004'),
      ('Khushbul Alam', 'ACC1005');

-- select distinct customer_city
-- from customer;

-- select account_number, branch_name, balance, balance+balance*.1 as New_Balance
-- from account;

-- select *
-- from loan;

-- select *
-- from loan
-- where amount>5000;

-- select *
-- from customer,borrower
-- where customer.customer_name = borrower.customer_name;

INSERT INTO branch
VALUES('Perryridge', 'New York', 1000000);

INSERT INTO Account
VALUES('ACC1006', 'Perryridge', 25000),
      ('ACC1007', 'Perryridge', 37000),
      ('ACC1008', 'Perryridge', 90000),
      ('ACC1009', 'Perryridge', 49000),
      ('ACC1010', 'Perryridge', 69000);
      
INSERT INTO Loan
VALUES('LN1006', 'Perryridge', 50000),
      ('LN1007', 'Perryridge', 2000),
      ('LN1008', 'Perryridge', 10000),
      ('LN1009', 'Perryridge', 750),
      ('LN1010', 'Perryridge', 1500);

-- show all customers who have a loan from branch Perryridge and the amount of the loan is greater than 1200
-- select *
-- from loan
-- where branch_name='Perryridge' and amount>1200;

-- show all customers who have a loan between 50000 and 100000
-- select loan_number, amount
-- from loan
-- where amount between 50000 and 100000; --between er kaj shikhlam

INSERT INTO Customer
VALUES('Donald Trump', 'Washington', 'LA'),
      ('Jack Maa', 'Yungwong', 'Beijing'),
      ('Elon Mask', 'Silicon Vally', 'New York'),
      ('Cristiano Ronaldo', 'Lisbon', 'Portogal'),
      ('Leonel Messi', 'HagaLand', 'Buens Aires');

INSERT INTO Borrower
VALUES('Donald Trump', 'LN1006'),
      ('Jack Maa', 'LN1007'),
      ('Elon Mask', 'LN1008'),
      ('Cristiano Ronaldo', 'LN1009'),
      ('Leonel Messi', 'LN1010');

-- show loan_number and amount of all loans of branch Perryridge
-- select customer_name, loan.loan_number as loan_number
-- from borrower cross join loan 
-- where loan.branch_name='Perryridge' and loan.loan_number=borrower.loan_number;

-- show all depositors who have an account in branch Mirpur
-- select customer_name, depositor.account_number, balance
-- from depositor cross join account
-- where account.branch_name='Mirpur' and depositor.account_number=account.account_number;

-- find the names of all branches that have greater assets than some branch located in Brooklyn
-- select distinct T.branch_name
-- from branch as T, branch as S
-- where T.assets>S.assets and s.branch_city='DHAKA';
