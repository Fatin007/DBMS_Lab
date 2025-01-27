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

