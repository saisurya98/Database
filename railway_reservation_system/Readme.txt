step 1- install pulse secure vpn on the computer (https://uta.service-now.com/selfservice?id=ss_kb_article&sys_id=KB0011589)

step2 - have access for orace sql database for your specific net id ( sxg8664) 
	goto command prompt type ssh netid@omega.uta.edu and then type your password.

step 3- install oracle sql developer software for querying the data i.e creation of tables (https://www.oracle.com/database/sqldeveloper/technologies/download/)
	I have created train ,train_Status, passenger, booked tables using primary and foriegn key constraints of them. this is done on sql developer. 

step4- After the creation of tables are done , need to insert data into tables
       We were given data in csv format , this data is inserted into tables by python using oracledb package
       which is a connection between python and oracledb. Here we need to provide user, host, password for oracledb ,port and servername.
       run this command on terminal (python insert.py)

step 5- Check whether data is been inserted into tables correctly

step 6- We have run all tasks first on oracledb to understand what we need to clearly do before proceding with ui creation.

step7 - We have created (test.html) which our simple GUI interface , it will ask the user what task need to be executed.

step 7- Run this command on terminal ( python test.py) it takes you to a weblink .In that webpage enter the input you want to give.

step 8- Check for the ouput on the same webpage.
 