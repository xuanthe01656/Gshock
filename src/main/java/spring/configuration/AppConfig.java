package spring.configuration;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

import spring.handler.LoginSuccessHandler;

@Configuration
@ComponentScans({ @ComponentScan("spring") })
@EnableWebMvc
public class AppConfig {
//	@Bean(name = "viewControllers")
//	public ViewControllerRegistry addViewControllers(ViewControllerRegistry registry) {
//		registry.addViewController("/").setViewName("home");
//		registry.setOrder(0);
//		return registry;
//
//	}

    @Bean(name = "viewResolver")
    InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/views/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(1);
		return viewResolver;
	}

    @Bean(name = "viewResolverTiles")
    ViewResolver getViewResolver() {
    	UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
    	viewResolver.setViewClass(TilesView.class);
    	viewResolver.setOrder(0);
    	return viewResolver;
    }

    @Bean(name = "tilesConfigurer")

    TilesConfigurer getTilesConfigurer() {
    	TilesConfigurer tilesConfigurer = new TilesConfigurer();
    	tilesConfigurer.setDefinitions("/WEB-INF/templates/tiles-gshock-admin.xml","/WEB-INF/templates/tiles-gshock-public.xml");
    	return tilesConfigurer;
    }
    @Bean(name="multipartResolver")
    MultipartResolver getMultipartResolver() {
    	CommonsMultipartResolver resolver = new CommonsMultipartResolver();
    	return resolver;
    }
    @Bean
    public MessageSource messageSource () {
    	ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
    	messageSource.setBasenames("messages/validator", "messages/success" , "messages/automail");//validate.properties
    	messageSource.setDefaultEncoding("UTF-8");
    	return messageSource;
    }
    @Bean
    public MethodValidationPostProcessor methodValidationPostProcessor() {
        return new MethodValidationPostProcessor();
    }
//    @Bean
//    public JavaMailSender getJavaMailSender() {
//        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//        mailSender.setHost("smtp.gmail.com");
//        mailSender.setPort(587);
//        
//        mailSender.setUsername("xuanthe01656@gmail.com");
//        mailSender.setPassword("gslqxuozgwmxbfvv");
//        
//        Properties props = mailSender.getJavaMailProperties();
//        props.put("mail.smtp.ssl.enable", "true");
//        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//        props.put("mail.transport.protocol", "smtp");
//        //props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.debug", "true");
//        
//        return mailSender;
//    }
    
    @Bean
    public UTF8Filter utf8() {
    	return new UTF8Filter();
    }
   
    
    
}

