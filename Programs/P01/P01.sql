
CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE COMPANY.Employee (
    EMPNO INT,
    ENAME VARCHAR(255),
    JOB VARCHAR(255),
    MANAGER_NO INT,
    SAL DECIMAL(10, 2),
    COMMISSION DECIMAL(10, 2)
);

DESC COMPANY.Employee;

CREATE USER IF NOT EXISTS 'dbuser'@'localhost' IDENTIFIED BY 'T0p5E(RET';

GRANT ALL PRIVILEGES ON COMPANY.Employee TO 'dbuser'@'localhost';


#login with new user account
#$ mysql -u dbuser -p

SELECT * FROM Employee;

START TRANSACTION;

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
VALUES (1, 'Kavana Shetty', 'Manager', NULL, 5000.00, 1000.00);

COMMIT;

SELECT * FROM Employee;

START TRANSACTION;
INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
VALUES (2, 'Ram Charan', 'Developer', 1, 4000.00, NULL);

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
VALUES (3, 'Honey Singh', 'Salesperson', 2, 3000.00, 500.00);

SELECT * FROM Employee;

DELETE FROM Employee where ENAME = 'Kavana Shetty';

SELECT * FROM Employee;

ROLLBACK;

SELECT * FROM Employee;

-- Add Primary Key Constraint
ALTER TABLE Employee
ADD CONSTRAINT pk_employee PRIMARY KEY (EMPNO);

INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
VALUES (1, 'Ranjan', 'Manager', NULL, 5000.00, 1000.00);


ALTER TABLE Employee
MODIFY ENAME VARCHAR(255) NOT NULL,
MODIFY JOB VARCHAR(255) NOT NULL,
MODIFY SAL DECIMAL(10, 2) NOT NULL;


INSERT INTO Employee (EMPNO, ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
VALUES (4, 'Ranjan', 'Manager', NULL, 5000.00, 1000.00);

SELECT * FROM Employee;

INSERT INTO Employee (ENAME, JOB, MANAGER_NO, SAL, COMMISSION)
VALUES (NULL, 'Tester', NULL, 3500.00, NULL);
