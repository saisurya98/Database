set echo on
spool analysis1.query.sql
set timing on 

-- Query for analysis 1 : write an sql statement for each actor/actress  
--to compute the number of movies they have participated in by year during their career.


-- We need to select primaryname , startyear and count for a particular actor 
--Therefore we have to do the following : In title_basics we have a primary key as tconst and in name_basics we have a primary key as nconst 
-- In title principas we have tconst, nconst as a secondary key and a inner join is done on table name basics and titleprincipals with nconst,
-- The above step is done to get a proper mapping of data.
-- we use like 'movie' to match the string correctly


--Analysis 1 for actor Ethan Hawke 

select nb.primaryname as name, tb.startyear as year, count(*) as movie_count
from sharmac.title_principals tp
inner join sharmac.name_basics nb on nb.nconst=tp.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (nb.primaryname like 'Ethan Hawke') and (tb.startyear not like '\N') and (tb.titletype like 'movie')
group by nb.primaryname, tb.startyear
order by tb.startyear;


-- We used primarytitle for observing number of movies done by the actor in a sample range of years so that we can justify the above query 

select nb.primaryname as name, tb.startyear as year, tb.primarytitle as movie
from sharmac.title_principals tp
inner join sharmac.name_basics nb on nb.nconst=tp.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (nb.primaryname like 'Ethan Hawke') and (tb.startyear between '2015' and '2016') and (tb.titletype like 'movie')
group by nb.primaryname, tb.startyear,tb.primarytitle
order by tb.startyear;


--Analysis 1 for actress Marilyn Monroe

select nb.primaryname as name , tb.startyear as year, count(*) as movie_count
from sharmac.title_principals tp
inner join sharmac.name_basics nb on nb.nconst=tp.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (nb.primaryname like 'Marilyn Monroe') and (tb.startyear not like '\N') and (tb.titletype like 'movie')
group by nb.primaryname, tb.startyear
order by tb.startyear ;

-- We used primarytitle for observing number of movies done by the actor in a sample range of years so that we can justify the above query 


select nb.primaryname as name, tb.startyear as year, tb.primarytitle as movie
from sharmac.title_principals tp
inner join sharmac.name_basics nb on nb.nconst=tp.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (nb.primaryname like 'Marilyn Monroe') and  (tb.startyear between '1955' and '1957' ) and (tb.titletype like 'movie')
group by nb.primaryname, tb.startyear,tb.primarytitle
order by tb.startyear ;

-- additional analysis to find the best film
select tb.startyear,tb.titletype, tb.primarytitle as movie,avg(tr.averagerating)
from sharmac.title_principals tp
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
inner join sharmac.name_basics nb on nb.nconst=tp.nconst
inner join title_ratings tr on tr.tconst=tb.tconst
where (tb.startyear between '1920' and '2022' ) and  (tb.titletype like 'movie')  and(nb.primaryname like 'Marilyn Monroe') and (tb.startyear not like '\N')
group by tb.startyear,tb.titletype, tb.primarytitle 
order by 4 desc;


spool off
