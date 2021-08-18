package eu.crg.qsample.twitter;

import org.springframework.beans.factory.annotation.Autowired;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;

public class TwitterPoster {

    @Autowired
    TwitterFactoryQSample twitterFactory;

    public String postTweet(String tweet) throws TwitterException {
        Twitter twitter = twitterFactory.createTwitterInstance();
        Status status = twitter.updateStatus(tweet);
        return status.getText();
    }
}
