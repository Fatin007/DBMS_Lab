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