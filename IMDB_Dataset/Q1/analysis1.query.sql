SQL> set timing on
SQL> 
SQL> -- Query for analysis 1 : write an sql statement for each actor/actress  
SQL> --to compute the number of movies they have participated in by year during their career.
SQL> 
SQL> 
SQL> -- We need to select primaryname , startyear and count for a particular actor 
SQL> --Therefore we have to do the following : In title_basics we have a primary key as tconst and in name_basics we have a primary key as nconst 
SQL> -- In title principas we have tconst, nconst as a secondary key and a inner join is done on table name basics and titleprincipals with nconst,
SQL> -- The above step is done to get a proper mapping of data.
SQL> -- we use like 'movie' to match the string correctly
SQL> 
SQL> 
SQL> --Analysis 1 for actor Ethan Hawke 
SQL> 
SQL> select nb.primaryname as name, tb.startyear as year, count(*) as movie_count
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on nb.nconst=tp.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (nb.primaryname like 'Ethan Hawke') and (tb.startyear not like '\N') and (tb.titletype like 'movie')
  6  group by nb.primaryname, tb.startyear
  7  order by tb.startyear;
Elapsed: 00:00:00.751
SQL> 
SQL> 
SQL> -- We used primarytitle for observing number of movies done by the actor in a sample range of years so that we can justify the above query 
SQL> 
SQL> select nb.primaryname as name, tb.startyear as year, tb.primarytitle as movie
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on nb.nconst=tp.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (nb.primaryname like 'Ethan Hawke') and (tb.startyear between '2015' and '2016') and (tb.titletype like 'movie')
  6  group by nb.primaryname, tb.startyear,tb.primarytitle
  7  order by tb.startyear;
Elapsed: 00:00:00.368
SQL> 
SQL> 
SQL> --Analysis 1 for actress Marilyn Monroe
SQL> 
SQL> select nb.primaryname as name , tb.startyear as year, count(*) as movie_count
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on nb.nconst=tp.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (nb.primaryname like 'Marilyn Monroe') and (tb.startyear not like '\N') and (tb.titletype like 'movie')
  6  group by nb.primaryname, tb.startyear
  7  order by tb.startyear ;
Elapsed: 00:00:00.361
SQL> 
SQL> -- We used primarytitle for observing number of movies done by the actor in a sample range of years so that we can justify the above query 
SQL> 
SQL> 
SQL> select nb.primaryname as name, tb.startyear as year, tb.primarytitle as movie
  2  from sharmac.title_principals tp
  3  inner join sharmac.name_basics nb on nb.nconst=tp.nconst
  4  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  5  where (nb.primaryname like 'Marilyn Monroe') and  (tb.startyear between '1955' and '1957' ) and (tb.titletype like 'movie')
  6  group by nb.primaryname, tb.startyear,tb.primarytitle
  7  order by tb.startyear ;
Elapsed: 00:00:00.390
SQL> 
SQL> -- additional analysis to find the best film
SQL> select tb.startyear,tb.titletype, tb.primarytitle as movie,avg(tr.averagerating)
  2  from sharmac.title_principals tp
  3  inner join sharmac.title_basics tb on tb.tconst=tp.tconst
  4  inner join sharmac.name_basics nb on nb.nconst=tp.nconst
  5  inner join title_ratings tr on tr.tconst=tb.tconst
  6  where (tb.startyear between '1920' and '2022' ) and  (tb.titletype like 'movie')  and(nb.primaryname like 'Marilyn Monroe') and (tb.startyear not like '\N')
  7  group by tb.startyear,tb.titletype, tb.primarytitle 
  8  order by 4 desc;
Elapsed: 00:00:00.358
SQL> 
SQL> 
SQL> spool off
