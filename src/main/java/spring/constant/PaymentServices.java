
package spring.constant;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import spring.model.OrderPaypal;
import spring.model.Users;

public class PaymentServices {
	private static final String CLIENT_ID = "AbYD8TOn9WpFya1gPzFoNSM0jjNI8WAXSDFq4A05ellU16Zip_P9J1GrVOIS9qSpPmTtWO1xcJDRtcir";
	private static final String CLIENT_SECRET = "EPS008bnhD2VR6FYtN7KR-t1pPZ7Yb2i8smDVo_O39xiK75tQ0vSwOzfHbc3IrJoeIiG_KVVpRIIjcML";
	private static final String MODE = "live";
//	private static final String CLIENT_ID = "AY2Z1JOLWUxCCPN1ASuN0_OvnIvGMgpUKt2MD0ylCxlkiKzsNsOupi977lvl2mD8rxNrFN_DiDGNJN4z";
//	private static final String CLIENT_SECRET = "EHo9gnPmNEbZ_4dcgltTxvey7V9CtnNcypyxhiuqphES9pWf3YUXyZMi_IHcBk-HqjnpfO3axk_PqazA";
//	private static final String MODE = "sandbox";

	public String authorizePayment(OrderPaypal orderDetail, Users user)			
			throws PayPalRESTException {		

		Payer payer = getPayerInformation(user);
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(orderDetail);
		
		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);

		System.out.println("=== CREATED PAYMENT: ====");
		System.out.println(approvedPayment);

		return getApprovalLink(approvedPayment);

	}
	
	private Payer getPayerInformation(Users user) {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(user.getName())
				 .setEmail(user.getEmail());
		
		payer.setPayerInfo(payerInfo);
		
		return payer;
	}
	
	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/gshock/paypal/cancel.jsp");
		redirectUrls.setReturnUrl("http://localhost:8080/gshock/paypal/review");
		
		return redirectUrls;
	}
	
	private List<Transaction> getTransactionInformation(OrderPaypal orderDetail) {
		Details details = new Details();
		details.setSubtotal(orderDetail.getSubtotal());
		details.setTax(orderDetail.getTax());
		details.setShipping(orderDetail.getShipping());
		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(orderDetail.getTotal());
		amount.setDetails(details);

		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription(orderDetail.getProductName());
		
		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<>();
		
		Item item = new Item();
		item.setCurrency("USD");
		item.setName(orderDetail.getProductName());
		item.setPrice(orderDetail.getSubtotal());
		item.setTax(orderDetail.getTax());
		item.setQuantity("1");
		
		items.add(item);
		itemList.setItems(items);
		transaction.setItemList(itemList);

		List<Transaction> listTransaction = new ArrayList<>();
		listTransaction.add(transaction);	
		
		return listTransaction;
	}
	
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;
		
		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}		
		
		return approvalLink;
	}

	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		return payment.execute(apiContext, paymentExecution);
	}
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}
}
