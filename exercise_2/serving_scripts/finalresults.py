
import psycopg2
import sys

sys.argv.pop(0)

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

if len(sys.argv) == 1:
	input = str(sys.argv[0].lower())
	cur.execute("SELECT count FROM tweetwordcount WHERE word='%s'" % input)
	results = cur.fetchone()
	print 'Total number of occurrences of "%s":%s' %(input, '0' if not results else str(results[0]))

if len(sys.argv) == 0:
	cur.execute("SELECT * FROM tweetwordcount ORDER BY word")
	results = cur.fetchall()
	for word in results:
		print '(%s, %s)' %(word[0], word[1])

cur.close()
conn.close() 
	
	  
