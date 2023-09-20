import csv
import oracledb
dsn_tns = oracledb.makedsn(host = 'acaddbprod.uta.edu', port='1523', service_name='pcse1p.data.uta.edu')
conn = oracledb.connect(user='sxg8664', password='uN7YBRm8J1jF', dsn=dsn_tns)
cur = conn.cursor()


file3 =open(r"/Users/ASUS/OneDrive/Desktop/zip/sss.csv")
passenger = csv.reader(file3)
next(passenger)
for i in passenger:
    print(i)
    first_name =i[0]
    last_name = i[1]
    address = i[2]
    city = i[3]
    county = i[4]
    phone2= i[5]
    SSN =i[6]
    bdate=i[7]
    age=i[8]
    sql = ('insert into passenger(first_name, last_name, address, city, county, phone2,PSSN,bdate,age) '
        'values(:first_name,:last_name,:address,:city, :county, :phone2,:SSN, :bdate,:age)')
    cur.execute(sql,[first_name, last_name, address, city, county, phone2,SSN,bdate,age])
    conn.commit()



file1 =open(r"/Users/ASUS/OneDrive/Desktop/zip/Train.csv")
train = csv.reader(file1)
next(train)
for i in train:
    print(i)
    Train_Number =i[0]
    Train_Name = i[1]
    Premium_Fair = i[2]
    General_Fair = i[3]
    Source_Station = i[4]
    Destination_Station= i[5]
    Available_on = i[6]
    sql = ('insert into train(T_Number, T_Name, Premium_Fair, General_Fair, Source_Station, Destination_Station, Available_on) '
        'values(:Train_Number,:Train_Name,:Premium_Fair,:General_Fair, :Source_Station, :Destination_Station, :Available_on)')
    cur.execute(sql, [Train_Number, Train_Name, Premium_Fair, General_Fair, Source_Station, Destination_Station, Available_on])
    conn.commit()



file4 = open(r"/Users/ASUS/OneDrive/Desktop/zip/booked-1.csv")
booked = csv.reader(file4)
next(booked)
for i in booked:
    print(i)
    SSN = i[0]
    Train_Number = i[1]
    Ticket_Type = i[2]
    Staus = i[3]
    sql = ('insert into booked(SSN, Train_Number, Ticket_Type, Staus) '
           'values(:SSN,:Train_Number,:Ticket_Type,:Staus)')
    cur.execute(sql, [SSN, Train_Number, Ticket_Type, Staus])
    conn.commit()



file2 =open(r"/Users/ASUS/OneDrive/Desktop/zip/status.csv")
status = csv.reader(file2)
next(status)
for i in status:
    print(i)
    TrainDate =i[0]
    Train_Name = i[1]
    PremiumSeatsAvailable = i[2]
    GenSeatsAvailable = i[3]
    PremiumSeatsOccupied = i[4]
    GenSeatsOccupied= i[5]
    t_s_number = i[6]
    sql = ('insert into status(TrainDate, Train_Name, PremiumSeatsAvailable, GenSeatsAvailable, PremiumSeatsOccupied, GenSeatsOccupied, t_s_number) '
        'values(:TrainDate,:Train_Name,:PremiumSeatsAvailable,:GenSeatsAvailable, :PremiumSeatsOccupied, :GenSeatsOccupied ,:t_s_number)')
    cur.execute(sql, [TrainDate, Train_Name, PremiumSeatsAvailable, GenSeatsAvailable, PremiumSeatsOccupied, GenSeatsOccupied, t_s_number])
    conn.commit()



conn.close()
