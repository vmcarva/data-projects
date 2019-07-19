SELECT a.au_id, a.au_lname, a.au_fname, ifnull(sum(qty),0) as total  FROM authors a
left outer join titleauthor ta
on ta.au_id = a.au_id
left outer join titles t
on ta.title_id = t.title_id 
left outer join publishers p
on p.pub_id = t.pub_id
left outer join sales s
on s.title_id = t.title_id
group by a.au_id
order by total desc, au_lname 
limit 23;


 