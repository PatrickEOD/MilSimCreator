package mvc.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mvc.entities.User;
import mvc.repositories.UserRepository;

@Service
public class UserService {

	
	private UserRepository userRepository;
	
	@Autowired
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Transactional
	public void saveUser(User user) {
		userRepository.save(user);
	}
	
	@Transactional
	public User getUser(String login) {
		User user = userRepository.findByLogin(login);
		return user;
	}
	
	@Transactional
	public User getUser(Long id) {
		User user = userRepository.findOne(id);
		return user;
	}
	
	@Transactional
	public List<User> getUsersList() {
		return userRepository.findAll();
	}
	
	@Transactional
	public List<User> getUsersList(String groupName) {
		List<User> users = new ArrayList<User>();
		users = userRepository.getByGroupMember(groupName);
		return users;
	}
	
	@Transactional
	public void deleteUser(Long id) {
		userRepository.delete(userRepository.findOne(id));
	}
	
}
