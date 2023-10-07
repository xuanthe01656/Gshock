package config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import spring.model.Users;
import spring.service.CategoriesService;
import spring.service.UsersService;

@Controller
@RequestMapping("/auth")
public class AuthloginPublicController {
	
	@Autowired
	private BCryptPasswordEncoder bCrypt;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private MessageSource messageSource;
	
   
    public boolean equalsEmail(ArrayList<Users> list, String email) {
		for (Users user : list) {
			if(user.getEmail().equals(email)) {
				return true;
			}
		}
	return false;
}
	@GetMapping("public/login")
	public String login(ModelMap modelMap) {
		modelMap.addAttribute("categoryService", categoriesService);
		return "public.login";
	}
	
	@PostMapping("public/login")
	public String login(@ModelAttribute Users users,ModelMap modelMap,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Users> listUser = new ArrayList<>();
		Users user = new Users();
		List<Users> lUser = usersService.exisUser(users.getEmail(), users.getPassword());
		Users userLogin = (Users)session.getAttribute("objU");
		if(userLogin!=null) {
			modelMap.addAttribute("categoryService", categoriesService);
			return "redirect:/public/index";
		}
		if(lUser.size()>0) {
			for (int i = 0; i < lUser.size(); i++) {
				if(lUser.get(i).getEmail().equals(users.getEmail())&&lUser.get(i).getPassword().equals(users.getPassword())) {
					user = lUser.get(i);				
				}else {
					listUser.add(lUser.get(i));
				}
			}	
		}else {
			modelMap.addAttribute("categoryService", categoriesService);
			return "redirect:/auth/public/login?msg=2";
		}
		if(user.getEmail()!=null&&user.getPassword()!=null) {
			modelMap.addAttribute("objU", user);
			modelMap.addAttribute("categoryService", categoriesService);
			return "redirect:/public/index";
		}else {
			if(equalsEmail(listUser, users.getEmail())) {
				response.sendRedirect(request.getContextPath()+"/auth/public/login?msg=1");

				modelMap.addAttribute("categoryService", categoriesService);
				return "redirect:/auth/public/login?msg=1";
			}else {
				if(equalsEmail(listUser, users.getEmail())==false) {
					response.sendRedirect(request.getContextPath()+"/auth/public/login?msg=2");

					modelMap.addAttribute("categoryService", categoriesService);
					return "redirect:/auth/public/login?msg=2";
				}			
			}
		}

		modelMap.addAttribute("categoryService", categoriesService);
		return "public.login";
	}
	
	@GetMapping("public/logout")
	public String logout(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		modelMap.addAttribute("categoryService", categoriesService);
		return "redirect:/auth/public/login";
	}
	
	@GetMapping("public/signup")
	public String signupPublic(ModelMap modelMap) {
		modelMap.addAttribute("categoryService", categoriesService);
		return "auth/public/signup";
	}
	
	@PostMapping("public/signup")
	public String signupPublic(@Valid @ModelAttribute("userError") Users user, BindingResult rs, ModelMap model, RedirectAttributes ra) {
		
		if(rs.hasErrors()){
			model.addAttribute("categoryService", categoriesService);
			return "auth/public/signup";
		}
		user.setPassword(bCrypt.encode(user.getPassword()));
		if(usersService.addUser(user)>0) {
			return "redirect:/auth/public/redirectPage";
		}else {
			model.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
		}
		return "auth/public/signup";
	}
	@PostMapping("public/handel_username")
	@ResponseBody
	public String handelUsername(@RequestParam("username") String username, ModelMap modelMap, RedirectAttributes ra) {
		//Users user = usersService.getUserByUsername(username);
		if(username.equalsIgnoreCase("admin")==true) {
			return "1";
		}else {
			try {
				if(usersService.getUserByUsername(username).getUsername()!=null) {
					return "1";
				}
				
			} catch (EmptyResultDataAccessException e) {
				return "2";
			}
		}
			return "0";
	}
	@PostMapping("public/handel_email")
	@ResponseBody
	public String handelEmail(@RequestParam("email") String email, ModelMap modelMap, RedirectAttributes ra) {
		//Users user = usersService.getUserByUsername(username);
		try {
			if(usersService.getUserByEmail(email).getEmail()!=null) {
				return "1";
			}
		} catch (EmptyResultDataAccessException e) {
			return "2";
		}
		return "0";
	}

}
