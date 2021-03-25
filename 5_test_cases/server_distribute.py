import  csv
import mysql.connector
import math

# Get list form Database
mydb = mysql.connector.connect(
  host="10.83.35.70",
  user="root",
  password="123$%^",
  database="rule_management"
)
mycursor = mydb.cursor()
mycursor.execute("SELECT count(*) FROM data_model")
myresult = mycursor.fetchall()

for x in myresult:
  
  print(x)

# Read CSV File
with open('server.csv', 'r') as csvFile:
    reader = csv.reader(csvFile)
    server = []
    for row in reader:
        server.append(row)

# Select DB by index
    for x in server:
        index = server.index(x)
        # print('Index of', x ,'is',index)
        if index == 0:
          mycursor.execute("SELECT id FROM data_model LIMIT 5 OFFSET 0")
          server1 = mycursor.fetchall()
          for x in myresult:
            print('list 1',server1)
        elif  index == 1:
          mycursor.execute("SELECT id FROM data_model LIMIT 5 OFFSET 5")
          server2 = mycursor.fetchall()
          for x in myresult:
            print('list 2',server2)
        elif  index == 2:
          mycursor.execute("SELECT id FROM data_model LIMIT 5 OFFSET 10")
          server3 = mycursor.fetchall()
          for x in myresult:
            print('list 3',server3)
        elif  index == 3:
          mycursor.execute("SELECT id FROM data_model LIMIT 5 OFFSET 15")
          server4 = mycursor.fetchall()
          for x in myresult:
            print('list 4',server4)
        else:
          mycursor.execute("SELECT id FROM data_model LIMIT 5 OFFSET 20")
          server5 = mycursor.fetchall()
          for x in myresult:
            print('list 5',server5)

    


