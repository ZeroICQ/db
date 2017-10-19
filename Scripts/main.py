import fdb
import students
import groups
import subjects
import marks
import subgroups

DB_PATH='localhost:C:/Users/Alexey/Desktop/db/STUDENTS.FDB'

con = fdb.connect(
    dsn=DB_PATH,
    user='SYSDBA',
    password='masterkey'
)
try:
    cur = con.cursor()

    students.run(con, cur)
    groups.run(con, cur)
    subjects.run(con, cur)
    marks.run(con, cur)
    subgroups.run(con, cur)
finally:
    con.commit()
    con.close()