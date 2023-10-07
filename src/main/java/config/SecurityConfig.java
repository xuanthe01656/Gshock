package config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig  extends WebSecurityConfigurerAdapter {
	
	
	@Configuration
	@Order(1)
	public static class App1ConfigurationAdapter {
		@Autowired
	    protected DataSource dataSource;
		
		@Autowired 
		SecurityFilterChain securityFilterChain;
		
		@Bean
	    public JdbcUserDetailsManager userDetailsManager() {
		    JdbcUserDetailsManager manager = new JdbcUserDetailsManager();
		    manager.setDataSource(dataSource);
		    manager.setUsersByUsernameQuery(
		        "select username,password,enable from admin where username=?");
		    manager.setAuthoritiesByUsernameQuery(
		        "select username, concat('ROLE_', name) role from admin as u inner join roles as r on r.id = u.role_id where username= ?");
		    manager.setRolePrefix("ROLE_");
		    return manager;
		}
		
	    @Bean
	    public SecurityFilterChain filterChainApp1(HttpSecurity http) throws Exception {
	    	 http.authorizeRequests().antMatchers("/").permitAll();
	        http.antMatcher("/admin/**")
			.authorizeRequests()
			.antMatchers("/admin/index/**").access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN', 'ROLE_USER')")
			.antMatchers("/admin/profile/**").access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN', 'ROLE_USER')")
			.antMatchers("/admin/edit-profile/**").access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN', 'ROLE_USER')")
			.antMatchers("/admin/cat/**").access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN')")
			.antMatchers("/admin/product/**"). access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN')")
			.antMatchers("/admin/user/**"). access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/add-product"). access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN')")
			.antMatchers("/admin/add-cat"). access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN')")
			.antMatchers("/admin/add-user" ).access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/edit-product/**"). access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN', 'ROLE_USER')")
			.antMatchers("/admin/edit-cat/**" ).access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN')")
			.antMatchers("/admin/edit-user/**"). access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/delete-product/**"). access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/delete-cat/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/delete-user/**"). access("hasRole('ROLE_ADMIN')")
			.antMatchers("/admin/").access("hasAnyRole('ROLE_EDITOR', 'ROLE_ADMIN', 'ROLE_USER')")
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.and()
	        .formLogin()
	        .loginPage("/auth/admin/login")
	        .loginProcessingUrl("/auth/admin/login")
	        .failureUrl("/auth/admin/login?error=loginError")
	        .defaultSuccessUrl("/admin/index")
	        
	        .and()
	        .logout()
	        .logoutUrl("/auth/admin/logout")
	        .logoutSuccessUrl("/auth/admin/login")
	        .deleteCookies("JSESSIONID")
	        
	        .and()
	        .exceptionHandling()
	        .accessDeniedPage("/403")
	        
	        .and()
	        .csrf().disable();
	       return http.build();
	    }
		@Autowired
		public void configAuthentication(AuthenticationManagerBuilder builder)
		        throws Exception {

		    builder.userDetailsService(userDetailsManager());
		}
	}
	@Configuration
	@Order(2)
	public static class App2ConfigurationAdapter {
		@Autowired
	    protected DataSource dataSource;
		
		@Bean
	    public JdbcUserDetailsManager userDetailsManager() {
		    JdbcUserDetailsManager manager = new JdbcUserDetailsManager();
		    manager.setDataSource(dataSource);
		    manager.setUsersByUsernameQuery(
		        "select username,password,enable from admin where username=?");
		    manager.setAuthoritiesByUsernameQuery(
		        "select username, concat('ROLE_', name) role from admin as u inner join roles as r on r.id = u.role_id where username= ?");
		    manager.setRolePrefix("ROLE_");
		    return manager;
		}
		
	    @Bean 
	    public SecurityFilterChain filterChainApp2(HttpSecurity http) throws Exception {
	    	 http.authorizeRequests().antMatchers("/").permitAll();
	        http.antMatcher("/public/**")
			.authorizeRequests()
			.and()
	        .formLogin()
	        .loginPage("/auth/public/login")
	        .loginProcessingUrl("/auth/public/login")
	        .failureUrl("/auth/public/login?error=loginError")
	        .defaultSuccessUrl("/public/index")
	        
	        .and()
	        .logout()
	        .logoutUrl("/auth/public/logout")
	        .logoutSuccessUrl("/auth/public/login")
	        .deleteCookies("JSESSIONID")
	        
	        .and()
	        .exceptionHandling()
	        .accessDeniedPage("/403")
	        
	        .and()
	        .csrf().disable();
	       return http.build();
	    }

		@Autowired
		public void configAuthentication(AuthenticationManagerBuilder builder)
		        throws Exception {

		    builder.userDetailsService(userDetailsManager());
		}
	}
	@Bean
	public static BCryptPasswordEncoder encoder() {
		BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
		return bCrypt;
	}
}
