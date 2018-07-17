package mvc.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import mvc.entities.Tweet;
import mvc.services.TweetService;


public class TweetConverter implements Converter<String, Tweet> {

	@Autowired
	private TweetService tweetService;

	@Override
	public Tweet convert(String arg) {
		String[] data = arg.split(",");
		Tweet tweet= tweetService.getTweet(Long.parseLong(data[0]));
		return tweet;
	}
}
