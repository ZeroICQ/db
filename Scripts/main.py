import fdb
import students
import groups
import subjects
import marks

DB_PATH='localhost:C:/Users/Alexey/Desktop/database/STUDENTS.FDB'

con = fdb.connect(
    dsn=DB_PATH,
    user='SYSDBA',
    password='masterkey'
)

cur = con.cursor()

students.run(con, cur)
groups.run(con, cur)
subjects.run(con, cur)
marks.run(con, cur)

con.commit()
con.close()