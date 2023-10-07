
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- 	<link id="profile_body" target="_self" rel="stylesheet" type="text/css" href="${contextPath }/css/style_profile.css" /> --%>
    <style type="text/css">body.kc-css-system .kc-css-161135{padding-top: 15px;padding-bottom: 30px;}body.kc-css-system .kc-css-785453{text-align: center;}body.kc-css-system .kc-css-700239 .type{font-size: 30px;line-height: 36px;font-weight: 600;}body.kc-css-system .kc-css-700239{margin-top: 30px;}body.kc-css-system .kc-css-411740{margin-top: 20px;}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-700239 .type{font-size: 24px;line-height: 30px;}}</style>
    <style>
.tooltip {
  position: relative;
  opacity: 1;
  z-index: 1;
  display: inline-block;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 140px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  bottom: 150%;
  left: 50%;
  margin-left: -75px;
  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}
</style>
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
					<a href="${pageContext.request.contextPath }/public/profile" disabled="disabled" id="my-account" class="title-info active">Tài khoản của tôi</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/public/profile" class="title-info" id="my-order">Đơn hàng của tôi</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/public/profile" class="title-info" id="change-password">Đổi mật khẩu</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/public/profile" class="title-info" id="address">Sổ địa chỉ</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath }/public/profile" class="title-info" id="link_atm">Liên kết ngân hàng</a>
				</li>
			</ul>
		</div>
     </div>
     <div class="row col-right-ac col-sm-9">
     	<div class="col-sm-12">
			<h1 class="title-head margin-top-0">Nộp LOCKXU</h1>
			<div id="card-body" class="card-body" >
			<c:if test="${not empty confirm }">
				<p style="color: red; font-style: italic;">${confirm }</p>
			</c:if>
				<h1>Nộp</h1>
				<div class="row">
				<c:if test="${not empty listAccATMAD }">
					<c:forEach items="${listAccATMAD }" var="atmad">
						<div class="col-sm-12">
					<a href="javaScript: void(0)" onclick="functionShow(${atmad.id})">${atmad.bank_name }</a>
					<div id="atm-${atmad.id}" style="display: none;">
						<form id="form-change-info" action="<%=request.getContextPath() %>/public/payment-lock?id_bank=${atmad.id}" method="Post" data-toggle="validator">
	                            <div class="row" style="padding-bottom: 20px;"> 
	                             <div class="col-md-12">                      
	                                    <div class="form-group">
	                                        <label>QR Code *</label>
	                                        <img src="${imagePath }/imgQr/${atmad.imgQr}" name="img-qr" id="qr_info" class="form-control" style="width: 300px; height: 300px;" /> 
	                                    </div>
	                                </div> 
	                                <div class="col-md-6">                      
	                                    <div class="form-group">
	                                        <label>Tên tài khoản nhận *</label>
	                                        <div class="col-sm-9">
	                                        	 <input type="text" name="name" id="name_info" class="form-control field__input" value="${atmad.name }" placeholder="Enter Name" disabled="disabled" required>
	                                        </div>
	                                        <div class="col-sm-3 tooltip">
	                                        	<button class="" onclick="myFunction('name_info')" onmouseout="outFunc()" type="button"><span class="tooltiptext" id="myTooltip">Copy to clipboard</span>Copy text</button>
	                                        </div>
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                </div> 
	                                <div class="col-md-6">
	                                    <div class="form-group">
	                                        <label>Số tài khoản nhận *</label>
	                                        <div class="col-sm-9">
	                                        	 <input type="text" name="account_number" id="account_number_info" class="form-control field__input" value="${atmad.account_number }" placeholder="Enter Account Number" disabled="disabled" required>
	                                        </div>
	                                        <div class="col-sm-3 tooltip">
	                                        	<button class="" onclick="myFunction('account_number_info')" onmouseout="outFunc()" type="button"><span class="tooltiptext" id="myTooltip">Copy to clipboard</span>Copy text</button>
	                                        </div>
	                                    </div>
	                                </div>   
	                                <div class="col-md-6">
	                                    <div class="form-group">
	                                        <label>Nội dung chuyển khoản *</label>
	                                        <div class="col-sm-9">
	                                        	 <input type="text" name="content_payment" id="content_payment" class="form-control field__input" value="${content }" placeholder="Enter Content Payment" required>
	                                        </div>
	                                        <div class="col-sm-3 tooltip">
	                                        	<button class="" onclick="myFunction('content_info')" onmouseout="outFunc()"  type="button"><span class="tooltiptext" id="myTooltip">Copy to clipboard</span>Copy text</button>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col-md-6">
	                                    <div class="form-group">
	                                        <label>Số tiền nộp *<small>(Tối thiểu 10.000vnd và phải là bội của 10)</small></label>
	                                        <input type="text" name="payment_amount" id="payment_amount" class="form-control field__input" value="" placeholder="Enter Payment Amount" required>
	                                    </div>
	                                </div>
	                            </div>              
	                            <button type="submit" id="change-info" class="btn btn-primary mr-2">Nộp</button>
	                            <button type="reset" class="btn btn-danger">Reset</button>
	                        </form>
					</div>
				</div>
					</c:forEach>
				</c:if>
				</div>	
			</div>
		</div>
		<div class="col-sm-12">
			<h1 class="title-head margin-top-0">Rút LOCKXU</h1>
			<div id="card-body" class="card-body">
			<h1>Rút</h1>	
			 <form id="form-change-info" action="<%=request.getContextPath() %>/public/withdraw-money" method="Post" data-toggle="validator">
                            <div class="row"> 
                                <div class="col-md-6">                      
                                    <div class="form-group">
                                        <label>Chọn ngân hàng *</label>
                                        <select name="id_bank" id="id_bank" class="form-control field__input"  required>
	                          				<option value="">--Chọn ngân hàng -- </option>
	                          				<c:if test="${not empty accATM }">
	                          					<c:forEach items="${accATM }" var="atmList">
	                          					<option value="${atmList.id }">${atmList.bank_name } </option>
	                          					</c:forEach>
	                          				</c:if>
	                          			</select>
	                          <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Số tiền rút * <small>(Tối thiểu 10LOCKXU)</small></label>
                                        <input type="number" name="withdrawal_amount" id="withdrawal_amount" class="form-control field__input" min="10" max="${lockxu.surplus }" value="${objU.phone}" placeholder="Enter Phone No" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Số tiền nhận thực tế (VND)</label>
                                        <p id="real_money" class="form-control field__input"></p>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                </div>              
                            <button type="submit" id="change-info" class="btn btn-primary mr-2">Rút</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
			</div>
		</div>
     </div>
    </div>
    </section>
   <script type="text/javascript">
		$('ul li .title-info').click(function(){
		    $('li .title-info').removeClass("active");
		    $(this).addClass("active");
		});
		function functionShow(id){
			$("#atm-"+id).toggle();
		}
		function myFunction(valueString) {
		  var copyText = document.getElementById(valueString);
		  copyText.select();
		  copyText.setSelectionRange(0, 99999);
		  navigator.clipboard.writeText(copyText.value);
		  
		  var tooltip = document.getElementById("myTooltip");
		  tooltip.innerHTML = "Copied: " + copyText.value;
		}

		function outFunc() {
		  var tooltip = document.getElementById("myTooltip");
		  tooltip.innerHTML = "Copy to clipboard";
		}
		$("#withdrawal_amount").on("input", function(){
			var amount = parseInt($("#withdrawal_amount").val());
			var real_money = amount*1000;
			$("#real_money").html(real_money);
		});
	</script>
<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-542146{width: 50%;}body.kc-css-system .kc-css-383299{width: 50%;}body.kc-css-system .kc-css-183404{width: 40%;}body.kc-css-system .kc-css-8168{width: 20%;}body.kc-css-system .kc-css-681413{width: 20%;}body.kc-css-system .kc-css-567871{width: 20%;}}body.kc-css-system .kc-css-294102{background: #ee1a26;padding-top: 10px;padding-bottom: 10px;}body.kc-css-system .kc-css-294102 >.kc-container{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-652455 .type{color: #ffffff;font-size: 14px;font-weight: 600;text-transform: uppercase;}body.kc-css-system .kc-css-652455{width: 50%;}body.kc-css-system .kc-css-874180{width: 50%;}body.kc-css-system .kc-css-921585{background: #000000;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-921585 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-229334 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-229334 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-229334{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-217143 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-217143 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-217143{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-494534 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-494534 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-494534{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-820481 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-820481 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-820481{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-224882 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-224882 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-224882 .sub{color: #ee1a26;font-size: 24px;font-weight: 700;}body.kc-css-system .kc-css-224882{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-133168 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-133168 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-133168{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-270365 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-767782{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-767782 a{color: #aeaeae;}body.kc-css-system .kc-css-767782 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-767782 p{margin-bottom: 10px;}body.kc-css-system .kc-css-273605 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-908476{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-908476 a{color: #aeaeae;}body.kc-css-system .kc-css-908476 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-908476 p{margin-bottom: 10px;}body.kc-css-system .kc-css-330280 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-217626{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-217626 a{color: #aeaeae;}body.kc-css-system .kc-css-217626 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-217626 p{margin-bottom: 10px;}body.kc-css-system .kc-css-261744 i{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-261744 .item{display: flex;width: 36px;height: 36px;background: #ee1a26;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-261744{display: flex;}body.kc-css-system .kc-css-42241 .icon{display: flex;width: 40px;height: 40px;background: #ffffff;border-radius: 100% 100% 100% 100%;color: #ee1a26;font-size: 24px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-42241:hover .icon{color: #ee1a26;}body.kc-css-system .kc-css-42241 .type{font-weight: 600;margin-left: 10px;}body.kc-css-system .kc-css-42241{position: fixed;display: flex;background: rgba(238, 26, 38, 0.75);border-radius: 25px 25px 25px 25px;padding: 3px 3px 3px 3px;align-items: center;width: auto;bottom: 40px;left: 10px;z-index: 99;box-shadow: 0 0 5px #ddd;animation-duration: 500ms; animation-name: calllink; animation-iteration-count: infinite; animation-direction: alternate;}body.kc-css-system .kc-css-130685 .thumb img{height: 80px;}body.kc-css-system .kc-css-130685{position: fixed;width: auto;bottom: 120px;right: 10px;z-index: 89;}body.kc-css-system .kc-css-235194 i{color: #ffffff;font-size: 24px;line-height: 24px;}body.kc-css-system .kc-css-235194 .thumb img{height: 80px;}body.kc-css-system .kc-css-235194 .item{padding: 9px 15px 9px 15px;margin-bottom: 1px;}body.kc-css-system .kc-css-235194 .item:hover{background: #000000;}body.kc-css-system .kc-css-235194 .item:first-child{border-top-right-radius: 10px;}body.kc-css-system .kc-css-235194 .item:last-child{border-bottom-right-radius: 10px;}body.kc-css-system .kc-css-235194{position: fixed;background: #ee1a26;border-top-right-radius: 10px;border-bottom-right-radius: 10px;width: auto;bottom: 120px;left: 0;z-index: 89;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-42241{bottom: 120px;}body.kc-css-system .kc-css-130685{bottom: 90px;}body.kc-css-system .kc-css-235194{display: none;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-652455{width: 100%;}body.kc-css-system .kc-css-874180{width: 100%;margin-top: 15px;}body.kc-css-system .kc-css-8168{margin-top: 20px;}body.kc-css-system .kc-css-681413{margin-top: 20px;}body.kc-css-system .kc-css-567871{margin-top: 20px;}body.kc-css-system .kc-css-261744{margin-top: 20px;}body.kc-css-system .kc-css-130685 .thumb img{height: 60px;}body.kc-css-system .kc-css-235194 .thumb img{height: 60px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-229334 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-217143 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-494534 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-820481 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-133168 .type{font-size: 14px;line-height: 20px;}}</style>
   