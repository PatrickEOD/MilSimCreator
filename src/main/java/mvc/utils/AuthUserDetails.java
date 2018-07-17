package mvc.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;

public class AuthUserDetails {

	@Autowired
	private AuthenticationFacade authenticationFacade;
	
	public String authUserName() {
		Authentication auth = authenticationFacade.getAuthentication();
		return auth.getName();
	}
}
