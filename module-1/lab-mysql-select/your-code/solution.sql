-- Challenge 1 - Who Have Published What At Where?

SELECT 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
	a.au_fname as FIRST_NAME,
	t.title as TITLE,
	p.pub_name as PUBLISHER
FROM titles t
join publishers p on t.pub_id = p.pub_id
join titleauthor ta on ta.title_id = t.title_id
join authors a on a.au_id = ta.au_id

-- Challenge 2 - Who Have Published How Many At Where?

SELECT 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
	a.au_fname as FIRST_NAME,
	p.pub_name as PUBLISHER,
	count(t.title) as TITLE_COUNT
FROM titles t
INNER join publishers p on t.pub_id = p.pub_id
INNER join titleauthor ta on ta.title_id = t.title_id
INNER join authors a on a.au_id = ta.au_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY count(t.title) desc;

-- Sum the counter of titles
SELECT SUM(TITLE_COUNT)
FROM (SELECT 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
	a.au_fname as FIRST_NAME,
	p.pub_name as PUBLISHER,
	count(t.title) as TITLE_COUNT
FROM titles t
INNER join publishers p on t.pub_id = p.pub_id
INNER join titleauthor ta on ta.title_id = t.title_id
INNER join authors a on a.au_id = ta.au_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name
ORDER BY count(t.title) desc)

-- Counter titleauthor
SELECT COUNT(title_id)
FROM titleauthor t

-- Challenge 3 - Best Selling Authors
SELECT 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
	a.au_fname as FIRST_NAME,
	sum(s.qty) as TOTAL
FROM authors a
left join titleauthor ta on a.au_id = ta.au_id 
left join sales s on s.title_id = ta.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3


-- Challenge 4 - Best Selling Authors Ranking


SELECT 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
	a.au_fname as FIRST_NAME,
	CASE 
		WHEN ta.title_id is NULL then 0 
		ELSE sum(s.qty) 
	END as TOTAL
FROM authors a
left join titleauthor ta on a.au_id = ta.au_id 
left join sales s on s.title_id = ta.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC

-- Bonus Challenge - Most Profiting Authors

SELECT 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
	a.au_fname as FIRST_NAME,
	sum(r.royalty) as PROFIT
FROM authors a
left join titleauthor ta on a.au_id = ta.au_id 
left join roysched r on r.title_id = ta.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY PROFIT DESC
LIMIT 3
