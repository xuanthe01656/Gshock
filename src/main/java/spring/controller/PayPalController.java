package spring.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
import spring.model.OrderPaypal;
import spring.model.Users;

@Controller
@RequestMapping("paypal")
public class PayPalController {

	@PostMapping("checkout")
	public String checkout() {
		return "paypal/checkout";
	}
	
	@PostMapping("error")
	public String error() {
		return "paypal/error";
	}
	@PostMapping("cancel")
	public String cancel() {
		return "paypal/cancel";
	}
	@GetMapping("review")
	public String review() {
		return "paypal/review";
	}
	@PostMapping("review")
	public String review1() {
		return "paypal/review";
	}
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
	             
	            return "forward:/paypal/review?paymentId=" + paymentId + "&PayerID=" + payerId+"";
	             
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
	            System.out.println(approvalLink);
	           return "redirect:"+approvalLink+"";
	             
	        } catch (PayPalRESTException ex) {
	            request.setAttribute("errorMessage", ex.getMessage());
	            ex.printStackTrace();
	            return "forward:/paypal/error";
	        }
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
	 
	            return "forward:/paypal/receipt";
	             
	        } catch (PayPalRESTException ex) {
	            request.setAttribute("errorMessage", ex.getMessage());
	            ex.printStackTrace();
	            return "forward:/paypal/error";
	        }
	}
	
}
