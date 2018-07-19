package mvc.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private DBuserDetailsService dbUserDetailsService;
	
	@Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new MySimpleUrlAuthenticationSuccessHandler();
    }
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		super.configure(http); -- to jest nie potrzebne
		http.authorizeRequests()
			.antMatchers("/login", "/register", "/resources/**") //definiuje strony
				.permitAll() // które są dostepne do autoryzacji
			.antMatchers("/user") //definiouje strony
				.hasAnyRole("USER", "LIDER", "COOLIDER", "ADMINISTRATOR") //które sa dostepne dla urzytkowników o tych rolach (jedna z nich)
			.antMatchers("/admin")
				.hasAnyRole("ADMINISTRATOR", "ORGANISATOR")
			.anyRequest() // jake kolwiek żądanie po stronie login
				.authenticated() //musi byc autentykowane
			.and()
			.formLogin()//formatowanie loginu
				.defaultSuccessUrl("/homePage/homePage") // przekierowanie na stronę domowa po wylogowaniu i zalogowaniu
				.loginPage("/login")
				.loginProcessingUrl("/login")//przekierowanie na stronę
				.successHandler(myAuthenticationSuccessHandler())
				.usernameParameter("login")
				.passwordParameter("password")
			.and()
			.logout()
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.invalidateHttpSession(true)
				.logoutSuccessUrl("/login?loggedout")
			.and()
			.httpBasic();//reszta rzeczy domyślna
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder(10);
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(dbUserDetailsService);
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
	}
	
}
