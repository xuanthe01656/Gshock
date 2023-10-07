package spring.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import spring.constant.Defines;
import spring.constant.EmailUtil;
import spring.constant.RandomLb;
import spring.model.Admin;
import spring.model.Users;
import spring.service.CategoriesService;
import spring.service.LockPayAccountService;
import spring.service.UsersService;

@Controller
@RequestMapping("/auth")
public class AuthController {
	
	@Autowired
	private BCryptPasswordEncoder bCrypt;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private LockPayAccountService lockPayAccountService;
	
	@GetMapping("admin/login")
	public String loginAdmin() {
		return "auth/admin/login";
	}
	
	@PostMapping("admin/login")
	public String loginAdmin(@Valid @ModelAttribute("userError") Admin user, BindingResult rs, ModelMap model, RedirectAttributes ra) {
		
		if(rs.hasErrors()){
			return "auth/admin/login";
		}		
		return "auth/admin/login";
	}
	
	@GetMapping("admin/logout")
	public String logoutAdmin() {
		
		return "redirect:auth/admin/login";
	}
	
	public boolean equalsEmail(ArrayList<Users> list, String email) {
		for (Users user : list) {
			if(user.getEmail().equals(email)) {
				return true;
			}
		}
	return false;
}
	public boolean equalsUserName(ArrayList<Users> list, String username) {
		for (Users user : list) {
			if(user.getUsername().equals(username)) {
				return true;
			}
		}
	return false;
}
	@GetMapping("public/login")
	public String login(ModelMap modelMap) {
		modelMap.addAttribute("categoryService", categoriesService);
		return "auth/public/login";
	}
	
	@PostMapping("public/login")
	public String login(@ModelAttribute Users users,ModelMap modelMap,HttpServletRequest request, HttpServletResponse response, Principal principal) throws ServletException, IOException {
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
				if(lUser.get(i).getEmail().equals(users.getUsername())&&lUser.get(i).getPassword().equals(users.getPassword())) {
					user = lUser.get(i);
					break;
				}else {
					listUser.add(lUser.get(i));
				}
			}
			for (int i = 0; i < lUser.size(); i++) {
				if(lUser.get(i).getUsername().equals(users.getUsername())&&lUser.get(i).getPassword().equals(users.getPassword())) {
					user = lUser.get(i);
					break;
				}else {
					listUser.add(lUser.get(i));
				}
			}	
		}else {
			modelMap.addAttribute("categoryService", categoriesService);
			return "redirect:/auth/public/login?msg=2";
		}
		if(user.getEmail()!=null&&user.getPassword()!=null&&user.getUsername()!=null) {
			session.setAttribute("objU", user);
			modelMap.addAttribute("categoryService", categoriesService);
			return "redirect:/public/index";
		}else {
			if(equalsEmail(listUser, users.getEmail())) {
				modelMap.addAttribute("categoryService", categoriesService);
				return "redirect:/auth/public/login?msg=1";
			}else {
				if(equalsEmail(listUser, users.getEmail())==false) {
					modelMap.addAttribute("categoryService", categoriesService);
					return "redirect:/auth/public/login?msg=2";
				}else {
					if(equalsUserName(listUser, users.getUsername())) {
						modelMap.addAttribute("categoryService", categoriesService);
						return "redirect:/auth/public/login?msg=1";
					}else {
						if(equalsUserName(listUser, users.getUsername())==false) {
							modelMap.addAttribute("categoryService", categoriesService);
							return "redirect:/auth/public/login?msg=2";
						}			
					}
				}		
			}
		}

		modelMap.addAttribute("categoryService", categoriesService);
		return "auth/public/login";
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
//		user.setPassword(bCrypt.encode(user.getPassword()));
		if(usersService.addUser(user)>0) {
			Users users = usersService.getUserByUsername(user.getUsername());
			if(lockPayAccountService.createdAccLockxu(users.getId())>0) {
				return "redirect:/auth/public/redirectPage";
			}else {
				model.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
			}
			
		}else {
			model.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
		}
		return "auth/public/signup";
	}
	@GetMapping("public/check-user")
	public String checkUser() {
		
		return "auth/public/checkUser";
	}
	@PostMapping("public/check-user")
	public String checkUser(@ModelAttribute Users user, RedirectAttributes ra, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Users users = usersService.getUserByUsername(user.getUsername());
		System.out.println(users);
		if(users!=null) {
			RandomLb rd = new RandomLb();
			if(users.getUsername().equals(user.getUsername())&&users.getEmail().equals(user.getEmail())==false) {
				modelMap.addAttribute("success", messageSource.getMessage("errorEmail", null, Locale.getDefault()));
				return "auth/public/checkUser";
			}
			if(users.getUsername().equals(user.getUsername())==false&&users.getEmail().equals(user.getEmail())) {
				modelMap.addAttribute("success", messageSource.getMessage("errorUs", null, Locale.getDefault()));
				return "auth/public/checkUser";
			}
			if(users.getUsername().equals(user.getUsername())==false&&users.getEmail().equals(user.getEmail())==false) {
				modelMap.addAttribute("success", messageSource.getMessage("errorCheck", null, Locale.getDefault()));
				return "auth/public/checkUser";
			}
			if(users.getUsername().equals(user.getUsername())&&users.getEmail().equals(user.getEmail())) {
				String code = rd.randomAlphaNumeric(8);
				session.setAttribute("codeCheck", code);
				session.setAttribute("id", users.getId());
				final String fromEmail = "xuanthe01656@gmail.com"; //requires valid gmail id
				final String password = "gslqxuozgwmxbfvv"; // correct password for gmail id
				final String toEmail = users.getEmail(); // can be any email id 
				
				System.out.println("TLSEmail Start");
				Properties props = new Properties();
				props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				props.put("mail.smtp.ssl.trust","smtp.gmail.com");
				props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
				props.put("mail.smtp.port", "587"); //TLS Port
				props.put("mail.smtp.auth", "true"); //enable authentication
				props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
				
		                //create Authenticator object to pass in Session.getInstance argument
				Authenticator auth = new Authenticator() {
					//override the getPasswordAuthentication method
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(fromEmail, password);
					}
				};
				Session sessionM = Session.getInstance(props, auth);
			    
			    EmailUtil.sendEmail(sessionM, toEmail,"RE_PASSWORD", Defines.CODE_RESETPASS_MAIL+code);
				//emailServiceImpl.sendSimpleMessage(user.getEmail(), "RE_PASSWORD", Defines.CODE_RESETPASS_MAIL+code);
				return "redirect:/auth/public/change-password";
			}else {
				modelMap.addAttribute("success", messageSource.getMessage("ERROR", null, Locale.getDefault()));
				return "auth/public/checkUser";
			}
		}
		return "auth/public/checkUser";
	}
	@GetMapping("public/change-password")
	public String changePass() {
		
		return "auth/public/changePass";
	}
	@PostMapping("public/change-password")
	public String changePass(@RequestParam("code") String code,@RequestParam("npass") String password, @RequestParam("rpass") String repassword,ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String newPass = bCrypt.encode(password);
		int id =(Integer)session.getAttribute("id");
		String codeCheck = (String) session.getAttribute("codeCheck");
		if(codeCheck.equals(code)==false) {
			modelMap.addAttribute("success", messageSource.getMessage("errorCode", null, Locale.getDefault()));
			return "auth/public/changePass";
		}
		if(usersService.setPass(newPass, id)>0) {
			return "redirect:/auth/public/redirectPage";
		}
		return "auth/public/changePass";
	}
	@PostMapping("public/check-code")
	@ResponseBody
	public String checkCode(@RequestParam("code") String code, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String codeCheck = (String) session.getAttribute("codeCheck");
		if(codeCheck.equalsIgnoreCase(code)) {
			return "1";
		}
		return "2";
	}
	@GetMapping("public/redirectPage")
	public String redirectPage() {
		return "auth/public/redirectPage";
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
	@ResponseBody
	@GetMapping("mahoa")
	public String mahoa() {
		String pass= bCrypt.encode("123456");
		if(bCrypt.matches(pass, pass)) {
			
		}
		return pass;
	}
	
}
