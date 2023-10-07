<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <style type="text/css">body.kc-css-system .kc-css-161135{padding-top: 15px;padding-bottom: 30px;}body.kc-css-system .kc-css-785453{text-align: center;}body.kc-css-system .kc-css-700239 .type{font-size: 30px;line-height: 36px;font-weight: 600;}body.kc-css-system .kc-css-700239{margin-top: 30px;}body.kc-css-system .kc-css-411740{margin-top: 20px;}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-700239 .type{font-size: 24px;line-height: 30px;}}</style>
    <section id="main_page" class="kc-elm kc-css-161135 kc_row vnt_section hide_col">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-785453 vnt_editor">
<span><span><a href="${pageContext.request.contextPath }/public/index">Trang chủ</a></span> » <span class="breadcrumb_last" aria-current="page">Đơn hàng</span></span></div>

<div class="kc-elm kc-css-700239 vnt_title">
        <h1 class="type">Đơn hàng</h1>
    </div>
 <div class="kc-elm kc-css-411740 vnt_the_content">
<div class="woocommerce"><div class="woocommerce-notices-wrapper"></div>
	<div class="cart-empty woocommerce-info row">
		<div class="col-sm-12 col-md-12 col-lg-12 border_product border-product-sm">
                        <div class="ajax_cart" style="padding: 15px 15px;border: 0.5px solid grey;border-radius: 5px;">
                           <div class="row align-items-center align-items-center-sm"> </div>
                            <c:if test="${not empty listOrder }">
                            	<c:forEach items="${listOrder }" var="pro">
                            		<div class="row align-items-center align-items-center-md">
		                                <div class="col-lg-2 col-md-3 col-3 product-mobile">
		                                	<img style="width: 83px ; height: 88px" id="product_image_1" src='${imagePath }/product/<c:forTokens items="${pro.images }" delims="[ ]," begin="0" end="0" var="image">${image }</c:forTokens>' class="img-fluid" alt="" height="">
		                                </div>
		                                <div class="col-lg-3 col-md-9 col-9">
		                                    <p class="font-w600 title_product" id="product_name_1">${pro.product_sku }</p>
		                                    <p class="font-w600 title_product"><span><small>Số lượng: </small></span><span><small id="product_qty_${pro.id }">${pro.qty }</small></span></p>
		                                    <a class="popup_del_info" style="margin-top: -7px;">
		                                    </a>
		                                </div>
		                                <div class="col-lg-2">
		                                    <div class="col-sm-12 col-md-12 col-lg-12">
		                                        <div class="d-flex align-items-center justify-content-end">
		                                            <p class="fw-bold total_price_2 text-right bk_total_product_price" id="product_price_${pro.id }"><fmt:formatNumber value = "${pro.subtotal }"/></p><span>₫</span>
		                                        </div>
		                                        <input type="hidden" value="3485000" id="total_price">
		                                        <p hidden="" id="product_price_${pro.id }" class="popup_info_price"></p>
		                                    </div>
		                                </div>
		                            </div>
		                            
                            	</c:forEach>
                            
                         <input type="hidden" id="length_product" value="1">
                        <hr class="hr-md">
                            <!--  START TICKET -->
                            <!-- END TICKET  -->
                            <div class="row total-bill">
                                <!-- <div class="col-lg-6">
                                    <div class="row">
                                    </div>
                                </div> -->
                                <div class="col-lg-6">
                                    <div class="provisional">
                                    	<p class="total_price">   Phí vận chuyển: <fmt:formatNumber value = "${listOrder[0].transports }"/><span class="count_price ml-1">đ</span> </p>
                                    	<p class="total_price">   Giảm Giá: <fmt:formatNumber value = "${listOrder[0].discount }"/><span class="count_price ml-1">đ</span> </p>
                                        <p class="total_price">   Tổng Tiền: <fmt:formatNumber value = "${listOrder[0].total }"/><span class="count_price ml-1">đ</span> </p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                	<div class="bk-btn row" style="margin-top: 10px">
										<div class="bk-btn-box col-sm-6">
										<c:if test="${listOrder[0].status==1 }">
											<form action="${pageContext.request.contextPath }/public/handel?status=6" method="Post">
												<button  type="submit" class="bk-btn-paynow" value="${listOrder[0].order_code }" name="order_code" style="display: inline-block;background-color: #e00 !important;color: #fff !important">
													<strong>Hủy Đơn</strong>
												</button>
											</form>
											<form action="${pageContext.request.contextPath }/public/contact-cskh" method="Post">
												<button  type="submit" class="bk-btn-paynow" style="display: inline-block;background-color: #e00 !important;color: #fff !important" type="button">
													<strong>Liên Hệ Người Bán</strong>
												</button>
											</form>
										</c:if>
										<c:if test="${listOrder[0].status==6 }">
											<form action="${pageContext.request.contextPath }/public/handel?status=1" method="Post">
												<button  type="submit" class="bk-btn-paynow" value="${listOrder[0].order_code }" name="order_code" style="display: inline-block;background-color: #e00 !important;color: #fff !important">
													<strong>Đặt Lại</strong>
												</button>
											</form>
											<form action="${pageContext.request.contextPath }/public/contact-cskh" method="Post">
												<button type="submit" class="bk-btn-paynow" style="display: inline-block;background-color: #e00 !important;color: #fff !important">
													<strong>Liên Hệ Người Bán</strong>
												</button>
											</form>
										</c:if>
										</div>
										
									</div>
                                </div>
                            </div>
                            </c:if>
                             <c:if test="${empty listOrder }">
                            	Không có sản phẩm nào.
                            </c:if>
                        </div>
                    </div>	
                    <script>
						var ip_address;
						$.getJSON("https://api.ipify.org?format=json", function(data) {
						    // Setting text of element P with id gfg
						    ip_address = data.ip;
						   $("#paypal_ip").val(ip_address);
						   $("#payment_ip").val(ip_address);
						})
					</script>
	</div>
	<p class="return-to-shop">
		<a class="button wc-backward" href="${pageContext.request.contextPath}/public/cat">
			Quay trở lại cửa hàng		</a>
	</p>
</div>
</div>
        </div>
    </section>

<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-542146{width: 50%;}body.kc-css-system .kc-css-383299{width: 50%;}body.kc-css-system .kc-css-183404{width: 40%;}body.kc-css-system .kc-css-8168{width: 20%;}body.kc-css-system .kc-css-681413{width: 20%;}body.kc-css-system .kc-css-567871{width: 20%;}}body.kc-css-system .kc-css-294102{background: #ee1a26;padding-top: 10px;padding-bottom: 10px;}body.kc-css-system .kc-css-294102 >.kc-container{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-652455 .type{color: #ffffff;font-size: 14px;font-weight: 600;text-transform: uppercase;}body.kc-css-system .kc-css-652455{width: 50%;}body.kc-css-system .kc-css-874180{width: 50%;}body.kc-css-system .kc-css-921585{background: #000000;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-921585 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-229334 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-229334 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-229334{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-217143 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-217143 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-217143{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-494534 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-494534 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-494534{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-820481 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-820481 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-820481{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-224882 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-224882 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-224882 .sub{color: #ee1a26;font-size: 24px;font-weight: 700;}body.kc-css-system .kc-css-224882{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-133168 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-133168 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-133168{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-270365 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-767782{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-767782 a{color: #aeaeae;}body.kc-css-system .kc-css-767782 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-767782 p{margin-bottom: 10px;}body.kc-css-system .kc-css-273605 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-908476{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-908476 a{color: #aeaeae;}body.kc-css-system .kc-css-908476 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-908476 p{margin-bottom: 10px;}body.kc-css-system .kc-css-330280 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-217626{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-217626 a{color: #aeaeae;}body.kc-css-system .kc-css-217626 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-217626 p{margin-bottom: 10px;}body.kc-css-system .kc-css-261744 i{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-261744 .item{display: flex;width: 36px;height: 36px;background: #ee1a26;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-261744{display: flex;}body.kc-css-system .kc-css-42241 .icon{display: flex;width: 40px;height: 40px;background: #ffffff;border-radius: 100% 100% 100% 100%;color: #ee1a26;font-size: 24px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-42241:hover .icon{color: #ee1a26;}body.kc-css-system .kc-css-42241 .type{font-weight: 600;margin-left: 10px;}body.kc-css-system .kc-css-42241{position: fixed;display: flex;background: rgba(238, 26, 38, 0.75);border-radius: 25px 25px 25px 25px;padding: 3px 3px 3px 3px;align-items: center;width: auto;bottom: 40px;left: 10px;z-index: 99;box-shadow: 0 0 5px #ddd;animation-duration: 500ms; animation-name: calllink; animation-iteration-count: infinite; animation-direction: alternate;}body.kc-css-system .kc-css-130685 .thumb img{height: 80px;}body.kc-css-system .kc-css-130685{position: fixed;width: auto;bottom: 120px;right: 10px;z-index: 89;}body.kc-css-system .kc-css-235194 i{color: #ffffff;font-size: 24px;line-height: 24px;}body.kc-css-system .kc-css-235194 .thumb img{height: 80px;}body.kc-css-system .kc-css-235194 .item{padding: 9px 15px 9px 15px;margin-bottom: 1px;}body.kc-css-system .kc-css-235194 .item:hover{background: #000000;}body.kc-css-system .kc-css-235194 .item:first-child{border-top-right-radius: 10px;}body.kc-css-system .kc-css-235194 .item:last-child{border-bottom-right-radius: 10px;}body.kc-css-system .kc-css-235194{position: fixed;background: #ee1a26;border-top-right-radius: 10px;border-bottom-right-radius: 10px;width: auto;bottom: 120px;left: 0;z-index: 89;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-42241{bottom: 120px;}body.kc-css-system .kc-css-130685{bottom: 90px;}body.kc-css-system .kc-css-235194{display: none;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-652455{width: 100%;}body.kc-css-system .kc-css-874180{width: 100%;margin-top: 15px;}body.kc-css-system .kc-css-8168{margin-top: 20px;}body.kc-css-system .kc-css-681413{margin-top: 20px;}body.kc-css-system .kc-css-567871{margin-top: 20px;}body.kc-css-system .kc-css-261744{margin-top: 20px;}body.kc-css-system .kc-css-130685 .thumb img{height: 60px;}body.kc-css-system .kc-css-235194 .thumb img{height: 60px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-229334 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-217143 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-494534 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-820481 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-133168 .type{font-size: 14px;line-height: 20px;}}</style>