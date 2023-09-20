set echo on
spool analysis3.query
set timing on 

-- Query for analysis 3 : For two given genres and a year range we need to list the actors and actresses each separately who have
--acted in movies which have BOTH genres listed for that movie and the count of such movies for each year

-- Note :The mapping of data is been done similarly using join like done in analysis1 
-- years range will be 1941 and 1950 , genres will be adventure,comedy



--listing all actors for given parameters
select nb.primaryname, tb.startyear,tp.category,tb.genres,count(*)
from sharmac.title_principals tp
join sharmac.name_basics nb on nb.nconst=tp.nconst
join sharmac.title_basics tb on tb.tconst=tp.tconst
where (tb.startyear between '1941' and '1950') and (tb.genres like 'Adventure,Comedy') and (tb.titletype like 'movie') and (tp.category like 'actor') and (tb.startyear not like '\N')
group by nb.primaryname,tb.startyear,tp.category,tb.genres
order by tb.startyear asc;


--listing all actress for given parameters

select nb.primaryname, tb.startyear,tp.category,tb.genres,count(*)
from sharmac.title_principals tp
join sharmac.name_basics nb on nb.nconst=tp.nconst
join sharmac.title_basics tb on tb.tconst=tp.tconst
where (tb.startyear between '1941' and '1950') and (tb.genres like 'Adventure,Comedy') and (tb.titletype like 'movie') and (tp.category like 'actress') and (tb.startyear not like '\N')
group by nb.primaryname,tb.startyear,tp.category,tb.genres
order by tb.startyear asc;

--Verification
select nb.primaryname, tb.startyear,tp.category,tb.genres,tb.originaltitle
from sharmac.title_principals tp
join sharmac.name_basics nb on nb.nconst=tp.nconst
join sharmac.title_basics tb on tb.tconst=tp.tconst
where (tb.startyear like '1941') and (tb.genres like 'Adventure,Comedy') and (tb.titletype like 'movie') and (tp.category like 'actress') and (tb.startyear not like '\N')
group by nb.primaryname,tb.startyear,tp.category,tb.genres,tb.originaltitle
order by tb.startyear asc;


spool off







