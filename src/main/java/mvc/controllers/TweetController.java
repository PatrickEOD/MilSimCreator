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
import mvc.repositories.UserRepository;
import mvc.utils.ActualDate;
import mvc.utils.AuthenticationFacade;

@Controller
@RequestMapping("/tweet")
public class TweetController {

	private TweetRepository tweetRepository;
	private UserRepository userRepository;

	@Autowired
	public TweetController(TweetRepository tweetRepository, UserRepository userRepository) {
		this.tweetRepository = tweetRepository;
		this.userRepository = userRepository;
	}
	
	@Autowired
	private AuthenticationFacade authenticationFacade;
	
//	@Autowired
//	private Authentication authentication;
	
	// CRUD

//	@GetMapping("/add")
//	public String add(Model model) {
//		Tweet tweet = new Tweet();
//		model.addAttribute("tweet", tweet);
//		return "homePage";
//	}
	
	@PostMapping("/add")
	public String add(@Validated @ModelAttribute (name = "addTweet") Tweet tweet, BindingResult result) {
		System.out.println("==========================================" + tweet.getText());
		System.out.println("==========================================" + tweet.getCreated());
		System.out.println("==========================================" + tweet.getUser().getLogin());
		if(result.hasErrors()) {
			System.out.println("========================================== redirect");
			return "redirect:/homePage";
		}
//		Authentication authentication = authenticationFacade.getAuthentication();
//		User user = userRepository.findByLogin(authentication.getName());
//		tweet.setUser(user);
		tweet.setCreated(ActualDate.getActualDate());
		System.out.println("========================================== before save");
		tweetRepository.save(tweet);
		System.out.println("========================================== after save");
		return "redirect:/homePage";
	}
	
	@GetMapping("/tweetList")
	public String list(Model model) {
		model.addAttribute("tweetList", tweetRepository.findAll());
		return "homePage";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		Tweet tweet = tweetRepository.findOne(id);
		Authentication authentication = authenticationFacade.getAuthentication();
		if(authentication.getName().equals(tweet.getUser().getLogin())) {
			model.addAttribute(tweetRepository.findOne(id));
			return "tweet/edit";
		}
		return "redirect:/homePage";
	}
	
	@PostMapping("/edit")
	public String edit(@Validated @ModelAttribute (name = "tweetEdit") Tweet tweet, BindingResult result) {
		if(result.hasErrors()) {
			return "homePage";
		}
		tweetRepository.save(tweet);
		return "redirect:/homePage";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		tweetRepository.delete(tweetRepository.findOne(id));
		return "redirect:/homePage";
	}
}
