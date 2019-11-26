SELECT 
	ta.title_id,
	a.au_id as AUTHOR_ID,
 	t.price*s.qty*t.royalty/100*ta.royaltyper/100 as sales_royalty
FROM authors a
left join titleauthor ta on a.au_id = ta.au_id 
left join titles t on ta.title_id = t.title_id 
left join sales s on s.title_id = ta.title_id
ORDER BY sales_royalty DESC

SELECT title_id, AUTHOR_ID, SUM(sales_royalty) as sum_sales_royalty from (SELECT 
	ta.title_id,
	a.au_id as AUTHOR_ID,
 	t.price*s.qty*t.royalty/100*ta.royaltyper/100 as sales_royalty
FROM authors a
left join titleauthor ta on a.au_id = ta.au_id 
left join titles t on ta.title_id = t.title_id 
left join sales s on s.title_id = ta.title_id
ORDER BY sales_royalty DESC) 
GROUP by title_id, AUTHOR_ID ORDER by SUM(sales_royalty)  desc;

SELECT AUTHOR_ID, sum (sum_sales_royalty)
from 
(SELECT title_id, AUTHOR_ID, SUM(sales_royalty) as sum_sales_royalty from 
(SELECT 
	ta.title_id,
	a.au_id as AUTHOR_ID,
 	t.price*s.qty*t.royalty/100*ta.royaltyper/100 as sales_royalty
FROM authors a
left join titleauthor ta on a.au_id = ta.au_id 
left join titles t on ta.title_id = t.title_id 
left join sales s on s.title_id = ta.title_id
ORDER BY sales_royalty DESC)
GROUP by title_id, AUTHOR_ID ORDER by SUM(sales_royalty) desc)
GROUP BY AUTHOR_ID
GROUP by sum (sum_sales_royalty)
limit 3

