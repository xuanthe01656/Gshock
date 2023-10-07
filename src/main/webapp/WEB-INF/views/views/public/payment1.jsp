<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <style type="text/css">body.kc-css-system .kc-css-161135{padding-top: 15px;padding-bottom: 30px;}body.kc-css-system .kc-css-785453{text-align: center;}body.kc-css-system .kc-css-700239 .type{font-size: 30px;line-height: 36px;font-weight: 600;}body.kc-css-system .kc-css-700239{margin-top: 30px;}body.kc-css-system .kc-css-411740{margin-top: 20px;}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-700239 .type{font-size: 24px;line-height: 30px;}}</style>
    <section id="main_page" class="kc-elm kc-css-161135 kc_row vnt_section hide_col">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-785453 vnt_editor">
<span><span><a href="https://gshockvn.net/">Trang chủ</a></span> » <span class="breadcrumb_last" aria-current="page">Thanh toán</span></span></div>

<div class="kc-elm kc-css-700239 vnt_title">
        
        <h1 class="type">Thanh toán</h1>
        
    
    </div>
 <div class="kc-elm kc-css-411740 vnt_the_content">
<div class="woocommerce"><div class="woocommerce-notices-wrapper"></div><div class="woocommerce-form-coupon-toggle">
	
	<div class="woocommerce-info">
		Bạn có mã ưu đãi? <a href="https://gshockvn.net/thanh-toan/#" class="showcoupon">Ấn vào đây để nhập mã</a>	</div>
</div>

<form class="checkout_coupon woocommerce-form-coupon" method="post" style="display:none">

	<p>Nếu bạn có mã giảm giá, vui lòng điền vào phía bên dưới.</p>

	<p class="form-row form-row-first">
		<label for="coupon_code" class="screen-reader-text">Ưu đãi:</label>
		<input type="text" name="coupon_code" class="input-text" placeholder="Mã ưu đãi" id="coupon_code" value="">
	</p>

	<p class="form-row form-row-last">
		<button type="submit" class="button" name="apply_coupon" value="Áp dụng">Áp dụng</button>
	</p>

	<div class="clear"></div>
</form>
<div class="woocommerce-notices-wrapper"></div>
<form name="checkout" method="post" class="checkout woocommerce-checkout" action="https://gshockvn.net/thanh-toan/" enctype="multipart/form-data" novalidate="novalidate">

		<div class="col2-set" id="customer_details">
			<div class="col-1">
				<div class="woocommerce-billing-fields">
	
		<h3>Thông tin thanh toán</h3>
	<div class="woocommerce-billing-fields__field-wrapper">
		<p class="form-row form-row-first validate-required" id="billing_first_name_field" data-priority="10"><label for="billing_first_name" class="">Tên&nbsp;<abbr class="required" title="bắt buộc">*</abbr></label><span class="woocommerce-input-wrapper"><input type="text" class="input-text " name="billing_first_name" id="billing_first_name" placeholder="" value="" autocomplete="given-name"></span></p><p class="form-row form-row-last validate-required" id="billing_last_name_field" data-priority="20"><label for="billing_last_name" class="">Họ&nbsp;<abbr class="required" title="bắt buộc">*</abbr></label><span class="woocommerce-input-wrapper"><input type="text" class="input-text " name="billing_last_name" id="billing_last_name" placeholder="" value="" autocomplete="family-name"></span></p><p class="form-row form-row-first validate-required validate-phone" id="billing_phone_field" data-priority="20"><label for="billing_phone" class="">Số điện thoại&nbsp;<abbr class="required" title="bắt buộc">*</abbr></label><span class="woocommerce-input-wrapper"><input type="tel" class="input-text " name="billing_phone" id="billing_phone" placeholder="Số điện thoại của bạn" value="" autocomplete="tel"></span></p><p class="form-row form-row-last validate-required validate-email" id="billing_email_field" data-priority="21"><label for="billing_email" class="">Địa chỉ email&nbsp;<abbr class="required" title="bắt buộc">*</abbr></label><span class="woocommerce-input-wrapper"><input type="email" class="input-text " name="billing_email" id="billing_email" placeholder="Email của bạn" value="" autocomplete="email username"></span></p><p class="form-row form-row-first address-field update_totals_on_change validate-required" id="billing_state_field" data-priority="30"><label for="billing_state" class="">Tỉnh/Thành phố&nbsp;<abbr class="required" title="bắt buộc">*</abbr></label><span class="woocommerce-input-wrapper"><select name="billing_state" id="billing_state" class="select select2-hidden-accessible" data-allow_clear="true" data-placeholder="Chọn tỉnh/thành phố" tabindex="-1" aria-hidden="true">
							<option value="">Chọn tỉnh/thành phố</option><option value="HANOI">Hà Nội</option><option value="HOCHIMINH" selected="selected">Hồ Chí Minh</option><option value="ANGIANG">An Giang</option><option value="BACGIANG">Bắc Giang</option><option value="BACKAN">Bắc Kạn</option><option value="BACLIEU">Bạc Liêu</option><option value="BACNINH">Bắc Ninh</option><option value="BARIAVUNGTAU">Bà Rịa - Vũng Tàu</option><option value="BENTRE">Bến Tre</option><option value="BINHDINH">Bình Định</option><option value="BINHDUONG">Bình Dương</option><option value="BINHPHUOC">Bình Phước</option><option value="BINHTHUAN">Bình Thuận</option><option value="CAMAU">Cà Mau</option><option value="CANTHO">Cần Thơ</option><option value="CAOBANG">Cao Bằng</option><option value="DAKLAK">Đắk Lắk</option><option value="DAKNONG">Đắk Nông</option><option value="DANANG">Đà Nẵng</option><option value="DIENBIEN">Điện Biên</option><option value="DONGNAI">Đồng Nai</option><option value="DONGTHAP">Đồng Tháp</option><option value="GIALAI">Gia Lai</option><option value="HAGIANG">Hà Giang</option><option value="HAIDUONG">Hải Dương</option><option value="HAIPHONG">Hải Phòng</option><option value="HANAM">Hà Nam</option><option value="HATINH">Hà Tĩnh</option><option value="HAUGIANG">Hậu Giang</option><option value="HOABINH">Hòa Bình</option><option value="HUNGYEN">Hưng Yên</option><option value="KHANHHOA">Khánh Hòa</option><option value="KIENGIANG">Kiên Giang</option><option value="KONTUM">Kon Tum</option><option value="LAICHAU">Lai Châu</option><option value="LAMDONG">Lâm Đồng</option><option value="LANGSON">Lạng Sơn</option><option value="LAOCAI">Lào Cai</option><option value="LONGAN">Long An</option><option value="NAMDINH">Nam Định</option><option value="NGHEAN">Nghệ An</option><option value="NINHBINH">Ninh Bình</option><option value="NINHTHUAN">Ninh Thuận</option><option value="PHUTHO">Phú Thọ</option><option value="PHUYEN">Phú Yên</option><option value="QUANGBINH">Quảng Bình</option><option value="QUANGNAM">Quảng Nam</option><option value="QUANGNGAI">Quảng Ngãi</option><option value="QUANGNINH">Quảng Ninh</option><option value="QUANGTRI">Quảng Trị</option><option value="SOCTRANG">Sóc Trăng</option><option value="SONLA">Sơn La</option><option value="TAYNINH">Tây Ninh</option><option value="THAIBINH">Thái Bình</option><option value="THAINGUYEN">Thái Nguyên</option><option value="THANHHOA">Thanh Hóa</option><option value="THUATHIENHUE">Thừa Thiên Huế</option><option value="TIENGIANG">Tiền Giang</option><option value="TRAVINH">Trà Vinh</option><option value="TUYENQUANG">Tuyên Quang</option><option value="VINHLONG">Vĩnh Long</option><option value="VINHPHUC">Vĩnh Phúc</option><option value="YENBAI">Yên Bái</option>
						</select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 251.172px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-billing_state-container"><span class="select2-selection__rendered" id="select2-billing_state-container" title="Hồ Chí Minh">Hồ Chí Minh</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span></span></p><p class="form-row form-row-last validate-required validate-required" id="billing_city_field" data-priority="40"><label for="billing_city" class="">Quận/Huyện <abbr class="required" title="bắt buộc">*</abbr></label><select name="billing_city" id="billing_city" class="select select2-hidden-accessible" data-allow_clear="true" data-placeholder="Chọn quận huyện" tabindex="-1" aria-hidden="true">
                    <option value="" selected="selected">Chọn quận huyện</option><option value="785">Huyện Bình Chánh</option><option value="787">Huyện Cần Giờ</option><option value="783">Huyện Củ Chi</option><option value="784">Huyện Hóc Môn</option><option value="786">Huyện Nhà Bè</option><option value="760">Quận 1</option><option value="770">Quận 3</option><option value="773">Quận 4</option><option value="774">Quận 5</option><option value="775">Quận 6</option><option value="778">Quận 7</option><option value="776">Quận 8</option><option value="771">Quận 10</option><option value="772">Quận 11</option><option value="761">Quận 12</option><option value="765">Quận Bình Thạnh</option><option value="777">Quận Bình Tân</option><option value="764">Quận Gò Vấp</option><option value="768">Quận Phú Nhuận</option><option value="766">Quận Tân Bình</option><option value="767">Quận Tân Phú</option><option value="769">Thành phố Thủ Đức</option>
                </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 251.172px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-billing_city-container"><span class="select2-selection__rendered" id="select2-billing_city-container"><span class="select2-selection__placeholder">Chọn quận huyện</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span></p><p class="form-row form-row-first validate-required validate-required" id="billing_address_2_field" data-priority="50"><label for="billing_address_2" class="">Xã/Phường <abbr class="required" title="bắt buộc">*</abbr></label><select name="billing_address_2" id="billing_address_2" class="select select2-hidden-accessible" data-allow_clear="true" data-placeholder="Chọn xã/phường" tabindex="-1" aria-hidden="true">
                    <option value="" selected="selected">Chọn xã/phường</option>
                </select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 251.172px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-billing_address_2-container"><span class="select2-selection__rendered" id="select2-billing_address_2-container"><span class="select2-selection__placeholder">Chọn xã/phường</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span></p><p class="form-row form-row-last validate-required" id="billing_address_1_field" data-priority="60"><label for="billing_address_1" class="">Địa chỉ&nbsp;<abbr class="required" title="bắt buộc">*</abbr></label><span class="woocommerce-input-wrapper"><input type="text" class="input-text " name="billing_address_1" id="billing_address_1" placeholder="Ví dụ: Số 20, ngõ 90" value="" autocomplete="address-line1"></span></p>	</div>

	</div>

			</div>

			<div class="col-2">
				<div class="woocommerce-shipping-fields">
	</div>
<div class="woocommerce-additional-fields">
	
	
		
			<h3>Thông tin bổ sung</h3>

		
		<div class="woocommerce-additional-fields__field-wrapper">
							<p class="form-row notes" id="order_comments_field" data-priority=""><label for="order_comments" class="">Ghi chú đơn hàng&nbsp;<span class="optional">(tuỳ chọn)</span></label><span class="woocommerce-input-wrapper"><textarea name="order_comments" class="input-text " id="order_comments" placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa điểm giao hàng chi tiết hơn." rows="2" cols="5"></textarea></span></p>					</div>

	
	</div>
			</div>
		</div>
	<h3 id="order_review_heading">Đơn hàng của bạn</h3>
	
	
	<div id="order_review" class="woocommerce-checkout-review-order">
		<table class="shop_table woocommerce-checkout-review-order-table">
	<thead>
		<tr>
			<th class="product-name">Sản phẩm</th>
			<th class="product-total">Tạm tính</th>
		</tr>
	</thead>
	<tbody>
						<tr class="cart_item">
					<td class="product-name">
						GST-S110-1ADR&nbsp;						 <strong class="product-quantity">×&nbsp;5</strong>											</td>
					<td class="product-total">
						<span class="woocommerce-Price-amount amount"><bdi>26.495.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span>					</td>
				</tr>
					</tbody>
	<tfoot>

		<tr class="cart-subtotal">
			<th>Tạm tính</th>
			<td><span class="woocommerce-Price-amount amount"><bdi>26.495.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></td>
		</tr>
		
		<tr class="order-total">
			<th>Tổng</th>
			<td><strong><span class="woocommerce-Price-amount amount"><bdi>26.495.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></strong> </td>
		</tr>

		
	</tfoot>
</table>

<div id="payment" class="woocommerce-checkout-payment">
			<ul class="wc_payment_methods payment_methods methods">
			<li class="wc_payment_method payment_method_bacs">
	<input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="bacs" checked="checked" data-order_button_text="">

	<label for="payment_method_bacs">
		Chuyển khoản ngân hàng 	</label>
			<div class="payment_box payment_method_bacs">
			<p>Thực hiện thanh toán vào ngay tài khoản ngân hàng của chúng tôi. Vui lòng sử dụng Mã đơn hàng của bạn trong phần Nội dung thanh toán. Đơn hàng sẽ đươc giao sau khi tiền đã chuyển.</p>
		</div>
	</li>
<li class="wc_payment_method payment_method_cod">
	<input id="payment_method_cod" type="radio" class="input-radio" name="payment_method" value="cod" data-order_button_text="">

	<label for="payment_method_cod">
		Trả tiền mặt khi nhận hàng 	</label>
			<div class="payment_box payment_method_cod" style="display:none;">
			<p>Trả tiền mặt khi giao hàng</p>
		</div>
	</li>
		</ul>
		<div class="form-row place-order">
		<noscript>
			Trình duyệt của bạn không hỗ trợ JavaScript, hoặc nó bị vô hiệu hóa, hãy đảm bảo bạn nhấp vào <em>Cập nhật giỏ hàng</em> trước khi bạn thanh toán. Bạn có thể phải trả nhiều hơn số tiền đã nói ở trên, nếu bạn không làm như vậy.			<br/><button type="submit" class="button alt" name="woocommerce_checkout_update_totals" value="Cập nhật tổng">Cập nhật tổng</button>
		</noscript>

			<div class="woocommerce-terms-and-conditions-wrapper">
		<div class="woocommerce-privacy-policy-text"></div>
			</div>
	
		
		<button type="submit" class="button alt" name="woocommerce_checkout_place_order" id="place_order" value="Đặt hàng" data-value="Đặt hàng">Đặt hàng</button>
		
		<input type="hidden" id="woocommerce-process-checkout-nonce" name="woocommerce-process-checkout-nonce" value="3985ff6ddf"><input type="hidden" name="_wp_http_referer" value="/?wc-ajax=update_order_review">	</div>
</div>

	</div>

	
</form>

</div>
</div>


        </div>
    </section>


<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-542146{width: 50%;}body.kc-css-system .kc-css-383299{width: 50%;}body.kc-css-system .kc-css-183404{width: 40%;}body.kc-css-system .kc-css-8168{width: 20%;}body.kc-css-system .kc-css-681413{width: 20%;}body.kc-css-system .kc-css-567871{width: 20%;}}body.kc-css-system .kc-css-294102{background: #ee1a26;padding-top: 10px;padding-bottom: 10px;}body.kc-css-system .kc-css-294102 >.kc-container{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-652455 .type{color: #ffffff;font-size: 14px;font-weight: 600;text-transform: uppercase;}body.kc-css-system .kc-css-652455{width: 50%;}body.kc-css-system .kc-css-874180{width: 50%;}body.kc-css-system .kc-css-921585{background: #000000;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-921585 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-229334 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-229334 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-229334{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-217143 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-217143 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-217143{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-494534 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-494534 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-494534{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-820481 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-820481 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-820481{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-224882 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-224882 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-224882 .sub{color: #ee1a26;font-size: 24px;font-weight: 700;}body.kc-css-system .kc-css-224882{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-133168 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-133168 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-133168{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-270365 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-767782{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-767782 a{color: #aeaeae;}body.kc-css-system .kc-css-767782 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-767782 p{margin-bottom: 10px;}body.kc-css-system .kc-css-273605 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-908476{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-908476 a{color: #aeaeae;}body.kc-css-system .kc-css-908476 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-908476 p{margin-bottom: 10px;}body.kc-css-system .kc-css-330280 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-217626{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-217626 a{color: #aeaeae;}body.kc-css-system .kc-css-217626 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-217626 p{margin-bottom: 10px;}body.kc-css-system .kc-css-261744 i{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-261744 .item{display: flex;width: 36px;height: 36px;background: #ee1a26;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-261744{display: flex;}body.kc-css-system .kc-css-42241 .icon{display: flex;width: 40px;height: 40px;background: #ffffff;border-radius: 100% 100% 100% 100%;color: #ee1a26;font-size: 24px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-42241:hover .icon{color: #ee1a26;}body.kc-css-system .kc-css-42241 .type{font-weight: 600;margin-left: 10px;}body.kc-css-system .kc-css-42241{position: fixed;display: flex;background: rgba(238, 26, 38, 0.75);border-radius: 25px 25px 25px 25px;padding: 3px 3px 3px 3px;align-items: center;width: auto;bottom: 40px;left: 10px;z-index: 99;box-shadow: 0 0 5px #ddd;animation-duration: 500ms; animation-name: calllink; animation-iteration-count: infinite; animation-direction: alternate;}body.kc-css-system .kc-css-130685 .thumb img{height: 80px;}body.kc-css-system .kc-css-130685{position: fixed;width: auto;bottom: 120px;right: 10px;z-index: 89;}body.kc-css-system .kc-css-235194 i{color: #ffffff;font-size: 24px;line-height: 24px;}body.kc-css-system .kc-css-235194 .thumb img{height: 80px;}body.kc-css-system .kc-css-235194 .item{padding: 9px 15px 9px 15px;margin-bottom: 1px;}body.kc-css-system .kc-css-235194 .item:hover{background: #000000;}body.kc-css-system .kc-css-235194 .item:first-child{border-top-right-radius: 10px;}body.kc-css-system .kc-css-235194 .item:last-child{border-bottom-right-radius: 10px;}body.kc-css-system .kc-css-235194{position: fixed;background: #ee1a26;border-top-right-radius: 10px;border-bottom-right-radius: 10px;width: auto;bottom: 120px;left: 0;z-index: 89;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-42241{bottom: 120px;}body.kc-css-system .kc-css-130685{bottom: 90px;}body.kc-css-system .kc-css-235194{display: none;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-652455{width: 100%;}body.kc-css-system .kc-css-874180{width: 100%;margin-top: 15px;}body.kc-css-system .kc-css-8168{margin-top: 20px;}body.kc-css-system .kc-css-681413{margin-top: 20px;}body.kc-css-system .kc-css-567871{margin-top: 20px;}body.kc-css-system .kc-css-261744{margin-top: 20px;}body.kc-css-system .kc-css-130685 .thumb img{height: 60px;}body.kc-css-system .kc-css-235194 .thumb img{height: 60px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-229334 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-217143 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-494534 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-820481 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-133168 .type{font-size: 14px;line-height: 20px;}}</style>
