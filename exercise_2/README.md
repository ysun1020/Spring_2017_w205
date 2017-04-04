## MIDS W205 Exercise 2 - Twitter Stream Application Running Instructions

### System Requirements
1. Python 2.7 with streamparse, tweepy, and psycopg2 packages installed 
2. Apache Storm, Postgres installed and configured 
3. Must have an account with Twitter

### Deployment Instructions
**Step 1 - Environment and Tool Setup** 

1. After connecting to the AMI, mounting the EBS volume, and starting Postgres, switch to user w205 from root
```
$ su - w205
```
2. clone the repo
```
$ git clone https://github.com/ysun1020/Spring_2017_w205.git
```
2. Change directory to exercise_2/DB_Setup and run setup_DB in order to set up PostgresSQL database and tweetwordcount table
```
$ python setup_DB.py
```
The following message will be displayed if setup is successful

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/1-screenshot-DatabaseSetup.PNG "Successful setup")

**Step 2 - Run Storm Topology**

1. Change directory to exercise_2/extweetwordcount/src/spouts/, open tweets.py via `vi tweets.py`, modify the **Twitter credentials** section ONLY, using your own Twitter API credentials. 

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/2-screenshot-TwitterCredentialSetup.PNG "Twitter Credentials")

Note: If you don't have access to the credentials, please follow instructions in the appendix to obtain them.

2. Change directory to exercise_2/extweetwordcount, start streaming:
```
$ sparse run
```
This will take a minute or two to start running, once you see a stream log, it means the streaming is working properly

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/3-screenshot-TwitterStreamingLog.PNG "Stream Log")

3. To stop the stream, press `ctrl + c`

**Step 3 - Extract Results**

Scripts are located in /exercise_2/serving_scripts

1. Checking count for 1 word:
```
$ python finalresults.py look
```

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/4-screenshot-SingleWordOccurrence.PNG "Single Word Result")

2. Checking count for all words:
```
$ python finalresults.py
```

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/5-screenshot-AllWordOccurrence.PNG "All Words Result")

3. Checking words and counts, where count is in a specified interval [k1, k2], k2 > k1:
```
$ python histogram.py 10 12
```
Note: Input for this must be 2 **integers**, separated by a **space**

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/6-screenshot-HistogramResults.PNG "Histogram Result")

### Appendix - Obtaining Twitter API Credentials - Must Have an Account with Twitter

1. Login to Twitter 
2. Visit https://apps.twitter.com/ and click on "Create New App". 

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/12-screenshot-TwitterAppStart.png "Create New App")

3. Fill in the application name, description, and website (ignore the Callback URL field). The name will now be listed in as one of your applications. 

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/9-screenshot-CreateTwitterApp.png "Create an Application")

4. Agree to the terms and agreements, and click "Create your Twitter Application"

Once you have successfully created an application, it should take you to the application page. Here you must create access keys for subsequent operations by your application, using the following procedure:

1. Click on the "Keys and Access Tokens" tab.
2. Click on "Create my access token" near the bottom of the page.

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/10-screenshot-TwitterTokenActivation.png "Access Token")

Now you have four pieces of information (from the blacked out fields below):

A consumer key that identifies your application.
A consumer secret that acts as a password for your application.
An access token that identifies your authorized access.
An access token secret that acts as a password for that authorized access.

![alt-text](https://github.com/ysun1020/Spring_2017_w205/blob/master/exercise_2/snapshots/11-screentshot-TwitterAPIKeys.png "API Key")

At any point, you can revoke the access key, or regenerate any of these values. To completely disable the application, you must delete the application. This removes the consumer key, secret, and access tokens from Twitter's system, and any program using them will immediately stop working.


