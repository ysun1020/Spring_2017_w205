import tweepy

consumer_key = "h0w783jvDoMD9MMHhZuC93ESC";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "EVPd580ipCdthXrMZ6fJIzEKyDwiraI0WN4EpEMG1ezTstWraQ";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "42347853-rkZDiGfOP9U1aSDo5zLz08x7OznEGNGBmFBwR13HK";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "TEHxhjCG6XPy4wYffClo5I89QPu9nMeIKulnf993f9ho1";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



