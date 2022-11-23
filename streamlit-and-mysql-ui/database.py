import mysql.connector
from datetime import date
from dotenv import load_dotenv
import os
load_dotenv()
mygate = mysql.connector.connect(
    host=os.getenv('db_host'),
    user=os.getenv('db_user'),
    password=os.getenv('db_password'),
    database=os.getenv('db_database'),
)

c = mygate.cursor()


def view_all_tickets():
    c.execute('SELECT * from ticket')
    data = c.fetchall()
    return data


def get_flat_block(rid):
    c.execute('SELECT flat, block from resident WHERE rid="{}"'.format(rid))
    data = c.fetchall()
    if data:
        return data[0]
    else:
        return False


def db_create_ticket(rid, complaint):
    tid = 'T444'
    if not get_flat_block(rid):
        return False

    flat, block = get_flat_block(rid)
    query = 'INSERT INTO ticket(tid, rid, flat, block, is_resolved, complaint, response, date_generated) VALUES ("{}","{}","{}","{}","{}","{}","{}","{}")'.format(
        tid, rid, flat, block, 0, complaint, None, date.today())
    c.execute(query)
    mygate.commit()
    return tid


def db_get_ticket(tid):
    c.execute('SELECT * from ticket WHERE tid="{}"'.format(tid))
    data = c.fetchall()
    return data


def db_update_ticket(tid, new_ticket_status, new_ticket_response):

    # print(new_ticket_response, new_ticket_status, tid)

    try:
        query = 'UPDATE ticket set response="{}" WHERE tid="{}";'.format(
            new_ticket_response, tid)
        # print(query)
        c.execute(query)
        mygate.commit()
        data = c.fetchall()
        print(data)
        return data
    except:
        return True


def db_delete_ticket(tid):
    try:
        c.execute('DELETE FROM ticket WHERE tid="{}"'.format(tid))
        mygate.commit()
        return True
    except:
        return False


def db_any_query(q):
    c.execute(q)
    data = c.fetchall()
    mygate.commit()
    return data
