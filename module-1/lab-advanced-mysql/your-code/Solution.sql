SELECT 
	ta.title_id,
	a.au_id as AUTHOR_ID,
 	t.price*s.qty*t.royalty/100*ta.royaltyper/100 as sales_royalty
FROM authors a
left join titleauthor ta on a.au_id = ta.au_id 
left join titles t on ta.title_id = t.title_id 
left join sales s on s.title_id = ta.title_id
ORDER BY sales_royalty DESC
