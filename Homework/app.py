from flask import Flask
from flask import request
import fdb

app = Flask(__name__)
DB_PATH='localhost:C:/Users/Alexey/Desktop/db/STUDENTS.FDB'

@app.route("/")
def hello():
    con = fdb.connect(
    dsn=DB_PATH,
    user='SYSDBA',
    password='masterkey'
    )

    cur = con.cursor()
    result = '<form action="/"><input name="s" type="text"><input type="submit"></form><br>'

    searchword = request.args.get('s', '')
    if searchword:
        cur.execute("SELECT * FROM STUDENTS where name LIKE '%' || ? || '%'", (searchword,))
        for row in cur.fetchall():
            result += str(row) + '<br>'

    else:    
        sql = 'SELECT * FROM STUDENTS'
        cur.execute(sql)
        for row in cur.fetchall():
            result += str(row) + '<br>'

    con.close()
    return result
