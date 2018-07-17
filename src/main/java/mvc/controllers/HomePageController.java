package mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.entities.Tweet;
import mvc.entities.User;
import mvc.repositories.TweetRepository;
import mvc.services.TweetService;
import mvc.services.UserService;
import mvc.utils.ActualDate;
import mvc.utils.AuthenticationFacade;

@Controller
@RequestMapping("/")
public class HomePageController {

	private TweetRepository tweetRepository;

	@Autowired
	public HomePageController(TweetRepository tweetRepository) {
		this.tweetRepository = tweetRepository;
	}
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TweetService tweetService;

	@Autowired
	private AuthenticationFacade authenticationFacade;

	@ModelAttribute("authorizedUser")
	public User getAuthUser() {
		User user = userService.getUser(authenticationFacade.getAuthentication().getName());
		return user;
	}
	
	@ModelAttribute("groupMembers")
	public List<User> getGroupMembers() {
		List<User> groupMembers = userService.getUsersList(getAuthUser().getGroupMember());
		return groupMembers;
	}

	@GetMapping("/homePage")
	public String goToHomePage(Model model) {
		//Add tweet form
		Tweet tweet = new Tweet();
		Authentication authentication = authenticationFacade.getAuthentication();
		User user = userService.getUser(authentication.getName());
		tweet.setUser(user);
		tweet.setCreated(ActualDate.getActualDate());
		model.addAttribute("addTweet", tweet);
		
		//List tweets form
//		model.addAttribute("tweetList", tweetRepository.findAll());
		model.addAttribute("tweetList", tweetService.getTweetList());
		
		return "homePage";
	}
}
