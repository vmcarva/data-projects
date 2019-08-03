SET SQL_SAFE_UPDATES = 0;

-- Summary of changes: column names changed, dates fixed and some columns added (such as age and status description
-- The script was made based to clean the DB once, so it can be analyzed further with Python

-- Renaming columns of table district
ALTER TABLE district RENAME COLUMN A1 TO district_id;
ALTER TABLE district RENAME COLUMN A2 TO district_name;
ALTER TABLE district RENAME COLUMN A3 TO district_region;
ALTER TABLE district RENAME COLUMN A4 TO no_inhabitants;
ALTER TABLE district RENAME COLUMN A5 TO mun_no_inhabitants499;
ALTER TABLE district RENAME COLUMN A6 TO mun_no_inhabitants1999;
ALTER TABLE district RENAME COLUMN A7 TO mun_no_inhabitants9999;
ALTER TABLE district RENAME COLUMN A8 TO mun_no_inhabitants10000;
ALTER TABLE district RENAME COLUMN A9 TO no_cities;
ALTER TABLE district RENAME COLUMN A10 TO ratio_urban_inhabitants;
ALTER TABLE district RENAME COLUMN A11 TO avg_salary;
ALTER TABLE district RENAME COLUMN A12 TO unemployment_rate95;
ALTER TABLE district RENAME COLUMN A13 TO unemployment_rate96;
ALTER TABLE district RENAME COLUMN A14 TO rate_entrepreneurs;
ALTER TABLE district RENAME COLUMN A15 TO no_crimes95;
ALTER TABLE district RENAME COLUMN A16 TO no_crimes96;

-- Fixing date of card table
ALTER TABLE card
ADD COLUMN issue_date date;

UPDATE card
SET issue_date = date(insert(insert(CONCAT('19',LEFT(issued,6)),5,0,'-'),8,0,'-'));

ALTER TABLE card DROP COLUMN issued;

-- Fixing date of account table
ALTER TABLE account
ADD COLUMN account_date date;

UPDATE account
SET account_date = date(insert(insert(CONCAT('19',LEFT(date,6)),5,0,'-'),8,0,'-'));

ALTER TABLE account DROP COLUMN date;

-- Fixing date, adding gender and age to client table
ALTER TABLE client
ADD COLUMN gender char(1);

ALTER TABLE client
ADD COLUMN birth_date date;

ALTER TABLE client
ADD COLUMN age int;

UPDATE client
SET age = floor(datediff('1998-12-29',birth_date)/365) ;

UPDATE client
SET gender = if((right(left(birth_number,4),2))-50 < 1, 'M', 'F');

UPDATE client
SET birth_number = if((right(left(birth_number,4),2))-50 < 1, birth_number, birth_number-5000);

UPDATE client
SET birth_date = date(insert(insert(CONCAT('19',LEFT(birth_number,6)),5,0,'-'),8,0,'-'));

ALTER TABLE client DROP COLUMN birth_number;

-- Fixing date in loan table
ALTER TABLE loan
ADD COLUMN date_loan date;

UPDATE loan
SET date_loan = date(insert(insert(CONCAT('19',LEFT( berka.loan.date,6)),5,0,'-'),8,0,'-'));

ALTER TABLE loan DROP COLUMN date;

-- Fixing date in trans table
ALTER TABLE trans
ADD COLUMN date_trans date;

UPDATE trans
SET date_trans = date(insert(insert(CONCAT('19',LEFT( berka.trans.date,6)),5,0,'-'),8,0,'-'));

ALTER TABLE trans DROP COLUMN date;

