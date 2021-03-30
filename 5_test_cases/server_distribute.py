import  csv
import mysql.connector
import math

# Variable
global limit, offset
table = "creditscore"


# Connect to Database
mydb = mysql.connector.connect(
  host="10.83.35.70",
  user="root",
  password="123$%^",
  database="credit_score"
)

# Select and count number of User
mycursor = mydb.cursor()
mycursor.execute(f"SELECT * FROM {table}")
myresult = mycursor.fetchall()
users = 0
for data in myresult:
  users+=1
print('Number of Users = ',users)


# Read CSV File
with open('server.csv', 'r') as csvFile:
    reader = csv.reader(csvFile)
    server = []
    ips=0
    for row in reader:
        server.append(row)
        ips+=1
    print('Number of Server IPs = ',ips)    
    limit = math.ceil(users/ips)

 # Query DB with Limit and Offset
 
for x in server:
  index = server.index(x)
  offset = index*limit
  mycursor.execute(f"SELECT id FROM {table} LIMIT {limit} OFFSET {offset}")
  server1 = mycursor.fetchall()
  print(f'ID List {index}',server1)
       