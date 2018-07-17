package mvc.services;

import java.util.ArrayList;
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
		return tweets;
	}
	
	@Transactional
	public List<Tweet> getTweetList() {
		List<Tweet> tweets = new ArrayList<Tweet>();
		tweets = tweetRepository.findAll();
		return tweets;
	}
	
	@Transactional
	public void deleteTweet(Long id) {
		tweetRepository.delete(tweetRepository.findOne(id));
	}
}
