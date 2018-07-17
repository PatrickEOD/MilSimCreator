package mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.entities.Tweet;
import mvc.entities.User;
import mvc.repositories.TweetRepository;
import mvc.services.TweetService;
import mvc.services.UserService;
import mvc.utils.AuthenticationFacade;

@Controller
@RequestMapping("/tweet")
public class TweetController {

	private TweetRepository tweetRepository;

	@Autowired
	public TweetController(TweetRepository tweetRepository) {
		this.tweetRepository = tweetRepository;
	}
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TweetService tweetService;
	
	@Autowired
	private AuthenticationFacade authenticationFacade;
	
	// CRUD

	@PostMapping("/add")
	public String add(@Validated @ModelAttribute (name = "addTweet") Tweet tweet, BindingResult result) {
		if(result.hasErrors()) {
			return "redirect:/homePage";
		}
		Authentication authentication = authenticationFacade.getAuthentication();
		User user = userService.getUser(authentication.getName());
		tweet.setUser(user);
		tweetRepository.save(tweet);
		return "redirect:/homePage";
	}
	
	@GetMapping("/tweetList")
	public String list(Model model) {
		model.addAttribute("tweetList", tweetService.getTweetList());
		return "homePage";
	}
	
	@GetMapping("/userTweetList/{userLogin}")
	public String userTweetList(@PathVariable Long userLogin, Model model) {
		model.addAttribute("userTweets", tweetService.getTweetList(userService.getUser(userLogin)));
		return "user/tweets";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		Tweet tweet = tweetService.getTweet(id);
		Authentication authentication = authenticationFacade.getAuthentication();
		if(authentication.getName().equals(tweet.getUser().getLogin())) {
			model.addAttribute("editTweet", tweet);
			return "tweet/edit";
		}
		return "redirect:/homePage";
	}
	
	@PostMapping("/edit")
	public String edit(@Validated @ModelAttribute (name = "tweetEdit") Tweet tweet, BindingResult result) {
		if(result.hasErrors()) {
			return "homePage";
		}
		tweetService.saveTweet(tweet);
		return "redirect:/homePage";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		tweetService.deleteTweet(id);
		return "redirect:/homePage";
	}
}
