We have created a large database and populated it with Millions of rows of International 
Movies and TV episodes information.  It is known as the IMDb database by the community 
(publicly available data set, but not as a relational DBMS) and used by researchers in databases 
and other fields. IMDb database schema (table name, attribute name and type) are given at the 
end. This has all movie and TV episode information from the beginning (1925) until 2018 for US 
and international movies and TV episodes. You can query this database for looking up certain 
information of interest, finding aggregate and statistical information that you are interested in, 
and OLAP analysis queries as well to the extent possible using SQL.

The IMDb database includes the following information: movie title, produced year, genres a 
movie belongs to, actors, writers, directors, runtime, adult or non-adult classification, reviews 
in terms of votes on the movie, average rating, region, language etc. Similarly for TV series. 
The purpose of setting up this database and this exercise is to provide you with an 
understanding of the differences between analyzing data available in files that you have used 
for the last 2 project vs. analyzing data stored in a DBMS. This is a large real-world DBMS and 
hence you will be writing your analysis queries in SQL (or Structured Query Language). Although 
the database is large, the response time is good which will allow you to appreciate the 
technology behind a DBMS (query optimization, concurrency control, simple relational 
abstraction, easy-to-use, non-procedural query language etc.) 

Analysis 1 
For this analysis, we will give you 2 names (one actor and one actress, in the param file as we 
have done earlier, for each team) and you choose your  favorite 1 actor and 1 actress. Write 
SQL queries (properly indented) for each (or together) to compute the number (count) of 
movies they have participated in by year during their career and compare them using 
visualization. IMDb database has international movies and actors as well so you can choose 
your pet actor/actress. You are welcome to do additional analysis as well.


II. 
Analysis 2 
In this analysis, you will be given a range of years and in that range, you need to find the 
actor/actress who have done the maximum number of movies and minimum number of movies. 
The output from the IMDb database is given below. To avoid listing a large number of 
actors/actresses with minimum as 1, please output who have done at least 3 as the 
minimum.   All outputs are sorted on year in ascending order. As you can see, there are too 
many rows for the minimum. This will reduce by making the minimum as 3 or above. 

Analysis 3 
For two given genres and a year range, list the actors/actresses (each separately) who have 
acted in movies which have BOTH genres listed for that movie and the count of such movies for 
each year (actor/actress name, year, and count as shown below). Many years may be absent if 
they have not acted in a movie with the two genres in that year.  
