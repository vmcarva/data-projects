-- The goal is to create a table with account and client profile information, so it can be further analyzed in Python
-- This table shows the most active customers, who have:
	-- respective district information 
	-- an existing balance amount 
    -- performed an payment order to a bank
    -- a card issued
    -- taken a bank loan
-- This amounts to 166 people, which is not the whole number of clients and accounts, but these are the clients taking the most of the bank's services  

CREATE TABLE account_profile 
select 
a.account_id,
c.client_id,
floor(datediff('1998-12-29',c.birth_date)/365) as client_age,
c.gender,
di.avg_salary,
di.no_crimes96,
di.unemployment_rate96,
di.rate_entrepreneurs,
TIMESTAMPDIFF(Month, a.account_date,'1998-12-29') as account_age_months,
IFNULL(TIMESTAMPDIFF(Month, cd.issue_date,'1998-12-29'),-1) as card_age_months,
cd.type,
ifnull(round(sum(o.amount)/if((TIMESTAMPDIFF(Month, a.account_date,'1998-12-29'))=0,1,TIMESTAMPDIFF(Month, a.account_date,'1998-12-29')),2),0) as avg_movimentation_amount,
balance.balance,
l.amount as loan_amount,
l.duration as loan_duration,
l.status_description

from account a

inner join disp d
on d.account_id = a.account_id

inner join client c
on c.client_id = d.client_id

inner join loan l
on l.account_id = a.account_id

inner join berka.order o 
on o.account_id = a.account_id

inner join card cd
on cd.disp_id = d.disp_id

inner join balance_account balance
on balance.account_id = a.account_id

inner join district di 
on di.district_id = a.district_id

group by account_id;


