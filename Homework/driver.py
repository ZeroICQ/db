import fdb

DB_PATH='localhost:C:/Users/Alexey/Desktop/db/STUDENTS.FDB'

con = fdb.connect(
    dsn=DB_PATH,
    user='SYSDBA',
    password='masterkey'
)

try:
    cur = con.cursor()
    sql = 'SELECT * FROM STUDENTS'
    cur.execute(sql)

    for row in cur.fetchall():
        print(row)
finally:
    con.close()
