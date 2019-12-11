import mysql.connector
from urllib.parse import urlparse

def mysql_inserts(cur_name,tablename,insert_data_list):
    sql_str = "INSERT INTO {} (name,price,start_date) VALUES (%s, %s, %s)".format(tablename)
    cur_name.executemany(sql_str,insert_data_list)

def mysql_insert(cur_name,tablename,data):
    if type(data) is dict:
        sql_str = "INSERT INTO {} (name,price,start_date) VALUES (%(name)s, %(price)s, %(start_date)s)".format(tablename)
        cur_name.execute(sql_str, data)
    else:
        sql_str = "INSERT INTO {} (name,price,start_date) VALUES (%s, %s, %s)".format(tablename)
        cur_name.execute(sql_str, data)

def mysql_select(cur_name,tablename):
    sql_str = "SELECT * FROM {}".format(tablename)
    cur_name.execute(sql_str)
    rows = cur_name.fetchall()
    for row in rows:
        print(row)


#localhostのMySQLのDB名:nyumonにユーザー名:ex_user password:ex_passで接続し,テーブル名:menuに対して操作する
def main():
    mysql_url = urlparse("mysql://ex_user:ex_pass@localhost:3306/nyumon")#デフォルトが3306

    conn = mysql.connector.connect(
        host = mysql_url.hostname or "localhost",
        port = mysql_url.port or 3306,
        user = mysql_url.username or "root",
        password = mysql_url.password or " ",
        database = mysql_url.path[1:]
    )
    print(conn.is_connected())
    conn.ping(reconnect=True)

    cur = conn.cursor()#カーソル

    tablename = "menu"
    data_tup = ("醤油カクテル",1100,"2009-1-11")
    data_list = ["抹茶カクテル", 850, "2007-7-8"]
    data_dic = {"name":"生姜カクテル", "price":725, "start_date":"2012-5-29"}
    datas = [
        ("オレンジ", 500, "2000-1-1"),
        ("リンゴ", 400, "2000-1-1"),
        ("桃", 300, "2000-1-1")
    ]


    mysql_insert(cur,tablename,data_list)
    mysql_insert(cur,tablename,data_tup)
    mysql_insert(cur,tablename,data_dic)
    mysql_inserts(cur,tablename,datas)
    mysql_select(cur,tablename)

    conn.commit()#しないと変更が反映されなかった。
    cur.close()
    conn.close()

if __name__ == "__main__":
    main()
