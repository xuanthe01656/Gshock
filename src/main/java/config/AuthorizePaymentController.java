package config;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import spring.constant.PaymentServices;
import spring.model.Cart;
import spring.model.OrderPaypal;
import spring.model.Users;
import spring.service.CartService;
import spring.service.CategoriesService;
import spring.service.DiscountCodeService;

@Controller
public class AuthorizePaymentController {
	@Autowired
	private DiscountCodeService discountCodeService;
	@Autowired
	private CategoriesService categoriesService;
	@Autowired
	private CartService cartService;
	
	private List<Cart> listPro = new ArrayList<>();
	

    @GetMapping("review-payment")
	public String reviewPayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String paymentId = request.getParameter("paymentId");
	        String payerId = request.getParameter("PayerID");
	         
	        try {
	            PaymentServices paymentServices = new PaymentServices();
	            Payment payment = paymentServices.getPaymentDetails(paymentId);
	             
	            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
	            Transaction transaction = payment.getTransactions().get(0);
	            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
	             
	            request.setAttribute("payer", payerInfo);
	            request.setAttribute("transaction", transaction);
	            request.setAttribute("shippingAddress", shippingAddress);
	             
	            String url = "review.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
	             
	            return "forward:/public/paypal/review?paymentId=" + paymentId + "&PayerID=" + payerId+"";
	             
	        } catch (PayPalRESTException ex) {
	            request.setAttribute("errorMessage", ex.getMessage());
	            ex.printStackTrace();
	            return "forward:/paypal/error";
	        }      
	}
	
	@PostMapping("authorize-payment")
	public String  paypal (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		 	String product = request.getParameter("product");
	        String subtotal = request.getParameter("subtotal");
	        String shipping = request.getParameter("shipping");
	        String tax = request.getParameter("tax");
	        String total = request.getParameter("total");
	         
	        OrderPaypal order = new OrderPaypal(product, subtotal, "0",shipping, tax, total);
	        Users objUs = new Users();
	        if(session.getAttribute("objU")!=null) {
	        	objUs = (Users) session.getAttribute("objU");
	        }
	        try {
	            PaymentServices paymentServices = new PaymentServices();
	            String approvalLink = paymentServices.authorizePayment(order, objUs);
	            response.sendRedirect(approvalLink);
	             
	        } catch (PayPalRESTException ex) {
	            request.setAttribute("errorMessage", ex.getMessage());
	            ex.printStackTrace();
	            return "forward:/paypal/error";
	        }
	        return "";
	}
	
	@PostMapping("execute-payment")
	public String executePayment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String paymentId = request.getParameter("paymentId");
	        String payerId = request.getParameter("PayerID");
	 
	        try {
	            PaymentServices paymentServices = new PaymentServices();
	            Payment payment = paymentServices.executePayment(paymentId, payerId);
	             
	            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
	            Transaction transaction = payment.getTransactions().get(0);
	            
	            request.setAttribute("payer", payerInfo);
	            request.setAttribute("transaction", transaction);          
	 
	            return "forward:/public/paypal/receipt";
	             
	        } catch (PayPalRESTException ex) {
	            request.setAttribute("errorMessage", ex.getMessage());
	            ex.printStackTrace();
	            return "forward:/paypal/error";
	        }
	}
	public float convert_to_usd(float vnd) {
    	float usd = vnd/24000; 
    	return usd;
    }

}
