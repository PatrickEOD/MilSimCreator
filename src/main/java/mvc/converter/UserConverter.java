package mvc.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import mvc.entities.User;
import mvc.repositories.UserRepository;

public class UserConverter implements Converter<String, User>{
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public User convert(String arg) {
		String[] data = arg.split(",");
		User user = userRepository.findOne(Long.parseLong(data[0]));
		return user;
	}
	

}
