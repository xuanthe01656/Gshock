package spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;
import spring.constant.Defines;
import spring.constant.EmailUtil;
import spring.constant.RandomLb;
import spring.model.AccountATM;
import spring.model.AccountATMAdmin;
import spring.model.Address;
import spring.model.Admin;
import spring.model.Cart;
import spring.model.Categories;
import spring.model.CommentRate;
import spring.model.LockPayAccount;
import spring.model.Order;
import spring.model.OrderDetail;
import spring.model.OrderPaypal;
import spring.model.PaymentManagement;
import spring.model.Product;
import spring.model.Users;
import spring.service.AccountATMAdminService;
import spring.service.AccountATMService;
import spring.service.AddressService;
import spring.service.AdminService;
import spring.service.CartService;
import spring.service.CategoriesService;
import spring.service.CommentRateService;
import spring.service.CountryService;
import spring.service.DiscountCodeService;
import spring.service.LockPayAccountService;
import spring.service.NotificationService;
import spring.service.OrdersService;
import spring.service.PaymentManagementService;
import spring.service.ProductService;
import spring.service.SuppliersService;
import spring.service.UsersService;

@Controller
@RequestMapping("public")
public class PublicController {
	final String fromEmail = "xuanthe01656@gmail.com"; //requires valid gmail id
	  final String password = "gslqxuozgwmxbfvv"; // correct password for gmail id
	  
	@Autowired
	private ProductService productService;

	@Autowired
	private UsersService usersService;
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private SuppliersService suppliersService;

	@Autowired
	private CountryService countryService;

	@Autowired
	private CommentRateService commentRateService;
	@Autowired
	private LockPayAccountService lockPayAccountService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private AccountATMService accountATMService;
	@Autowired
	private AccountATMAdminService accountATMAdminService;
	@Autowired
	private PaymentManagementService paymentManagementService;
	@Autowired
	private MessageSource messageSource;
	@Autowired
	private CartService cartService;
	@Autowired
	private DiscountCodeService discountCodeService;
	@Autowired
	private ServletContext context;
	@Autowired
	private ServletRequest request;
	@Autowired
	private ServletResponse response;
	@Autowired
	private NotificationService notificationService;

	private List<Cart> listPro = new ArrayList<>();
	private RandomLb randomLb = new RandomLb();
	private LockPayAccount lockxu = new LockPayAccount();

	@GetMapping("index")
	public String index(ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//			
//		} else {
//			id_user = 0;
//		}
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("categoryService", categoriesService);
		List<Categories> listCatUnPrId = categoriesService.getListCatUnByPrId();
		List<Integer> intg = new ArrayList<>();
		List<Categories> newList = new ArrayList<>();
		newList.addAll(listCatUnPrId);
		for (int i = 0; i < newList.size(); i++) {
			if (i == 0) {
				for (int j = 1; j < newList.size(); j++) {
					if (newList.get(i).getName().equals(newList.get(j).getName())) {
						intg.add(i);
						intg.add(j);
						newList.remove(j);
					}
				}
			}
			if (i > 0) {
				for (int j = 0; j < i && (i + 1) < newList.size(); j++) {
					if (newList.get(i).getName().equals(newList.get(j).getName())) {
						intg.add(i);
						intg.add(j);
						newList.remove(j);
					}
				}
			}
		}
		String name = "";
		List<Product> listProGshock = productService.getListByCatName("g-shock");
		List<Product> listProBabyg = productService.getListByCatName("baby-g");
		modelMap.addAttribute("listProGshock", listProGshock);
		modelMap.addAttribute("listProBabyg", listProBabyg);
		List<Product> listProSellHeightGshock = productService.getListProSellHeightByCatName("g-shock");
		modelMap.addAttribute("listProSellHeightGshock", listProSellHeightGshock);
		List<Product> listProSellHeightBabyg = productService.getListProSellHeightByCatName("baby-g");
		modelMap.addAttribute("listProSellHeightBabyg", listProSellHeightBabyg);
		modelMap.addAttribute("newListCat", newList);
		List<Product> listProSellHeightEdifice = productService.getListProSellHeightByCatName("edifice");
		modelMap.addAttribute("listProSellHeightEdifice", listProSellHeightEdifice);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("objU", objU);
		return "public.index";
	}

	@GetMapping("cat")
	public String cat(@RequestParam(required = false, value = "page") Integer page,
			@RequestParam(required = false, value = "name") String name,
			@RequestParam(required = false, value = "id") Integer id, ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		if (page == null) {
			page = 1;
		}
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		List<Categories> listCatUnPrId = categoriesService.getListCatUnByPrId();
		List<Integer> intg = new ArrayList<>();
		List<Categories> newList = new ArrayList<>();
		newList.addAll(listCatUnPrId);
		for (int i = 0; i < newList.size(); i++) {
			if (i == 0) {
				for (int j = 1; j < newList.size(); j++) {
					if (newList.get(i).getName().equals(newList.get(j).getName())) {
						intg.add(i);
						intg.add(j);
						newList.remove(j);
					}
				}
			}
			if (i > 0) {
				for (int j = 0; j < i && (i + 1) < newList.size(); j++) {
					if (newList.get(i).getName().equals(newList.get(j).getName())) {
						intg.add(i);
						intg.add(j);
						newList.remove(j);
					}
				}
			}
		}
		
		int max_page = Defines.MAX_PAGE;
		int numcur = Defines.MAX_PAGE + page - 1;
		int offset = (page - 1) * Defines.ROW_COUNT;
		int totalPro = 0;
		int numOfPage = 0;
		int numPro = 0;

//		List<Product> listProByName = new ArrayList<>();
//		List<Product> listProById = new ArrayList<>();
		List<Product> listPro1 = new ArrayList<>();
		List<Product> listPro2 = new ArrayList<>();
		String catName = "";
		if (id == null && name != null) {
			listPro2 = productService.getListByCatName(name);
			listPro1 = productService.getListByCatName(name, offset);
			catName = name;
			totalPro = listPro2.size();
			numOfPage = totalPro / Defines.ROW_COUNT;
			if (totalPro % Defines.ROW_COUNT != 0) {
				numOfPage++;
			}
			if (page < numOfPage) {
				numPro = (page - 1) * Defines.ROW_COUNT + Defines.ROW_COUNT;
			} else {
				numPro = totalPro;
			}

		} else {
			if (id != null && name == null) {
				listPro2 = productService.getListByCatId(id);
				listPro1 = productService.getListByCatId(id, offset);
				Categories catt = categoriesService.getCatById(id);
				catName = catt.getName();
				totalPro = listPro2.size();
				numOfPage = totalPro / Defines.ROW_COUNT;
				if (totalPro % Defines.ROW_COUNT != 0) {
					numOfPage++;
				}
				if (page < numOfPage) {
					numPro = (page - 1) * Defines.ROW_COUNT + Defines.ROW_COUNT;
				} else {
					numPro = totalPro;
				}
				modelMap.addAttribute("catById", catt);

			} else {
				listPro1 = productService.getListPro(offset);
				listPro2 = productService.getListPro();
				totalPro = listPro2.size();
				numOfPage = totalPro / Defines.ROW_COUNT;
				if (totalPro % Defines.ROW_COUNT != 0) {
					numOfPage++;
				}
				if (page < numOfPage) {
					numPro = (page - 1) * Defines.ROW_COUNT + Defines.ROW_COUNT;
				} else {
					numPro = totalPro;
				}
				catName = "Danh Mục Sản Phẩm";
			}
		}
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/product");
		modelMap.addAttribute("listCat1", newList);
//		modelMap.addAttribute("listProByName", listProByName);
		modelMap.addAttribute("listPro", listPro1);
		modelMap.addAttribute("numPro", numPro);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("catName", catName);
		modelMap.addAttribute("name", name);
		modelMap.addAttribute("maxPage", max_page);
		modelMap.addAttribute("numCur", numcur);
		modelMap.addAttribute("numOfPage", numOfPage);
		modelMap.addAttribute("numAllPro", listPro2.size());
		modelMap.addAttribute("realPath", path);
		modelMap.addAttribute("rowCount", Defines.ROW_COUNT);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("productService", productService);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("objU", objU);
		return "public.cat";
	}

	@GetMapping("product")
	public String product(@RequestParam("id") int id, ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
		List<Admin> listAdmin = adminService.getListAdmin();
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		Product pro = productService.getProById(id);
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("product", pro);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("commentRateService", commentRateService);
		modelMap.addAttribute("objU", objU);
		return "public.product";
	}

	@GetMapping("news")
	public String news(ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("objU", objU);
		return "public.news";
	}

	@GetMapping("news-detail")
	public String newsDetail(ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("objU", objU);
		return "public.news-detail";
	}

	@GetMapping("contact")
	public String contact(ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("objU", objU);
		return "public.contact";
	}

	@GetMapping("cart")
	public String cart(ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("objU", objU);
		return "public.cart";
	}

	@GetMapping("introduce")
	public String introduce(ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("objU", objU);
		return "public.introduce";
	}

	@GetMapping("payment")
	public String payment(ModelMap modelMap, HttpServletRequest request,Authentication principal1 ) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
			lockxu = lockPayAccountService.getAccLockxu(id_user);
			if(lockxu.getSurplus()<=3000) {
				final String toEmail = objU.getEmail();
				System.out.println("TLSEmail Start"); Properties props = new Properties();
				  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
				  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
				  props.put("mail.smtp.port", "587"); //TLS Port 
				  props.put("mail.smtp.auth","true"); //enable authentication 
				  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
				  
				  //create Authenticator object to pass in Session.getInstance argument
				  Authenticator auth = new Authenticator() { 
					  //override the getPasswordAuthentication method 
					  protected PasswordAuthentication
					  getPasswordAuthentication() { 
						  return new PasswordAuthentication(fromEmail, password); 
					} 
				}; 
				Session sessionM = Session.getInstance(props, auth);
				EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
						+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
						+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
						+ " Xin cảm ơn !");
			}
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//					lockxu = lockPayAccountService.getAccLockxu(id_user);
//					if(lockxu.getSurplus()<=3000) {
//						final String toEmail = objU.getEmail();
//						System.out.println("TLSEmail Start"); Properties props = new Properties();
//						  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//						  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//						  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//						  props.put("mail.smtp.port", "587"); //TLS Port 
//						  props.put("mail.smtp.auth","true"); //enable authentication 
//						  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//						  
//						  //create Authenticator object to pass in Session.getInstance argument
//						  Authenticator auth = new Authenticator() { 
//							  //override the getPasswordAuthentication method 
//							  protected PasswordAuthentication
//							  getPasswordAuthentication() { 
//								  return new PasswordAuthentication(fromEmail, password); 
//							} 
//						}; 
//						Session sessionM = Session.getInstance(props, auth);
//						EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//								+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//								+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//								+ " Xin cảm ơn !");
//					}
//					
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//				lockxu = lockPayAccountService.getAccLockxu(id_user);
//				if(lockxu.getSurplus()<=3000) {
//					final String toEmail = objU.getEmail();
//					System.out.println("TLSEmail Start"); Properties props = new Properties();
//					  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//					  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//					  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//					  props.put("mail.smtp.port", "587"); //TLS Port 
//					  props.put("mail.smtp.auth","true"); //enable authentication 
//					  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//					  
//					  //create Authenticator object to pass in Session.getInstance argument
//					  Authenticator auth = new Authenticator() { 
//						  //override the getPasswordAuthentication method 
//						  protected PasswordAuthentication
//						  getPasswordAuthentication() { 
//							  return new PasswordAuthentication(fromEmail, password); 
//						} 
//					}; 
//					Session sessionM = Session.getInstance(props, auth);
//					EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//							+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//							+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//							+ " Xin cảm ơn !");
//				}
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("addressService", addressService);
		List<Address> province = addressService.getListProvinces();
		modelMap.addAttribute("province", province);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("objU", objU);
		modelMap.addAttribute("lockxu", lockxu);
		return "public.payment";
	}
	@PostMapping("payment")
	public String payment(@RequestParam(required = false, value = "id") Integer id, @RequestParam("ip") String ip,
			ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
			lockxu = lockPayAccountService.getAccLockxu(id_user);
			if(lockxu.getSurplus()<=3000) {
				final String toEmail = objU.getEmail();
				System.out.println("TLSEmail Start"); Properties props = new Properties();
				  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
				  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
				  props.put("mail.smtp.port", "587"); //TLS Port 
				  props.put("mail.smtp.auth","true"); //enable authentication 
				  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
				  
				  //create Authenticator object to pass in Session.getInstance argument
				  Authenticator auth = new Authenticator() { 
					  //override the getPasswordAuthentication method 
					  protected PasswordAuthentication
					  getPasswordAuthentication() { 
						  return new PasswordAuthentication(fromEmail, password); 
					} 
				}; 
				Session sessionM = Session.getInstance(props, auth);
				EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
						+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
						+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
						+ " Xin cảm ơn !");
			}
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//					lockxu = lockPayAccountService.getAccLockxu(id_user);
//					if(lockxu.getSurplus()<=3000) {
//						final String toEmail = objU.getEmail();
//						System.out.println("TLSEmail Start"); Properties props = new Properties();
//						  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//						  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//						  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//						  props.put("mail.smtp.port", "587"); //TLS Port 
//						  props.put("mail.smtp.auth","true"); //enable authentication 
//						  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//						  
//						  //create Authenticator object to pass in Session.getInstance argument
//						  Authenticator auth = new Authenticator() { 
//							  //override the getPasswordAuthentication method 
//							  protected PasswordAuthentication
//							  getPasswordAuthentication() { 
//								  return new PasswordAuthentication(fromEmail, password); 
//							} 
//						}; 
//						Session sessionM = Session.getInstance(props, auth);
//						EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//								+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//								+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//								+ " Xin cảm ơn !");
//					}
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//				lockxu = lockPayAccountService.getAccLockxu(id_user);
//				if(lockxu.getSurplus()<=3000) {
//					final String toEmail = objU.getEmail();
//					System.out.println("TLSEmail Start"); Properties props = new Properties();
//					  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//					  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//					  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//					  props.put("mail.smtp.port", "587"); //TLS Port 
//					  props.put("mail.smtp.auth","true"); //enable authentication 
//					  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//					  
//					  //create Authenticator object to pass in Session.getInstance argument
//					  Authenticator auth = new Authenticator() { 
//						  //override the getPasswordAuthentication method 
//						  protected PasswordAuthentication
//						  getPasswordAuthentication() { 
//							  return new PasswordAuthentication(fromEmail, password); 
//						} 
//					}; 
//					Session sessionM = Session.getInstance(props, auth);
//					EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//							+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//							+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//							+ " Xin cảm ơn !");
//				}
//			}
//		} else {
//			id_user = 0;
//		}

		if (id != null) {
			Product product = productService.getProById(id);
			listPro = new ArrayList<>();
			try {
				if (cartService.getProByProId(id_user, ip, id) != null) {
					listPro = cartService.getListProByProId(id_user, ip,id);
					modelMap.addAttribute("categoryService", categoriesService);
					modelMap.addAttribute("addressService", addressService);
					List<Address> province = addressService.getListProvinces();
					modelMap.addAttribute("province", province);
					modelMap.addAttribute("cart", listPro);
					modelMap.addAttribute("objU", objU);
					modelMap.addAttribute("lockxu", lockxu);
					return "public.payment";
				}

			} catch (EmptyResultDataAccessException e) {
				if (cartService.addPro(product, id_user, ip) > 0) {
					listPro = cartService.getListProByProId(id_user, ip,id);
					modelMap.addAttribute("categoryService", categoriesService);
					modelMap.addAttribute("addressService", addressService);
					List<Address> province = addressService.getListProvinces();
					modelMap.addAttribute("province", province);
					modelMap.addAttribute("cart", listPro);
					modelMap.addAttribute("objU", objU);
					modelMap.addAttribute("lockxu", lockxu);
					return "public.payment";
				}

			}
			listPro = cartService.getListProByProId(id_user, ip,id);
			modelMap.addAttribute("categoryService", categoriesService);
			modelMap.addAttribute("addressService", addressService);
			modelMap.addAttribute("cart", listPro);
			List<Address> province = addressService.getListProvinces();
			modelMap.addAttribute("province", province);
			modelMap.addAttribute("objU", objU);
			modelMap.addAttribute("lockxu", lockxu);
			return "public.payment";
		} else {
			listPro = cartService.getListPro(id_user, ip);
			modelMap.addAttribute("categoryService", categoriesService);
			modelMap.addAttribute("addressService", addressService);
			List<Address> province = addressService.getListProvinces();
			modelMap.addAttribute("province", province);
			modelMap.addAttribute("cart", listPro);
			modelMap.addAttribute("objU", objU);
			modelMap.addAttribute("lockxu", lockxu);
			return "public.payment";
		}

	}
	@GetMapping("payment-paypal")
	public String paymentPayPal(ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
			lockxu = lockPayAccountService.getAccLockxu(id_user);
			if(lockxu.getSurplus()<=3000) {
				final String toEmail = objU.getEmail();
				System.out.println("TLSEmail Start"); Properties props = new Properties();
				  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
				  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
				  props.put("mail.smtp.port", "587"); //TLS Port 
				  props.put("mail.smtp.auth","true"); //enable authentication 
				  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
				  
				  //create Authenticator object to pass in Session.getInstance argument
				  Authenticator auth = new Authenticator() { 
					  //override the getPasswordAuthentication method 
					  protected PasswordAuthentication
					  getPasswordAuthentication() { 
						  return new PasswordAuthentication(fromEmail, password); 
					} 
				}; 
				Session sessionM = Session.getInstance(props, auth);
				EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
						+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
						+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
						+ " Xin cảm ơn !");
			}
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//					lockxu = lockPayAccountService.getAccLockxu(id_user);
//					if(lockxu.getSurplus()<=3000) {
//						final String toEmail = objU.getEmail();
//						System.out.println("TLSEmail Start"); Properties props = new Properties();
//						  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//						  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//						  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//						  props.put("mail.smtp.port", "587"); //TLS Port 
//						  props.put("mail.smtp.auth","true"); //enable authentication 
//						  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//						  
//						  //create Authenticator object to pass in Session.getInstance argument
//						  Authenticator auth = new Authenticator() { 
//							  //override the getPasswordAuthentication method 
//							  protected PasswordAuthentication
//							  getPasswordAuthentication() { 
//								  return new PasswordAuthentication(fromEmail, password); 
//							} 
//						}; 
//						Session sessionM = Session.getInstance(props, auth);
//						EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//								+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//								+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//								+ " Xin cảm ơn !");
//					}
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//				lockxu = lockPayAccountService.getAccLockxu(id_user);
//				if(lockxu.getSurplus()<=3000) {
//					final String toEmail = objU.getEmail();
//					System.out.println("TLSEmail Start"); Properties props = new Properties();
//					  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//					  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//					  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//					  props.put("mail.smtp.port", "587"); //TLS Port 
//					  props.put("mail.smtp.auth","true"); //enable authentication 
//					  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//					  
//					  //create Authenticator object to pass in Session.getInstance argument
//					  Authenticator auth = new Authenticator() { 
//						  //override the getPasswordAuthentication method 
//						  protected PasswordAuthentication
//						  getPasswordAuthentication() { 
//							  return new PasswordAuthentication(fromEmail, password); 
//						} 
//					}; 
//					Session sessionM = Session.getInstance(props, auth);
//					EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//							+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//							+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//							+ " Xin cảm ơn !");
//				}
//			}
//		} else {
//			id_user = 0;
//		}

		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("addressService", addressService);
		List<Address> province = addressService.getListProvinces();
		modelMap.addAttribute("province", province);
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("objU", objU);
		
		modelMap.addAttribute("lockxu", lockxu);
		return "public.payment-paypal";
	}
	@PostMapping("payment-paypal")
	public String paymentPaypal(@RequestParam(required = false, value = "id") Integer id, @RequestParam("ip") String ip,
			ModelMap modelMap, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}

		if (id != null) {
			Product product = productService.getProById(id);
			listPro = new ArrayList<>();
			try {
				if (cartService.getProByProId(id_user,ip,id) != null) {
					listPro = cartService.getListProByProId(id_user,ip,id);
					modelMap.addAttribute("categoryService", categoriesService);
					modelMap.addAttribute("addressService", addressService);
					List<Address> province = addressService.getListProvinces();
					modelMap.addAttribute("province", province);
					modelMap.addAttribute("cart", listPro);
					modelMap.addAttribute("objU", objU);
					lockxu  = lockPayAccountService.getAccLockxu(id_user);
					modelMap.addAttribute("lockxu", lockxu);
					return "public.payment-paypal";
				}

			} catch (EmptyResultDataAccessException e) {
				if (cartService.addPro(product, id_user, ip) > 0) {
					listPro = cartService.getListProByProId(id_user,ip,id);
					modelMap.addAttribute("categoryService", categoriesService);
					modelMap.addAttribute("addressService", addressService);
					List<Address> province = addressService.getListProvinces();
					modelMap.addAttribute("province", province);
					modelMap.addAttribute("cart", listPro);
					modelMap.addAttribute("objU", objU);
					lockxu = lockPayAccountService.getAccLockxu(id_user);
					modelMap.addAttribute("lockxu", lockxu);
					return "public.payment-paypal";
				}

			}
			listPro = cartService.getListProByProId(id_user,ip,id);
			modelMap.addAttribute("categoryService", categoriesService);
			modelMap.addAttribute("addressService", addressService);
			modelMap.addAttribute("cart", listPro);
			List<Address> province = addressService.getListProvinces();
			modelMap.addAttribute("province", province);
			modelMap.addAttribute("objU", objU);
			lockxu = lockPayAccountService.getAccLockxu(id_user);
			modelMap.addAttribute("lockxu", lockxu);
			return "public.payment-paypal";
		} else {
			listPro = cartService.getListPro(id_user, ip);
			modelMap.addAttribute("categoryService", categoriesService);
			modelMap.addAttribute("addressService", addressService);
			List<Address> province = addressService.getListProvinces();
			modelMap.addAttribute("province", province);
			modelMap.addAttribute("cart", listPro);
			modelMap.addAttribute("objU", objU);
			lockxu = lockPayAccountService.getAccLockxu(id_user);
			modelMap.addAttribute("lockxu", lockxu);
			return "public.payment-paypal";
		}

	}

	@PostMapping("get-districts")
	@ResponseBody
	public List<Address> getDistricts(@RequestParam("code") String code) {
		List<Address> list = addressService.getListDistricts(code);
		return list;
	}

	@PostMapping("get-wards")
	@ResponseBody
	public List<Address> getWards(@RequestParam("code") String code) {
		List<Address> list = addressService.getListWards(code);
		return list;
	}

	@PostMapping("get-shipping-fee")
	@ResponseBody
	public int getShippingFee(@RequestParam("code") String code, @RequestParam("price") int price) {
		Address address = addressService.getProvince(code);
		if (address.getName().equalsIgnoreCase("Hồ Chí Minh") && price < 2000000) {
			return 20000;
		} else {
			if (!address.getName().equalsIgnoreCase("Hồ Chí Minh") && price < 2000000) {
				return 35000;
			} else {
				if (price > 2000000) {
					return 0;
				}
			}
		}
		return 1;
	}

	@PostMapping("check-discount-code")
	@ResponseBody
	public String checkCode(@RequestParam("discount_code") String discount_code, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;

		Users objU = new Users();
		if(principal1!=null) {
			try {
				if(adminService.getAdByName(principal1.getName())!=null) {
					id_user = 0;
				}else {
					objU = usersService.getUserByUsername(principal1.getName());
					id_user = objU.getId();
				}
			} catch (EmptyResultDataAccessException e) {
				objU = usersService.getUserByUsername(principal1.getName());
				id_user = objU.getId();
			}
		} else {
			id_user = 0;
		}
		try {
			if (discountCodeService.getCode(discount_code) != null) {
				return "1";

			}
		} catch (EmptyResultDataAccessException e) {
			return "2";
		}
		return "";
	}

	@PostMapping("get-discount")
	@ResponseBody
	public int getDiscount(@RequestParam("discount_code") String discount_code) {
		return discountCodeService.getCode(discount_code).getReduced_price();
	}

	@PostMapping("order")
	public String oder(@RequestParam(required = false, name = "name") String name,
			@RequestParam(required = false, name = "phone") String phone, @RequestParam(required = false, name = "email") String email,
			@RequestParam("payment_methods") String payment_methods,
			@RequestParam("ship_type") String ship_type, @RequestParam(required = false, name= "province") String province,
			@RequestParam(required = false, name="district") String district, @RequestParam(required = false, name="ward") String ward,
			@RequestParam(required = false, name="address") String address1, @RequestParam("discount") String discount_code, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes ra, Authentication principal1) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;

		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//					lockxu = lockPayAccountService.getAccLockxu(id_user);
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//				lockxu = lockPayAccountService.getAccLockxu(id_user);
//			}
//		} else {
//			id_user = 0;
//		}
		float discount =0;
		if(discount_code!=null) {
			try {
				if (discountCodeService.getCode(discount_code) != null) {
					discount = (float)discountCodeService.getCode(discount_code).getReduced_price();
				}
			} catch (EmptyResultDataAccessException e) {
				discount =0;
			}
		}
		String notification = "";
		String order_code = randomLb.randomAlphaNumericUpperCase(8);
		float transport=0;
		String product_id="";
		String product_code="";
		String product_detail="";
		String shipping_address="";
		float price = 0;
		int qty = 0;
		float subtotal = 0;
		float total = 0;
		String images="";
		if(payment_methods.equals("COD")) {
			if(ship_type.equalsIgnoreCase("home")) {
				if(listPro.size()==1) {
					notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
					product_id=String.valueOf(listPro.get(0).getProduct_id());
					product_code = String.valueOf(listPro.get(0).getProduct_sku());
					product_detail = String.valueOf(listPro.get(0).getProduct_name());
					price = (float)listPro.get(0).getPrice();
					qty = listPro.get(0).getQty();
					Address city = addressService.getProvince(province);
					Address dis = addressService.getDistrict(district);
					Address w = addressService.getWard(ward);
					String address2 = address1.replace("-", ",");
					shipping_address = address2+"-"+w.getName()+"-"+dis.getName()+"-"+city.getName();
					subtotal = listPro.get(0).getQty()*listPro.get(0).getPrice();
					total = subtotal+transport-discount;
					OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, listPro.get(0).getImages(), subtotal, discount, transport, 0, total,payment_methods, ship_type, id_user, null, 1,0);
					OrderDetail newOrder = new OrderDetail();
					int result = 0;
					result = ordersService.addOrder(orderDetail);
					int result1 = 0;
					for(int i = 0; i<listPro.size(); i++) {
						newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()),listPro.get(i).getProduct_sku(),  listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total,payment_methods, ship_type, id_user, null, 1,0);
						result1 = result1+ordersService.addOrderDetail(newOrder);
					}
					if(result>0&&result1>0) {
						if(cartService.upStatus(listPro.get(0).getId(), 1)>0&&notificationService.addNotification(notification, "order")>0) {
							if(email!=null) {
								 final String toEmail = email; // can be any email id
								  System.out.println("TLSEmail Start"); Properties props = new Properties();
								  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
								  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
								  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
								  props.put("mail.smtp.port", "587"); //TLS Port 
								  props.put("mail.smtp.auth","true"); //enable authentication 
								  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
								  
								  //create Authenticator object to pass in Session.getInstance argument
								  Authenticator auth = new Authenticator() { 
									  //override the getPasswordAuthentication method 
									  protected PasswordAuthentication
									  getPasswordAuthentication() { 
										  return new PasswordAuthentication(fromEmail, password); 
									} 
								}; 
								Session sessionM = Session.getInstance(props, auth);
								EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG", "Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và gửi sản phẩm tới tay khách hàng sớm nhất."
										+ "Thông tin đặt hàng: "
										+ "	- Tên khách hàng: "+name+"."
										+ "	- Số điện thoại: "+phone+"."
										+ " - Tổng tiền: "+total+"."
										+ "	- Phương thức nhận hàng: Giao hàng tại nhà."
										+ " - Địa chỉ giao hàng: "+shipping_address+"."
										+ "	- Trạng thái thanh toán:  Chưa Thanh toán."
										+ "Kính mong quý khách giữ điện thoại để cửa hàng liên hệ hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
										+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
							};
							ra.addFlashAttribute("success", order_code);
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}else {
							ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}
					}else {
						ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
						listPro = cartService.getListPro(id_user, ip);
						modelMap.addAttribute("cart", listPro);
						modelMap.addAttribute("objU", objU);
						return "redirect:/public/cart";
					}
				}else {
					if(listPro.size()>1) {
						notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
						for (int i = 0;i<listPro.size();i++) {
							product_id =product_id+","+listPro.get(i).getProduct_id();
							product_code = product_code+","+listPro.get(i).getProduct_sku();
							product_detail = product_detail+","+listPro.get(i).getProduct_name();
							images = images+","+listPro.get(i).getImages();
							price = price+listPro.get(i).getPrice();
							qty = qty+listPro.get(i).getQty();
							subtotal = subtotal+(listPro.get(i).getQty()*listPro.get(i).getPrice());
						}
						total = total +subtotal+transport-discount;
						Address city = addressService.getProvince(province);
						Address dis = addressService.getDistrict(district);
						Address w = addressService.getWard(ward);
						String address2 = address1.replace("-", ",");
						shipping_address = address2+"-"+w.getName()+"-"+dis.getName()+"-"+city.getName();
						OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, images, subtotal, discount, transport, 0, total,payment_methods, ship_type, id_user, null, 1,0);
						OrderDetail newOrder = new OrderDetail();
						
						int result = 0;
						result = ordersService.addOrder(orderDetail);
						int result1 = 0;
						for(int i = 0; i<listPro.size(); i++) {
							newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()), listPro.get(i).getProduct_sku(), listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total, payment_methods, ship_type, id_user, null, 1,0);
							result1 = result1+ordersService.addOrderDetail(newOrder);
						}
						if(result>0&&result1>0) {
							int result2=0;
							for(int i=0; i<listPro.size(); i++) {
								result2=result2+cartService.upStatus(listPro.get(i).getId(), 1);
							}
							if(result2>0&&notificationService.addNotification(notification, "order")>0) {
									if(email!=null) {
										 final String toEmail = email; // can be any email id
										  System.out.println("TLSEmail Start"); Properties props = new Properties();
										  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
										  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
										  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
										  props.put("mail.smtp.port", "587"); //TLS Port 
										  props.put("mail.smtp.auth","true"); //enable authentication 
										  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
										  
										  //create Authenticator object to pass in Session.getInstance argument
										  Authenticator auth = new Authenticator() { 
											  //override the getPasswordAuthentication method 
											  protected PasswordAuthentication
											  getPasswordAuthentication() { 
												  return new PasswordAuthentication(fromEmail, password); 
											} 
										}; 
										Session sessionM = Session.getInstance(props, auth);
										EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG","Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và gửi sản phẩm tới tay khách hàng sớm nhất."
												+ "Thông tin đặt hàng: "
												+ "	- Tên khách hàng: "+name+"."
												+ "	- Số điện thoại: "+phone+"."
												+ " - Tổng tiền: "+total+"."
												+ "	- Phương thức nhận hàng: Giao hàng tại nhà."
												+ " - Địa chỉ giao hàng: "+shipping_address+"."
												+ "	- Trạng thái thanh toán:  Chưa Thanh toán."
												+ "Kính mong quý khách giữ điện thoại để cửa hàng liên hệ hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
												+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
									}
								ra.addFlashAttribute("success", "Đặt hàng thành công. Mã đặt hàng của bạn là: "+order_code+"");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}else {
								ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}
						}else {
							ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}
						
					}
				}
			}else {
				if(ship_type.equalsIgnoreCase("store")) {
					if(listPro.size()==1) {
						notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
						product_id=String.valueOf(listPro.get(0).getProduct_id());
						product_code = String.valueOf(listPro.get(0).getProduct_sku());
						product_detail = String.valueOf(listPro.get(0).getProduct_name());
						price = (float)listPro.get(0).getPrice();
						qty = listPro.get(0).getQty();
						
						shipping_address = "156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh";
						subtotal = listPro.get(0).getQty()*listPro.get(0).getPrice();
						total = subtotal+transport-discount;
						OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, listPro.get(0).getImages(), subtotal, discount, transport, 0, total, payment_methods, ship_type, id_user, null, 1,0);
						OrderDetail newOrder = new OrderDetail();
						int result = 0;
						result = ordersService.addOrder(orderDetail);
						int result1 = 0;
						for(int i = 0; i<listPro.size(); i++) {
							newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()), listPro.get(i).getProduct_sku(),listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total, payment_methods, ship_type, id_user, null, 1,0);
							result1 = result1+ordersService.addOrderDetail(newOrder);
						}
						if(result>0&&result1>0) {
							if(cartService.upStatus(listPro.get(0).getId(), 1)>0&&notificationService.addNotification(notification, "order")>0) {
									if(email!=null) {
										 final String toEmail = email; // can be any email id
										  System.out.println("TLSEmail Start"); Properties props = new Properties();
										  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
										  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
										  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
										  props.put("mail.smtp.port", "587"); //TLS Port 
										  props.put("mail.smtp.auth","true"); //enable authentication 
										  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
										  
										  //create Authenticator object to pass in Session.getInstance argument
										  Authenticator auth = new Authenticator() { 
											  //override the getPasswordAuthentication method 
											  protected PasswordAuthentication
											  getPasswordAuthentication() { 
												  return new PasswordAuthentication(fromEmail, password); 
											} 
										}; 
										Session sessionM = Session.getInstance(props, auth);
										EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG", "Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và giữ sản phẩm tại cửa hàng."
												+ "Thông tin đặt hàng: "
												+ "	- Tên khách hàng: "+name+"."
												+ "	- Số điện thoại: "+phone+"."
												+ " - Tổng tiền: "+total+"."
												+ "	- Phương thức nhận hàng: Tại cửa hàng."
												+ "	- Trạng thái thanh toán:  Chưa Thanh toán."
												+ " - Địa chỉ cửa hàng: 156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh."
												+ "Kính mong quý khách sắp xếp thời gian để đến cửa hàng để hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
												+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
									}
								ra.addFlashAttribute("success", "Đặt hàng thành công. Mã đặt hàng của bạn là: "+order_code+"");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}else {
								ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}
						}else {
							ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}
					}else {
						if(listPro.size()>1) {
							notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
							for (int i = 0;i<listPro.size();i++) {
								product_id =product_id+","+listPro.get(i).getProduct_id();
								product_code = product_code+","+listPro.get(i).getProduct_sku();
								product_detail = product_detail+","+listPro.get(i).getProduct_name();
								images = images+","+listPro.get(i).getImages();
								price = price+listPro.get(i).getPrice();
								qty = qty+listPro.get(i).getQty();
								subtotal = subtotal+(listPro.get(i).getQty()*listPro.get(i).getPrice());
							}
							total = total +subtotal+transport-discount;
							
							shipping_address = "156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh";
							OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, images, subtotal, discount, transport, 0, total,payment_methods, ship_type, id_user, null, 1,0);
							OrderDetail newOrder = new OrderDetail();
							int result = 0;
							result = ordersService.addOrder(orderDetail);
							int result1 = 0;
							for(int i = 0; i<listPro.size(); i++) {
								newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()), listPro.get(i).getProduct_sku(),listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total, payment_methods, ship_type, id_user, null, 1,0);
								result1 = result1+ordersService.addOrderDetail(newOrder);
							}
							if(result>0&&result1>0) {
								int result2=0;
								int result3=0;
								for(int i=0; i<listPro.size(); i++) {
									result2=result2+cartService.upStatus(listPro.get(i).getId(), 1);
								}
								
								if(result2>0&&notificationService.addNotification(notification, "order")>0) {
									if(email!=null) {
										 final String toEmail = email; // can be any email id
										  System.out.println("TLSEmail Start"); Properties props = new Properties();
										  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
										  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
										  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
										  props.put("mail.smtp.port", "587"); //TLS Port 
										  props.put("mail.smtp.auth","true"); //enable authentication 
										  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
										  
										  //create Authenticator object to pass in Session.getInstance argument
										  Authenticator auth = new Authenticator() { 
											  //override the getPasswordAuthentication method 
											  protected PasswordAuthentication
											  getPasswordAuthentication() { 
												  return new PasswordAuthentication(fromEmail, password); 
											} 
										}; 
										Session sessionM = Session.getInstance(props, auth);
										EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG", "Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và giữ sản phẩm tại cửa hàng."
												+ "Thông tin đặt hàng: "
												+ "	- Tên khách hàng: "+name+"."
												+ "	- Số điện thoại: "+phone+"."
												+ " - Tổng tiền: "+total+"."
												+ "	- Phương thức nhận hàng: Tại cửa hàng."
												+ "	- Trạng thái thanh toán:  Chưa Thanh toán."
												+ " - Địa chỉ cửa hàng: 156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh."
												+ "Kính mong quý khách sắp xếp thời gian để đến cửa hàng để hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
												+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
									}
									ra.addFlashAttribute("success", "Đặt hàng thành công. Mã đặt hàng của bạn là: "+order_code+"");
									listPro = cartService.getListPro(id_user, ip);
									modelMap.addAttribute("cart", listPro);
									modelMap.addAttribute("objU", objU);
									return "redirect:/public/cart";
								}else {
									ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
									listPro = cartService.getListPro(id_user, ip);
									modelMap.addAttribute("cart", listPro);
									modelMap.addAttribute("objU", objU);
									return "redirect:/public/cart";
								}
							}else {
								ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}
							
						}
					}
				}
			}
		}
		if(payment_methods.equals("LOCKXU")) {
			
			if(ship_type.equalsIgnoreCase("home")) {
				if(listPro.size()==1) {
					notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
					product_id=String.valueOf(listPro.get(0).getProduct_id());
					product_code = String.valueOf(listPro.get(0).getProduct_sku());
					product_detail = String.valueOf(listPro.get(0).getProduct_name());
					price = (float)listPro.get(0).getPrice();
					qty = listPro.get(0).getQty();
					Address city = addressService.getProvince(province);
					Address dis = addressService.getDistrict(district);
					Address w = addressService.getWard(ward);
					String address2 = address1.replace("-", ",");
					shipping_address = address2+"-"+w.getName()+"-"+dis.getName()+"-"+city.getName();
					subtotal = listPro.get(0).getQty()*listPro.get(0).getPrice();
					total = subtotal+transport-discount;
					OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, listPro.get(0).getImages(), subtotal, discount, transport, 0, total,payment_methods, ship_type, id_user, null, 1,1);
					OrderDetail newOrder = new OrderDetail();
					int result = 0;
					result = ordersService.addOrder(orderDetail);
					int result1 = 0;
					for(int i = 0; i<listPro.size(); i++) {
						newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()),listPro.get(i).getProduct_sku(),  listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total,payment_methods, ship_type, id_user, null, 1,1);
						result1 = result1+ordersService.addOrderDetail(newOrder);
					}
					int newLockxu = lockxu.getSurplus()-(int)(total/1000);
					int result2 = 0;
					result2 = lockPayAccountService.setLockxu(id_user, newLockxu);
					if(result>0&&result1>0&&result2>0) {
						lockxu = lockPayAccountService.getAccLockxu(id_user);
						if(lockxu.getSurplus()<=3000) {
							final String toEmail = objU.getEmail();
							System.out.println("TLSEmail Start"); Properties props = new Properties();
							  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
							  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
							  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
							  props.put("mail.smtp.port", "587"); //TLS Port 
							  props.put("mail.smtp.auth","true"); //enable authentication 
							  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
							  
							  //create Authenticator object to pass in Session.getInstance argument
							  Authenticator auth = new Authenticator() { 
								  //override the getPasswordAuthentication method 
								  protected PasswordAuthentication
								  getPasswordAuthentication() { 
									  return new PasswordAuthentication(fromEmail, password); 
								} 
							}; 
							Session sessionM = Session.getInstance(props, auth);
							EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
									+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
									+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
									+ " Xin cảm ơn !");
						}
						if(cartService.upStatus(listPro.get(0).getId(), 1)>0&&notificationService.addNotification(notification, "order")>0) {
							if(email!=null) {
								 final String toEmail = email; // can be any email id
								  System.out.println("TLSEmail Start"); Properties props = new Properties();
								  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
								  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
								  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
								  props.put("mail.smtp.port", "587"); //TLS Port 
								  props.put("mail.smtp.auth","true"); //enable authentication 
								  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
								  
								  //create Authenticator object to pass in Session.getInstance argument
								  Authenticator auth = new Authenticator() { 
									  //override the getPasswordAuthentication method 
									  protected PasswordAuthentication
									  getPasswordAuthentication() { 
										  return new PasswordAuthentication(fromEmail, password); 
									} 
								}; 
								Session sessionM = Session.getInstance(props, auth);
								EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG", "Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và gửi sản phẩm tới tay khách hàng sớm nhất."
										+ "Thông tin đặt hàng: "
										+ "	- Tên khách hàng: "+name+"."
										+ "	- Số điện thoại: "+phone+"."
										+ " - Tổng tiền: "+total+"."
										+ "	- Phương thức nhận hàng: Giao hàng tại nhà."
										+ "	- Trạng thái thanh toán:  Đã Thanh toán."
										+ " - Địa chỉ giao hàng: "+shipping_address+"."
										+ "Kính mong quý khách giữ điện thoại để cửa hàng liên hệ hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
										+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
							};
							ra.addFlashAttribute("success", order_code);
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}else {
							ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}
					}else {
						ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
						listPro = cartService.getListPro(id_user, ip);
						modelMap.addAttribute("cart", listPro);
						modelMap.addAttribute("objU", objU);
						return "redirect:/public/cart";
					}
				}else {
					if(listPro.size()>1) {
						notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
						for (int i = 0;i<listPro.size();i++) {
							product_id =product_id+","+listPro.get(i).getProduct_id();
							product_code = product_code+","+listPro.get(i).getProduct_sku();
							product_detail = product_detail+","+listPro.get(i).getProduct_name();
							images = images+","+listPro.get(i).getImages();
							price = price+listPro.get(i).getPrice();
							qty = qty+listPro.get(i).getQty();
							subtotal = subtotal+(listPro.get(i).getQty()*listPro.get(i).getPrice());
						}
						total = total +subtotal+transport-discount;
						Address city = addressService.getProvince(province);
						Address dis = addressService.getDistrict(district);
						Address w = addressService.getWard(ward);
						String address2 = address1.replace("-", ",");
						shipping_address = address2+"-"+w.getName()+"-"+dis.getName()+"-"+city.getName();
						OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, images, subtotal, discount, transport, 0, total,payment_methods, ship_type, id_user, null, 1,0);
						OrderDetail newOrder = new OrderDetail();
						
						int result = 0;
						result = ordersService.addOrder(orderDetail);
						int result1 = 0;
						for(int i = 0; i<listPro.size(); i++) {
							newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()), listPro.get(i).getProduct_sku(), listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total, payment_methods, ship_type, id_user, null, 1,0);
							result1 = result1+ordersService.addOrderDetail(newOrder);
						}
						int newLockxu = lockxu.getSurplus()-(int)(total/1000);
						int results = 0;
						results = lockPayAccountService.setLockxu(id_user, newLockxu);
						if(result>0&&result1>0&&results>0) {
							int result2=0;
							for(int i=0; i<listPro.size(); i++) {
								result2=result2+cartService.upStatus(listPro.get(i).getId(), 1);
							}
							lockxu = lockPayAccountService.getAccLockxu(id_user);
							if(lockxu.getSurplus()<=3000) {
								final String toEmail = objU.getEmail();
								System.out.println("TLSEmail Start"); Properties props = new Properties();
								  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
								  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
								  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
								  props.put("mail.smtp.port", "587"); //TLS Port 
								  props.put("mail.smtp.auth","true"); //enable authentication 
								  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
								  
								  //create Authenticator object to pass in Session.getInstance argument
								  Authenticator auth = new Authenticator() { 
									  //override the getPasswordAuthentication method 
									  protected PasswordAuthentication
									  getPasswordAuthentication() { 
										  return new PasswordAuthentication(fromEmail, password); 
									} 
								}; 
								Session sessionM = Session.getInstance(props, auth);
								EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
										+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
										+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
										+ " Xin cảm ơn !");
							}
							if(result2>0&&notificationService.addNotification(notification, "order")>0) {
									if(email!=null) {
										 final String toEmail = email; // can be any email id
										  System.out.println("TLSEmail Start"); Properties props = new Properties();
										  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
										  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
										  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
										  props.put("mail.smtp.port", "587"); //TLS Port 
										  props.put("mail.smtp.auth","true"); //enable authentication 
										  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
										  
										  //create Authenticator object to pass in Session.getInstance argument
										  Authenticator auth = new Authenticator() { 
											  //override the getPasswordAuthentication method 
											  protected PasswordAuthentication
											  getPasswordAuthentication() { 
												  return new PasswordAuthentication(fromEmail, password); 
											} 
										}; 
										Session sessionM = Session.getInstance(props, auth);
										EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG","Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và gửi sản phẩm tới tay khách hàng sớm nhất."
												+ "Thông tin đặt hàng: "
												+ "	- Tên khách hàng: "+name+"."
												+ "	- Số điện thoại: "+phone+"."
												+ " - Tổng tiền: "+total+"."
												+ "	- Phương thức nhận hàng: Giao hàng tại nhà."
												+ "	- Trạng thái thanh toán:  Đã Thanh toán."
												+ " - Địa chỉ giao hàng: "+shipping_address+"."
												+ "Kính mong quý khách giữ điện thoại để cửa hàng liên hệ hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
												+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
									}
								ra.addFlashAttribute("success", "Đặt hàng thành công. Mã đặt hàng của bạn là: "+order_code+"");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}else {
								ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}
						}else {
							ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}
						
					}
				}
			}else {
				if(ship_type.equalsIgnoreCase("store")) {
					if(listPro.size()==1) {
						notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
						product_id=String.valueOf(listPro.get(0).getProduct_id());
						product_code = String.valueOf(listPro.get(0).getProduct_sku());
						product_detail = String.valueOf(listPro.get(0).getProduct_name());
						price = (float)listPro.get(0).getPrice();
						qty = listPro.get(0).getQty();
						
						shipping_address = "156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh";
						subtotal = listPro.get(0).getQty()*listPro.get(0).getPrice();
						total = subtotal+transport-discount;
						OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, listPro.get(0).getImages(), subtotal, discount, transport, 0, total, payment_methods, ship_type, id_user, null, 1,0);
						OrderDetail newOrder = new OrderDetail();
						int result = 0;
						result = ordersService.addOrder(orderDetail);
						int result1 = 0;
						for(int i = 0; i<listPro.size(); i++) {
							newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()), listPro.get(i).getProduct_sku(),listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total, payment_methods, ship_type, id_user, null, 1,0);
							result1 = result1+ordersService.addOrderDetail(newOrder);
						}
						int newLockxu = lockxu.getSurplus()-(int)(total/1000);
						int result2 = 0;
						result2 = lockPayAccountService.setLockxu(id_user, newLockxu);
						if(result>0&&result1>0&&result2>0) {
							lockxu = lockPayAccountService.getAccLockxu(id_user);
							if(lockxu.getSurplus()<=3000) {
								final String toEmail = objU.getEmail();
								System.out.println("TLSEmail Start"); Properties props = new Properties();
								  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
								  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
								  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
								  props.put("mail.smtp.port", "587"); //TLS Port 
								  props.put("mail.smtp.auth","true"); //enable authentication 
								  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
								  
								  //create Authenticator object to pass in Session.getInstance argument
								  Authenticator auth = new Authenticator() { 
									  //override the getPasswordAuthentication method 
									  protected PasswordAuthentication
									  getPasswordAuthentication() { 
										  return new PasswordAuthentication(fromEmail, password); 
									} 
								}; 
								Session sessionM = Session.getInstance(props, auth);
								EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
										+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
										+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
										+ " Xin cảm ơn !");
							}
							if(cartService.upStatus(listPro.get(0).getId(), 1)>0&&notificationService.addNotification(notification, "order")>0) {
									if(email!=null) {
										 final String toEmail = email; // can be any email id
										  System.out.println("TLSEmail Start"); Properties props = new Properties();
										  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
										  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
										  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
										  props.put("mail.smtp.port", "587"); //TLS Port 
										  props.put("mail.smtp.auth","true"); //enable authentication 
										  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
										  
										  //create Authenticator object to pass in Session.getInstance argument
										  Authenticator auth = new Authenticator() { 
											  //override the getPasswordAuthentication method 
											  protected PasswordAuthentication
											  getPasswordAuthentication() { 
												  return new PasswordAuthentication(fromEmail, password); 
											} 
										}; 
										Session sessionM = Session.getInstance(props, auth);
										EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG", "Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và giữ sản phẩm tại cửa hàng."
												+ "Thông tin đặt hàng: "
												+ "	- Tên khách hàng: "+name+"."
												+ "	- Số điện thoại: "+phone+"."
												+ " - Tổng tiền: "+total+"."
												+ "	- Phương thức nhận hàng: Tại cửa hàng."
												+ "	- Trạng thái thanh toán:  Đã Thanh toán."
												+ " - Địa chỉ cửa hàng: 156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh."
												+ "Kính mong quý khách sắp xếp thời gian để đến cửa hàng để hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
												+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
									}
								ra.addFlashAttribute("success", "Đặt hàng thành công. Mã đặt hàng của bạn là: "+order_code+"");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}else {
								ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}
						}else {
							ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
							listPro = cartService.getListPro(id_user, ip);
							modelMap.addAttribute("cart", listPro);
							modelMap.addAttribute("objU", objU);
							return "redirect:/public/cart";
						}
					}else {
						if(listPro.size()>1) {
							notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
							for (int i = 0;i<listPro.size();i++) {
								product_id =product_id+","+listPro.get(i).getProduct_id();
								product_code = product_code+","+listPro.get(i).getProduct_sku();
								product_detail = product_detail+","+listPro.get(i).getProduct_name();
								images = images+","+listPro.get(i).getImages();
								price = price+listPro.get(i).getPrice();
								qty = qty+listPro.get(i).getQty();
								subtotal = subtotal+(listPro.get(i).getQty()*listPro.get(i).getPrice());
							}
							total = total +subtotal+transport-discount;
							
							shipping_address = "156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh";
							OrderDetail orderDetail = new OrderDetail(0, order_code, name, email, phone, shipping_address, product_id,product_code, product_detail, "", "", qty, price, images, subtotal, discount, transport, 0, total,payment_methods, ship_type, id_user, null, 1,0);
							OrderDetail newOrder = new OrderDetail();
							int result = 0;
							result = ordersService.addOrder(orderDetail);
							int result1 = 0;
							for(int i = 0; i<listPro.size(); i++) {
								newOrder = new OrderDetail(0, order_code, name, email, phone, shipping_address, String.valueOf(listPro.get(i).getProduct_id()), listPro.get(i).getProduct_sku(),listPro.get(i).getProduct_name(), "", "", listPro.get(i).getQty(),(float) listPro.get(i).getPrice(),listPro.get(i).getImages(),(float)(listPro.get(i).getPrice()*listPro.get(i).getQty()), (float)discount, (float)transport, 0,total, payment_methods, ship_type, id_user, null, 1,0);
								result1 = result1+ordersService.addOrderDetail(newOrder);
							}
							int newLockxu = lockxu.getSurplus()-(int)(total/1000);
							int results = 0;
							results = lockPayAccountService.setLockxu(id_user, newLockxu);
							if(result>0&&result1>0&&results>0) {
								int result2=0;
								int result3=0;
								for(int i=0; i<listPro.size(); i++) {
									result2=result2+cartService.upStatus(listPro.get(i).getId(), 1);
								}
								lockxu = lockPayAccountService.getAccLockxu(id_user);
								if(lockxu.getSurplus()<=3000) {
									final String toEmail = objU.getEmail();
									System.out.println("TLSEmail Start"); Properties props = new Properties();
									  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
									  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
									  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
									  props.put("mail.smtp.port", "587"); //TLS Port 
									  props.put("mail.smtp.auth","true"); //enable authentication 
									  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
									  
									  //create Authenticator object to pass in Session.getInstance argument
									  Authenticator auth = new Authenticator() { 
										  //override the getPasswordAuthentication method 
										  protected PasswordAuthentication
										  getPasswordAuthentication() { 
											  return new PasswordAuthentication(fromEmail, password); 
										} 
									}; 
									Session sessionM = Session.getInstance(props, auth);
									EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
											+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
											+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
											+ " Xin cảm ơn !");
								}
								if(result2>0&&notificationService.addNotification(notification, "order")>0) {
									if(email!=null) {
										 final String toEmail = email; // can be any email id
										  System.out.println("TLSEmail Start"); Properties props = new Properties();
										  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
										  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
										  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
										  props.put("mail.smtp.port", "587"); //TLS Port 
										  props.put("mail.smtp.auth","true"); //enable authentication 
										  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
										  
										  //create Authenticator object to pass in Session.getInstance argument
										  Authenticator auth = new Authenticator() { 
											  //override the getPasswordAuthentication method 
											  protected PasswordAuthentication
											  getPasswordAuthentication() { 
												  return new PasswordAuthentication(fromEmail, password); 
											} 
										}; 
										Session sessionM = Session.getInstance(props, auth);
										EmailUtil.sendEmail(sessionM, toEmail,"XÁC NHẬN ĐẶT HÀNG", "Cảm ơn bạn đã mua sản phẩm bên cửa hàng chúng tôi . Chúng tôi sẽ liên hệ lại bạn trong thời gian sớm nhất để hoàn tất quá trình đặt hàng và giữ sản phẩm tại cửa hàng."
												+ "Thông tin đặt hàng: "
												+ "	- Tên khách hàng: "+name+"."
												+ "	- Số điện thoại: "+phone+"."
												+ " - Tổng tiền: "+total+"."
												+ "	- Phương thức nhận hàng: Tại cửa hàng."
												+ "	- Trạng thái thanh toán:  Đã Thanh toán."
												+ " - Địa chỉ cửa hàng: 156 Nguyễn Hồng Đào, Phường 14, Quận Tân Bình, Thành phố Hồ Chí Minh."
												+ "Kính mong quý khách sắp xếp thời gian để đến cửa hàng để hoàn tất quá trình mua hàng và nhận nhiều ưu đãi bên cửa hàng chúng tôi."
												+ "Xin cảm ơn quý khách đã tin tưởng và ủng hộ.");
									}
									ra.addFlashAttribute("success", "Đặt hàng thành công. Mã đặt hàng của bạn là: "+order_code+"");
									listPro = cartService.getListPro(id_user, ip);
									modelMap.addAttribute("cart", listPro);
									modelMap.addAttribute("objU", objU);
									return "redirect:/public/cart";
								}else {
									ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
									listPro = cartService.getListPro(id_user, ip);
									modelMap.addAttribute("cart", listPro);
									modelMap.addAttribute("objU", objU);
									return "redirect:/public/cart";
								}
							}else {
								ra.addFlashAttribute("success", "Đặt hàng Không thành công. Vui lòng thử lại sau ít phút !");
								listPro = cartService.getListPro(id_user, ip);
								modelMap.addAttribute("cart", listPro);
								modelMap.addAttribute("objU", objU);
								return "redirect:/public/cart";
							}
							
						}
					}
				}
			}
		}
		
		if(ship_type.equalsIgnoreCase("paypal")) {
			String product_name="";
			float discounts = discount;
			float transports = 0;
			if(transport-discounts>0) {
				transport=transport-discounts;
			}else {
				if(transport-discounts<0) {
					transports = (transport-discounts)*(-1);
				}
			}
			float tax = 0;
			float transport_usd = convert_to_usd(transports);
			float discount_usd = convert_to_usd(discounts);
			float tax_usd = convert_to_usd(tax);
			for (Cart productAdminDetail : listPro) {
				subtotal = (float) ((productAdminDetail.getQty()*productAdminDetail.getPrice()));
				product_name =product_name+", "+ productAdminDetail.getProduct_name()+", ";
			}
			float subtotal_usd = convert_to_usd(subtotal);
			total = subtotal+tax+transports;
			float total_usd = convert_to_usd(total);
			OrderPaypal objOder = new OrderPaypal(product_name, String.valueOf(subtotal_usd), String.valueOf(discount_usd), String.valueOf(transport_usd), String.valueOf(tax_usd), String.valueOf(total_usd));
			request.setAttribute("objOrder", objOder);
			return "forward:/paypal/checkout";
			
		}

		return "redirect:/public/cart";
		
	}
	@GetMapping("my-order/{order_code}")
	public String myOrder(@PathVariable("order_code") String order_code, ModelMap modelMap, Authentication principal1, HttpServletRequest request) {
		List<OrderDetail> list = ordersService.getListOrderByCode(order_code);
		HttpSession session = request.getSession();
		Users objU = new Users();
		int id_user = 0;
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		modelMap.addAttribute("objU", objU);
		modelMap.addAttribute("listOrder", list);
		return "public.my-order";
	}
	@PostMapping("my-order")
	public String myOrderPost(@RequestParam("order_code") String order_code, ModelMap modelMap, Authentication principal1,HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<OrderDetail> list = ordersService.getListOrderByCode(order_code);
		Users objU = new Users();
		int id_user = 0;
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		modelMap.addAttribute("objU", objU);
		modelMap.addAttribute("listOrder", list);
		return "public.my-order";
	}
	@PostMapping("handel")
	public String hadelOrder(@RequestParam("status") int status, @RequestParam("order_code") String order_code, ModelMap modelMap,Authentication principal1, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String notification = "";
		
		if(status==6) {
			notification = "Khách hàng đã hủy đơn với mã đặt hàng là: "+order_code+"";
		}else {
			if(status==1) {
				notification = "Có đơn đặt hàng mới với mã đặt hàng là: "+order_code+"";
			}
		}
		Users objU = new Users();
		int id_user = 0;
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		modelMap.addAttribute("objU", objU);
		
		if(ordersService.upStatusOrder(status, order_code)>0&&ordersService.upStatusOrderDetail(status, order_code)>0&&notificationService.addNotification(notification, "order")>0) {
			List<OrderDetail> list = ordersService.getListOrderByCode(order_code);
			modelMap.addAttribute("listOrder", list);
			modelMap.addAttribute("objU", objU);
			return "redirect:/public/my-order/"+order_code+"";
		}else {
			List<OrderDetail> list = ordersService.getListOrderByCode(order_code);
			modelMap.addAttribute("listOrder", list);
			modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
			modelMap.addAttribute("objU", objU);
			return "redirect:/public/my-order/"+order_code+"";
		}
	}
//	@PostMapping("recomment")
//	public @ResponseBody List<CommentRate>  reComment(@ModelAttribute CommentRate commentRate, @RequestParam("product_id") int product_id, @RequestParam("parent_id") int parent_id,Authentication principal1,HttpServletRequest request, HttpServletResponse response) {
//		System.out.println(",,"+commentRate+",,"+product_id);
//		
//		HttpSession session = request.getSession();
//		List<CommentRate> listCmt = new ArrayList<>();
//		Users objU = new Users();
//		int id_user = 0;
//		
//		if(session.getAttribute("objU")!=null) {
//			objU = (Users) session.getAttribute("objU");
//			id_user = objU.getId();
//		}else {
//			id_user = 0;
//		}
//		commentRate.setImages("");
//		
//		commentRate.setComment_at(String.valueOf(id_user)+",");
//		if(commentRateService.addComment(commentRate)>0) {
//			listCmt = commentRateService.getListCmt(product_id, parent_id);
//		}
//		return listCmt;
//	}
	@PostMapping(value="comment2", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public List<CommentRate> comment(@ModelAttribute CommentRate commentRate,
			@RequestParam("product_id") int product_id, @RequestParam(value = "pic") MultipartFile[] files,
			Authentication principal1, HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		List<CommentRate> listCmt = new ArrayList<>();
		Users objU = new Users();
		int id_user = 0;
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		if (files.length > 0) {
			List<String> photos = new ArrayList<String>();
			String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/comment");
			for (MultipartFile file : files) {
				String fileName = saveImage(file, path);
				photos.add(fileName);
			}
			String nameFile = photos.toString();
			System.out.println(nameFile);
			commentRate.setImages(nameFile);
		} else {
			commentRate.setImages("");
		}

		commentRate.setComment_at(String.valueOf(id_user) + ",");
		commentRate.setId_user_like(String.valueOf(id_user));

//		commentRate.setRate(commentRate.getRate() + ",");
		if (commentRateService.addComment(commentRate) > 0) {
			listCmt = commentRateService.getListCmt(product_id, commentRate.getParent_id());
			modelMap.addAttribute("categoryService", categoriesService);
			modelMap.addAttribute("commentRateService", commentRateService);
			System.out.println(listCmt);
			return listCmt;
		}
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("commentRateService", commentRateService);
		System.out.println(listCmt);
		return listCmt;
	}

	@PostMapping(value="comment", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String comment2(@ModelAttribute CommentRate commentRate,
			@RequestParam("product_id") int product_id, @RequestParam(value = "pic") MultipartFile[] files,
			Authentication principal1, HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		List<CommentRate> listCmt = new ArrayList<>();
		Users objU = new Users();
		int id_user = 0;
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		if (files.length > 0) {
			List<String> photos = new ArrayList<String>();
			String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/comment");
			for (MultipartFile file : files) {
				String fileName = saveImage(file, path);
				photos.add(fileName);
			}
			String nameFile = photos.toString();
			commentRate.setImages(nameFile);
		} else {
			commentRate.setImages("");
		}

		commentRate.setComment_at(String.valueOf(id_user) + ",");
		commentRate.setId_user_like(String.valueOf(id_user));
		String cmtPr = "";
//		commentRate.setRate(commentRate.getRate() + ",");
		if (commentRateService.addComment(commentRate) > 0) {
			listCmt = commentRateService.getListCmt(product_id, commentRate.getParent_id());
			cmtPr = parentCmt(listCmt);
			return cmtPr;
		}
		
		return cmtPr;
	}
	@PostMapping(value="re-comment", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String reComment(@ModelAttribute CommentRate commentRate,
			@RequestParam("product_id") int product_id,
			Authentication principal1, HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		List<CommentRate> listCmt = new ArrayList<>();
		Users objU = new Users();
		int id_user = 0;
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		String cmtChil ="";
		commentRate.setImages("");
		commentRate.setComment_at(String.valueOf(id_user) + ",");
		commentRate.setId_user_like(String.valueOf(id_user));
		if (commentRateService.addComment(commentRate) > 0) {
			listCmt = commentRateService.getListCmt(product_id, commentRate.getParent_id());
			cmtChil = childCmt(listCmt);
			return cmtChil;
		}
		return cmtChil;
	};

	/* like */
	@PostMapping("like")
	@ResponseBody
	public String like(@RequestParam("id") int id, HttpServletRequest request, Authentication principal1) {
		HttpSession session = request.getSession();
		CommentRate cmt = commentRateService.getCmtById(id);
		String id_user_like = cmt.getId_user_like();
		List<String> listIdUserLike = new ArrayList<>();
		if(id_user_like.equals("")==false) {
			String [] idUserLike = id_user_like.split(",");
			listIdUserLike = new ArrayList<>(Arrays.asList(idUserLike));
		}
		String count = "";
		
		Users user = new Users();
		if (session.getAttribute("objU") != null) {
			user = (Users) session.getAttribute("objU");
		} else {
			user = null;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					user=null;
//				}else {
//					user = usersService.getUserByUsername(principal1.getName());
//				}
//			} catch (EmptyResultDataAccessException e) {
//				user = usersService.getUserByUsername(principal1.getName());
//			}
//		} else {
//			user=null;
//		}
		if(user!=null) { 
			String id_user = Integer.toString(user.getId()); 
			if(equalsId(listIdUserLike, id_user)==false) {
				cmt.setId_user_like(id_user_like+","+id_user);
				if(commentRateService.upLike(id, cmt )>0) {
					cmt = commentRateService.getCmtById(id);
					count = Integer.toString(cmt.getLike_comment());
					if(count.equals("0")) {
						return "";
					}
					return count;
				}
			}else {
				String new_id_user_like = "";
				listIdUserLike.remove(indexId(listIdUserLike, id_user));
				for (String string : listIdUserLike) {
					new_id_user_like = new_id_user_like+string+",";
				}
				cmt.setId_user_like(new_id_user_like);
				if(commentRateService.disLike(id, cmt)>0) {
					cmt = commentRateService.getCmtById(id);
					count = Integer.toString(cmt.getLike_comment());
					if(count.equals("0")) {
						return "";
					}
				}
			}
		}else {
			return "login";
		}
		
		return count;
	}
	
	public boolean equalsId(List<String> list, String id) {
		for (String string : list) {
			if(string.equals(id)) {
				return true;
			}
		}
		return false;
	}
	
	public int indexId(List<String> list, String id) {
		int index=0;
		for (int i = 0; i<list.size(); i++) {
			if(list.get(i).equals(id)) {
				index = i;
			}
		}
		return index;
	}
	
	@PostMapping("add-to-cart")
	@ResponseBody
	public int addCart(@RequestParam("id") int id, @RequestParam("ip") String ip, Authentication principal1,
			ModelMap modelMap, HttpServletRequest request) throws EmptyResultDataAccessException {
		HttpSession session = request.getSession();
		session.setAttribute("ip", ip);
		Product product = productService.getProById(id);
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		listPro = cartService.getListPro(id_user, ip);
		if (listPro.size() > 0) {
			try {
				if (cartService.getPro(id_user, ip,id) != null) {
					listPro = cartService.getListPro(id_user, ip);
					modelMap.addAttribute("cart", listPro);
					return listPro.size();
				}

			} catch (EmptyResultDataAccessException e) {
				if (cartService.addPro(product, id_user, ip) > 0) {
					listPro = cartService.getListPro(id_user, ip);
					modelMap.addAttribute("cart", listPro);
					return listPro.size();
				}
				modelMap.addAttribute("cart", listPro);
				listPro = cartService.getListPro(id_user, ip);
				return listPro.size();
			}
			listPro = cartService.getListPro(id_user, ip);
			modelMap.addAttribute("cart", listPro);
			return listPro.size();
		} else {
			if (cartService.addPro(product, id_user, ip) > 0) {
				listPro = cartService.getListPro(id_user, ip);
				modelMap.addAttribute("cart", listPro);
				return listPro.size();
			}
		}
		listPro = cartService.getListPro(id_user, ip);
		modelMap.addAttribute("cart", listPro);
		return listPro.size();
	}

	@GetMapping("del-to-cart")
	public String dellCart(@RequestParam("id") int id, Authentication principal1, ModelMap modelMap,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		String ip = (String) session.getAttribute("ip");
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//		}
		List<Cart> listPro = cartService.getListPro(id_user, ip);
		if (listPro.size() > 0) {
			if (cartService.delPro(id) > 0) {
				modelMap.addAttribute("cart", listPro);
				modelMap.addAttribute("objU", objU);
				return "redirect:/public/cart";
			}
			modelMap.addAttribute("cart", listPro);
			modelMap.addAttribute("objU", objU);
			return "redirect:/public/cart";
		}
		modelMap.addAttribute("cart", listPro);
		modelMap.addAttribute("objU", objU);
		
		return "redirect:/public/cart";
	}
	
	/* profile */
	
	@GetMapping("profile")
	public String profile(ModelMap modelMap, Authentication principal1, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id_user = 0;
		Users objU = new Users();
		List<PaymentManagement> history = new ArrayList<>();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
			history = paymentManagementService.getListByUser(id_user);
		} else {
			id_user = 0;
			return "redirect:/auth/public/login";
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//					return "redirect:/auth/public/login";
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//					history = paymentManagementService.getListByUser(id_user);
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//				history = paymentManagementService.getListByUser(id_user);
//			}
//		} else {
//			id_user = 0;
//			return "redirect:/auth/public/login";
//		}
		List<AccountATM> listAcc = accountATMService.getListAccByUser(id_user);
		List<Order> listOrder = ordersService.getListOrderByUser(id_user);
		LockPayAccount lockxu = lockPayAccountService.getAccLockxu(id_user);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("objU", objU);
		modelMap.addAttribute("listAcc", listAcc);
		modelMap.addAttribute("lockxu", lockxu);
		modelMap.addAttribute("listManagement", history);
		modelMap.addAttribute("ordersService", ordersService);
		return "public.profile";
	}

	public boolean equalsPro(List<Cart> list, int id) {
		for (Cart product : list) {
			if (product.getId() == id) {
				return true;
			}
		}
		return false;
	}

	@PostMapping("up-qty-pro-in-cart")
	public @ResponseBody String upQty(@RequestParam("id") int id, @RequestParam("qty") int qty) {
		if (cartService.upQtyPro(id, qty) > 0) {
			return "success";
		}
		return "";
	}

	public int indexPro(List<Cart> list, int id) {
		int index = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId() == id) {
				index = i;
			}
		}
		return index;
	}
	@PostMapping("link-bank")
	public String linkBank(@ModelAttribute AccountATM accountATM, Authentication principal1, ModelMap modelMap, RedirectAttributes ra,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
			return "redirect:/auth/public/login";
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//					return "redirect:/auth/public/login";
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//			return "redirect:/auth/public/login";
//		}
		List<AccountATM> listAcc = accountATMService.getListAccByUser(id_user);
		if(accountATMService.existAcc(accountATM.getAccount_number())) {
			ra.addFlashAttribute("existAcc", "Tài khoản ngân hàng đã tồn tại.");
			ra.addFlashAttribute("listAcc", listAcc);
			return "redirect:/public/profile";
		}else {
			if(accountATMService.addAcc(accountATM, id_user)>0) {
				ra.addFlashAttribute("success", messageSource.getMessage("success", null, Locale.getDefault()));
				ra.addFlashAttribute("listAcc", listAcc);
				return "redirect:/public/profile";
			}else {
				ra.addFlashAttribute("listAcc", listAcc);
				ra.addFlashAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
				return "redirect:/public/profile";
			}
		}
		
	}
	@GetMapping("paymentManagement")
	public String paymentManagement(Authentication principal1, ModelMap modelMap,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id_user = 0;
		Users objU = new Users();
		List<AccountATM> accATM = new ArrayList<>();
		List<PaymentManagement> history = new ArrayList<>();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
			accATM = accountATMService.getListAccByUser(id_user);
			history = paymentManagementService.getListByUser(id_user);
		} else {
			id_user = 0;
			return "redirect:/auth/public/login";
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//					return "redirect:/auth/public/login";
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//					accATM = accountATMService.getListAccByUser(id_user);
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//				accATM = accountATMService.getListAccByUser(id_user);
//			}
//		} else {
//			id_user = 0;
//			return "redirect:/auth/public/login";
//		}
		String content = randomLb.randomAlphaNumeric(8);
		List<AccountATMAdmin> listAccATMAD = accountATMAdminService.getListAcc();
		LockPayAccount lockxu = lockPayAccountService.getAccLockxu(id_user);
		modelMap.addAttribute("listAccATMAD", listAccATMAD);
		modelMap.addAttribute("content", content);
		modelMap.addAttribute("lockxu", lockxu);
		modelMap.addAttribute("objU", objU);
		modelMap.addAttribute("accATM", accATM);
		modelMap.addAttribute("listManagement", history);
		return "public.paymentManagement";
	}
	@PostMapping("payment-lock")
	public String paymentLock(@RequestParam("id_bank") int id_bank, @PathParam("content_payment") String content_payment, @PathParam("payment_amount") float payment_amount, Authentication principal1, ModelMap modelMap, RedirectAttributes ra,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
		} else {
			id_user = 0;
			return "redirect:/auth/public/login";
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//					return "redirect:/auth/public/login";
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//			}
//		} else {
//			id_user = 0;
//			return "redirect:/auth/public/login";
//		}
		PaymentManagement paymentManagement = new PaymentManagement(0,id_user, id_bank, 0, "deposit", payment_amount, 0, content_payment, null, 0, "", null, null, null);
		if(paymentManagementService.addAcc(paymentManagement)>0&&notificationService.addNotification("Yêu cầu nộp tiền chờ xác nhận !", "depositwithdrawal")>0) {
			ra.addFlashAttribute("confirm", "Gửi đơn nộp tiền thành công. Vui lòng chờ xác nhận. ");
		}else {
			ra.addFlashAttribute("confirm", "Gửi đơn nộp tiền không thành công. Vui lòng kiểm tra lại. ");
		}
		return "redirect:/public/paymentManagement";
	}
	@PostMapping("withdraw-money")
	public String withdrawMoney(@RequestParam("id_bank") int id_bank,  @PathParam("withdrawal_amount") float withdrawal_amount, Authentication principal1, ModelMap modelMap, RedirectAttributes ra, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id_user = 0;
		Users objU = new Users();
		if (session.getAttribute("objU") != null) {
			objU = (Users) session.getAttribute("objU");
			id_user = objU.getId();
			lockxu = lockPayAccountService.getAccLockxu(id_user);
			if(lockxu.getSurplus()<=3000) {
				final String toEmail = objU.getEmail();
				System.out.println("TLSEmail Start"); Properties props = new Properties();
				  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
				  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
				  props.put("mail.smtp.port", "587"); //TLS Port 
				  props.put("mail.smtp.auth","true"); //enable authentication 
				  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
				  
				  //create Authenticator object to pass in Session.getInstance argument
				  Authenticator auth = new Authenticator() { 
					  //override the getPasswordAuthentication method 
					  protected PasswordAuthentication
					  getPasswordAuthentication() { 
						  return new PasswordAuthentication(fromEmail, password); 
					} 
				}; 
				Session sessionM = Session.getInstance(props, auth);
				EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
						+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
						+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
						+ " Xin cảm ơn !");
			}
		} else {
			id_user = 0;
			return "redirect:/auth/public/login";
		}
//		if(principal1!=null) {
//			try {
//				if(adminService.getAdByName(principal1.getName())!=null) {
//					id_user = 0;
//					return "redirect:/auth/public/login";
//				}else {
//					objU = usersService.getUserByUsername(principal1.getName());
//					id_user = objU.getId();
//					lockxu = lockPayAccountService.getAccLockxu(id_user);
//					if(lockxu.getSurplus()<=3000) {
//						final String toEmail = objU.getEmail();
//						System.out.println("TLSEmail Start"); Properties props = new Properties();
//						  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//						  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//						  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//						  props.put("mail.smtp.port", "587"); //TLS Port 
//						  props.put("mail.smtp.auth","true"); //enable authentication 
//						  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//						  
//						  //create Authenticator object to pass in Session.getInstance argument
//						  Authenticator auth = new Authenticator() { 
//							  //override the getPasswordAuthentication method 
//							  protected PasswordAuthentication
//							  getPasswordAuthentication() { 
//								  return new PasswordAuthentication(fromEmail, password); 
//							} 
//						}; 
//						Session sessionM = Session.getInstance(props, auth);
//						EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//								+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//								+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//								+ " Xin cảm ơn !");
//					}
//				}
//			} catch (EmptyResultDataAccessException e) {
//				objU = usersService.getUserByUsername(principal1.getName());
//				id_user = objU.getId();
//				lockxu = lockPayAccountService.getAccLockxu(id_user);
//				if(lockxu.getSurplus()<=3000) {
//					final String toEmail = objU.getEmail();
//					System.out.println("TLSEmail Start"); Properties props = new Properties();
//					  props.put("mail.smtp.ssl.protocols", "TLSv1.2");
//					  props.put("mail.smtp.ssl.trust","smtp.gmail.com");
//					  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
//					  props.put("mail.smtp.port", "587"); //TLS Port 
//					  props.put("mail.smtp.auth","true"); //enable authentication 
//					  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
//					  
//					  //create Authenticator object to pass in Session.getInstance argument
//					  Authenticator auth = new Authenticator() { 
//						  //override the getPasswordAuthentication method 
//						  protected PasswordAuthentication
//						  getPasswordAuthentication() { 
//							  return new PasswordAuthentication(fromEmail, password); 
//						} 
//					}; 
//					Session sessionM = Session.getInstance(props, auth);
//					EmailUtil.sendEmail(sessionM, toEmail,"THÔNG BÁO NỘP TIỀN (LOCKXU)", "Xin Chào A/C "+objU.getName()+"!"
//							+ "	Số tiền (LOCKXU) trong tài khoản của bạn hiện tại sắp hết, để tiếp tục sử dụng thanh toán bắng LOCKXU thì quý khách hàng vui lòng nộp thêm tiền vào tài khoản."
//							+ " Để nộp tiền quý khách hàng vui lòng truy cập vào http://localhost:8080/gshock/public/paymentManagement để nộp tiền."
//							+ " Xin cảm ơn !");
//				}
//			}
//		} else {
//			id_user = 0;
//			return "redirect:/auth/public/login";
//		}
		float real_money = withdrawal_amount*1000;
		int newLockxu = lockxu.getSurplus()-(int)(real_money/1000);
		int result2 = 0;
		result2 = lockPayAccountService.setLockxu(id_user, newLockxu);
		PaymentManagement paymentManagement = new PaymentManagement(0,id_user, 0, id_bank, "withdraw", 0, real_money, "", null, 0, "", null, null, null);
		if(paymentManagementService.addAcc(paymentManagement)>0&&notificationService.addNotification("Yêu cầu rút tiền chờ xác nhận !", "depositwithdrawal")>0&&result2>0) {		
			ra.addFlashAttribute("confirm", "Gửi đơn rút tiền thành công. Vui lòng chờ xác nhận. ");
		}else {
			ra.addFlashAttribute("confirm", "Gửi đơn rút tiền không thành công. Vui lòng kiểm tra lại. ");
		}
		return "redirect:/public/paymentManagement";
	}
	@PostMapping("update-personal")
	@ResponseBody
	public Users updatePersonal(@ModelAttribute Users users, ModelMap modelMap, Authentication principal1, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Users user = new Users();
		if (session.getAttribute("objU") != null) {
			user = (Users) session.getAttribute("objU");
		} else {
			user=null;
		}
		if(usersService.updateUser(users)>0) {
			user = usersService.getUserByUsername(user.getUsername());
		}
		return user;
	}
	@SuppressWarnings("unused")
	private String saveImage(MultipartFile multipartFile, String pathName) {
		String dirUpload = pathName;
		System.out.println(dirUpload);
		String fileName = multipartFile.getOriginalFilename().replaceAll(" ", "");
		fileName = FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime() + "."
				+ FilenameUtils.getExtension(fileName);

		File dir = new File(dirUpload);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		String filePath = dirUpload + File.separator + fileName;
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			return fileName;
		} catch (IOException e) {
			return null;
		}
	}
	public float convert_to_usd(float vnd) {
    	float usd = vnd/24000; 
    	return usd;
    }
	public String parentCmt(List<CommentRate> list)  {
		
		String parent="";
		if(list.size()>0) {
			parent +="<ol class=\"commentlist \">";
			for (CommentRate cmtPr : list) {
				parent += "<li class=\"review even thread-even depth-1\" id=\"li-comment-"+cmtPr.getId()+"\">\r\n"
						+ "		<div id=\"comment-"+cmtPr.getId()+"\" class=\"comment_container\" style=\"padding-bottom: 20px; \">\r\n"
						+ "			<img alt=\"\" src=\""+context.getContextPath()+"/resources/gshock/public/images/2df23c32bf85d85f552345988df00f5e.png\" srcset=\"https://secure.gravatar.com/avatar/2df23c32bf85d85f552345988df00f5e?s=120&amp;d=mm&amp;r=g 2x\" class=\"avatar avatar-60 photo\" height=\"60\" width=\"60\" loading=\"lazy\" decoding=\"async\">\r\n"
						+ "			<div class=\"comment-text\">\r\n"
						+ "				<div class=\"star-rating\" role=\"img\" aria-label=\"Được xếp hạng 5 5 sao\"><span style=\"width:100%\">Được xếp hạng <strong class=\"rating\">5</strong> 5 sao</span></div>\r\n"
						+ "					<p class=\"meta\">\r\n"
						+ "						<strong class=\"woocommerce-review__author\">"+cmtPr.getName()+" </strong>\r\n"
						+ "						<span class=\"woocommerce-review__dash\">–</span> <time class=\"woocommerce-review__published-date\" datetime=\""+cmtPr.getComment_date()+"\">"+cmtPr.getComment_date()+"</time>\r\n"
						+ "					</p>\r\n"
						+ "					<div class=\"description\">\r\n"
						+ "						<p>"+cmtPr.getComment()+"</p>\r\n"
						+ "					</div>\r\n"
						+ "					<div>\r\n"
						+ "						<a id=\"re_cmt_"+cmtPr.getId()+"\" href=\"javascipt: void(0)\"><i class=\"fa fa-reply\" aria-hidden=\"true\"></i><span>Trả Lời</span></a>\r\n"
						+ "						<a id=\"like_cmt_"+cmtPr.getId()+"\" href=\"javascipt: void(0)\"><i class=\"fa fa-thumbs-up\" aria-hidden=\"true\"></i><span><span id=\"num_like_pr_"+cmtPr.getId()+"\"></span> Thích</span></a>\r\n"
						+ "						<script>\r\n"
						+ "							$(\"#like_cmt_"+cmtPr.getId()+"\").on(\"click\", function() {\r\n"
						+ "								var changedField = $(this);\r\n"
						+ "								var id = "+cmtPr.getId()+";\r\n"
						+ "								$.ajax({\r\n"
						+ "									url: \""+context.getContextPath()+"/public/like\",\r\n"
						+ "									type: \"POST\",\r\n"
						+ "									cache: false,\r\n"
						+ "									data: {\r\n"
						+ "									  id: id,\r\n"
						+ "									 },\r\n"
						+ "									 success: function(data){\r\n"
						+ "									   $(\".num_like_pr_"+cmtPr.getId()+"\").html(data);\r\n"
						+ "									   },\r\n"
						+ "									  error: function (){\r\n"
						+ "									   alert(\"Có lỗi xảy ra\");\r\n"
						+ "									   },\r\n"
						+ "									});\r\n"
						+ "									return false;\r\n"
						+ "								});\r\n"
						+ "						</script>\r\n"
						+ "					</div>\r\n"
						+ "						<div id=\"reply_form_"+cmtPr.getId()+"\" style=\"display: none; height: 430px; padding-bottom: 20px;\">\r\n"
						+ "								<div id=\"respond\" class=\"comment-respond\" style=\" height: 100%;\">\r\n"
						+ "									<span id=\"reply-title\" class=\"comment-reply-title\">\r\n"
						+ "										Trả Lời \r\n"
						+ "										<small>\r\n"
						+ "											<a rel=\"nofollow\" id=\"cancel-comment-reply-link\" href=\"https://gshockvn.net/san-pham/gst-s110-1adr/#respond\" style=\"display:none;\">Hủy</a>\r\n"
						+ "										</small>\r\n"
						+ "									</span>\r\n"
						+ "									<form action=\""+context.getContextPath()+"/public/comment?product_id="+cmtPr.getProduct_id()+"&parent_id="+cmtPr.getId()+"\" method=\"post\" class=\"comment-form\">\r\n"
						+ "										<p class=\"comment-notes\"><span id=\"email-notes\">Email của bạn sẽ không được hiển thị công khai.</span> <span class=\"required-field-message\">Các trường bắt buộc được đánh dấu <span class=\"required\">*</span></span></p>\r\n"
						+ "										\r\n"
						+ "										<p class=\"comment-form-comment\">\r\n"
						+ "											<label for=\"comment\">Nhận xét của bạn&nbsp;<span class=\"required\">*</span></label>\r\n"
						+ "											<textarea id=\"comment_chil_"+cmtPr.getId()+"\" name=\"comment\" cols=\"115\" rows=\"8\" required=\"\"></textarea>\r\n"
						+ "										</p>\r\n"
						+ "										<p class=\"comment-form-author\"><label for=\"author\">Tên&nbsp;<span class=\"required\">*</span></label>\r\n"
						+ "											<input id=\"re_name_"+cmtPr.getId()+"\" name=\"name\" type=\"text\" value=\"\" size=\"30\" required=\"\">\r\n"
						+ "										</p>\r\n"
						+ "										<p class=\"comment-form-email\"><label for=\"email\">Email&nbsp;<span class=\"required\">*</span></label>\r\n"
						+ "											<input id=\"re_email_"+cmtPr.getId()+"\" name=\"email\" type=\"email\" value=\"\" size=\"30\" required=\"\">\r\n"
						+ "										</p>\r\n"
						+ "										<p class=\"comment-form-cookies-consent\">\r\n"
						+ "											<input id=\"wp-comment-cookies-consent\" name=\"wp-comment-cookies-consent\" type=\"checkbox\" value=\"yes\">\r\n"
						+ "											<label for=\"wp-comment-cookies-consent\">Lưu tên của tôi, email, và trang web trong trình duyệt này cho lần bình luận kế tiếp của tôi.</label>\r\n"
						+ "										</p>\r\n"
						+ "										<p class=\"form-submit\">\r\n"
						+ "											<input name=\"submit\" type=\"button\" id=\"submit_cmt_chil_"+cmtPr.getId()+"\" class=\"submit11\" value=\"Gửi đi\">\r\n"
						+ "										</p>\r\n"
						+ "									</form>	\r\n"
						+ "								</div>\r\n"
						+ "								<script type=\"text/javascript\">\r\n"
						+ "									$(\"#re_cmt_"+cmtPr.getId()+"\").on(\"click\",function(){\r\n"
						+ "										$(\"#reply_form_"+cmtPr.getId()+"\").toggle();\r\n"
						+ "									});\r\n"
						+ "									$(\"#submit_cmt_chil_"+cmtPr.getId()+"\").on(\"click\", function() {                      		    	\r\n"
						+ "										var product_id = "+cmtPr.getProduct_id()+";\r\n"
						+ "								  		var comment = $(\"#comment_chil_"+cmtPr.getId()+"\").val();\r\n"
						+ "								  		var name = $(\"#re_name_"+cmtPr.getId()+"\").val();\r\n"
						+ "								  		var email = $(\"#re_email_"+cmtPr.getId()+"\").val();\r\n"
						+ "								  		var parent_id = "+cmtPr.getId()+";\r\n"
						+ "								  		var formData = new FormData();\r\n"
						+ "								  		\r\n"
						+ "								  		formData.append(\"product_id\", product_id);\r\n"
						+ "								  	  	formData.append(\"comment\", comment);\r\n"
						+ "								  	  	formData.append(\"name\", name);\r\n"
						+ "								  	  	formData.append(\"email\", email);\r\n"
						+ "								  	  	formData.append(\"parent_id\", parent_id);\r\n"
						+ "								  	 			$.ajax({	\r\n"
						+ "													url: \""+context.getContextPath()+"/public/re-comment\",\r\n"
						+ "													type: \"POST\",\r\n"
						+ "													cache: false,\r\n"
						+ "													contentType: false,\r\n"
						+ "													data: formData,\r\n"
						+ "													processData: false,\r\n"
						+ "									       success: function(data){\r\n"
						+ "									    	   \r\n"
						+ "									    	   $(\".display_cmt_chil_"+cmtPr.getId()+"\").html(data);\r\n"
						+ "									         $(\"#reply_form_"+cmtPr.getId()+"\").hide();\r\n"
						+ "									       },\r\n"
						+ "									       error: function (){\r\n"
						+ "									         alert(\"Có lỗi xảy ra\");\r\n"
						+ "									       },\r\n"
						+ "									    });\r\n"
						+ "									});\r\n"
						+ "							</script>\r\n"
						+ "						</div>	\r\n"
						+ "						<div id=\"re_comments \" class=\"display_cmt_chil_"+cmtPr.getId()+"\">\r\n"
						+ "								"+childCmt(commentRateService.getListCmtChil(cmtPr.getProduct_id(), cmtPr.getId()))+"\r\n"
						+ "						</div>\r\n"
						+ "			</div>\r\n"
						+ "		</div>\r\n"
						+ "	</li>";
			}
			parent+="</ol>";
		}
		return parent;
	}
	
	public String childCmt(List<CommentRate> list) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String child = "";
		if(list.size()>0) {
			child+="<ol class=\"commentlist\">";
			for (CommentRate cmtChil : list) {
				child += "<li class=\"review even thread-even depth-1\" id=\"li-comment-"+cmtChil.getId()+"\">\r\n"
						+ "										<div id=\"comment-"+cmtChil.getId()+"\" class=\"comment_container\" style=\" padding-bottom: 20px; \">\r\n"
						+ "											<img alt=\"\" src=\""+context.getContextPath()+"/resources/gshock/public/images/2df23c32bf85d85f552345988df00f5e.png\" srcset=\"https://secure.gravatar.com/avatar/2df23c32bf85d85f552345988df00f5e?s=120&amp;d=mm&amp;r=g 2x\" class=\"avatar avatar-60 photo\" height=\"60\" width=\"60\" loading=\"lazy\" decoding=\"async\">\r\n"
						+ "											<div class=\"comment-text\">\r\n"
						+ "													<p class=\"meta\">\r\n"
						+ "														<strong class=\"woocommerce-review__author\">"+cmtChil.getName()+" </strong>\r\n"
						+ "														<span class=\"woocommerce-review__dash\">–</span> <time class=\"woocommerce-review__published-date\" datetime=\""+cmtChil.getComment_date()+"\">"+cmtChil.getComment_date()+"</time>\r\n"
						+ "													</p>\r\n"
						+ "													<div class=\"description\">\r\n"
						+ "														<p>"+cmtChil.getComment()+"</p>\r\n"
						+ "													</div>\r\n"
						+ "													<div>\r\n"
						+ "														<a id=\"like_cmt_chil_"+cmtChil.getId()+"\" href=\"#\"><i class=\"fa fa-thumbs-up\" aria-hidden=\"true\"></i><span><span id=\"num_like_"+cmtChil.getId()+"\"></span> Thích</span></a>\r\n"
						+ "														<script type=\"text/javascript\">\r\n"
						+ "															$(\"#like_cmt_chil_"+cmtChil.getId()+"\").on(\"click\", function() {\r\n"
						+ "									             		        var changedField = $(this);\r\n"
						+ "									             		        var id = "+cmtChil.getId()+";\r\n"
						+ "									             		        $.ajax({\r\n"
						+ "									             					url: \""+context.getContextPath()+"/public/like\",\r\n"
						+ "									             					type: \"POST\",\r\n"
						+ "									             					cache: false,\r\n"
						+ "									             					data: {\r\n"
						+ "									             						id: id,\r\n"
						+ "									             						},\r\n"
						+ "									             					success: function(data){\r\n"
						+ "									             							$(\".num_like_"+cmtChil.getId()+"\").html(data);\r\n"
						+ "									             					},\r\n"
						+ "									             					error: function (){\r\n"
						+ "									             						alert(\"Có lỗi xảy ra\");\r\n"
						+ "									             					},\r\n"
						+ "									             				});\r\n"
						+ "									             				return false;\r\n"
						+ "									             		    });\r\n"
						+ "														</script>\r\n"
						+ "													</div>\r\n"
						+ "											</div>\r\n"
						+ "										</div>\r\n"
						+ "									</li>\r\n"
						+ "									"+childCmt(commentRateService.getListCmtChil(cmtChil.getProduct_id(), cmtChil.getId()))+"\r\n";
			}
			child+="</ol>";
		}
		
		return child;
	}
	
}
