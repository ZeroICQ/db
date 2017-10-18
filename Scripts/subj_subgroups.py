import random
import fdb


def rmk_table(cur):
    try:
        cur.execute('DROP TABLE subj_sub')
    except:
        print('table subj_sub doesn\'t exist')
    finally:
        cur.execute('CREATE TABLE subj_sub('
                    'ID INTEGER,'
                    'NAME VARCHAR(255),'
                    'SUBGROUP_ID INTEGER'
                    ');')


def run(con, cur):
    rmk_table(cur)
    con.commit()

    subjects = []

    with open('subjects.txt', 'r') as f:
        for line in f:
            if line != '\n':
                subjects.append(line.strip())

    for idx, subject in enumerate(subjects):
        cur.execute('INSERT INTO subj_sub VALUES (%d, \'%s\', %d);' % (idx + 1, subject, random.randint(1, 10)))

DB_PATH='localhost:C:/Users/Alexey/Desktop/database/STUDENTS.FDB'

con = fdb.connect(
    dsn=DB_PATH,
    user='SYSDBA',
    password='masterkey'
)
try:
    cur = con.cursor()

    run(con, cur)
finally:
    con.commit()
    con.close()
