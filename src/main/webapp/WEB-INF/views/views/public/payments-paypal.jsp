<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <style type="text/css">body.kc-css-system .kc-css-161135{padding-top: 15px;padding-bottom: 30px;}body.kc-css-system .kc-css-785453{text-align: center;}body.kc-css-system .kc-css-700239 .type{font-size: 30px;line-height: 36px;font-weight: 600;}body.kc-css-system .kc-css-700239{margin-top: 30px;}body.kc-css-system .kc-css-411740{margin-top: 20px;}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-700239 .type{font-size: 24px;line-height: 30px;}}</style>
   <style>
        td, th {
            border: 1px solid #D3D6D9;
            text-align: left;
            padding: 8px;
        }
        .no_store {
            font-weight: 500;
            font-size: 14px;
            display: block
        }
        .footer_web {
            width: 840px ;
            margin: auto !important;
        }
        .footer_web2 {
            display: flex ;
            justify-content: space-between
        }
        .with-res {
            width: 800px;
        }
        .scrollit {
            overflow:scroll;
            height:200px;
        }
        .td-choose-store{
            background-color: #FFFFFF;
            padding: 15px !important;
        }
        /*.img-show-info-pay{*/
        /*    position: absolute;*/
        /*    top: 8px;*/
        /*}*/
        .show-info-pay{
            position: absolute;
            background: white;
            top: -12px;
            border: 0.1rem solid #D3D6D9;
            padding: 5px;
            border-radius: 15px;
            width: 25px;
            height: 24px;
            left: 47%;
        }
        .padding_res_payment {
            padding: 10px 6px
        }
        .tick_bank {
            margin-top: 20px ;
            font-weight: 500;
            font-size: 15px ; display: none ;
            /*padding: 0px 10px*/
        }
        .search_bank {
            margin-top: 15px ;
            background: #F4F5F5;
            border-radius: 10px ;
            width: 100%;
            margin-left: -4px;
        }
        .box-center ul {
            position: relative;
            list-style: none;
            padding-left: 0px;
        }
        .box-center ul li {
            margin-bottom: 10px;
            position: relative;
        }
        .box-center ul::before {
            position: absolute;
            content: "";
            height: 100%;
            top: 0px;
            left: 9px;
            z-index: 0;
            border-left: 1px dotted #b3b3b3;
        }
        span.step_viet_qr {
            display: inline;
            background: #B5BABF;
            width: 20px;
            border-radius: 50%;
            height: 20px;
            text-align: center;
            margin-right: 6px;
            color: #fff;
            float: left;
        }

        /* body {
            background: #006E96;
        } */
        input[type=checkbox].checkbox-input  {
            position: relative;
            border: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            cursor: pointer;
            outline: none;
            background-color: #fff;
            border-radius: 2px;
        }

        input[type=checkbox].checkbox-input:checked:before {
            content: "";
            position: absolute;
            top: 4px;
            left: 8px;
            display: table;
            width: 4px;
            height: 9px;
            border: 2px solid #fff;
            border-top-width: 0;
            border-left-width: 0;
            -webkit-transform: rotate(45deg);
            transform: rotate(45deg);
        }
        input[type=checkbox].checkbox-input:checked:after {
            background-color: #2196F3;
            border-color: #2196F3;
        }
        input[type=checkbox].checkbox-input:after {
            content: "";
            display: block;
            width: 18px;
            height: 18px;
            border: 2px solid #bbb;
            border-radius: 50%;
            -webkit-transition: 240ms;
            transition: 240ms;
        }


        .tuto-wallet-1 p {
            position: absolute;
            width: 10px;
            height: 24px;
            left: 11px;
            top: 3px;
            font-style: normal;
            font-weight: 500;
            line-height: 150%;
            display: flex;
            align-items: center;
            text-align: center;
            color: #01425F;
        }

        .tuto-wallet-2 p {
            position: absolute;
            width: 10px;
            height: 24px;
            left: 11px;
            top: 3px;
            font-style: normal;
            font-weight: 500;
            line-height: 150%;
            display: flex;
            align-items: center;
            text-align: center;
            color: #01425F;
        }


        .tuto-wallet-3 p {
            position: absolute;
            width: 10px;
            height: 24px;
            left: 11px;
            top: 3px;
            font-style: normal;
            font-weight: 500;
            line-height: 150%;
            display: flex;
            align-items: center;
            text-align: center;
            color: #01425F;
        }

        .border_product {
            box-sizing: border-box;
            width: 100%;
            /*height: 100%;*/
            background: #FFFFFF;
            border: 1px solid #D3D6D9;
            border-radius: 8px;
        }
        .title_product {

            font-style: normal;
            font-weight: 500;
            font-size: 16px;
            line-height: 150%;
            color: #22313F;
            mix-blend-mode: normal;
        }



        .popup_back {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .popup_back:hover {
            text-decoration: none;
        }

        .popup_back span {
            font-weight:unset !important;
            font-style: normal !important;
            padding-left: 5px !important;
            font-size: 16px !important;
            line-height: 24px !important;
            color: #22313F !important;
        }
        .popup_back i {
            width: 16px;
            height: 16px;
        }

        .popup_del_info {
            display: flex;
            align-items: center;
        }

        .popup_del_info img {
            width: 40px;
            height: 16px;
        }

        .popup_del_info span {
            font-style: normal;
            font-weight: 100 !important;
            font-size: 12px;
            line-height: 12px;
            color: #C2C2C2;
            padding-left: 4px;
        }
        .total_price {
            font-weight: 400 !important;
            font-size: 14px !important;
            color: #22313F !important;
            line-height : unset !important;
            margin-bottom: 0px;

        }
        .total_price_2 {
            font-weight: 400 !important;
            font-size: 16px !important;
            color: #22313F !important;
            line-height : unset !important;
            margin-bottom: 0px;

        }
        .text_promotion {
            font-weight: 500;
            font-size: 16px;
            line-height: 150%;
            color: #22313F;
        }

        .text_select_price{
            font-style: normal;
            font-weight: 400;
            font-size: 14px;
            line-height: 140%;
            color: #4D4D4D;
            margin-bottom: 0px;
        }

        .total_price {
            font-style: normal;
            font-weight: 400;
            font-size: 14px;
            line-height: 140%;
            text-align: right;
            color: #22313F;
        }


        .count_price{
            font-style: normal;
            font-weight: 500;
            font-size: 16px;
            line-height: 150%;
            text-align: right;
            color: #E60A32;
            mix-blend-mode: normal;
        }
        .tex_customer {
            font-style: normal;
            font-weight: 500;
            font-size: 18px;
            margin-top: 24px;
            margin-left: -13px;
        }

        .btn-submit {
            max-width: 260px;
            width: 100%;
            font-style: normal;
            font-weight: 700;
            font-size: 12px !important;
            line-height: 20px;
            padding: 12px;
            color: #FFFFFF;
            background: #006E96 !important;
            border: 1px solid #FFFFFF;
            border-radius: 8px;
        }
        .text_popup_success_content {
            font-style: normal;
            font-weight: 500;
            font-size: 16px;
            align-items: center;
            text-align: center;
            color: #22313F;

        }
        .border_order {
            background: #FFF3E8;
            border-radius: 12px;
        }
        .text_order {
            font-style: normal;
            font-weight: 400;
            font-size: 12px;
            color: #FF821E;
            mix-blend-mode: normal;
            flex: none;
            order: 0;
            flex-grow: 0;
            padding: 2px 10px;
            margin-bottom: 0px;

        }
        .border_form_order {
            width: 500px;
            height: 100%;
            background: #F4F5F5;
            border: 1px solid rgba(34, 49, 63, 0.1);
            border-radius: 8px;
        }
        .border_form_order p {
            margin-bottom: 6px;
            font-style: normal;
            line-height: 19px;
        }

        .text_border_form_order {
            font-style: normal;
            font-weight: 400;
            font-size: 12px;
            line-height: 133.3%;
            color: #22313F;
        }
        .input_evoucher {
            /*position: absolute;*/
            width: 102%;
            height: 48px;
        }
        .input_approve_evoucher {
            position: absolute;
            width: 94%;
            height: 48px;
            background-color: #F4B207 !important;
            border-color: #F4B207 !important;
        }
        .form-check-label {
            font-size: 16px;
        }

        .border_value_payment {
            width:100%;
            height: 100%;
            background: #FFF3E8;
            border: 1px solid #D3D6D9;
            border-radius: 8px;
        }
        .text_order_code {
            font-weight: 400;
            font-size: 14px;
            line-height: 150%;
            color: #4D4D4D;
        }
        .fied_order_code_2 {
            text-align: right;
            font-weight: 500;
            font-size: 14px;
            color: #22313F;
        }
        .fied_order_code_3 {
            text-align: right;
            font-weight: 600;
            font-size: 14px;
            color: #006C9A;
        }

        .info-order-total-price {
            font-weight: 500;
            font-size: 14px;
            color: #E60A32;
        }
        .order_code {
            color: #22313F;
            font-weight: 500;
            font-size: 14px;
        }
        .my_img_icon {
            border-radius: 15px;
            padding: unset;
            margin-left: 0px;
        }

        .btn:hover, .btn:focus, .btn.focus {
            color: #ffffff !important;
        }

        .notification_success {
            /*position: absolute;*/
            width: 564px;
            height: 120px !important;
            background: #FFFFFF !important;
            border: 1px solid #1296D4 !important;
            border-radius: 8px !important;
            margin: auto !important;
        }
        .notification_success_2 {
            width: 564px ;
            height: 168px ;
            background: #F4F5F5 ;
            border: 1px solid rgba(34, 49, 63, 0.1) ;
            border-radius: 8px;
            margin: auto;
        }
        .select-border .select2-container--bootstrap4 .select2-selection, .input-border input {
            border: none;
            border-bottom: 1px solid #ccc;
            border-radius: 0px;
            outline: unset !important;
            box-shadow: none !important;
            font-size: 14px;
            background-color: #ffffff;
            height: 40px;
        }
        .form-control:disabled {
            background-color: #ffffff;
        }
        .popup_back span {
            cursor: pointer;
        }
        .provisional {
            display: flex;
            align-items: center;
            justify-content: end;
            margin-top: 10px;
        }
        .header_img {
            background: #006E96 ;
        }
        .btn-primary:hover, .btn-primary:focus, .btn-primary:active {
            background: #006E96 !important;
            border-color: #006E96 !important;
        }
        .text_title_border_form_order {
            font-weight: 500;
        }
        .hr_content {
            height: 8px;
            width: 110%;
            background: #F4F5F5;
            margin-top: 20px;
            margin-left: -15px;
        }
        .list-bank-v3 {
            padding: 7.5px;
            width: 100%;
        }
        .col-cus-8 {
            width: 12.3%;
        }
        .box_bank_v3 {
            border: 1px solid #cccccc61;
            margin-bottom: 15px;
            padding: 5px;
            border-radius: 5px;
            margin-left: 7.5px;
        }

        .box_bank_img {
            width: 100%
        }
        .has-search {
            position: relative;
        }

        .has-search .form-control {
            padding-left: 2.375rem;
            font-size: 14px;
            color: #22313F;
        }

        .has-search .form-control-feedback {
            position: absolute;
            z-index: 2;
            display: block;
            width: 2.375rem;
            height: 2.375rem;
            line-height: 2.375rem;
            text-align: center;
            pointer-events: none;
            color: #aaa;
        }

        .header_img_sm{
            display: none;
        }
        /*.info-cat{*/
        /*    display: none;*/
        /*}*/
        .align-items-center-sm{
            display: none;
        }
        .next-footer{
            display: block;
        }
        .next-footer-sm{
            display: none;
        }
        .text-promo{
            display: block;
        }
        .text-promo-sm{
            display: none !important;
        }
        .main-container{
            padding-bottom: 120px;
        }
        .form-create-order{
            padding-bottom: 40px;
        }
        .input-number-decrement{
            background: #F4F5F5;
            border-radius: 8px !important;
        }
        .input-number-increment{
            background: #F4F5F5;
            border-radius: 8px !important;
        }
        .input-number-group .input-number {
            border: 1px solid rgba(34, 49, 63, 0.1);
            border-radius: 5px;
        }
        .form-check-inline .form-check-input {
            accent-color: #006E96;
        }
        .font-save-qr{
            width: 90px;
            border: 1px solid #006E96;
            margin: auto;
            border-radius: 5px;
            padding: 5px 0 5px 0;
            display: none !important;
        }
        .save-qr-va{
            font-weight: 500;
            color: #006E96 !important;
        }
        @media (max-width: 568px) {
            .main-container{
                padding-bottom: 0px;
            }
            .hr-md{
                display: none;
            }
            .payment{
                border-radius: 20px 20px 0 0;
            }
            .navbar{
                display: block;
            }
            .header_img{
                display: none;
            }
            .header_img_sm{
                display: block;
            }
            .back-header{
                display: none;
            }
            .popup_back{
                background: #006E96 !important;
                color: white !important;
            }
            .align-items-center-md{
                display: none;
            }
            .align-items-center-sm{
                display: block;
                display: flex;
            }
            .text_promotion{
                font-style: normal;
                font-weight: 700;
                font-size: 12px;
                line-height: 15px;
                color: #000000;
                margin-top: 5px;
            }
            .tex_customer{
                font-style: normal;
                font-weight: 500;
                font-size: 16px;
                color: #000000;
                padding: 0 15px 0 15px;
                margin-left: 0px !important;
            }
            /*.info-cat{*/
            /*    display: flex;*/
            /*}*/
            .total-bill{
                display: none;
            }
            .total_price_2 {
                font-weight: 700 !important;
                color: #E60A32 !important;
            }
            .border-product-sm{
                border-bottom: solid 0.2rem #F4F5F5 !important;
                /*margin-bottom: 3%;*/
            }
            .border-product-sm-large{
                border-bottom: solid 0.5rem #F4F5F5 !important;
                /*margin-bottom: 3%;*/
            }
            .next-footer{
                display: none;
            }
            .next-footer-sm{
                display: block;
                display: flex;
            }
            .count_price {
                font-weight: 700;
            }
            .ticket-content-wrapper-orange {
                background: #ffffff;
                border: none;
            }
            .ticket-right {
                padding: 0px;
            }
            .ticket-promotion {
                background: #ffffff;
                margin-left: unset;
            }
            .text-promo{
                display: none !important;
            }
            .text-promo-sm{
                display: flex !important;
                padding: unset !important;
            }
            .ticket:before, .ticket:after {
                content: unset;
            }
            footer {
                position: unset !important;
            }
            .tex_customer {
                margin-top: 14px;
            }
            .pt-20 {
                 padding-top: 0px !important;
            }
            .pd-20 {
                padding-bottom: 0px !important;
            }
            .form-create-order{
                padding-bottom: 0px;
            }
            .back-res {
                 margin-top: 0px;
            }
            .btn_back_payment-sm{
                padding-left: 10px;
            }
            .font-save-qr{
                display: block !important;
            }
        }
    </style>
    <section id="main_page" class="kc-elm kc-css-161135 kc_row vnt_section hide_col">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-785453 vnt_editor">
<span><span><a href="${pageContext.request.contextPath }/public/index">Trang chủ</a></span> » <span class="breadcrumb_last" aria-current="page">Đặt Hàng</span></span></div>

<div class="kc-elm kc-css-700239 vnt_title">
        <h1 class="type">Đặt hàng</h1>
    </div>
 <div class="kc-elm kc-css-411740 vnt_the_content">
<div class="woocommerce"><div class="woocommerce-notices-wrapper"></div>
	<div class="cart-empty woocommerce-info row">
        <c:if test="${not empty cart }">
		<div class="col-sm-12 col-md-12 col-lg-12 border_product border-product-sm" style="padding-top: 20px; padding-bottom: 10px;">
                        <div class="ajax_cart" style="padding: 15px 15px;border: 0.5px solid grey;border-radius: 5px;">
                           <div class="row align-items-center align-items-center-sm"> </div>
                            	<c:forEach items="${cart }" var="pro">
                            		<div class="row align-items-center align-items-center-md">
		                                <div class="col-lg-2 col-md-3 col-3 product-mobile">
		                                	<img style="width: 83px ; height: 88px" id="product_image_1" src='${imagePath }/product/<c:forTokens items="${pro.images }" delims="[ ]," begin="0" end="0" var="image">${image }</c:forTokens>' class="img-fluid" alt="" height="">
		                                </div>
		                                <div class="col-lg-3 col-md-9 col-9">
		                                    <p class="font-w600 title_product" id="product_name_1">${pro.product_sku }</p>
		                                    <p class="font-w600 title_product"><span><small>Số lượng: </small></span><span><small id="product_qty_${pro.id }"><c:if test="${pro.qty>1 }">${pro.amount - pro.quantity_sold- pro.qty }</c:if><c:if test="${pro.qty==1 }">${pro.amount - pro.quantity_sold}</c:if></small></span></p>
		                                    <a class="popup_del_info" style="margin-top: -7px;">
		                                    </a>
		                                </div>
		                                <div class="col-lg-3 ">
		                                    <div class="col-12 col-md-12 col-lg-12 d-flex align-items-end qty-web">
		                                        <div class="float-left">
		                                            <div class="input-group input-number-group">
		                                                <div class="input-group-button">
		                                                    <span id="minus_${pro.id }" class="input-number-decrement">-</span>
		                                                </div>
		                                                <input class="input-number" type="number" value="${pro.qty }" min="1" max="" id="product_quantity_${pro.id }" name="child">
		                                                <%-- <input type="hidden" value="1" id="platform_product_id_h${pro.id }">
		                                                <input type="hidden" value="1" id="platform_variant_id_h${pro.id }"> --%>
		                                                <div class="input-group-button">
		                                                    <span id="plus_${pro.id }" class="input-number-increment">+</span>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="col-lg-2">
		                                    <div class="col-sm-12 col-md-12 col-lg-12">
		                                        <div class="d-flex align-items-center justify-content-end">
		                                            <p class="fw-bold total_price_2 text-right bk_subtotal_product_price" id="product_price_${pro.id }">${pro.price*pro.qty }</p><span>₫</span>
		                                        </div>
		                                        <input type="hidden" value="3485000" id="subtotal_price">
		                                        <p hidden="" id="product_price_${pro.id }" class="popup_info_price"></p>
		                                    </div>
		                                </div>
		                                <div class="col-lg-2">
		                                	<a id="del_${pro.id }" href="${pageContext.request.contextPath }/public/del-to-cart?id=${pro.id}" data-id="${pro.id }">
		                                		<img style="width: 15px; height: 20px;" alt="delete" src="${contextPath}/images/delete.png">
		                                	</a>	
		                                </div>
		                                <script type="text/javascript">
			                                number = ${pro.price*pro.qty};
			        						document.getElementById("product_price_${pro.id }").innerHTML = formatPrice(number);
			        						var qty = parseInt($("#product_quantity_${pro.id}").val());
			        						var total_qty = parseInt(${pro.amount})-parseInt(${pro.quantity_sold});
		        							var price = parseInt(${pro.price});
		        							var display_qty =parseInt($("#product_qty_${pro.id }").text());
			        						$("#minus_${pro.id }").on('click', function(){
			        							qty = parseInt($("#product_quantity_${pro.id}").val());
			        							total_qty = parseInt(${pro.amount})-parseInt(${pro.quantity_sold});
			        							/* var qty = parseInt($("#product_quantity_${pro.id}').val()); */
			        							price = parseInt(${pro.price});
			        							display_qty =parseInt($("#product_qty_${pro.id }").text());
			        							if(qty>1){
			        								qty=qty-1;
			        								var newPrice = qty*price;
			        								$("#product_quantity_${pro.id }").val(qty);
			        								document.getElementById("product_price_${pro.id }").innerHTML = formatPrice(newPrice);
			        								$("#product_qty_${pro.id }").html(display_qty+1);
			        								if(qty==1){
				        								$("#product_qty_${pro.id }").html(display_qty+2);
				        							}
			        							}
			        							var ek =[];
		                                        $('.bk_subtotal_product_price').each(function() { ek.push($(this).text()); });
		                                        var total = 0;
		                                        for(var i=0; i<ek.length; i++){
		                                        	var num = ek[i].replaceAll(".","");
		                                        	total+=(parseInt(num));
		                                        }
		                                        $('.display_subtotal').html(formatPrice(total));
		                                        $('.display_total').html(formatPrice(total));
		                                        $.ajax({
					             					url: '<%=request.getContextPath()%>/public/up-qty-pro-in-cart',
					             					type: 'POST',
					             					cache: false,
					             					data: {
					             						qty: qty,
					             						id: ${pro.id },
					             						},
					             					success: function(data){
					             							console.log(data);
					             						
					             					},
					             					error: function (){
					             						alert('Có lỗi xảy ra');
					             					},
					             				});
					             				return false;
			        						});
											$("#plus_${pro.id }").on('click', function(){
												total_qty = parseInt(${pro.amount})-parseInt(${pro.quantity_sold});
												qty = parseInt($("#product_quantity_${pro.id}").val());
			        							price = parseInt(${pro.price});
			        							display_qty =parseInt($("#product_qty_${pro.id }").text());
			        							if(qty<total_qty){
			        								qty = qty+1;
			        								var newPrice = qty*price;
			        								$("#product_quantity_${pro.id }").val(qty);
			        								document.getElementById("product_price_${pro.id }").innerHTML = formatPrice(newPrice);
			        								$("#product_qty_${pro.id }").html(display_qty-1);
			        								if(qty==2){
				        								$("#product_qty_${pro.id }").html(display_qty-2);
				        							}
			        							}
			        							var ek =[];
		                                        $('.bk_subtotal_product_price').each(function() { ek.push($(this).text()); });
		                                        var total = 0;
		                                        for(var i=0; i<ek.length; i++){
		                                        	var num = ek[i].replaceAll(".","");
		                                        	total+=(parseInt(num));
		                                        }
		                                        $('.display_subtotal').html(formatPrice(total));
		                                        $('.display_total').html(formatPrice(total));
		                                        $.ajax({
					             					url: '<%=request.getContextPath()%>/public/up-qty-pro-in-cart',
					             					type: 'POST',
					             					cache: false,
					             					data: {
					             						qty: qty,
					             						id: ${pro.id },
					             						},
					             					success: function(data){
					             							console.log(data);
					             						
					             					},
					             					error: function (){
					             						alert('Có lỗi xảy ra');
					             					},
					             				});
					             				return false;
			        						});
											$("#product_quantity_${pro.id }").on('input', function(){
												total_qty = parseInt(${pro.amount})-parseInt(${pro.quantity_sold});
			        							qty = parseInt($("#product_quantity_${pro.id}").val());
			        							price = parseInt(${pro.price});
			        							display_qty =parseInt($("#product_qty_${pro.id }").text());
												if(qty<=parseInt(total_qty)&&qty>=1){
													var newPrice = qty*price;
			        								document.getElementById("product_price_${pro.id }").innerHTML = formatPrice(newPrice);
												}else{
													if(qty>parseInt(total_qty)){
														qty = total_qty;
				        								var newPrice = qty*price;
				        								$("#product_quantity_${pro.id }").val(qty);
				        								document.getElementById("product_price_${pro.id }").innerHTML = formatPrice(newPrice);
														alert('vượt quá số lượng hiện có.');
													}else{
														if(qty==0){
															qty=1;
															var newPrice = qty*price;
					        								$("#product_quantity_${pro.id }").val(qty);
					        								document.getElementById("product_price_${pro.id }").innerHTML = formatPrice(newPrice);
					        								alert('số lượng phải từ 1.');
														}
													}
												}
												$("#product_qty_${pro.id }").html(total_qty);
												display_qty =parseInt($("#product_qty_${pro.id }").text());
												if(display_qty==total_qty&&qty>1){
													$("#product_qty_${pro.id }").html(display_qty-qty);
												}
												var ek =[];
		                                        $('.bk_total_product_price').each(function() { ek.push($(this).text()); });
		                                        var total = 0;
		                                        for(var i=0; i<ek.length; i++){
		                                        	var num = ek[i].replaceAll(".","");
		                                        	total+=(parseInt(num));
		                                        }
		                                        $('.display_subtotal').html(formatPrice(total));
		                                        $('.display_total').html(formatPrice(total));
											});
											$("#product_quantity_${pro.id }").on('blur', function(){
												total_qty = parseInt(${pro.amount})-parseInt(${pro.quantity_sold});
			        							qty = parseInt($("#product_quantity_${pro.id}").val());
			        							price = parseInt(${pro.price});
			        							display_qty =parseInt($("#product_qty_${pro.id }").text());
												if(isNaN(qty)){
													qty=1;
													var newPrice = qty*price;
			        								$("#product_quantity_${pro.id }").val(qty);
			        								document.getElementById("product_price_${pro.id }").innerHTML = formatPrice(newPrice);
			        								$("#product_qty_${pro.id }").html(display_qty-qty);
			        								alert('số lượng phải từ 1.');
												}
												$("#product_qty_${pro.id }").html(total_qty);
												display_qty =parseInt($("#product_qty_${pro.id }").text());
												if(display_qty==total_qty&qty>1){
													$("#product_qty_${pro.id }").html(display_qty-qty);
												}
												 $.ajax({
						             					url: '<%=request.getContextPath()%>/public/up-qty-pro-in-cart',
						             					type: 'POST',
						             					cache: false,
						             					data: {
						             						qty: qty,
						             						id: ${pro.id },
						             						},
						             					success: function(data){
						             							console.log(data);
						             						
						             					},
						             					error: function (){
						             						alert('Có lỗi xảy ra');
						             					},
						             				});
												 $('.display_subtotal').html(formatPrice(total));
												 $('.display_total').html(formatPrice(total));
											});
			        						
			        						function formatPrice(price){
			        							intl = new Intl.NumberFormat('vn-IN', { maximumSignificantDigits: price.legnth }).format(price);
			        							return intl;
			        						}
		                                </script>
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
                                
                                <div class="col-lg-12" style="float: right;">
                                    <div class="provisional">
                                        <p class="subtotal_price">   Tạm tính: <text class="product-quantity">${fn:length(cart) }</text>  sản phẩm </p>
                                        <div class="d-flex align-item-center mr-3">
                                            <p class="count_price value  mb-0 ml-4 display_subtotal"></p><span class="count_price ml-1">đ</span>
                                        </div>
                                        <script type="text/javascript">
                                        var ek =[];
                                        $('.bk_subtotal_product_price').each(function() { ek.push($(this).text()); });
                                        var total = 0;
                                        for(var i=0; i<ek.length; i++){
                                        	var num = ek[i].replaceAll(".","");
                                        	total+=(parseInt(num));
                                        }
                                        
                                        $('.display_subtotal').html(formatPrice(total));
                                        
                                        function formatPrice(price){
		        							intl = new Intl.NumberFormat('vn-IN', { maximumSignificantDigits: price.legnth }).format(price);
		        						return intl;
		        						}
                                        </script>
                                    </div>
                                </div>
                            </div>
                            
                    		</div>	
                            
                   			<form id="form-checkout" action="${pageContext.request.contextPath }/public/order" method="Post">
                   				
		                    <div class="col-sm-12 col-md-12 col-lg-12" style="padding: 20px;">
			                    <p class="tex_customer">Yêu cầu nhận hàng</p>
			                </div>
			                <div class=" col-sm-12 col-md-12 col-lg-12 border_product border-product-sm">
		                        <div style="padding: 15px 15px" class="top_border">
		                            <div class="d-flex align-items-center">
		                                <div class="d-flex align-items-center form-check form-check-inline">
		                                    <input class="form-check-input" type="radio" name="ship_type" id="paypal" value="paypal" checked="">
		                                    <label class="form-check-label" for="home_delivery" style="margin-top: 7px;padding: 0px 10px;">Thanh toán PayPal</label>
		                                </div>
		                            </div>
		                            <div class="area" style="display: block;">
		                                <div class="row mt-2">
		                                    <div class="col-sm-12 col-md-12 col-lg-6 mt-2">
		                                        <div class="form-group select-border">
		                                            <label class="margin-label">Tỉnh/Thành phố <span class="star-red">*</span></label>
		                                            <select id="province" name="province" class="form-control " data-select2-id="select2-data-city" tabindex="-1" aria-hidden="true">
		                                                <option value="" data-select2-id="select2-data-2-jmtw">--Chọn Tỉnh Thành--</option>
		                                                <c:if test="${not empty province }">
		                                                	<c:forEach items="${province }" var="province">
		                                                	<option value="${province.code }">${province.name }</option> 
		                                                	</c:forEach>
		                                                </c:if>    
		                                            </select>
		                                        </div>
		                                    </div>
		                                    
		                                </div>
		                                <div class="row">
		                                    <section class="col-sm-6">
												<div class="form-group mt_20">
													<h4 >
														<label>Giảm Giá</label>
													</h4>
												</div>
												<div class="ajax-message-display">
												</div>
												 <div class="form-group layout-flex">
												 	<div class="col-sm-9 style-discount">
												 		<label for="discount" class="label_field">Nhập mã giảm giá <small>(Nếu có)</small></label>
												 		<input type="text" class="form-control field__input" name="discount" value="" id="discount" aria-describedby="textHelp" placeholder="">
												 	</div>
												 	<div class="col-sm-3 style-discount" style="margin-top: 7px;">
												 		<label for="apply_discount" class="label_field"></label>
												    	<input type="button" class="" id="apply_discount" disabled value="Áp Dụng"/>
												 	</div>
												 </div>
											</section>
											<section class="col-sm-6">
												<div class="form-group mt_20">
													<h4 >
														<label>Vận Chuyển</label>
													</h4>
												</div>
												<div class="ajax-transport-fee">
													
												</div>
											</section>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-sm-12">
                                	<div class="bk-btn row" style="margin-top: 20px; float: right;">
										<div class="bk-btn-box">
											<button id="paypal" type="submit" class="bk-btn-paynow" style="display: inline-block;background-color: #e00 !important;color: #fff !important" type="button">
												<strong>Đặt hàng</strong><span>Lấy Thông Tin Từ PayPal</span>
											</button>
										</div>
									</div>
                                </div>
                   			</form>
                   			
                                <hr class="hr-md">
                            <!--  START TICKET -->
                            <!-- END TICKET  -->
                            <div class="row total-bill">
                                <!-- <div class="col-lg-6">
                                    <div class="row">
                                    </div>
                                </div> -->
                                
                                <div class="col-lg-12">
                                    <div class="provisional">
                                        <p class="total_price">   Tổng: <text class="product-quantity">${fn:length(cart) }</text>  sản phẩm </p>
                                        <div class="d-flex align-item-center mr-3">
                                            <p class="count_price value  mb-0 ml-4 display_total"></p><span class="count_price ml-1">đ</span>
                                        </div>
                                        <script type="text/javascript">
                                        var ek =[];
                                        $('.bk_subtotal_product_price').each(function() { ek.push($(this).text()); });
                                        var total = 0;
                                        for(var i=0; i<ek.length; i++){
                                        	var num = ek[i].replaceAll(".","");
                                        	total+=(parseInt(num));
                                        }
                                        
                                        $('.display_total').html(formatPrice(total));
                                        
                                        function formatPrice(price){
		        							intl = new Intl.NumberFormat('vn-IN', { maximumSignificantDigits: price.legnth }).format(price);
		        						return intl;
		        						}
                                        
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
           </c:if>
          <c:if test="${empty cart }">
               Không có sản phẩm nào.
          </c:if>
	</div>
	<p class="return-to-shop">
		<a class="button wc-backward" href="https://gshockvn.net/cua-hang/">
			Quay trở lại cửa hàng		</a>
	</p>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	  $('#form-checkout').validate({
			rules:{
				
				province:{
					required: true,
				},
			},
			messages:{
				
				province:{
					required: 'Chọn tỉnh thành.',
				},
			},
		});
});
var price = parseInt($(".display_subtotal").text().replaceAll(".",""));
$('#province').on('change', function(){
	var code = $('#province').val();
	$.ajax({
		url: '${pageContext.request.contextPath}/public/get-shipping-fee',
		type: 'POST',
		cache: false,
		data: {
				code: code,
				price: price,
			},
		success: function(data){
				data1=formatPrice(data);
				html="<div class=\"form-check check-form form-control field__input\" id=\"in\">"+
				"<div class=\"radio__input\" style=\"width: 20px;float: left;\">"+
				"<input class=\"form-check-input\" value=\""+data1+"\" type=\"radio\" name=\"transport\" id=\"input_transport_fee\" checked>"+
				"</div>"+
				"<label class=\"form-check-label\" for=\"transport-in\">"+
				"Phí vận chuyển "+
				"</label>"+
				"<label class=\"form-check-label\" for=\"transport-in\">"+
				""+data1+""+
				"<label>đ</label>"+
				"</label>"+
				"</div>";
			
				$('.ajax-transport-fee').html(html);
				price = parseInt(data);
				total = parseInt($('.display_total').text().replaceAll(".",""));
				total+=data;
				 $('.display_total').html(formatPrice(total));
				
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	});
});

function formatPrice(price){
	intl = new Intl.NumberFormat('vn-IN', { maximumSignificantDigits: price.legnth }).format(price);
return intl;
}


$(function() {
	$('#discount').on('keyup', function() {
			$(this).val($(this).val().toUpperCase());
	        var changedField = $(this);
	        var discount_code=$('#discount').val();
	        var size_list = parseInt($(".product-quantity").text());
	        $.ajax({
				url: '<%=request.getContextPath()%>/public/check-discount-code',
				type: 'POST',
				cache: false,
				data: {
					discount_code: discount_code,
					size_list: size_list,
					},
				success: function(data){
					if(data=="1"){
						$('.ajax-message-display').html("<p style=\"color: green; font-style: italic;\">Mã giảm giá được phép dùng.</p>");
						$(document).ready(function() {
		        			$('#apply_discount').prop('disabled', false);
		        		});
					}
					if(data=="2"){
						$('.ajax-message-display').html("<p style=\"color: green; font-style: italic;\">Mã giảm giá không tồn tại.</p>");
						$(document).ready(function() {
		        			$('#apply_discount').prop('disabled', true);
		        		});
					}
				},
				error: function (){
					alert('Có lỗi xảy ra');
				},
			});
			return false;
	});
	$('#apply_discount').on('click', function(){
		if($('#apply_discount').prop('disabled')==false){
			$(this).val($(this).val().toUpperCase());
	        var changedField = $(this);
	        var discount_code=$('#discount').val();
	        $.ajax({
				url: '<%=request.getContextPath()%>/public/get-discount',
				type: 'POST',
				cache: false,
				data: {
					discount_code: discount_code,
					},
				success: function(data){
					$('.ajax-discount-display').html("<div id=\"discount_line\">"+data+"</div><span>đ</span>");
					price = parseInt(data);
					total = parseInt($('.display_total').text().replaceAll(".",""));
					total-=data;
					 $('.display_total').html(formatPrice(total));
					
				},
				error: function (){
					alert('Có lỗi xảy ra');
				},
			});
		}
	});
});
</script>

        </div>
    </section>

<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-542146{width: 50%;}body.kc-css-system .kc-css-383299{width: 50%;}body.kc-css-system .kc-css-183404{width: 40%;}body.kc-css-system .kc-css-8168{width: 20%;}body.kc-css-system .kc-css-681413{width: 20%;}body.kc-css-system .kc-css-567871{width: 20%;}}body.kc-css-system .kc-css-294102{background: #ee1a26;padding-top: 10px;padding-bottom: 10px;}body.kc-css-system .kc-css-294102 >.kc-container{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-652455 .type{color: #ffffff;font-size: 14px;font-weight: 600;text-transform: uppercase;}body.kc-css-system .kc-css-652455{width: 50%;}body.kc-css-system .kc-css-874180{width: 50%;}body.kc-css-system .kc-css-921585{background: #000000;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-921585 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-229334 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-229334 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-229334{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-217143 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-217143 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-217143{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-494534 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-494534 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-494534{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-820481 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-820481 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-820481{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-224882 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-224882 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-224882 .sub{color: #ee1a26;font-size: 24px;font-weight: 700;}body.kc-css-system .kc-css-224882{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-133168 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-133168 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-133168{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-270365 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-767782{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-767782 a{color: #aeaeae;}body.kc-css-system .kc-css-767782 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-767782 p{margin-bottom: 10px;}body.kc-css-system .kc-css-273605 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-908476{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-908476 a{color: #aeaeae;}body.kc-css-system .kc-css-908476 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-908476 p{margin-bottom: 10px;}body.kc-css-system .kc-css-330280 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-217626{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-217626 a{color: #aeaeae;}body.kc-css-system .kc-css-217626 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-217626 p{margin-bottom: 10px;}body.kc-css-system .kc-css-261744 i{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-261744 .item{display: flex;width: 36px;height: 36px;background: #ee1a26;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-261744{display: flex;}body.kc-css-system .kc-css-42241 .icon{display: flex;width: 40px;height: 40px;background: #ffffff;border-radius: 100% 100% 100% 100%;color: #ee1a26;font-size: 24px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-42241:hover .icon{color: #ee1a26;}body.kc-css-system .kc-css-42241 .type{font-weight: 600;margin-left: 10px;}body.kc-css-system .kc-css-42241{position: fixed;display: flex;background: rgba(238, 26, 38, 0.75);border-radius: 25px 25px 25px 25px;padding: 3px 3px 3px 3px;align-items: center;width: auto;bottom: 40px;left: 10px;z-index: 99;box-shadow: 0 0 5px #ddd;animation-duration: 500ms; animation-name: calllink; animation-iteration-count: infinite; animation-direction: alternate;}body.kc-css-system .kc-css-130685 .thumb img{height: 80px;}body.kc-css-system .kc-css-130685{position: fixed;width: auto;bottom: 120px;right: 10px;z-index: 89;}body.kc-css-system .kc-css-235194 i{color: #ffffff;font-size: 24px;line-height: 24px;}body.kc-css-system .kc-css-235194 .thumb img{height: 80px;}body.kc-css-system .kc-css-235194 .item{padding: 9px 15px 9px 15px;margin-bottom: 1px;}body.kc-css-system .kc-css-235194 .item:hover{background: #000000;}body.kc-css-system .kc-css-235194 .item:first-child{border-top-right-radius: 10px;}body.kc-css-system .kc-css-235194 .item:last-child{border-bottom-right-radius: 10px;}body.kc-css-system .kc-css-235194{position: fixed;background: #ee1a26;border-top-right-radius: 10px;border-bottom-right-radius: 10px;width: auto;bottom: 120px;left: 0;z-index: 89;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-42241{bottom: 120px;}body.kc-css-system .kc-css-130685{bottom: 90px;}body.kc-css-system .kc-css-235194{display: none;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-652455{width: 100%;}body.kc-css-system .kc-css-874180{width: 100%;margin-top: 15px;}body.kc-css-system .kc-css-8168{margin-top: 20px;}body.kc-css-system .kc-css-681413{margin-top: 20px;}body.kc-css-system .kc-css-567871{margin-top: 20px;}body.kc-css-system .kc-css-261744{margin-top: 20px;}body.kc-css-system .kc-css-130685 .thumb img{height: 60px;}body.kc-css-system .kc-css-235194 .thumb img{height: 60px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-229334 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-217143 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-494534 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-820481 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-133168 .type{font-size: 14px;line-height: 20px;}}</style>