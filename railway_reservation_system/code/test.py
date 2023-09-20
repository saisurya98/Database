from flask import Flask, render_template, request
import oracledb
import re
def change_date_format(dt):
        return re.sub(r'(\d{4})-(\d{1,2})-(\d{1,2})', '\\3-\\2-\\1', dt)

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('test.html')

@app.route('/hello', methods=['POST'])
def hello():
    
    dsn_tns = oracledb.makedsn(host = 'acaddbprod.uta.edu', port='1523', service_name='pcse1p.data.uta.edu')
    conn = oracledb.connect(user='sxg8664', password='uN7YBRm8J1jF', dsn=dsn_tns)
    cur = conn.cursor()
    query ='select * from train'
    form=request.form['form']
    fname = request.form['fname']
    lname=request.form['lname']
    age=request.form['age']
    tname = request.form['tname']
    ssn= request.form['ssn']
    day=change_date_format(request.form['day'])
    tno=0
    ttype=''
    if form=='Execute Task1':
        query='select p.first_name, p.last_name , t.T_Number, t.T_Name from passenger p , booked b , train t where (p.PSSN =b.SSN) and (b.Train_Number=t.T_Number) and (p.first_name =\'%s\') and (p.last_name =\'%s\') '% (fname,lname)     
    elif form=='Execute Task3':
        query='select t.T_number, t.T_name, t.Source_Station,t.Destination_Station, p.first_name, p.last_name, b.Ticket_Type,b.Staus, p.age from train t, passenger p, booked b where (t.T_Number=b.Train_Number) and (p.PSSN=b.SSN) and (p.age =%s)'%(age)
    elif form=='Execute Task4':
        query='select t.T_Name as trainname, t.T_number as trainnumber, count (*) as count from train t, passenger p, booked b where (t.T_number = b.Train_number) and (p.PSSN= b.SSN) group by t.T_name,t.T_number'
    elif form=='Execute Task5':
        query='select t.T_Name, p.first_name, p.last_name from train t , passenger p , booked b where (t.T_Number=b.Train_Number) and (p.PSSN=b.SSN) and b.staus= \'Booked\' and t.T_Name=\'%s\' group by t.T_Name, p.first_name, p.last_name order by t.T_Name' % (tname)
    elif form=='Execute Task2':
        query='select p.first_name , p.last_name, b.staus,s.TrainDate from train t , passenger p , booked b, status s where (t.T_Number=b.Train_Number) and (p.PSSN=b.SSN) and b.staus= \'Booked\' AND  s.TrainDate =\'%s\''% (day) 
    elif form=='Execute Task6':
        query='select * from booked  where SSN=\'%s\' and staus=\'Booked\' fetch first 1 row only'% (ssn)
        cur.execute(query)
        results=cur.fetchone()
        tno=results[1]
        ttype=results[2]
        query='delete from booked where SSN=\'%s\' and Train_Number=\'%s\' and Ticket_Type =\'%s\''% (ssn,tno,ttype)
        cur.execute(query)
        query='update booked SET staus= \'CONFIRMED\' where SSN in (select p.PSSN from passenger p, booked b, train t where (p.PSSN=b.SSN) and (b.staus=\'WaitL\') and (b.Train_Number=\'%s\') and (b.Ticket_Type=\'%s\') and (t.T_Number=b.Train_Number) fetch first 1 row only) and Train_Number=\'%s\''%(tno,ttype,tno)
        cur.execute(query)
        query='select * from booked where staus=\'CONFIRMED\' '
    cur.execute(query)
    results=cur.fetchall() 
    conn.commit()
    return '%s <br/> <a href="/">Back Home</a>' % (results)

if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 5000)