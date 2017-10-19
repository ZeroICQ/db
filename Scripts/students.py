import random


def gen_date():
    day = random.randint(1, 28)
    month = random.randint(1, 12)
    year = random.randint(1900, 2000)
    return '%d-%d-%d' % (year, month, day)


names = ['Nikita', 'Alexander', 'Dima', 'Nastya', 'Dasha']
surnames = ['Ivanov', 'Smirnov', 'Vasilev', 'Petrov', 'Kyznetsov']
fatherNames = ['Ivanovich', 'Alexeevich', 'Vasilich', 'Olegovich']


def rmk_table(cur):
    try:
        cur.execute('DROP TABLE STUDENTS')
    except:
        print('table STUDENTS doesn\'t exist')
    finally:
        cur.execute('CREATE TABLE STUDENTS('
                        'ID INTEGER,'
                        'NAME VARCHAR(255),'
                        'BIRTHDAY DATE,'
                        'GROUP_ID INTEGER'
                    ');')


def run(con, cur):
    s_id = 1
    rmk_table(cur)
    con.commit()
    for name in names:
        for surname in surnames:
            for fatherName in fatherNames:
                fio = '%s %s %s' % (surname, name, fatherName)
                sql = 'INSERT INTO STUDENTS VALUES (%d, \'%s\', \'%s\', %d);' % (s_id, fio, gen_date(), random.randint(1, 8))
                cur.execute(sql)
                s_id += 1

