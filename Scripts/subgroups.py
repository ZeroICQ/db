import random


def rmk_table(cur):
    try:
        cur.execute('DROP TABLE SUBGROUPS')
    except:
        print('table SUBGROUPS doesn\'t exist')
    finally:
        cur.execute('CREATE TABLE SUBGROUPS('
                        'ID INTEGER,'
                        'PARENT_ID INTEGER,'
                        'CHILD_ID INTEGER,'
                        'NAME VARCHAR(255)'
                    ');')


s_id = 1
g_cur = None


def insert(parent, child, name):
    global s_id

    sql = 'INSERT INTO SUBGROUPS (id, parent_id, child_id, name) values (?,?,?,?)'

    g_cur.execute(sql, (s_id, parent, child, name))
    s_id += 1


def run(con, cur):
    global g_cur

    rmk_table(cur)
    con.commit()

    g_cur = cur

    insert(None, 2, 'sub1')
    insert(1, 3, 'sub2')
    insert(2, 4, 'sub3')
    insert(3, 5, 'sub4')
    insert(4, None, 'sub5')

    insert(None, 7, 'sub6')
    insert(7, 8, 'sub7')
    insert(8, None, 'sub8')

    insert(None, 9, 'sub9')
    insert(9, None, 'sub10')





