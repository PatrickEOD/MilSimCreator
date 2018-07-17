package mvc.services;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mvc.entities.Tweet;
import mvc.entities.User;
import mvc.repositories.TweetRepository;

@Service
public class TweetService {

	private TweetRepository tweetRepository;
	
	@Autowired
	public TweetService(TweetRepository tweetRepository) {
		this.tweetRepository = tweetRepository;
	}
	
	@Transactional
	public void saveTweet(Tweet tweet) {
		tweetRepository.save(tweet);
	}
	
	@Transactional
	public Tweet getTweet(Long id) {
		Tweet tweet = tweetRepository.findOne(id);
		return tweet;
	}
	
	@Transactional
	public List<Tweet> getTweetList(User user) {
		List<Tweet> tweets = new ArrayList<Tweet>();
		tweets = tweetRepository.findByUser(user);
		sortCollectionByDate(tweets);
		return tweets;
	}

	
	@Transactional
	public List<Tweet> getTweetList() {
		List<Tweet> tweets = new ArrayList<Tweet>();
		tweets = tweetRepository.findAll();
		sortCollectionByDate(tweets);
		return tweets;
	}
	
	@Transactional
	public void deleteTweet(Long id) {
		tweetRepository.delete(tweetRepository.findOne(id));
	}
	
	//Utils for single class
	
	//Sorting collection by descending order
	private void sortCollectionByDate(List<Tweet> tweets) {
		Collections.sort(tweets, new Comparator<Tweet>() {
			public int compare(Tweet t1, Tweet t2) {
				if(t1.getCreated() == null || t2.getCreated() == null) {
					return 0;
				}
				return t2.getCreated().compareTo(t1.getCreated());
			}
		});
	}
}
