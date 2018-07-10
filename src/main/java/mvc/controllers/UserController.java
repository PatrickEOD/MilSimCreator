package mvc.controllers;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.entities.User;
import mvc.repositories.UserRepository;
import mvc.utils.ActualDate;
import mvc.utils.enums.Privilige;
import mvc.utils.enums.WeaponType;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private UserRepository userRepository;
	
	@Autowired
	public UserController(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@ModelAttribute("WeaponType")
	public WeaponType[] weaponType() {
		return WeaponType.values();
	}
	
	//CRUD: create
	
	@GetMapping("/add")
	public String add(Model model) {
		User user = new User();
		user.setCreated(ActualDate.getActualDate());
		user.addPrivilege(Privilige.USER);
		user.setActive(true);
		model.addAttribute("user", user);
		return "user/add";
	}
	
	@PostMapping("/add")
	public String add(@Validated @ModelAttribute (name = "user") User user, BindingResult result) {
		if(result.hasErrors()) {
			return "user/add";
		}
//		user.setCreated(ActualDate.getActualDate());
//		user.addPrivilege(Privilige.USER);
//		user.setActive(true);
		userRepository.save(user);
		return "redirect:/homePage"; 
	}
	
	//CRUD: read
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("user", userRepository.findAll());
		return "user/list";
	}
	
	//CRUD: update
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable Long id, Model model) {
		model.addAttribute("user", userRepository.findOne(id));
		return "user/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@Validated @ModelAttribute (name = "user") User user, BindingResult result) {
		if(result.hasErrors()) {
			return "homePage"; 	
		}
		userRepository.save(user);
		return "redirect:/user/list";
	}
	
	@GetMapping("/editPass/{id}")
	public String editPassw(@PathVariable Long id, Model model) {
		User user = userRepository.findOne(id);
//		user.setPassword(null);
		model.addAttribute("user", user);
		return "user/editPass";
	}
	
	@PostMapping("/editPass")
	public String editPassw(@ModelAttribute (name = "user") User user, @RequestParam("oldPassword") String oldPassword, 
			@RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword, Model model) {
		if(passwordEncoder.matches(oldPassword, user.getPassword())) {
			if(newPassword.equals(confirmPassword)) {
				user.setPassword(passwordEncoder.encode(newPassword));
				userRepository.save(user);
				return "redirect:/user/list";
			} else {
				model.addAttribute("wrongConfirm", "New password is different from confirm password!");
				System.out.println("============================Wrong confirmation===============================");
			}
		} else {
			model.addAttribute("wrongPassword", "Old password is not the password you want to change!");
			System.out.println("============================Wrong password===============================");
//			return "redirect:user/editPass";
		}
		model.addAttribute("user", user);
		return "user/editPass";
	}
	
	//CRUD: delete
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		userRepository.delete(userRepository.findOne(id));
		return "redirect:/user/list";
	}
	
	//Single Entity Utils
	
 }
