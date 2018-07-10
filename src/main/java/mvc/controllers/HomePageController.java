package mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.entities.User;
import mvc.repositories.UserRepository;
import mvc.utils.AuthenticationFacade;

@Controller
@RequestMapping("/")
public class HomePageController {

	private UserRepository userRepository;

	@Autowired
	public HomePageController(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Autowired
	private AuthenticationFacade authenticationFacade;

	@ModelAttribute("authorizedUser")
	public User getAuthUser() {
		User user = userRepository.findByLogin(authenticationFacade.getAuthenticaiton().getName());
		return user;
	}
	
	@ModelAttribute("groupMembers")
	public List<User> getGroupMembers() {
		List<User> groupMembers = userRepository.getByGroupMember(getAuthUser().getGroupMember());
		return groupMembers;
	}

	@GetMapping("/homePage")
	public String goToHomePage(Model model) {
		return "homePage";
	}
}
