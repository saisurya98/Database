select * from status;
select * from passenger;
select * from booked;
select * from train;

drop table booked;
drop table passenger;
drop table status;
drop table train; 

--DELETE FROM status
--WHERE Train_Name='21-02-2022';


insert into status(Train_Name, TrainDate, PremiumSeatsAvailable, GenSeatsAvailable, PremiumSeatsOccupied, GenSeatsOccupied, t_s_number) 
        values('Golden Chariot','21-02-2022',6,3,4,7,4);
      
insert into passenger(first_name, last_name, address, city, county, phone2,PSSN,bdate)
    values('James','Butt','6649 N Blue Gum St', 'New Orleans', 'Orleans', '504-845-1427', '264816896', '1968-10-10');
        
    
select t.t_number, t.t_name from train t, status s where t.t_number= s.t_s_number;

-- TASK 1
select p.first_name, p.last_name , t.T_Number, t.T_Name
from passenger p , booked b , train t
where (p.PSSN =b.SSN) and (b.Train_Number=t.T_Number) 
--and (p.first_name ='Art') and (p.last_name ='Venere')          


--TASK 2
--User input the Day and list of passengers travelling on entered day with confirmed tickets displays on UI.
select p.first_name , p.last_name, b.staus,s.TrainDate
from train t , passenger p , booked b, status s
where (t.T_Number=b.Train_Number) and (p.PSSN=b.SSN) and b.staus= 'Booked' AND  s.TrainDate = '21-02-2022';



--TASK3
--User input the age of the passenger (50 to 60) and UI display the train information (TrainNumber, Train Name, Source and Destination) 
--and passenger information (Name, Address,Category, ticket status) of passengers who are between the ages of 50 to 60. 
select t.T_number, t.T_name, t.Source_Station,t.Destination_Station, p.first_name, p.last_name, b.Ticket_Type,b.Staus, p.age
from train t, passenger p, booked b
where (t.T_Number=b.Train_Number) and (p.PSSN=b.SSN) and (p.age =55);



--TASK 4 List all the train name along with count of passengers it is carrying
select t.T_Name as trainname, t.T_number as trainnumber, count (*) as count
from train t, passenger p, booked b
where (t.T_number =b.Train_number) and (p.PSSN= b.SSN)
group by t.T_name,t.T_number ;

--TASK5 Enter a train name and retrieve all the passengers with confirmed status travelling in that train
select t.T_Name, p.first_name, p.last_name
from train t , passenger p , booked b
where (t.T_Number=b.Train_Number) and (p.PSSN=b.SSN) and b.staus= 'Booked' 
group by t.T_Name, p.first_name, p.last_name
order by t.T_Name ;

--TASK 6 User Cancel a ticket (delete a record) and show that passenger in waiting list get ticket confirmed. 
select p.first_name,p.last_name,b.Train_Number,b.staus,b.Ticket_Type,p.PSSN
from passenger p, booked b
where (p.PSSN=b.SSN)
fetch first 1 row only; 


update booked
SET staus= 'CONFIRMED' where SSN in (select p.PSSN
                               from passenger p, booked b, train t
                               where (p.PSSN=b.SSN) and (b.staus='WaitL') and (b.Train_Number=2) and (b.Ticket_Type='General') and (t.T_Number=b.Train_Number)
                               fetch first 1 row only)
                               and Train_Number=2  ; 


--query for seeing info on type nd status nd train number 
select * from booked  where SSN='240471168' and staus='Booked'             
fetch first 1 row only;

delete from booked where SSN='240471168' and Train_Number=2 and Ticket_Type ='General'


240471168

SELECT *from passenger p, booked b where (b.SSN=p.PSSN);             
