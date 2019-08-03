SET SQL_SAFE_UPDATES = 0;


-- Some information in the DB is written in Czech, but the name of some of the attributes in English were also given
-- The task here is to substitue those terms 

-- Updating account table - categoric field to English words
UPDATE account
SET frequency = 
CASE 
  WHEN frequency = 'POPLATEK MESICNE' THEN 'Monthly Issuance'
  WHEN frequency = 'POPLATEK TYDNE' THEN 'Weekly Issuance'
  WHEN frequency = 'POPLATEK PO OBRATU' THEN 'Issuance after Transaction'
  ELSE frequency
END;

-- Updating order table - categoric field to English words
UPDATE berka.order
SET k_symbol = 
CASE 
  WHEN k_symbol = 'POJISTNE' THEN 'Insurance Payment'
  WHEN k_symbol = 'SIPO' THEN 'Household Payment'
  WHEN k_symbol = 'LEASING' THEN 'Leasing'
  WHEN k_symbol = 'UVER' THEN 'Loan Payment'
  ELSE k_symbol
END;

-- Updating trans table - categoric field to English words
UPDATE berka.trans
SET type = 
CASE 
  WHEN type = 'PRIJEM' THEN 'Credit'
  WHEN type = 'VYDAJ' THEN 'Withdrawl'
  WHEN type = 'VYBER' THEN 'Withdrawl'
  ELSE type
END;

UPDATE berka.trans
SET operation = 
CASE 
  WHEN operation = 'VYBER KARTOU' THEN 'Credit Card Withdrawl'
  WHEN operation = 'VKLAD' THEN 'Credit in Cash'
  WHEN operation = 'PREVOD Z UCTU' THEN 'Collection from another Bank '
  WHEN operation = 'VYBER' THEN 'Withdrawl in Cash'
  WHEN operation = 'PREVOD NA UCET' THEN 'Remittance to another Bank '
  ELSE operation
END;

UPDATE berka.trans
SET k_symbol = 
CASE 
  WHEN k_symbol = 'POJISTNE' THEN 'Insurance Payment'
  WHEN k_symbol = 'SLUZBY' THEN 'Payment for Statement'
  WHEN k_symbol = 'UROK' THEN 'Interest Credited'
  WHEN k_symbol = 'SANKC. UROK' THEN 'Sanction Interest if Negative Balance'
  WHEN k_symbol = 'SIPO' THEN 'Household Payment'
  WHEN k_symbol = 'DUCHOD' THEN 'Old-age Pension'
  WHEN k_symbol = 'UVER' THEN 'Loan Payment'
  ELSE k_symbol
END;

-- Updating loan table - categoric field to understandable meaning

ALTER TABLE loan ADD column status_description text;

UPDATE berka.loan
SET status_description = 
CASE 
  WHEN status = 'A' THEN 'Contract Finished - Loan Paid'
  WHEN status = 'B' THEN 'Contract Finished - Loan not Paid'
  WHEN status = 'C' THEN 'Running Contract - Without Debt'
  WHEN status = 'D' THEN 'Running Contract - Client in Debt'
  ELSE status
END;
