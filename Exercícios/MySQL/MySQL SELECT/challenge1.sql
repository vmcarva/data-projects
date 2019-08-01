SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name  FROM authors a
inner join titleauthor ta
on ta.au_id = a.au_id
inner join titles t
on ta.title_id = t.title_id 
inner join publishers p
on p.pub_id = t.pub_id




