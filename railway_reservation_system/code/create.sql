    CREATE TABLE train(
     T_Number INT not null,
     T_Name VARCHAR(255) not null,
     Premium_Fair INT NOT NULL,
     General_Fair INT NOT NULL,
     Source_Station VARCHAR(255)NOT NULL,
     Destination_Station VARCHAR(255) NOT NULL,
     Available_on varchar(255) NOT NULL,
     Primary key(T_Number)
    );
    
    CREATE TABLE status(
        TrainDate  VARCHAR(255) not null,
        Train_Name Varchar(255) not null,
        PremiumSeatsAvailable INT not null,
        GenSeatsAvailable INT not null,
        PremiumSeatsOccupied INT not null,
        GenSeatsOccupied INT not null,
        t_s_number  INT not null,
        primary key(t_s_number), 
        foreign key(t_s_number) references train(T_Number)
    );
    
    Create Table passenger(
        first_name char(20) not null,
        last_name char(20) not null,
        address varchar(100) not null,
        city char(50) not null,
        county char(50) not null,
        phone2 varchar(15) not null,
        PSSN varchar(10),
        bdate varchar(20) not null,
        age int not null,
        primary key(PSSN)
    );
    
    Create Table booked(
        SSN varchar(10) not null,
        Train_Number INT not null,
        Ticket_Type varchar(255) not null,
        Staus varchar(255) not null,
        primary key(SSN, Train_Number),
        foreign key (SSN) references passenger(PSSN),
        foreign key(Train_Number) references train(T_Number)
    );



