
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- 	<link id="profile_body" target="_self" rel="stylesheet" type="text/css" href="${contextPath }/css/style_profile.css" /> --%>
    <style type="text/css">body.kc-css-system .kc-css-161135{padding-top: 15px;padding-bottom: 30px;}body.kc-css-system .kc-css-785453{text-align: center;}body.kc-css-system .kc-css-700239 .type{font-size: 30px;line-height: 36px;font-weight: 600;}body.kc-css-system .kc-css-700239{margin-top: 30px;}body.kc-css-system .kc-css-411740{margin-top: 20px;}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-700239 .type{font-size: 24px;line-height: 30px;}}</style>
    <section id="main_page" class="kc-elm kc-css-161135 kc_row vnt_section">
        <div class="kc-row-container kc-container vnt_col"></div>
        	<div class="kc-elm kc-css-785453 vnt_editor">
				<span><span><a href="${pageContext.request.contextPath }/public/index">Trang chủ</a></span> » <span class="breadcrumb_last" aria-current="page">Cá Nhân</span></span>
			</div>
			<div class="kc-elm kc-css-700239 vnt_title">
				<h1 class="type">Cá nhân</h1>
			</div>
			
	
			<div class="row row2">
      <div class="col-left-ac col-sm-3">
          <div class="block-account">
			<div class="info info-1">
				<img src="//bizweb.dktcdn.net/100/438/408/themes/904142/assets/account_ava.jpg?1681726130231" alt="${objU.name }">
				<p>${objU.name }</p>
				<div class="row" style="padding-left: 50px;">
					<img class="col-sm-3" style="padding: 0; margin:0 auto; text-align: center; width:25px; height: 25px;" alt="" src="${contextPath }/images/coin-1.1s-200px.svg">
					<p class="col-sm-9" style="padding: 0;margin:0 auto; text-align: left;"> ${lockxu.surplus }LOCKXU</p>
				</div>
				<p><span><small>(10LOCKXU = 10000VND)</small></span></p>
				<div class="row" style="margin:5px;">
					<a class="click_logout col-sm-6" href="${pageContext.request.contextPath }/public/paymentManagement">Nộp</a>
					<a class="click_logout col-sm-6" href="${pageContext.request.contextPath }/public/paymentManagement">Rút</a>
				</div>
				<a class="click_logout" href="${pageContext.request.contextPath }/auth/public/logout">Đăng xuất</a>
			</div>
			<ul>
				<li>
					<a disabled="disabled" id="my-account" class="title-info active">Tài khoản của tôi</a>
				</li>
				<li>
					<a class="title-info" id="my-order">Đơn hàng của tôi</a>
				</li>
				<li>
					<a class="title-info" id="change-password">Đổi mật khẩu</a>
				</li>
				<li>
					<a class="title-info" id="address">Sổ địa chỉ</a>
				</li>
				<li>
					<a class="title-info" id="link_atm">Liên kết ngân hàng</a>
				</li>
				<li>
					<a class="title-info" id="transaction_history_btn">Lịch sử giao dịch</a>
				</li>
			</ul>
		</div>
     </div>
     <div class="col-right-ac col-sm-9">
     	<c:if test="${not empty success }">
							<p style="color: green; font-style: italic">${success }</p>
						</c:if>
						<c:if test="${not empty success }">
							<p style="color: red; font-style: italic">${unsuccess }</p>
						</c:if>
						<c:if test="${not empty existAcc }">
							<p style="color: red; font-style: italic">${existAcc }</p>
						</c:if>
						
		<h1 class="title-head margin-top-0">Thông tin cá nhân<button id="edit-personal" class="btn-edit-addr btn btn-primarys btn-more" type="button" >Sửa thông tin</button></h1>
		<div class="form-signup name-account m992 ajax-change-info">
			<p><strong>Họ và tên:</strong> ${objU.name }</p>
			<p><strong>Địa chỉ email:</strong> ${objU.email }</p>
		</div>
		<div id="card-body" class="card-body" style="display: none;">
		<h1>Sửa Thông Tin</h1>	
			 <form id="form-change-info" action="<%=request.getContextPath() %>/public/update-personal" method="Post" data-toggle="validator">
                            <div class="row"> 
                                <div class="col-md-6">                      
                                    <div class="form-group">
                                        <label>Name *</label>
                                        <input type="text" name="name" id="name_info" class="form-control field__input" value="${objU.name }" placeholder="Enter Name" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email *</label>
                                        <input type="text" id="email_info" name="email" class="form-control field__input" value="${objU.email }" placeholder="Enter Email" required>
                                    	<div class="ajax-email-info"></div>
                                    </div>
                                </div>   
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Phone Number *</label>
                                        <input type="text" name="phone" id="phone_info" class="form-control field__input" value="${objU.phone}" placeholder="Enter Phone No" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                </div>              
                            <button type="button" id="change-info" class="btn btn-primary mr-2">Cập nhật</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
		</div>
		<div id="display-order" class="card-body ajax-order" style="display: none;">
		<h1>Đơn Hàng</h1>
			<div class="body-order-body col-lg-12">
				<c:if test="${not empty listOrder }">
		           	<c:forEach items="${listOrder }" var="od">
		           	<c:if test="${not empty ordersService.getListOrderByCode(od.order_code) }">
		           		<c:forEach items="${ordersService.getListOrderByCode(od.order_code) }" var="order">
		           		<div class="body_body_main mb-3">
				            <div class="body_body_head mb-3 col-sm-12 row">
					             <div class="body_body_left col-sm-4">
					             <c:forTokens items="${order.images }" delims="[ ]," var="image" begin="0" end="0">
					             	<img src="${imagePath }/product/${image}" alt="product_name" title="product-name>">
					             </c:forTokens>
					             </div>
					            <div class="body_body_right col-sm-8">
						            <p class="text-left product-name">${order.product_detail }</p>
						            <span class="text-left color_size">${order.product_sku }</span>
						            <p class="quantity_order">x ${order.qty }</p>
						            <span class="text-left price_order"><fmt:formatNumber value = "${order.price}"/> đ</span>
						            <span class="text-left subtotal_one"><span class="subtotal_two">Subtotal: </span><fmt:formatNumber value = "${order.price*order.qty }"/> đ</span>
					            </div>
				            </div>
				         </div>
						<div class="col-sm-12">
							<table class="table">
							     <tbody>
							        <tr>
							           <td class="text-right">Discount</td>
							           <td class="text-right"><fmt:formatNumber value = "${order.discount }"/> đ</td>
							           <td class="text-right">Transports</td>
							           <td class="text-right"><fmt:formatNumber value = "${order.transports }"/> đ</td>
							           <td class="text-right"><strong>Total</strong></td>
							           <td class="text-right"><fmt:formatNumber value = "${order.total }"/> đ</td>
							         </tr>
							         <c:if test="${listOrder[0].status==1 }">
							         <tr>
							            <th class="text-center" colspan="6">
											<form action="${pageContext.request.contextPath }/public/handel?status=6" method="Post">
												<button  type="submit" class="bk-btn-paynow" value="${listOrder[0].order_code }" name="order_code" style="display: inline-block;background-color: #e00 !important;color: #fff !important">
													<strong>Hủy Đơn</strong>
												</button>
											</form>
										</th>
									</tr>
									<tr>
							            <th class="text-center" colspan="6">
							            	<form action="${pageContext.request.contextPath }/public/contact-cskh" method="Post">
												<button  type="submit" class="bk-btn-paynow" style="display: inline-block;background-color: #e00 !important;color: #fff !important" type="button">
													<strong>Liên Hệ Người Bán</strong>
												</button>
											</form>
							            </th>
							         </tr>
							        </c:if>
							        <c:if test="${listOrder[0].status==6 }">
							        <tr>
							            <th class="text-center" colspan="6">
							            	<form action="${pageContext.request.contextPath }/public/handel?status=1" method="Post">
												<button  type="submit" class="bk-btn-paynow" value="${listOrder[0].order_code }" name="order_code" style="display: inline-block;background-color: #e00 !important;color: #fff !important">
													<strong>Đặt Lại</strong>
												</button>
											</form>
							            </th>
							         </tr>
							         <tr>
							             <th class="text-center" colspan="6">
							            	<form action="${pageContext.request.contextPath }/public/contact-cskh" method="Post">
												<button type="submit" class="bk-btn-paynow" style="display: inline-block;background-color: #e00 !important;color: #fff !important">
													<strong>Liên Hệ Người Bán</strong>
												</button>
											</form>
							            </th>
							         </tr>
							         </c:if>
							         <!-- <tr>
							            <th class="text-center" colspan="6"><button type="button" id="help_order">Liên hệ chăm sóc khách hàng</button></th>
							         </tr>   -->   
							     </tbody>
							  </table>
					     </div>
		           		</c:forEach>
		           	</c:if>
		           	</c:forEach>
		        </c:if>
			</div>   
		</div>
		<div id="password-change" class="card-body" style="display: none;">
		<h1>Đổi Mật Khẩu</h1>
			 <form id="form-change-password" method="Post" data-toggle="validator">
			 <div class="ajax-change-password"></div>
                   <div class="row"> 
                        <div class="col-md-6">                      
                            <div class="form-group">
                                 <label>Mật Khẩu Cũ</label>
                                 <input type="password" id="old_password" name="old_password" class="form-control field__input" value="" placeholder="Enter Old Password" required>
                              	<div class="ajax-check-password"></div>
                              	<div class="help-block with-errors"></div>
                           </div>
                           <div class="form-group">
                                 <label>Mật Khẩu Mới</label>
                                 <input type="password" id="new_password" name="new_password" class="form-control field__input" value="" placeholder="Enter New Password" required>
                              	<div class="help-block with-errors"></div>
                           </div>
                           <div class="form-group">
                                 <label>Nhập Lại Mật Khẩu</label>
                                 <input type="password" id="re_password" name="re_password" class="form-control field__input" value="" placeholder="Enter Re-Password" required>
                              	<div class="help-block with-errors"></div>
                           </div>
                        </div>   
                    </div>              
              		<button type="button" id="btn-change-password" class="btn btn-primary mr-2">Cập nhật</button>
                    <button type="reset" class="btn btn-danger">Reset</button>
            </form>
		</div>
		<div id="address-list" class="card-body" style="display: none;">
			<h1>Sổ Địa Chỉ</h1>
			<div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                <table class="data-table table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                        	<th scope="col"></th>
                            <th scope="col">Name</th>
                            <th scope="col">Phone No.</th>
                            <th scope="col" colspan="4">Address</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                    
                        <tr>
                        	<th scope="row">Địa Chỉ </th>
                        	
                            <td>address</td>
                            
                             <td>
                                <div class="d-flex align-items-center list-action">
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                                        href="<%=request.getContextPath()%>/admin/update-personal?id=1"><i class="ri-pencil-line mr-0"></i></a>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </div>
		</div>
	 </div>
	 <div id="atm_account" class="card-body" style="display: none;">
	 	<div>
	 		<h1>Liên Kết Ngân Hàng</h1>
	 		<form action="${pageContext.request.contextPath }/public/link-bank " method="post">
	 			<div class="row"> 
	                <div class="col-md-6">                      
	                    <div class="form-group">
	                         <label>Ngân hàng *</label>
	                          <select name="bank_name" id="bank_info" class="form-control field__input"  required>
	                          	<option value="">--Chọn ngân hàng -- </option>
	                          </select>
	                          <div class="help-block with-errors"></div>
	                    </div>
	                </div>
	                <div class="col-md-6">
	                      <div class="form-group">
	                          <label for="name">Tên tài khoản *</label>
	                          <input type="text" name="name" id="name" class="form-control field__input" value="" placeholder="Enter Fullname" required>
	                      	<div class="help-block with-errors"></div>
	                      </div>
	                </div> 
	                <div class="col-md-6">
	                      <div class="form-group">
	                          <label>Số tài khoản *</label>
	                          <input type="text" name="account_number" id="account_number" class="form-control field__input" value="" placeholder="Enter Number Account" required>
	                      	<div class="account_info"></div>
	                      	<div class="help-block with-errors"></div>
	                      </div>
	                </div> 
	                <div class="col-md-6">
	                      <div class="form-group">
	                          <label for="name">Chi nhánh *</label>
	                          <input type="text" name="bank_branch" id="bank_branch" class="form-control field__input" value="" placeholder="Enter Bank Branch" required>
	                      	<div class="help-block with-errors"></div>
	                      </div>
	                </div> 
	           </div>
	           <button class="btn btn-primary mr-2" type="submit">Thêm</button>
	 		</form>
	 	</div>
	 	<div>
	 		<h1>Danh Sách Ngân Hàng Đã Liên Kết</h1>
	 		<div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                <table class="data-table table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                        	<th scope="col"></th>
                            <th scope="col">Bank Name</th>
                            <th scope="col">Name</th>
                            <th scope="col">Bank Account Number</th>
                            <th scope="col">Bank Branch</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                    <c:if test="${not empty listAcc }">
                    	<c:forEach items="${listAcc }" var="atm">
                        <tr>
                        	<th scope="row">Ngân Hàng 1 </th>
                            <td>${atm.bank_name }</td>
                            <td>${atm.name }</td>
                            <td>${atm.account_number }</td>
                            <td>${atm.bank_branch }</td>
                             <td>
                                <div class="d-flex align-items-center list-action">
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                                        href="<%=request.getContextPath()%>/admin/update-atm?id=${atm.id}"><i class="ri-pencil-line mr-0"></i></a>
                                </div>
                            </td>
                        </tr>
                    	</c:forEach>
                    </c:if> 
                    </tbody>
                </table>
                </div>
		</div>
	 	</div>
	 </div>
	 <div id="transaction_history" class="card-body" style="display: none;">
	 	<h1>Lịch Sử Giao Dịch</h1>
	 	<h2>Lịch Sử Nạp</h2>
	 	<div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                <table class="data-table table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                        	<th >No.</th>
                            <th >Phương thức</th>
                            <th>Số tiền</th>
                            <th>Trạng thái</th>
                            <th>Ghi chú</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                   <c:if test="${not empty listManagement }">
                    <c:set value="1" var="index"/>
                    <c:set value="0" var="sum" />
                    	<c:forEach items="${listManagement }" var="manager">
                    	<c:if test="${manager.method eq 'deposit' }">
                    	<tr>
                        	<th>${index }</th>
                        	<c:if test="${manager.method eq 'deposit' }">
                            	<td>Nạp</td>
                            </c:if>
                           <td><fmt:formatNumber type = "number" value = "${manager.payment_amount }" /></td>
                            <c:if test="${manager.status==0 }">
                            	<td>Chờ Xác Nhận</td>
                            </c:if>
                            <c:if test="${manager.status==1 }">
                            	<td>Thành Công</td>
                            </c:if>
                            <c:if test="${manager.status==2 }">
                            	<td>Thất Bại</td>
                            </c:if>
                            
                            <td>${manager.notes }</td>
                        </tr>
                        <c:set value="${index+1 }" var="index"/>
                        <c:set value="${sum+manager.payment_amount }" var="sum"/>
                    	</c:if>
                    	</c:forEach>
                    	<tr>
                        	<th colspan="2">Tổng</th>
                        	<th colspan="3"><fmt:formatNumber type = "number" value = "${sum}" />VND</th>
                        </tr>
                    </c:if> 
                    </tbody>
                </table>
                </div>
			</div>
			<h2>Lịch Sử Rút</h2>
	 	<div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                <table class="data-table table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                        	<th >No.</th>
                            <th >Phương thức</th>
                            <th>Số tiền</th>
                            <th>Trạng thái</th>
                            <th>Ghi chú</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                   <c:if test="${not empty listManagement }">
                    <c:set value="1" var="index"/>
                    <c:set value="0" var="sum"/>
                    	<c:forEach items="${listManagement }" var="manager">
                    	<c:if test="${manager.method eq 'withdraw' }">
                    	<tr>
                        	<th>${index }</th>
                        	
                            <c:if test="${manager.method eq 'withdraw' }">
                            	<td>Rút</td>
                            </c:if>
                             <td><fmt:formatNumber type = "number" value = "${manager.withdrawal_amount }" /></td>
                            <c:if test="${manager.status==0 }">
                            	<td>Chờ Xác Nhận</td>
                            </c:if>
                            <c:if test="${manager.status==1 }">
                            	<td>Thành Công</td>
                            </c:if>
                            <c:if test="${manager.status==2 }">
                            	<td>Thất Bại</td>
                            </c:if>
                            <td>${manager.notes }</td>
                        </tr>
                        <c:set value="${sum+manager.withdrawal_amount }" var="sum"/>
                        <c:set value="${index+1 }" var="index"/>
                    	</c:if>
                    	</c:forEach>
                    	<tr>
                        	<th colspan="2">Tổng</th>
                        	<th colspan="3"><fmt:formatNumber type = "number" value = "${sum}" /> VND</th>
                        </tr>
                    </c:if> 
                    </tbody>
                </table>
                </div>
			</div>
	 </div>
     </div>
    </div>
    </section>
    <script type="text/javascript">
    jQuery('#name').keyup(function() {
		$(this).val($(this).val().toUpperCase());
	});
    $("#account_number").on('blur', function(){
    	console.log($("#bank_info").find(':selected').data("bin"));
    	var data = JSON.stringify({
    	      "bin": $("#bank_info").find(':selected').data("bin"),
    	      "accountNumber": $("#account_number").val(),
    	    });

    	    var config = {
    	      method: 'post',
    	      url: 'https://api.vietqr.io/v2/lookup',
    	      headers: { 
    	        'x-client-id': 'a7725f46-89dc-4bb5-84f5-26d08329c256', 
    	        'x-api-key': '5fba5c29-de51-4cf8-8588-1dba9ffd1b47', 
    	        'Content-Type': 'application/json',
    	      },
    	      data : data
    	    };
    	    $.ajax(config)
    	    .then(function (response) {
    	    	console.log(response);
    	      $('.account_info').html(response.data);
    	    })
    	    .catch(function (error) {
    	      console.log(error);
    	    });
    });
    
</script>
    <script type="text/javascript">
   
    $.ajax({
		url: 'https://api.vietqr.io/v2/banks',
		type: 'GET',
		cache: false,
		success: function(data){
			console.log(data.data);
			if(data.data.length>0){
				html2 = "<option value=\"\">--Chọn ngân hàng -- </option>";
				for(var i=0; i<data.data.length; i++ ){
					html2+="<option value=\""+data.data[i].name+"\" data-bin=\""+data.data[i].bin+"\">"+data.data[i].name+"</option>";
				}
				$('#bank_info').html(html2);
			}
		},
		error: function (){
			alert('Có lỗi xảy ra');
		},
	});
    
    
		$('#edit-personal').on('click', function(){
			$('#card-body').toggle();
			$('#password-change').hide();
			$('#address-list').hide();
			$('#display-order').hide();
			$('#atm_account').hide();
			$('#transaction_history').hide();
		});
		$('#change-password').on('click', function(){
			$('#password-change').toggle();
			$('#card-body').hide();
			$('#address-list').hide();
			$('#display-order').hide();
			$('#atm_account').hide();
			$('#transaction_history').hide();
		});
		$('#address').on('click', function(){
			$('#address-list').toggle();
			$('#card-body').hide();
			$('#password-change').hide();
			$('#display-order').hide();
			$('#atm_account').hide();
			$('#transaction_history').hide();
		});
		$('#my-account').on('click', function(){
			$('#card-body').hide();
			$('#password-change').hide();
			$('#address-list').hide();
			$('#display-order').hide();
			$('#transaction_history').hide();
			$('#atm_account').hide();
		});
		$('#link_atm').on('click', function(){
			$('#card-body').hide();
			$('#password-change').hide();
			$('#address-list').hide();
			$('#display-order').hide();
			$('#transaction_history').hide();
			$('#atm_account').show();
		});
		$('ul li .title-info').click(function(){
		    $('li .title-info').removeClass("active");
		    $(this).addClass("active");
		});
		$('#form-change-password').validate({
			rules:{
			
				old_password:{
					required: true,
					minlength: 6,
					maxlength: 13,
					},
				new_password:{
					required: true,
					minlength: 6,
					maxlength: 13,
				},
				re_password:{
					required: true,
					minlength: 6,
					maxlength: 13,
					equalTo: "#new_password"
				},
			},
			messages:{
				email:{
					required: 'Nhập vào email của bạn.',
					email: 'Hãy nhập đúng định dạng.',
				},
				old_password:{
					required: 'Nhập vào mật khẩu cũ.',
					minlength: 'Nhập ít nhất 6 ký tự.',
					maxlength: 'Nhập tối da 13 ký tự.',
					},
				new_password:{
					required: 'Nhập vào mật khẩu mới.',
					minlength: 'Nhập ít nhất 6 ký tự.',
					maxlength: 'Nhập tối da 13 ký tự.',
				},
				re_password:{
					required: 'Nhập lại mật khẩu mới.',
					minlength: 'Nhập ít nhất 6 ký tự.',
					maxlength: 'Nhập tối da 13 ký tự.',
					equalTo: 'Mật khẩu chưa chính xác.'
				},
			},
		});
		$('#form-change-info').validate({
			rules:{
				email:{
					required: true,
					email: true,
				},
				
			},
			messages:{
				email:{
					required: 'Nhập vào email của bạn.',
					email: 'Hãy nhập đúng định dạng.',
				},
			},
		});
		$('#old_password').on('input', function(){
   		 var changedField = $(this);
		     var old_password = $("#old_password").val(); 
		     var id = ${objU.id };
		        $.ajax({
					url: '<%=request.getContextPath()%>/public/update-personal',
					type: 'POST',
					cache: false,
					data: {
							aid: id,
							aold_password: old_password,
						},
					success: function(data){
						$('.ajax-check-password').html(data);
					},
					error: function (){
						alert('Có lỗi xảy ra');
					},
				});
				return false;
   	});
		
		$('#email_info').on('blur', function(){
	   		 var changedField = $(this);
			     var email = $("#email_info").val(); 
			     var id = ${objU.id };
			        $.ajax({
						url: '<%=request.getContextPath()%>/public/update-personal',
						type: 'POST',
						cache: false,
						data: {
								id: id,
								email: email,
							},
						success: function(data){
							$('.ajax-email-info').html(data);
						},
						error: function (){
							alert('Có lỗi xảy ra');
						},
					});
					return false;
	   	});
		$('#change-info').on('click', function(){
			if($('#form-change-info').valid()==true){
				var changedField = $(this);
			     var name = $("#name_info").val(); 
			     var email = $('#email_info').val();
			     var phone = $('#phone_info').val();
			     var id = ${objU.id };
			        $.ajax({
						url: '<%=request.getContextPath()%>/public/update-personal',
						type: 'POST',
						cache: false,
						data: {
								id: id,
								name: name,
								email: email,
								phone: phone,
							},
						success: function(data){
							html = "<p><strong>Họ và tên:</strong>"+ data.name +"</p>"
								+"<p><strong>Địa chỉ email:</strong>"+data.email +"</p>";
							$('.ajax-change-info').html(html);
							$('#card-body').hide();
						},
						error: function (){
							alert('Có lỗi xảy ra');
						},
					});
					return false;
			}else{
				$('#form-change-password').valid();
			}
		});
		$('#btn-change-password').on('click', function(){
			if($('#form-change-password').valid()==true){
				var changedField = $(this);
			     var old_password = $("#old_password").val(); 
			     var new_password = $('#new_password').val();
			     var id = 1
			        $.ajax({
						url: '<%=request.getContextPath()%>/public/update-personal',
						type: 'POST',
						cache: false,
						data: {
								aid: id,
								password: old_password,
								anew_password: new_password,
							},
						success: function(data){
							$('.ajax-change-password').html(data);
							$('#form-change-password').trigger("reset");
						},
						error: function (){
							alert('Có lỗi xảy ra');
						},
					});
					return false;
			}else{
				$('#form-change-password').valid();
			}
		});
		$('#my-order').on('click', function(){
			$('#card-body').hide();
			$('#password-change').hide();
			$('#address-list').hide();
			$('#transaction_history').hide();
			$('#atm_account').hide();
			$('#display-order').show();
		});
		$('#transaction_history_btn').on('click', function(){
			$('#card-body').hide();
			$('#password-change').hide();
			$('#address-list').hide();
			$('#display-order').hide();
			$('#atm_account').hide();
			$('#transaction_history').show();
		});
		$('.cancel_order').on('click', function(){
			var order_code = $(this).val();
			 $.ajax({
				 url: '<%=request.getContextPath()%>/admin/cancel-order',
					type: 'POST',
					cache: false,
					data: {
							order_code: order_code,
						},
					success: function(data){
						$('.ajax-order').html(data);
					},
					error: function (){
						alert('Có lỗi xảy ra');
					},
				});
				return false;
		});
	</script>
        </div>
    </section>
<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-542146{width: 50%;}body.kc-css-system .kc-css-383299{width: 50%;}body.kc-css-system .kc-css-183404{width: 40%;}body.kc-css-system .kc-css-8168{width: 20%;}body.kc-css-system .kc-css-681413{width: 20%;}body.kc-css-system .kc-css-567871{width: 20%;}}body.kc-css-system .kc-css-294102{background: #ee1a26;padding-top: 10px;padding-bottom: 10px;}body.kc-css-system .kc-css-294102 >.kc-container{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-652455 .type{color: #ffffff;font-size: 14px;font-weight: 600;text-transform: uppercase;}body.kc-css-system .kc-css-652455{width: 50%;}body.kc-css-system .kc-css-874180{width: 50%;}body.kc-css-system .kc-css-921585{background: #000000;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-921585 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-229334 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-229334 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-229334{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-217143 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-217143 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-217143{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-494534 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-494534 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-494534{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-820481 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-820481 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-820481{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-224882 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-224882 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-224882 .sub{color: #ee1a26;font-size: 24px;font-weight: 700;}body.kc-css-system .kc-css-224882{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-133168 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-133168 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-133168{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-270365 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-767782{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-767782 a{color: #aeaeae;}body.kc-css-system .kc-css-767782 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-767782 p{margin-bottom: 10px;}body.kc-css-system .kc-css-273605 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-908476{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-908476 a{color: #aeaeae;}body.kc-css-system .kc-css-908476 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-908476 p{margin-bottom: 10px;}body.kc-css-system .kc-css-330280 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-217626{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-217626 a{color: #aeaeae;}body.kc-css-system .kc-css-217626 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-217626 p{margin-bottom: 10px;}body.kc-css-system .kc-css-261744 i{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-261744 .item{display: flex;width: 36px;height: 36px;background: #ee1a26;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-261744{display: flex;}body.kc-css-system .kc-css-42241 .icon{display: flex;width: 40px;height: 40px;background: #ffffff;border-radius: 100% 100% 100% 100%;color: #ee1a26;font-size: 24px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-42241:hover .icon{color: #ee1a26;}body.kc-css-system .kc-css-42241 .type{font-weight: 600;margin-left: 10px;}body.kc-css-system .kc-css-42241{position: fixed;display: flex;background: rgba(238, 26, 38, 0.75);border-radius: 25px 25px 25px 25px;padding: 3px 3px 3px 3px;align-items: center;width: auto;bottom: 40px;left: 10px;z-index: 99;box-shadow: 0 0 5px #ddd;animation-duration: 500ms; animation-name: calllink; animation-iteration-count: infinite; animation-direction: alternate;}body.kc-css-system .kc-css-130685 .thumb img{height: 80px;}body.kc-css-system .kc-css-130685{position: fixed;width: auto;bottom: 120px;right: 10px;z-index: 89;}body.kc-css-system .kc-css-235194 i{color: #ffffff;font-size: 24px;line-height: 24px;}body.kc-css-system .kc-css-235194 .thumb img{height: 80px;}body.kc-css-system .kc-css-235194 .item{padding: 9px 15px 9px 15px;margin-bottom: 1px;}body.kc-css-system .kc-css-235194 .item:hover{background: #000000;}body.kc-css-system .kc-css-235194 .item:first-child{border-top-right-radius: 10px;}body.kc-css-system .kc-css-235194 .item:last-child{border-bottom-right-radius: 10px;}body.kc-css-system .kc-css-235194{position: fixed;background: #ee1a26;border-top-right-radius: 10px;border-bottom-right-radius: 10px;width: auto;bottom: 120px;left: 0;z-index: 89;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-42241{bottom: 120px;}body.kc-css-system .kc-css-130685{bottom: 90px;}body.kc-css-system .kc-css-235194{display: none;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-652455{width: 100%;}body.kc-css-system .kc-css-874180{width: 100%;margin-top: 15px;}body.kc-css-system .kc-css-8168{margin-top: 20px;}body.kc-css-system .kc-css-681413{margin-top: 20px;}body.kc-css-system .kc-css-567871{margin-top: 20px;}body.kc-css-system .kc-css-261744{margin-top: 20px;}body.kc-css-system .kc-css-130685 .thumb img{height: 60px;}body.kc-css-system .kc-css-235194 .thumb img{height: 60px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-229334 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-217143 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-494534 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-820481 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-133168 .type{font-size: 14px;line-height: 20px;}}</style>
   