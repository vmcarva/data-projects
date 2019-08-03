# Project Guide

The task is given in the file: berka.pdf

Since the task was about cleaning, transforming, translating and analyzing the DB, the primary and foreign keys were assumed to be consistent already, since the files were probably exported from an original working DB. 

## 1) Most of the tables were imported to MySQL by using the Import Wizard. This includes the tables:
- Account
- Client
- Card
- Disp
- District
- Loan
- Order

## 2) However, the table *Trans* can't be imported using the Import wizard so fast. This is why the code below on this Jupyter was written: to read the CSV with the trans information and to record it in a table on the Berka DB.

## 3) Following this step, the scripts below were executed to clean, transform and translated information on the DB:
- ../Basic Data Cleaning and Transformation.sql
- ../Translating Categorical Values.sql

## 4) The scripts for new table creations are the ones below:
- ../Creating Table Balance_Account.sql
- ../Creating Table Account_Profile.sql

5) A dump of the financial database called berka was generated and can be executed with the script:
- ../Dump DB - Financial Data Set 20190803.sql
