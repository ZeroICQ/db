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
                        'CHILD_ID INTEGER'
                    ');')


s_id = 1
g_cur = None


def insert(parent, child):
    global s_id

    sql = 'INSERT INTO SUBGROUPS (id, parent_id, child_id) values (?,?,?)'

    g_cur.execute(sql, (s_id, parent, child))
    s_id += 1


def run(con, cur):
    global g_cur

    rmk_table(cur)
    con.commit()

    g_cur = cur

    insert(1, 2)
    insert(1, 3)
    insert(3, 8)
    insert(2, 4)
    insert(2, 5)
    insert(4, 6)
    insert(4, 7)




