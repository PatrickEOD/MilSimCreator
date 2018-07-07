package mvc.controllers;


import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.entities.User;
import mvc.repositories.UserRepository;
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
	
	@ModelAttribute("WeaponType")
	public WeaponType[] weaponType() {
		return WeaponType.values();
	}
	
	//CRUD: create
	
	@GetMapping("/add")
	public String add(Model model) {
		User user = new User();
		user.addPrivilege(Privilige.USER);
		user.setCreated(getActualDate());
		model.addAttribute("user", new User());
		return "user/add";
	}
	
	@PostMapping("/add")
	public String add(@ModelAttribute User user) {
		userRepository.save(user);
		return "redirect:/user/list"; //when added spring security should redirect to homepage with logged id user
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
		return "article/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute (name = "user") User user) {
		userRepository.save(user);
		return "redirect:/user/list";
	}
	
	//CRUD: delete
	
	@GetMapping("/delete/{id}")
	public String deleteArticle(@PathVariable Long id) {
		userRepository.delete(userRepository.findOne(id));
		return "redirect:/article/list";
	}
	
	//Single Entity Utils
	
	private Timestamp getActualDate() {
		LocalDateTime ldt = LocalDateTime.now();
		return Timestamp.valueOf(ldt);
	}
}
