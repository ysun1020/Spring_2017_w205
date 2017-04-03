
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# Connect to DB
conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

# Checking for existing DB
cur.execute("DROP DATABASE IF EXISTS tcount")
conn commit()

# Create New
cur.execute("CREATE DATABASE tcount")
conn.commit()
cur.close()
conn.close()


# Connect to tcount and create tweetwordcount table and keys
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
cur.execute('''CREATE TABLE tweetwordcount
       (word TEXT PRIMARY KEY     NOT NULL,
       count INT     NOT NULL);''')
conn.commit()
cur.close()
conn.close()

