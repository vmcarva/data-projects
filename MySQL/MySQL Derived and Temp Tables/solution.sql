
USE lab_mysql_vinicius; 

#Query with derived tables

SELECT r3.au_id, SUM(r3.vl_royalty) AS total_royalties FROM 
(SELECT r2.title_id, r2.au_id, SUM(r2.royalty) AS vl_royalty FROM 
(SELECT s.title_id, a.au_id, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 AS royalty FROM authors a
INNER JOIN titleauthor ta
ON ta.au_id = a.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id 
INNER JOIN publishers p
ON p.pub_id = t.pub_id
INNER JOIN sales s
ON s.title_id = t.title_id
ORDER BY a.au_id ) AS r2
GROUP BY r2.title_id
) AS r3
GROUP BY r3.au_id
ORDER BY total_royalties DESC
LIMIT 3;


#Query with temp tables

CREATE TEMPORARY TABLE IF NOT EXISTS temp_royalties AS (SELECT s.title_id, a.au_id, t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 AS royalty
FROM authors a
INNER JOIN titleauthor ta
ON ta.au_id = a.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id 
INNER JOIN publishers p
ON p.pub_id = t.pub_id
INNER JOIN sales s
ON s.title_id = t.title_id
ORDER BY a.au_id);

CREATE TEMPORARY TABLE IF NOT EXISTS temp_royalties2 AS (SELECT r2.title_id, r2.au_id, SUM(r2.royalty) AS vl_royalty FROM temp_royalties r2 GROUP BY r2.title_id);

CREATE TEMPORARY TABLE IF NOT EXISTS temp_royalties3 AS (SELECT r3.au_id, SUM(r3.vl_royalty) AS total_royalties FROM temp_royalties2 r3 GROUP BY r3.au_id);

SELECT * FROM temp_royalties3 ORDER BY total_royalties DESC LIMIT 3;

# Creating permanent table 
CREATE TABLE most_profiting_authors AS (SELECT * FROM temp_royalties3);
SELECT * FROM most_profiting_authors ORDER BY total_royalties DESC LIMIT 3;