package mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.entities.User;
import mvc.services.UserService;
import mvc.utils.ActualDate;
import mvc.utils.enums.Privilige;

@Controller
@RequestMapping("/")
public class LoginController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String login(Model model) {
		if(SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
			!(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken)) {
//			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); -- to przekazuje wszysktie dane użytkownika
			return "redirect:/homePage/homePage";
		}
		model.addAttribute(new User());
		return "login";
	}

	@GetMapping("/register")
	public String register(Model model) {
		User user = new User();
		user.setCreated(ActualDate.getActualDate());
		user.addPrivilege(Privilige.USER);
		user.setActive(true);
		model.addAttribute("user", user);
		return "register";
	}
	
	@PostMapping("/register")
	public String register(@Validated @ModelAttribute User user, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "redirect:/register";
		}
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setActive(true);
		user.setCreated(ActualDate.getActualDate());
		user.addPrivilege(Privilige.USER);
		userService.saveUser(user);
		model.addAttribute("newUser", "You can log in now!");
		return "login";
	}
}
