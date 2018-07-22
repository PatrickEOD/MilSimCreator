package mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.entities.User;
import mvc.services.UserService;
import mvc.utils.AuthenticationFacade;
import mvc.utils.enums.WeaponType;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthenticationFacade authenticationFacade;
	
	@ModelAttribute("WeaponType")
	public WeaponType[] weaponType() {
		return WeaponType.values();
	}

	@ModelAttribute("authorizedUser")
	public User getAuthUser() {
		User user = userService.getUser(authenticationFacade.getAuthentication().getName());
		return user;
	}

	@GetMapping("/status")
	public String milsimStatus() {
		return "admin/milsimStatus";
	}
}
