package mvc.utils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationFacade implements AuthenticationFacadeInterface {

	@Override
	public Authentication getAuthenticaiton() {
		return SecurityContextHolder.getContext().getAuthentication();
	}
	
	
}
