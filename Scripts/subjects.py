import random


def rmk_table(cur):
    try:
        cur.execute('DROP TABLE SUBJECTS')
    except:
        print('table SUBJECTS doesn\'t exist')
    finally:
        cur.execute('CREATE TABLE SUBJECTS('
                        'ID INTEGER,'
                        'NAME VARCHAR(255),'
                        'GROUP_ID INTEGER'
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
        cur.execute('INSERT INTO subjects VALUES (%d, \'%s\', %d);' % (idx + 1, subject, random.randint(1, 5)))