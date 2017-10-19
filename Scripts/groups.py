import random


def gen_date():
    day = random.randint(1, 29)
    month = random.randint(1, 12)
    year = random.randint(1900, 2000)
    return '%d-%d-%d' % (year, month, day)

def rmk_table(cur):
    try:
        cur.execute('DROP TABLE GROUPS')
    except:
        print('table GROUPS doesn\'t exist')
    finally:
        cur.execute('CREATE TABLE GROUPS('
                        'ID INTEGER,'
                        'NAME VARCHAR(255)'
                    ');')


def run(con, cur):
    rmk_table(cur)
    con.commit()

    group_names = ['natural science',
                   'engineer',
                   'international relationships',
                   'economics and management',
                   'eastern culture',
                   'good',
                   'bad',
                   'average']

    for idx, name in enumerate(group_names):
        sql = 'INSERT INTO GROUPS VALUES (%d, \'%s\')' % (idx+1, name)
        cur.execute(sql)
