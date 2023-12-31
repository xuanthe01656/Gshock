package spring.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import spring.service.UsersService;

@Component
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
 
    @Autowired
    private UsersService usersService;
     
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
    	
        
         
        super.onAuthenticationSuccess(request, response, authentication);
    }
 
}