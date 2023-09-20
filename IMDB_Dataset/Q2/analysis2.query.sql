SQL> set timing on
SQL> 
SQL> -- Query for analysis 2 we have a range of years and in that range, you need to find the
SQL> --actor/actress who have done the maximum number of movies and minimum number of movies.
SQL> -- The range of years needed to use is 1941 to 1950
SQL> 
SQL> 
SQL> -- Maximum number of movies done for actor
SQL> select nb.nconst as name_id ,nb.primaryname as name,count(*) as movies
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on tp.nconst=nb.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actor') and (tb.startyear not like '\N') 
  6  group by nb.nconst,nb.primaryname
  7  order by 3 desc
  8  fetch first 1 row only;
Elapsed: 00:00:01.577
SQL> 
SQL> -- Maximum number of movies done for actress
SQL> select nb.nconst as name_id ,nb.primaryname as name,count(*) as movies
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on tp.nconst=nb.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actress') and (tb.startyear not like '\N') 
  6  group by nb.nconst,nb.primaryname
  7  order by 3 desc
  8  fetch first 2 rows only;
Elapsed: 00:00:00.409
SQL> 
SQL> 
SQL> 
SQL> -- Minimum number of movies done for actor 
SQL> select nb.nconst as name_id ,nb.primaryname as name, count(*) as movies
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on tp.nconst=nb.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actor') and (tb.startyear not like '\N')
  6  group by nb.nconst,nb.primaryname
  7  having count(*)>=3
  8  order by 3
  9  fetch first 2 rows only;
Elapsed: 00:00:00.366
SQL> 
SQL> 
SQL> -- Minimum number of movies done for actress
SQL> select nb.nconst as name_id ,nb.primaryname as name, count(*) as movies
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on tp.nconst=nb.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (tb.startyear between '1941' and '1950') and (tb.titletype like 'movie') and (tp.category like 'actress') and (tb.startyear not like '\N')
  6  group by nb.nconst,nb.primaryname
  7  having count(*)>=3
  8  order by 3  
  9  fetch first 2 rows only;
Elapsed: 00:00:00.357
SQL> 
SQL> 
SQL> -- Query used for correctness 
SQL> select nb.primaryname as name, tb.primarytitle as movie
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on nb.nconst=tp.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (nb.primaryname like 'Charles Starrett ') and  (tb.startyear between '1941' and '1950' ) and (tb.titletype like 'movie') and (tp.category like 'actress')
  6  group by nb.primaryname,tb.primarytitle;
Elapsed: 00:00:00.375
SQL> 
SQL> 
SQL> 
SQL> spool off
