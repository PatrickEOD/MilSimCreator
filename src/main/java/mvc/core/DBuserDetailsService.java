package mvc.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import mvc.entities.User;
import mvc.repositories.UserRepository;

@Service
public class DBuserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
		User user = userRepository.findByLogin(login);
		UserDetails userDetails = org.springframework.security.core.userdetails.User.builder()
				.username(user.getLogin())
				.password(user.getPassword())
				.roles(user.getStringPriviliges())
				.build();
		return userDetails;
	}
}
