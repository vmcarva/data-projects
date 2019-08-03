
-- The most basic account information to me is: how much money does each account has at the most current date?
-- This script created the table balance_account, storing the account, the most current balance and the transaction id that generated it 

CREATE TABLE balance_account 
select tr.account_id, tr.balance, max(trans_id) as trans_id

from berka.trans tr
inner join (SELECT account_id, max(date_trans) as max_date from berka.trans
				group by account_id
				order by account_id) t2
on t2.account_id = tr.account_id
where t2.max_date = tr.date_trans
group by tr.account_id
order by tr.account_id, t2.max_date;


