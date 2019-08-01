SELECT a.au_id, a.au_lname, a.au_fname, sum(qty) as total  FROM authors a
inner join titleauthor ta
on ta.au_id = a.au_id
inner join titles t
on ta.title_id = t.title_id 
inner join publishers p
on p.pub_id = t.pub_id
inner join sales s
on s.title_id = t.title_id
group by a.au_id
order by total desc
limit 3;
