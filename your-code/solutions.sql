use pubs;

#select * from authors;
#select * from discounts;
#select * from employee;
#select * from jobs;
#select * from pub_info;
#select * from publishers;
#select * from roysched;
#select * from sales;
#select * from stores;
#select * from titleauthor;
#select * from titles;

## Challenge 1 - Who Have Published What At Where?
select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", titles.title as TITLE, publishers.pub_name as PUBLISHER
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id;

## Challenge 2 - Who Have Published How Many At Where?
select authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME",
publishers.pub_name as PUBLISHER,
count(titles.title_id) as "TITLE COUNT"
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
order by authors.au_id desc;

#select count(*) from titleauthor;

## Challenge 3 - Best Selling Authors
select authors.au_id "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", sum(sales.qty) as TOTAL
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
join sales on titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by TOTAL desc
limit 3; 

## Challenge 4 - Best Selling Authors Ranking
select authors.au_id "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME",
coalesce(sum(sales.qty), 0) as TOTAL
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titleauthor.title_id = titles.title_id
left join sales on titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
order by TOTAL desc;






