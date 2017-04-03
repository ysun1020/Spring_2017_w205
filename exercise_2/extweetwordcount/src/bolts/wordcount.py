from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()

	#postgres connection
	self.conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = self.conn.cursor()
	#checking for existing records in tweetwordcount table
	cur.execute("SELECT * FROM tweetwordcount")
	prevrec = cur.fetchall()
	for (key, count) in prevrec:
		self.counts[key] = count
	self.conn.commit()

    def process(self, tup):
        word = tup.values[0]
	
        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: tcount 
        # Table name: tweetwordcount 
        # you need to create both the database and the table in advance.
	
	# Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])


	cur = self.conn.cursor()
        if (self.counts[word] == 1):
                cur.execute("INSERT INTO tweetwordcount (word, count) VALUES (%s, 1)", (word,))

        else:
                cur.execute("UPDATE tweetwordcount SET count=%s WHERE word=%s", (self.counts[word], word))
        self.conn.commit()


        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))


