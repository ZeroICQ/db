import random


def rmk_table(cur):
    try:
        cur.execute('DROP TABLE MARKS')
    except:
        print('table MARKS doesn\'t exist')
    finally:
        cur.execute('CREATE TABLE MARKS('
                        'ID INTEGER,'
                        'STUDENT_ID INTEGER,'
                        'SUBJECT_ID INTEGER,'
                        'MARK INTEGER'
                    ');')


def run(con, cur):
    rmk_table(cur)
    con.commit()
    for x in range(1000):
        if x % 1000 == 0:
            print(x)
        sql = 'INSERT INTO MARKS VALUES(%d, %d, %d, %d);' % (x + 1, random.randint(1, 100), random.randint(1, 58), random.randint(1, 10))
        cur.execute(sql)