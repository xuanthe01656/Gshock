package spring.controller;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;
import spring.constant.Defines;
import spring.constant.EmailUtil;
import spring.constant.ExportExcel;
import spring.constant.ExportPdf;
import spring.model.AccountATM;
import spring.model.AccountATMAdmin;
//import javax.servlet.ServletContext;
import spring.model.Admin;
import spring.model.Categories;
import spring.model.Country;
import spring.model.LockPayAccount;
import spring.model.Notification;
import spring.model.Order;
import spring.model.OrderDetail;
import spring.model.PaymentManagement;
import spring.model.Product;
import spring.model.Roles;
import spring.model.Suppliers;
import spring.model.Users;
import spring.service.AccountATMAdminService;
import spring.service.AccountATMService;
import spring.service.AdminService;
import spring.service.CategoriesService;
import spring.service.CountryService;
import spring.service.LockPayAccountService;
import spring.service.NotificationService;
import spring.service.OrdersService;
import spring.service.PaymentManagementService;
import spring.service.ProductService;
import spring.service.SuppliersService;
import spring.service.UsersService;

@Controller
@RequestMapping("admin")
public class Admincontroller {
	final String fromEmail = "xuanthe01656@gmail.com"; //requires valid gmail id
	  final String password = "gslqxuozgwmxbfvv"; // correct password for gmail id
	
	//private ServletContext servletContext;
	
	@Autowired
	private ProductService productService ;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private SuppliersService suppliersService;
	
	@Autowired
	private CountryService countryService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private AccountATMAdminService accountATMAdminService;
	@Autowired
	private AccountATMService accountATMService;
	@Autowired
	private PaymentManagementService paymentManagementService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private LockPayAccountService lockPayAccountService;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private BCryptPasswordEncoder encoder ;
//	@Autowired
//	private ExportExcel exportExcel;
//	
//	@Autowired
//	private ExportPdf exportPdf;
	
	private List<OrderDetail> listOrders = new ArrayList<>();
	private List<Order> listOrder = new ArrayList<>();
		
	/* index */
	@GetMapping("index")
	public String index(ModelMap modelMap, Principal principal) {
		
		Admin admin = adminService.getAdByName(principal.getName());
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("admin", admin);
		return "admin.index";
	}

	/* profile */
	@GetMapping("profile")
	public String profile( ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("admin", admin);
		return "admin.profile";
	}
	@PostMapping("profile")
	public String profile(@ModelAttribute Admin admin, ModelMap modelMap,Principal principal, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/user");
		Admin admin1 = adminService.getAdByName(principal.getName());
//		if(picAdmin.getOriginalFilename().equals("")==false) {
//			String fileNames = saveImage(picAdmin, path);
//			admin.setImages(fileNames);
//		}else {
//			admin.setImages(admin1.getImages());
//		}
		admin.setImages(admin1.getImages());
		if(adminService.editProfile(admin, admin1.getId())>0) {
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			admin = adminService.getAdByName(principal.getName());
			modelMap.addAttribute("admin", admin);
			return "admin.profile";
		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		admin = adminService.getAdByName(principal.getName());
		modelMap.addAttribute("admin", admin);
		return "admin.profile";
	}
	@PostMapping("check-email")
	@ResponseBody
	public String checkEmailEdit(@RequestParam("email") String email, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		try {
			if(adminService.getAdminByEmail(email, admin.getId())!=null) {
				return "1";
			}
		} catch (EmptyResultDataAccessException e) {
			return"2";
		}
		return "2";
	}
	@PostMapping("change-password")
	public String changePass(@RequestParam("cpass") String current_password,@RequestParam("npass") String new_password, Principal principal, ModelMap modelMap, RedirectAttributes ra) {
		
		Admin admin = adminService.getAdByName(principal.getName());
		if(encoder.matches(current_password, admin.getPassword())) {
			admin.setPassword(encoder.encode(new_password));
			if(adminService.changePass(admin)>0) {
				return "redirect:/auth/admin/logout?successchange="+"Thành công vui lòng đăng nhập lại."+"";
			}else {
				List<Notification> notification = notificationService.getLisNotification();
				modelMap.addAttribute("notification", notification);
				modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
				admin = adminService.getAdByName(principal.getName());
				modelMap.addAttribute("admin", admin);
				return "redirect:/admin/profile";
			}
		}else {
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			admin = adminService.getAdByName(principal.getName());
			modelMap.addAttribute("admin", admin);
			ra.addFlashAttribute("error_pass", "Thay đổi mật khẩu không thành công do mật khẩu cũ sai.");
		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		admin = adminService.getAdByName(principal.getName());
		modelMap.addAttribute("admin", admin);
		return "redirect:/admin/profile";
	}
	@PostMapping("check-pass")
	@ResponseBody
	public String checkPass(@RequestParam("cpass") String cpass, Principal principal) {
		
		Admin admin = adminService.getAdByName(principal.getName());
		if(encoder.matches(cpass, admin.getPassword())==true) {
			return "1";
		}else {
			return "2";
		}
	}
	@PostMapping("change-avata")
	@ResponseBody
	public Admin changeAvata(@RequestParam(value = "pic") MultipartFile picAdmin, Principal principal, HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/user");
		if(picAdmin.getOriginalFilename().equals("")==false) {
			String fileNames = saveImage(picAdmin, path);
			admin.setImages(fileNames);
		}
		if(adminService.upAvata(admin)>0) {
			admin = adminService.getAdByName(principal.getName());
			return admin;
		}
		System.out.println(admin+",,"+picAdmin);
		return admin;
		
	}
	/* product */
	@GetMapping("product")
	public String product(@RequestParam(required = false, name= "page") Integer page, ModelMap model,HttpServletRequest request,Principal principal) {
		if(page==null) {
			page = 1;
		}
		Admin admin = adminService.getAdByName(principal.getName());
		int max_page = Defines.MAX_PAGE;
		int numcur = Defines.ROW_COUNT + page -1;
		int offset = (page-1)*Defines.ROW_COUNT;
		List<Product> listAllPro = productService.getListPro();
		int totalPro = listAllPro.size();
		int numOfPage =totalPro/Defines.ROW_COUNT;
		if(totalPro%Defines.ROW_COUNT!=0) {
			numOfPage++;
		}
		int numPro = 0;
		if(page<numOfPage){
			numPro = (page-1)*Defines.ROW_COUNT+Defines.ROW_COUNT;
		}else{
			numPro = totalPro;
		}
		List<Product> listPro = productService.getListPro(offset);
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/product");
		List<Notification> notification = notificationService.getLisNotification();
		model.addAttribute("notification", notification);
		model.addAttribute("listPro", listPro);
		model.addAttribute("listAllPro", listAllPro);
		model.addAttribute("numOfPage", numOfPage);
		model.addAttribute("page", page);
		model.addAttribute("maxPage", max_page);
		model.addAttribute("rowcount", Defines.ROW_COUNT);
		model.addAttribute("numcur", numcur);
		model.addAttribute("numPro", numPro);
		model.addAttribute("numAllPro", listAllPro.size());
		model.addAttribute("realPath", path);
		model.addAttribute("admin", admin);
		return "admin.product";
	}
	
	@GetMapping("add-product")
	public String addProduct(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("supplierService", suppliersService);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("admin", admin);
		return "admin.add-product";
	}
	@PostMapping("add-product")
	public String addProduct(@ModelAttribute Product product ,ModelMap modelMap,@RequestParam(value = "picture") MultipartFile[] files, RedirectAttributes ra, HttpServletRequest request,Principal principal) {
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("supplierService", suppliersService);
		Admin admin = adminService.getAdByName(principal.getName());
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/product");
		List<String> photos = new ArrayList<String>();
		for (MultipartFile file : files) {
			String fileName = saveImage(file, path);
			photos.add(fileName);
		}
		String nameFile=photos.toString();
		System.out.println(nameFile);
		product.setImages(nameFile);
		product.setCreated_at(admin.getId());
		product.setPayments("");
		if(productService.addProduct(product)>0) {
			
			modelMap.addAttribute("success", messageSource.getMessage("success", null, Locale.getDefault()));
		}else {
			modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("admin", admin);
		modelMap.addAttribute("notification", notification);
		return "admin.add-product";
	}
	
	@PostMapping("get-cat-chil")
	public @ResponseBody List<Categories> getListChil(@RequestParam("parent_id") int parent_id){
		List<Categories> listCatChil = categoriesService.getListCatByPrId(parent_id);
		return listCatChil;
	}
	
	@GetMapping("edit-product")
	public String editProduct(@RequestParam("id") int id, @RequestParam("page") int page, ModelMap modelMap, Principal principal) {
		Product getProById = productService.getProById(id);
		Admin admin = adminService.getAdByName(principal.getName());
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("admin", admin);
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("supplierService", suppliersService);
		modelMap.addAttribute("proById", getProById);
		modelMap.addAttribute("page", page);
		return "admin.edit-product";
	}
	
	@PostMapping("edit-product")
	public String editProduct(@ModelAttribute Product product,@RequestParam("id") int id, @RequestParam("page") int page,@RequestParam(required = false , value = "pic") MultipartFile[] filess, ModelMap modelMap, RedirectAttributes ra, Principal principal, HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		Product getProById = productService.getProById(id);
		product.setUpdated_at(admin.getId());
		product.setPayments("");
//		System.out.println("ID: "+id+", Page: "+page+", file: "+filess);
//		System.out.println(product);
		if(filess[0].getOriginalFilename().equals("")==false) {
			String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/product");
			List<String> photos = new ArrayList<String>();
			for (MultipartFile file : filess) {
				String fileName = saveImage(file, path);
				photos.add(fileName);
			}
			String nameFile=photos.toString();
			System.out.println(nameFile);
			product.setImages(nameFile);
			if(productService.editProduct(product, id)>0) {
				List<Notification> notification = notificationService.getLisNotification();
				modelMap.addAttribute("notification", notification);
				modelMap.addAttribute("success", messageSource.getMessage("success", null, Locale.getDefault()));
				modelMap.addAttribute("admin", admin);
				return "redirect:/admin/product?id="+id+"&page="+page+"";
			}else {
				modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
			}
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			modelMap.addAttribute("proById", getProById);
			modelMap.addAttribute("page", page);
			modelMap.addAttribute("categoryService", categoriesService);
			modelMap.addAttribute("supplierService", suppliersService);
			modelMap.addAttribute("admin", admin);
			return "redirect:/admin/edit-product?id="+id+"&page="+page+"";
		}else {
			if(productService.editProductNotImg(product, id)>0) {
				List<Notification> notification = notificationService.getLisNotification();
				modelMap.addAttribute("notification", notification);
				modelMap.addAttribute("success", messageSource.getMessage("successEdit", null, Locale.getDefault()));
				modelMap.addAttribute("admin", admin);
				return "redirect:/admin/product?id="+id+"&page="+page+"";
			}else {
				modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
			}
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			modelMap.addAttribute("proById", getProById);
			modelMap.addAttribute("page", page);
			modelMap.addAttribute("categoryService", categoriesService);
			modelMap.addAttribute("supplierService", suppliersService);
			modelMap.addAttribute("admin", admin);
			return "redirect:/admin/edit-product?id="+id+"&page="+page+"";
		}
	}
	
	@GetMapping("delete-product")
	public String deleteProduct(@RequestParam("id") int id, @RequestParam("page") int page, ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		if(productService.delPro(id)>0) {
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
			modelMap.addAttribute("admin", admin);
			return "redirect:/admin/product?id="+id+"&page="+page+"";
		}else {
			modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("admin", admin);
		modelMap.addAttribute("notification", notification);
		return "redirect:/admin/product?id="+id+"&page="+page+"";
	}
	
	@GetMapping("product-detail")
	public String productDetail(@RequestParam("id") int id, @RequestParam("page") int page, ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		Product getProById = productService.getProById(id);
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("proById", getProById);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("admin", admin);
		return "admin.product-detail";
	}
	
	@PostMapping("handel_productSku")
	@ResponseBody
	public String handelProduct(@RequestParam("sku") String sku) throws EmptyResultDataAccessException {
		//Product product = productService.getProBySKU(sku);
		try {
			if(productService.getProBySKU(sku)!=null) { 
				return "1"; 
			}
		} catch (EmptyResultDataAccessException e) {
			return "2";
		}
		 return "";
	}
	
	@PostMapping("handel_productSku_edit")
	@ResponseBody
	public String handelProductEdit(@RequestParam("sku") String sku, @RequestParam("id") int id) throws EmptyResultDataAccessException {
//		Product product = productService.getProById(id);
		try {
			if(productService.getProUnBySku(sku,id )!=null) { 
				return "1"; 
			}
		} catch (EmptyResultDataAccessException e) {
			return "2";
		}
		 return "";
	}
	
	@SuppressWarnings("unused")
	private String saveImage(MultipartFile multipartFile, String pathName) {
		String dirUpload = pathName;
		System.out.println(dirUpload);
		String fileName = multipartFile.getOriginalFilename().replaceAll(" ", "");
		fileName= FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime()+"."+FilenameUtils.getExtension(fileName);
		
		File dir = new File(dirUpload);
		if(!dir.exists()) {
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

//	public void setServletContext(ServletContext servletContext) {
//		this.servletContext=servletContext;
//	}

	/* cat */
	@GetMapping("cat")
	public String cat(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Categories> listCat = categoriesService.getListCat();
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("categoryService", categoriesService);
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("admin", admin);
		return "admin.cat";
	}
	
	@GetMapping("add-cat")
	public String addCat(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Categories> listCatPr = categoriesService.getListCatPr();
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listCatPr", listCatPr);
		modelMap.addAttribute("admin", admin);
		return "admin.add-cat";
	}
	
	@SuppressWarnings("unused")
	@PostMapping("add-cat")
	public String addCat(@Valid @ModelAttribute("catError") Categories categories, BindingResult rs,@RequestParam("parent_id") String parent_id,@RequestParam(required = false, value = "picture") MultipartFile files, @RequestParam(required = false, value = "pic") MultipartFile filelogo, ModelMap modelMap, RedirectAttributes ra, HttpServletRequest request, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Categories> listCatPr = categoriesService.getListCatPr();
		List<Notification> notification = notificationService.getLisNotification();
		if(rs.hasErrors()) {
			modelMap.addAttribute("notification", notification);
			modelMap.addAttribute("listCatPr", listCatPr);
			modelMap.addAttribute("admin", admin);
			return "admin.add-cat";
		}
		int prId = 0;
		if(parent_id!=null) {
			prId = Integer.parseInt(parent_id);
		}else {
			prId = 0;
		}
		
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/category");
		if(files!=null) {
			if(files.getOriginalFilename().equals("")==false) {
				String fileNames = saveImage(files, path);
				categories.setImage(fileNames);
			}else {
				categories.setImage("");
			}
		}else {
			categories.setImage("");
		}
		if(filelogo!=null) {
			if(filelogo.getOriginalFilename().equals("")==false) {
				String fileName = saveImage(filelogo, path);
				categories.setLogo(fileName);
			}else {
				categories.setLogo("");
			}
			
		}else {
			categories.setLogo("");
		}
		try {
			if(categoriesService.getCatByPrIdName(prId, categories.getName())!=null) {
				modelMap.addAttribute("notification", notification);
				modelMap.addAttribute("listCatPr", listCatPr);
				modelMap.addAttribute("admin", admin);
				modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
				return "admin.add-cat";
			}
		} catch (EmptyResultDataAccessException e) {
			if(categoriesService.addCat(categories, prId)>0) {
				modelMap.addAttribute("notification", notification);
				modelMap.addAttribute("listCatPr", listCatPr);
				modelMap.addAttribute("admin", admin);
				ra.addFlashAttribute("success", "Thêm danh mục thành công!");
				return "redirect:/admin/add-cat";
			}else {
				modelMap.addAttribute("listCatPr", listCatPr);
				ra.addFlashAttribute("success", "Thêm danh mục không thành công!");
			}
		}
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listCatPr", listCatPr);
		modelMap.addAttribute("admin", admin);
		return "admin.add-cat";
	}
	
	@PostMapping("handel_name_cat_add")
	@ResponseBody
	public String handelNameCatAdd(@RequestParam("parent_id") int parent_id, @RequestParam("name") String name) throws EmptyResultDataAccessException {
		
		try {
			if(categoriesService.getCatByPrIdName(parent_id, name)!=null) { return "1"; }
		} catch (EmptyResultDataAccessException e) {
			return "2";
		}
		 return "";
		 
	}
	
	@GetMapping("edit-cat")
	public String editCat(@RequestParam("id") int id, ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		Categories CatById = categoriesService.getCatById(id);
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("cat", CatById);
		modelMap.addAttribute("admin", admin);
		return "admin.edit-cat";
	}
	
	@PostMapping("edit-cat")
	public String editCat(@ModelAttribute Categories categories,BindingResult rs,@RequestParam("id") int id,@RequestParam(required = false, value="picture") MultipartFile files,@RequestParam(required = false, value = "pic") MultipartFile filelogo, ModelMap modelMap, RedirectAttributes ra, HttpServletRequest request, Principal principal ) {
		Admin admin = adminService.getAdByName(principal.getName());
		Categories CatById = categoriesService.getCatById(id);
//		if(rs.hasErrors()) {
//			modelMap.addAttribute("cat", CatById);
//			return "admin.edit-cat";
//		}
		
		if(categories.getName().equals("")==true) {
			categories.setName(CatById.getName());
		}
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/category");
		if(files.getOriginalFilename().equals("")==false) {
			String fileNames = saveImage(files, path);
			categories.setImage(fileNames);
		}else {
			categories.setImage(CatById.getImage());
		}
		if(filelogo.getOriginalFilename().equals("")==false) {
			String fileName = saveImage(filelogo, path);
			categories.setLogo(fileName);
		}else {
			categories.setLogo(CatById.getLogo());
		}
		if(categoriesService.editCat(categories, id)>0) {
			modelMap.addAttribute("success", messageSource.getMessage("successEdit", null, Locale.getDefault()));
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("admin", admin);
			modelMap.addAttribute("notification", notification);
			return "redirect:/admin/cat";
		}else {
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			modelMap.addAttribute("cat", CatById);
			modelMap.addAttribute("admin", admin);
			modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
			return "redirect:/admin/edit-cat?id="+id+"";
		}
//		try {
//			if(categoriesService.getCatByPrIdName(CatById.getParent_id(), categories.getName())!=null) { 
//				modelMap.addAttribute("cat", CatById);
//				modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
//				return "redirect:/admin/edit-cat?id="+id+"";
//			}
//		} catch (EmptyResultDataAccessException e) {
//			if(categoriesService.editCat(categories, id)>0) {
//				modelMap.addAttribute("success", messageSource.getMessage("success", null, Locale.getDefault()));
//				return "redirect:/admin/cat";
//			}else {
//				modelMap.addAttribute("cat", CatById);
//				modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
//				return "redirect:/admin/edit-cat?id="+id+"";
//			}
//		}
//		modelMap.addAttribute("cat", CatById);
//		return "redirect:/admin/edit-cat?id="+id+"";
	}
	
	@GetMapping("delete-cat")
	public String deleteCat(@RequestParam("id") int id, ModelMap modelMap, HttpServletRequest request, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		Categories cat = categoriesService.getCatById(id);
		String pathCat = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/category");
		String pathPro = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/product");
		String picPro = "";
		String picCat= "";
		
		List<Categories> listCat = new ArrayList<>();
		List<Product> listPro = productService.getListProByCat(id);;
		if(cat.getParent_id()==0) {
			
			listCat = categoriesService.getListCatByPrId(cat.getId());
			if(listCat.size()>0) {
				for (Categories categories : listCat) {
					if(categories.getImage().equals("")==false) {
						picCat=picCat+categories.getImage()+",";
					}
				}
			}
			picCat+=cat.getImage();
			System.out.println(picCat);
			if(picCat.equals("")==true&&listPro.size()>0&&listCat.size()>0) {
				for (Product product : listPro) {
					picPro+= product.getImages().replace("[", "").replace("]", ",");
				}
				String[] listPicPro = picPro.split(",");
				System.out.println(picPro);
					if(categoriesService.delCat(id)>0 && categoriesService.delCatByPrId(id)>0 &&productService.delProByCat(id)>0) {
						List<Notification> notification = notificationService.getLisNotification();
						modelMap.addAttribute("notification", notification);
						modelMap.addAttribute("admin", admin);
						modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
						return "redirect:/admin/cat";
					}else {
						List<Notification> notification = notificationService.getLisNotification();
						modelMap.addAttribute("notification", notification);
						modelMap.addAttribute("admin", admin);
						modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
						return "redirect:/admin/cat";
					}
				
			}else {
				if(picCat.equals("")==false&&listPro.size()>0&&listCat.size()>0) {
					for (Product product : listPro) {
						picPro+= product.getImages().replace("[", "").replace("]", ",");
					}
					String[] listPicPro = picPro.split(",");
					String[] listPicCat = picCat.split(",");
						if(categoriesService.delCat(id)>0&& categoriesService.delCatByPrId(id)>0 && productService.delProByCat(id)>0) {
							List<Notification> notification = notificationService.getLisNotification();
							modelMap.addAttribute("notification", notification);
							modelMap.addAttribute("admin", admin);
							modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
							return "redirect:/admin/cat";
						}else {
							List<Notification> notification = notificationService.getLisNotification();
							modelMap.addAttribute("notification", notification);
							modelMap.addAttribute("admin", admin);
							modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
							return "redirect:/admin/cat";
						}
					
				}else {
					if(picCat.equals("")==true&&listPro.size()==0&& listCat.size()==0) {
							if(categoriesService.delCat(id)>0) {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}else {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}
					}else {
						if(picCat.equals("")==false&&listPro.size()==0&&listCat.size()==0) {
							String[] listPicCat = picCat.split(",");
							if(categoriesService.delCat(id)>0) {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}else {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}
						}else {
							if(picCat.equals("")==true&&listPro.size()>0&&listCat.size()==0) {
								for (Product product : listPro) {
									picPro+= product.getImages().replace("[", "").replace("]", ",");
								}
								String[] listPicPro = picPro.split(",");
									if(categoriesService.delCat(id)>0 &&productService.delProByCat(id)>0) {
										List<Notification> notification = notificationService.getLisNotification();
										modelMap.addAttribute("notification", notification);
										modelMap.addAttribute("admin", admin);
										modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
										return "redirect:/admin/cat";
									}else {
										List<Notification> notification = notificationService.getLisNotification();
										modelMap.addAttribute("notification", notification);
										modelMap.addAttribute("admin", admin);
										modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
										return "redirect:/admin/cat";
									}
								
							}else {
								if(picCat.equals("")==true&&listPro.size()==0&&listCat.size()>0) {
										if(categoriesService.delCat(id)>0 && categoriesService.delCatByPrId(id)>0) {
											List<Notification> notification = notificationService.getLisNotification();
											modelMap.addAttribute("notification", notification);
											modelMap.addAttribute("admin", admin);
											modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
											return "redirect:/admin/cat";
										}else {
											List<Notification> notification = notificationService.getLisNotification();
											modelMap.addAttribute("notification", notification);
											modelMap.addAttribute("admin", admin);
											modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
											return "redirect:/admin/cat";
										}
									
								}else {
									if(picCat.equals("")==false&&listPro.size()>0&&listCat.size()==0) {
										for (Product product : listPro) {
											picPro+= product.getImages().replace("[", "").replace("]", ",");
										}
										String[] listPicPro = picPro.split(",");
										String[] listPicCat = picCat.split(",");
											if(categoriesService.delCat(id)>0 &&productService.delProByCat(id)>0) {
												List<Notification> notification = notificationService.getLisNotification();
												modelMap.addAttribute("notification", notification);
												modelMap.addAttribute("admin", admin);
												modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
												return "redirect:/admin/cat";
											}else {
												List<Notification> notification = notificationService.getLisNotification();
												modelMap.addAttribute("notification", notification);
												modelMap.addAttribute("admin", admin);
												modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
												return "redirect:/admin/cat";
											}
									}else {
										if(picCat.equals("")==false&&listPro.size()==0&&listCat.size()>0) {
											String[] listPicCat = picCat.split(",");
											System.out.println(picPro);
												if(categoriesService.delCat(id)>0 && categoriesService.delCatByPrId(id)>0) {
													List<Notification> notification = notificationService.getLisNotification();
													modelMap.addAttribute("notification", notification);
													modelMap.addAttribute("admin", admin);
													modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
													return "redirect:/admin/cat";
												}else {
													List<Notification> notification = notificationService.getLisNotification();
													modelMap.addAttribute("notification", notification);
													modelMap.addAttribute("admin", admin);
													modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
													return "redirect:/admin/cat";
												}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		if(cat.getParent_id()!=0) {
			picCat=cat.getImage();
			if(picCat.equals("")==true&&listPro.size()>0) {
				for (Product product : listPro) {
					picPro+= product.getImages().replace("[", "").replace("]", ",");
				}
				String[] listPicPro = picPro.split(",");
				System.out.println(picPro);
					if(categoriesService.delCat(id)>0 &&productService.delProByCat(id)>0) {
						List<Notification> notification = notificationService.getLisNotification();
						modelMap.addAttribute("notification", notification);
						modelMap.addAttribute("admin", admin);
						modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
						return "redirect:/admin/cat";
					}else {
						List<Notification> notification = notificationService.getLisNotification();
						modelMap.addAttribute("notification", notification);
						modelMap.addAttribute("admin", admin);
						modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
						return "redirect:/admin/cat";
					}
				
			}else {
				if(picCat.equals("")==false&&listPro.size()>0) {
					for (Product product : listPro) {
						picPro+= product.getImages().replace("[", "").replace("]", ",");
					}
					String[] listPicPro = picPro.split(",");
						if(categoriesService.delCat(id)>0&& productService.delProByCat(id)>0) {
							List<Notification> notification = notificationService.getLisNotification();
							modelMap.addAttribute("notification", notification);
							modelMap.addAttribute("admin", admin);
							modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
							return "redirect:/admin/cat";
						}else {
							List<Notification> notification = notificationService.getLisNotification();
							modelMap.addAttribute("notification", notification);
							modelMap.addAttribute("admin", admin);
							modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
							return "redirect:/admin/cat";
						}
					
				}else {
					if(picCat.equals("")==true&&listPro.size()==0) {
							if(categoriesService.delCat(id)>0) {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}else {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}
					}else {
						if(picCat.equals("")==false&&listPro.size()==0) {
							if(categoriesService.delCat(id)>0) {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}else {
								List<Notification> notification = notificationService.getLisNotification();
								modelMap.addAttribute("notification", notification);
								modelMap.addAttribute("admin", admin);
								modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
								return "redirect:/admin/cat";
							}
						}
					}
				}
			}
		}
//		if(categoriesService.delCat(id)>0 && productService.delProByCat(id)>0) {
//			modelMap.addAttribute("success", messageSource.getMessage("successDel", null, Locale.getDefault()));
//			return "redirect:/admin/cat";
//		}else {
//			modelMap.addAttribute("unsuccess", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
//		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("admin", admin);
		return "redirect:/admin/cat";
	}
	
//	public boolean delPicList(String[] listPic, String path) {
//		for (String string : listPic) {
//			File image = new File(path+string);
//				if(image.exists()) {
//					 image.delete();
//					 return true;
//			}
//		}
////		for (String string : listPic) {
////			File image = new File(path+string);
////				if(image.exists()) {
////					return true;
////			}
////		}
//		return false;
//	}
//	
//	public boolean delPicString(String pic, String path) {
//		File image = new File(path+pic);
//		if(image.exists()) {
//			image.delete();
//			return true;
//		}
////		if(image.exists()) {
////			return true;
////		}
//		return false;
//	}
	
	@PostMapping("handel_name_cat_edit")
	@ResponseBody
	public String handelNameCatEdit(@RequestParam("parent_id") int parent_id, @RequestParam("name") String name)  {
	
		try {
			if(categoriesService.getCatByPrIdName(parent_id, name)!=null) { return "1"; }
		} catch (EmptyResultDataAccessException e) {
			return "2";
		}
		 return "";
	}
	
	/* user */
	@GetMapping("customer")
	public String user(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Users> listUs = usersService.getListUser();
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listUs", listUs);
		modelMap.addAttribute("admin", admin);
		return "admin.customer";
	}
	/* Admin */
	@GetMapping("user")
	public String admin(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Admin> listAd = adminService.getListAdmin();
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listAd", listAd);
		modelMap.addAttribute("admin", admin);
		return "admin.user";
	}
	@GetMapping("add-user")
	public String addUser(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Admin> listAd = adminService.getListAdmin();
		List<Notification> notification = notificationService.getLisNotification();
		List<Roles> role = adminService.getRoles();
		
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listAd", listAd);
		modelMap.addAttribute("role", role);
		modelMap.addAttribute("admin", admin);
		return "admin.add-user";
	}
	@PostMapping("add-user")
	public String addUser(@ModelAttribute Admin admin,ModelMap modelMap, RedirectAttributes ra, Principal principal) {
		Admin admin1 = adminService.getAdByName(principal.getName());
		admin.setPassword(encoder.encode(admin.getPassword()));
	
				if(adminService.addAdmin(admin)>0) {
					List<Admin> listAd = adminService.getListAdmin();
					List<Notification> notification = notificationService.getLisNotification();
					List<Roles> role = adminService.getRoles();
					modelMap.addAttribute("success", messageSource.getMessage("success", null, Locale.getDefault()));
					modelMap.addAttribute("notification", notification);
					modelMap.addAttribute("listAd", listAd);
					modelMap.addAttribute("role", role);
					modelMap.addAttribute("admin", admin1);
					return "redirect:/admin/add-user";
				}
				List<Admin> listAd = adminService.getListAdmin();
				List<Notification> notification = notificationService.getLisNotification();
				List<Roles> role = adminService.getRoles();
				modelMap.addAttribute("success", messageSource.getMessage("success", null, Locale.getDefault()));
				modelMap.addAttribute("notification", notification);
				modelMap.addAttribute("listAd", listAd);
				modelMap.addAttribute("role", role);
				modelMap.addAttribute("admin", admin1);
		return "admin.add-user";
	}
	@PostMapping("check-username")
	@ResponseBody
	public String checkUsername(@RequestParam("username") String username, Principal principal) {
		try {
			if(adminService.getAdminByAdminname(username)!=null) {
				return "1";
			}
		} catch (EmptyResultDataAccessException e) {
			return "2";
		}
		
		return "2";
	}
	@PostMapping("check-email-add")
	@ResponseBody
	public String checkEmailAdd(@RequestParam("email") String email, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		try {
			if(adminService.getAdminByEmail(email)!=null) {
				return "1";
			}
		} catch (EmptyResultDataAccessException e) {
			return"2";
		}
		return "2";
	}
	/* Suppliers and Country */
	@GetMapping("supplier")
	public String supplier(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Suppliers> listSupplier = suppliersService.getListSupplier();
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listSup", listSupplier);
		modelMap.addAttribute("admin", admin);
		return "admin.supplier";
	}
	
	@GetMapping("supplierDemo")
	@ResponseBody
	public List<Suppliers> suppliers() {
		List<Suppliers> listSupplier = suppliersService.getListSupplier();
		//modelMap.addAttribute("listSup", listSupplier);
		return listSupplier;
	}
	
	@GetMapping("add-supplier")
	public String addSupplier(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("admin", admin);
		return "admin.add-supcntry";
	}
	
	@PostMapping("add-supplier")
	public String addsupplier(@ModelAttribute Suppliers suppliers, ModelMap modelMap, RedirectAttributes ra,Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		if(suppliersService.addSupplier(suppliers, admin.getId())>0) {
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			ra.addFlashAttribute("successSup", "Thêm thành công");
			modelMap.addAttribute("admin", admin);
			return "admin.add-supcntry";
		}else {
			ra.addFlashAttribute("unsuccessSup", "Thêm không thành công");
		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("admin", admin);
		return "admin.add-supcntry";
	}
	
	@GetMapping("country")
	public String country(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Country> listCountry = countryService.getListCountry();
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listCountry", listCountry);
		modelMap.addAttribute("admin", admin);
		return "admin.country";
	}
	
	@GetMapping("add-country")
	public String addCountry(ModelMap modelMap, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("admin", admin);
		return "admin.add-supcntry";
	}
	
	@PostMapping("add-country")
	public String addCountry(@ModelAttribute Country country, ModelMap modelMap, RedirectAttributes ra, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		if(countryService.addCountry(country)>0) {
			List<Notification> notification = notificationService.getLisNotification();
			modelMap.addAttribute("notification", notification);
			ra.addFlashAttribute("successCntry", "Thêm thành công");
			modelMap.addAttribute("admin", admin);
			return "admin.add-supcntry";
		}else {
			ra.addFlashAttribute("unsuccessCntry", "Thêm không thành công");
		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("admin", admin);
		modelMap.addAttribute("notification", notification);
		return "admin.add-supcntry";
	}

	/* order */
	@GetMapping("order")
	public String oder(@RequestParam(required = false, name="page") Integer page, @RequestParam(required = false, name="id_status")Integer id_status, ModelMap modelMap, HttpServletRequest request, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		List<Notification> notification = new ArrayList<>();
		if(page==null) {
			page=1;
		}
		if(id_status!=null) {
			if(notificationService.upStatus(1, id_status)>0) {
				int max_page = Defines.MAX_PAGE;
				int numcur = Defines.ROW_COUNT + page -1;
				int offset = (page-1)*Defines.ROW_COUNT;
				List<Order> listAllOrder = ordersService.getLisOrder();
				int totalOrder = listAllOrder.size();
				int numOfPage =totalOrder/Defines.ROW_COUNT;
				if(totalOrder%Defines.ROW_COUNT!=0) {
					numOfPage++;
				}
				int numOrder = 0;
				if(page<numOfPage){
					numOrder = (page-1)*Defines.ROW_COUNT+Defines.ROW_COUNT;
				}else{
					numOrder = totalOrder;
				}
				List<Order> listOrder = ordersService.getLisOrder(offset);
				notification = notificationService.getLisNotification();
				modelMap.addAttribute("notification", notification);
				session.setAttribute("page", page);
				modelMap.addAttribute("listOrder", listOrder);
				modelMap.addAttribute("maxPage", max_page);
				modelMap.addAttribute("numcur", numcur);
				modelMap.addAttribute("page", page);
				modelMap.addAttribute("rowcount", Defines.ROW_COUNT);
				modelMap.addAttribute("listAllOrder", listAllOrder);
				modelMap.addAttribute("total_order", totalOrder);
				modelMap.addAttribute("numOfPage", numOfPage);
				modelMap.addAttribute("numOrder", numOrder);
				modelMap.addAttribute("admin", admin);
				return "redirect:/admin/order?page="+page+"";
			}else {
				notification = notificationService.getLisNotification();
				modelMap.addAttribute("notification", notification);
				modelMap.addAttribute("admin", admin);
				modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
				return "redirect:/admin/index";
			}
		}else {
		int max_page = Defines.MAX_PAGE;
		int numcur = Defines.ROW_COUNT + page -1;
		int offset = (page-1)*Defines.ROW_COUNT;
		List<Order> listAllOrder = ordersService.getLisOrder();
		int totalOrder = listAllOrder.size();
		int numOfPage =totalOrder/Defines.ROW_COUNT;
		if(totalOrder%Defines.ROW_COUNT!=0) {
			numOfPage++;
		}
		int numOrder = 0;
		if(page<numOfPage){
			numOrder = (page-1)*Defines.ROW_COUNT+Defines.ROW_COUNT;
		}else{
			numOrder = totalOrder;
		}
		List<Order> listOrder = ordersService.getLisOrder(offset);
		notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		session.setAttribute("page", page);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("maxPage", max_page);
		modelMap.addAttribute("numcur", numcur);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("rowcount", Defines.ROW_COUNT);
		modelMap.addAttribute("listAllOrder", listAllOrder);
		modelMap.addAttribute("total_order", totalOrder);
		modelMap.addAttribute("numOfPage", numOfPage);
		modelMap.addAttribute("numOrder", numOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.order";
		}
	}
	
	@GetMapping("order-detail/{code}/{page}")
	public String oderDetail(@PathVariable String code ,@PathVariable int page,ModelMap modelMap, HttpServletRequest request, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		List<OrderDetail> listOrder = ordersService.getListOrderByCode(code);
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.order-detail";
	}
	@PostMapping("order")
	public String search( @RequestParam(required = false,name="key") String key,ModelMap modelMap, HttpServletRequest request, Principal principal) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		int page = (Integer)session.getAttribute("page");
		List<Notification> notification = notificationService.getLisNotification();
				if(key==null) {
					listOrders = ordersService.getLisOrderDetail();
					int max_page = Defines.MAX_PAGE;
					int numcur = Defines.ROW_COUNT + page -1;
					int offset = (page-1)*Defines.ROW_COUNT;
					List<Order> listAllOrder = ordersService.getLisOrder();
					int totalOrder = listAllOrder.size();
					int numOfPage =totalOrder/Defines.ROW_COUNT;
					if(totalOrder%Defines.ROW_COUNT!=0) {
						numOfPage++;
					}
					int numOrder = 0;
					if(page<numOfPage){
						numOrder = (page-1)*Defines.ROW_COUNT+Defines.ROW_COUNT;
					}else{
						numOrder = totalOrder;
					}
					listOrder = ordersService.getLisOrder(offset);
					notification = notificationService.getLisNotification();
					modelMap.addAttribute("notification", notification);
					session.setAttribute("page", page);
					modelMap.addAttribute("listOrder", listOrder);
					modelMap.addAttribute("maxPage", max_page);
					modelMap.addAttribute("numcur", numcur);
					modelMap.addAttribute("page", page);
					modelMap.addAttribute("rowcount", Defines.ROW_COUNT);
					modelMap.addAttribute("listAllOrder", listAllOrder);
					modelMap.addAttribute("total_order", totalOrder);
					modelMap.addAttribute("numOfPage", numOfPage);
					modelMap.addAttribute("numOrder", numOrder);
					modelMap.addAttribute("admin", admin);
					return "admin.order";
				}else {
					listOrders = ordersService.getListByKeyWord(key);
					
					int max_page = Defines.MAX_PAGE;
					int numcur = Defines.ROW_COUNT + page -1;
					int offset = (page-1)*Defines.ROW_COUNT;
					List<Order> listAllOrder = ordersService.getListOrderByKeyWord(key);
					int totalOrder = listAllOrder.size();
					int numOfPage =totalOrder/Defines.ROW_COUNT;
					if(totalOrder%Defines.ROW_COUNT!=0) {
						numOfPage++;
					}
					int numOrder = 0;
					if(page<numOfPage){
						numOrder = (page-1)*Defines.ROW_COUNT+Defines.ROW_COUNT;
					}else{
						numOrder = totalOrder;
					}
					listOrder = ordersService.getListOrderByKeyWord(key, offset);
					notification = notificationService.getLisNotification();
					modelMap.addAttribute("notification", notification);
					session.setAttribute("page", page);
					modelMap.addAttribute("listOrder", listOrder);
					modelMap.addAttribute("maxPage", max_page);
					modelMap.addAttribute("numcur", numcur);
					modelMap.addAttribute("page", page);
					modelMap.addAttribute("rowcount", Defines.ROW_COUNT);
					modelMap.addAttribute("listAllOrder", listAllOrder);
					modelMap.addAttribute("total_order", totalOrder);
					modelMap.addAttribute("numOfPage", numOfPage);
					modelMap.addAttribute("numOrder", numOrder);
					modelMap.addAttribute("admin", admin);
					return "admin.order";
				}
	}
	/* export */
	@GetMapping("export-excel")
	public String exportExcel(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ExportExcel exportExcel = new ExportExcel();
		//listOrders = ordersService.getLisOrderDetail();
		String name_file = exportExcel.exportOrderDetail(request, listOrders);
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/export-excel/");
		File open = new File(path+name_file);
		if(open.exists()) {
			 Desktop.getDesktop().open(open);
			 return "redirect:/admin/order";
		}
		return "redirect:/admin/order";
		
	}
	@GetMapping("export-pdf")
	public String exportPDF(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) {
		ExportPdf exportPdf = new ExportPdf();
		listOrders = ordersService.getLisOrderDetail();
		try {
			String name_file=exportPdf.exportPdf(request, listOrders);
			String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/export-pdf/");
			File open = new File(path+name_file);
			if(open.exists()) {
				 Desktop.getDesktop().open(open);
//				 Desktop.getDesktop().print(open);
				 return "redirect:/admin/order";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/order";
	}
//	@PostMapping("search-order")
//	public String searchOrder(@RequestParam(required = false, name="key") String key,ModelMap modelMap) {
//		List<Order> list = new ArrayList<>();
//		System.out.println(key);
//		if(key==null) {
//			listOrder = ordersService.getLisOrderDetail();
//			list = ordersService.getLisOrder();
//		}else {
//			listOrder = ordersService.getListByKeyWord(key);
//			list = ordersService.getListOrderByKeyWord(key);
//		}
//		modelMap.addAttribute("listOrder", list);
//		return "redirect:/admin/order";
//	}
//	@GetMapping("pic")
//	@ResponseBody
//	public String pic() {
//		Categories cat = categoriesService.getCatById(4);
//		List<Product> listPro = productService.getListProByCat(4);
//		String pic = "";
//		for (Product product : listPro) {
//			pic+= product.getImages().replace("[", "").replace("]", ",");
//		}
//		return pic;
//	}
	/* payment management */
	@GetMapping("depositwithdrawal")
	public String depositWithdrawal(Principal principal,ModelMap modelMap,RedirectAttributes ra, @RequestParam(required = false, name="id_status")Integer id_status, HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		List<PaymentManagement> list = paymentManagementService.getListAcc();
		List<Notification> notification = new ArrayList<>();
		if(id_status!=null) {
			if(notificationService.upStatus(1, id_status)>0) {
				notification = notificationService.getLisNotification();
			}else {
				notification = notificationService.getLisNotification();
				ra.addFlashAttribute("errorUp", "Có lỗi xảy ra.");
			}
		}
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listManagement", list);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.depositwithdrawal";
	}
	@PostMapping("depositwithdrawal")
	public String depositWithdrawal(@RequestParam("key") String key,Principal principal,ModelMap modelMap,RedirectAttributes ra, @RequestParam(required = false, name="id_status")Integer id_status, HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		List<PaymentManagement> list = paymentManagementService.getListAccByKey(key);
		List<Notification> notification = new ArrayList<>();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listManagement", list);
		System.out.println(key);System.out.println(list);
		modelMap.addAttribute("admin", admin);
		return "admin.depositwithdrawal";
	}
	@GetMapping("atmadmin")
	public String atmAdmin(Principal principal,ModelMap modelMap,HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		List<Notification> notification = notificationService.getLisNotification();
		List<AccountATMAdmin> listAccATMAD = accountATMAdminService.getListAcc();
		modelMap.addAttribute("listAccATMAD", listAccATMAD);
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.atmadmin";
	}
	@GetMapping("atmcustomer")
	public String atmCustomer(Principal principal,ModelMap modelMap,HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		List<Notification> notification = notificationService.getLisNotification();
		List<AccountATM> listATMCus = accountATMService.getListAcc();
		modelMap.addAttribute("listAccATMCus", listATMCus);
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.atmcustomer";
	}
	@GetMapping("lockxu")
	public String lockxu(Principal principal,ModelMap modelMap,HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		List<Notification> notification = notificationService.getLisNotification();
		List<LockPayAccount> listLockxu = lockPayAccountService.getListLockxu();
		modelMap.addAttribute("listLockxu", listLockxu);
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.lockxu";
	}
	@GetMapping("add-atmadmin")
	public String addAtmadmin(Principal principal,ModelMap modelMap,HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		HttpSession session = request.getSession();
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.add-atmadmin";
	}
	@PostMapping("add-atmadmin")
	public String addAtmadmin( @ModelAttribute AccountATMAdmin accountATMAdmin, @RequestParam(value = "picQr") MultipartFile picQR, ModelMap modelMap, Principal principal, HttpServletRequest request) {
		Admin admin = adminService.getAdByName(principal.getName());
		String path = request.getServletContext().getRealPath("/WEB-INF/resources/gshock/image/imgQr");
		HttpSession session = request.getSession();
		if(picQR.getOriginalFilename().equals("")==false) {
			String fileNames = saveImage(picQR, path);
			accountATMAdmin.setImgQr(fileNames);
		}
		
		if(accountATMAdminService.addAccATM(accountATMAdmin, admin.getId())>0) {
			modelMap.addAttribute("success", messageSource.getMessage("success", null, Locale.getDefault()));
		}else {
			modelMap.addAttribute("success", messageSource.getMessage("unsuccess", null, Locale.getDefault()));
		}
		List<Notification> notification = notificationService.getLisNotification();
		modelMap.addAttribute("notification", notification);
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("admin", admin);
		return "admin.add-atmadmin";
	}
	@PostMapping("confirm-pay")
	public String confirmPay(@RequestParam("id") int id,@PathParam("notes") String notes, ModelMap modelMap,RedirectAttributes ra, Principal principal) {
		PaymentManagement objPayment = paymentManagementService.getObjPayments(id);
		LockPayAccount lockxuu = lockPayAccountService.getAccLockxu(objPayment.getId_user());
		Users objU = usersService.getUserById(objPayment.getId_user());
		if(objPayment.getMethod().equals("deposit")) {
			int lockxu = (int)objPayment.getPayment_amount()/1000;
			LockPayAccount lockxuAcc = lockPayAccountService.getAccLockxu(objPayment.getId_user());
			if(paymentManagementService.confirmPay(1,id, notes)>0&&lockPayAccountService.upAmount(lockxu,lockxuAcc.getId())>0) {
				List<Notification> notification = notificationService.getLisNotification();
				ra.addFlashAttribute("notification", notification);
				ra.addFlashAttribute("successCf", "Thành Công");
				return "redirect:/admin/depositwithdrawal";
			}else {
				List<Notification> notification = notificationService.getLisNotification();
				ra.addFlashAttribute("notification", notification);
				ra.addFlashAttribute("successCf", "Thất Bại");
				return "redirect:/admin/depositwithdrawal";
			}
		}
		if(objPayment.getMethod().equals("withdraw")) {
//			int newLockxu = lockxuu.getSurplus()-(int)(objPayment.getWithdrawal_amount()/1000);&&lockPayAccountService.upAmount(newLockxu*1000,lockxuAcc.getId())>0
			LockPayAccount lockxuAcc = lockPayAccountService.getAccLockxu(objPayment.getId_user());
			if(paymentManagementService.confirmPay(1,id, notes)>0) {
				lockxuu = lockPayAccountService.getAccLockxu(objPayment.getId_user());
				if(lockxuu.getSurplus()<=3000) {
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
				List<Notification> notification = notificationService.getLisNotification();
				ra.addFlashAttribute("notification", notification);
				ra.addFlashAttribute("successCf", "Thành Công");
				return "redirect:/admin/depositwithdrawal";
			}else {
				List<Notification> notification = notificationService.getLisNotification();
				ra.addFlashAttribute("notification", notification);
				ra.addFlashAttribute("successCf", "Thất Bại");
				return "redirect:/admin/depositwithdrawal";
			}
			
		}
		List<Notification> notification = notificationService.getLisNotification();
		ra.addFlashAttribute("notification", notification);
		return "redirect:/admin/depositwithdrawal";
	}
	
	@PostMapping("cancel-pay")
	public String cancelPay(@RequestParam("id") int id,@RequestParam("notes") String notes, ModelMap modelMap,RedirectAttributes ra, Principal principal) {
		PaymentManagement objPayment = paymentManagementService.getObjPayments(id);
		LockPayAccount lockxuAcc = lockPayAccountService.getAccLockxu(objPayment.getId_user());
		int newLockxu =(int) objPayment.getWithdrawal_amount()/1000;
		if(paymentManagementService.confirmPay(2,id, notes)>0&&lockPayAccountService.upAmount(newLockxu,lockxuAcc.getId())>0) {
			List<Notification> notification = notificationService.getLisNotification();
			ra.addFlashAttribute("notification", notification);
			ra.addFlashAttribute("successCf", "Thành Công");
			return "redirect:/admin/depositwithdrawal";
		}else {
			List<Notification> notification = notificationService.getLisNotification();
			ra.addFlashAttribute("notification", notification);
			ra.addFlashAttribute("successCf", "Thất Bại");
			return "redirect:/admin/depositwithdrawal";
		}
	}
}
