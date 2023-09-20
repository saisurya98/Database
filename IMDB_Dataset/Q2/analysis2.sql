set echo on
spool analysis2.query.sql
set timing on 

-- Query for analysis 2 we have a range of years and in that range, you need to find the
--actor/actress who have done the maximum number of movies and minimum number of movies.
-- The range of years needed to use is 1941 to 1950


-- Maximum number of movies done for actor
select nb.nconst as name_id ,nb.primaryname as name,count(*) as movies
from sharmac.title_principals tp
inner join sharmac.name_basics nb on tp.nconst=nb.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actor') and (tb.startyear not like '\N') 
group by nb.nconst,nb.primaryname
order by 3 desc
fetch first 1 row only;

-- Maximum number of movies done for actress
select nb.nconst as name_id ,nb.primaryname as name,count(*) as movies
from sharmac.title_principals tp
inner join sharmac.name_basics nb on tp.nconst=nb.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actress') and (tb.startyear not like '\N') 
group by nb.nconst,nb.primaryname
order by 3 desc
fetch first 2 rows only;



-- Minimum number of movies done for actor 
select nb.nconst as name_id ,nb.primaryname as name, count(*) as movies
from sharmac.title_principals tp
inner join sharmac.name_basics nb on tp.nconst=nb.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actor') and (tb.startyear not like '\N')
group by nb.nconst,nb.primaryname
having count(*)>=3
order by 3
fetch first 2 rows only;


-- Minimum number of movies done for actress
select nb.nconst as name_id ,nb.primaryname as name, count(*) as movies
from sharmac.title_principals tp
inner join sharmac.name_basics nb on tp.nconst=nb.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actress') and (tb.startyear not like '\N')
group by nb.nconst,nb.primaryname
having count(*)>=3
order by 3  
fetch first 2 rows only;


-- Query used for correctness 
select nb.primaryname as name, tb.primarytitle as movie
from sharmac.title_principals tp
inner join sharmac.name_basics nb on nb.nconst=tp.nconst
inner join sharmac.title_basics tb on tb.tconst=tp.tconst
where (nb.primaryname like 'Charles Starrett ') and  (tb.startyear between '1941' and '1950' ) and (tb.titletype like 'movie') and (tp.category like 'actress')
group by nb.primaryname,tb.primarytitle;



spool off












