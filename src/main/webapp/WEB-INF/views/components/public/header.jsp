<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<section id="main_header" class="kc-elm kc-css-842145 kc_row vnt_section hide_col">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-133662 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/LOGO-GWACH-e1638010196607.png" alt="">
    </div>
     <a href="${pageContext.request.contextPath }/public/index" title="Trang chủ" class="link"><span class="link_title">Trang chủ</span></a>
    </div>

	<div id="menu_header" class="kc-elm kc-css-427078 vnt_menu">
            <ul id="nav_header" class="vnt_nav ">
            	<li id="menu-item-261" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-2 current_page_item menu-item-261">
            		<a class="menu_link" href="${pageContext.request.contextPath }/public/index" aria-current="page">Trang chủ</a>
            	</li>
				<li id="menu-item-262" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-262">
					<a class="menu_link link_section" href="${pageContext.request.contextPath }/public/cat">Sản phẩm</a>
					<style type="text/css">body.kc-css-system .kc-css-658506{background: rgba(5, 5, 6, 0.60);padding-top: 15px;padding-bottom: 15px;}body.kc-css-system .kc-css-7603 .title{color: #ffffff;}body.kc-css-system .kc-css-7603 .title a{color: #ffffff;}body.kc-css-system .kc-css-7603 .item:hover .title{color: #ee1a26;}body.kc-css-system .kc-css-7603{display: grid;grid-template-columns: repeat(6, 1fr);grid-gap: 10px;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-658506{background: #191919;padding-top: 0px;padding-bottom: 0px;}body.kc-css-system .kc-css-658506 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-7603 .title{line-height: 50px;}body.kc-css-system .kc-css-7603 .item{border-top: 1px solid #303030;;padding-left: 45px;}body.kc-css-system .kc-css-7603{grid-template-columns: repeat(3, 1fr);grid-gap: 0;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-7603{grid-template-columns: repeat(2, 1fr);}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-7603{grid-template-columns: 1fr;}}</style>
			    <section id="menu_sanpham" class="kc-elm kc-css-658506 kc_row vnt_section hide_col">
			        <div class="kc-row-container kc-container vnt_col">
			        	<div class="kc-elm kc-css-7603 vnt_list">
			        	<c:set value="1" var="indexPr"/>
			        	<c:set value="1" var="indexChil"/>
			        	<c:if test="${not empty categoryService.getListCatByPrId(0) }">
			        		<c:forEach items="${categoryService.getListCatByPrId(0) }" var="catPr">
			        		<div>
			        			<div class="item item_${indexPr } current">
								    <div class="title">${catPr.name }</div>
								    <div id="catPrName${catPr.id}">
								    	<a href="${pageContext.request.contextPath }/public/cat?id=${catPr.id}" title="${catPr.name}" class="link">${catPr.name}</a>
								    </div>
								    <!-- <script type="text/javascript">
								   		var name = '${catPr.name}';
								   		var newName = loc_xoa_dau(name).replaceAll(" ", "-");
								   	
								   		document.getElementById('catPrName${catPr.id}').innerHTML='<a href="${pageContext.request.contextPath }/public/cat/'+newName+'" title="${catPr.name}" class="link">${catPr.name}</a>';
								    </script> -->
						    	</div>
						    	<c:if test="${not empty categoryService.getListCatByPrId(catPr.id) }">
						    	<div style="padding-left: 5px; font-size: 15px">
						    		<ul>
						    		<c:forEach items="${categoryService.getListCatByPrId(catPr.id) }" var="catChil">
						    				<li>
							    				<div class="item item_${indeChil } current">
											    <div class="title">${catChil.name}</div>
											    <div id="catChilName${catChil.id}">
									    			<a href="${pageContext.request.contextPath }/public/cat?id=${catChil.id}" title="${catChil.name}" class="link">${catChil.name}</a>
									    		</div>
									    		<!-- <script type="text/javascript">
									    			var namePr = '${catPr.name}';
											   		var nameChil = '${catChil.name}';
											   		var newNameChil = loc_xoa_dau(nameChil).replaceAll(" ", "-");
											   		var newNamePr = loc_xoa_dau(namePr).replaceAll(" ", "-");
											   		
											   		document.getElementById('catChilName${catChil.id}').innerHTML='<a href="${pageContext.request.contextPath }/public/cat/'+newNameChil+'" title="${catChil.name}" class="link">${catChil.name}</a>';
											    </script> -->
									    		</div>
								    		</li>
						    			
						    		<c:set value="${indexChil+1 }" var="indexChil"/>
						    		</c:forEach>
						    	</ul>
						    	</div>
						    	
						    	</c:if>
			        		</div>
			        			
						    	<c:set value="${indexPr+1 }" var="indexPr"/>
			        		</c:forEach>
			        	</c:if>
							<%-- <div class="item item_1 current">
							    <div class="title">G-Shock</div>
							    <a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/dong-ho-nam/" title="Đồng hồ nam" class="link">Đồng hồ nam</a>
						    </div>
						
						    <div class="item item_2 current">
						    <div class="title">Baby-G</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/baby-g/" title="Baby-G" class="link">Baby-G</a>    </div>
						
						    <div class="item item_3 current">
						    <div class="title">AP Royal Oak Collection</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_4 current">
						    <div class="title">G-Watch Signature</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_5 current">
						    <div class="title">Casio Vintage</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_6 current">
						    <div class="title">Edifice</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_7 current">
						    <div class="title">Đồng hồ cao cấp</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_8 current">
						    <div class="title">Đồng Hồ Cặp</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_9 current">
						    <div class="title">G-Steel</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_10 current">
						    <div class="title">Gravity Master</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/ga-2100-ap-royal-oak/" title="GA-2100 AP Royal Oak" class="link">GA-2100 AP Royal Oak</a>    </div>
						
						    <div class="item item_11 current">
								 <div class="title">Đồng Hồ Size Nhỏ</div><a href="${pageContext.request.contextPath }/public/danh-muc-san-pham/san-pham-moi/" title="Sản phẩm mới" class="link">Sản phẩm mới</a> 
							</div> --%>
						</div>
					</div>
		    	</section>

</li>
<li id="menu-item-272" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-272"><a class="menu_link" href="${pageContext.request.contextPath }/public/news">Tin tức</a></li>
<li id="menu-item-270" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-270"><a class="menu_link" href="${pageContext.request.contextPath }/public/contact">Liên hệ</a></li>
<li id="menu-item-271" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-271"><a class="menu_link" href="${pageContext.request.contextPath }/public/introduce">Giới thiệu</a></li>
</ul>        
</div>
    <div id="header_search" class="kc-elm kc-css-44370 vnt_element">
	    <div class="kc-elm kc-css-462941 vnt_editor">
			<div class="dgwt-wcas-search-wrapp dgwt-wcas-no-submit woocommerce dgwt-wcas-style-solaris js-dgwt-wcas-layout-classic dgwt-wcas-layout-classic js-dgwt-wcas-mobile-overlay-disabled">
					<form class="dgwt-wcas-search-form" role="search" action="https://gshockvn.net/" method="get">
					<div class="dgwt-wcas-sf-wrapp">
						<svg class="dgwt-wcas-ico-magnifier" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 51.539 51.361" xml:space="preserve">
					         <path d="M51.539,49.356L37.247,35.065c3.273-3.74,5.272-8.623,5.272-13.983c0-11.742-9.518-21.26-21.26-21.26 S0,9.339,0,21.082s9.518,21.26,21.26,21.26c5.361,0,10.244-1.999,13.983-5.272l14.292,14.292L51.539,49.356z M2.835,21.082 c0-10.176,8.249-18.425,18.425-18.425s18.425,8.249,18.425,18.425S31.436,39.507,21.26,39.507S2.835,31.258,2.835,21.082z"></path>
						</svg>
						<label class="screen-reader-text" for="dgwt-wcas-search-input-1">Tìm kiếm sản phẩm</label>
						<input id="dgwt-wcas-search-input-1" type="search" class="dgwt-wcas-search-input" name="s" value="" placeholder="Tên / Mã sản phẩm" autocomplete="off">
						<div class="dgwt-wcas-preloader"></div>
						<div class="dgwt-wcas-voice-search"></div>
						<input type="hidden" name="post_type" value="product">
						<input type="hidden" name="dgwt_wcas" value="1">
					</div>
				</form>
			</div>
		</div>
    </div>
	<div class="kc-elm kc-css-745639 kc_col-sm-3 kc_column kc_col-sm-3">
	<div class="kc-elm kc-css-677951 vnt_title btn_search">
	    <div class="thumb"><img class="img_1" src="${contextPath }/images/search.png" alt="Search Icon"></div>
		<button type="button" class="link" data-toggle="modal" data-target="#header_search"></button> 
	</div>
	<div class="kc-elm kc-css-817499 vnt_title collapse navbar-collapse">
	    <div class="thumb" style=" margin-bottom: -40px; ">
		    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	 			<div class="container-fluid">
		 			<div class="collapse navbar-collapse" id="main_nav">
		 				<div class="navbar-nav">
					    	<div class="nav-item dropdown">
					    	<c:if test="${not empty objU }">
					    		<c:if test="${objU.username!=null }">
					    			<a href="${pageContext.request.contextPath }/public/profile" class="nav-link  dropdown-toggle" data-bs-toggle="dropdown" title="Tài khoản">
						    			<img class="img_1" src="${contextPath }/images/gio-hang.png" alt="Tài khoản">
							    	</a>
							    	<ul class="dropdown-menu">
									  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/public/profile"> Cá Nhân</a></li>
									  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/auth/public/logout"> Đăng Xuất </a></li>
								    </ul>
					    		</c:if>
					    		<c:if test="${objU.username==null }">
					    		<a href="${pageContext.request.contextPath }/auth/public/login" class="nav-link  dropdown-toggle" data-bs-toggle="dropdown" title="Tài khoản">
						    		<img class="img_1" src="${contextPath }/images/gio-hang.png" alt="Tài khoản">
						    	</a>
						    	<ul class="dropdown-menu">
								  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/auth/public/login"> Đăng Nhập</a></li>
							    </ul>
					    	</c:if>
					    	</c:if>
					    	<c:if test="${empty objU }">
					    		<a href="${pageContext.request.contextPath }/auth/public/login" class="nav-link  dropdown-toggle" data-bs-toggle="dropdown" title="Tài khoản">
						    		<img class="img_1" src="${contextPath }/images/gio-hang.png" alt="Tài khoản">
						    	</a>
						    	<ul class="dropdown-menu">
								  <li><a class="dropdown-item" href="${pageContext.request.contextPath }/auth/public/login"> Đăng Nhập</a></li>
							    </ul>
					    	</c:if>
					    	</div>
				    	</div>
				    </div>
			    </div>
			</nav>
	    </div>
	</div>

	<div class="kc-elm kc-css-493724 vnt_title gio_hang">
	   <div class="thumb"><img class="img_1" src="${contextPath }/images/cart.png" alt="Giỏ hàng"></div>
		<span class="num">${fn:length(cart) }</span>
		<a href="${pageContext.request.contextPath }/public/cart" class="link " title="Thanh toán">Thanh toán</a>
    </div>

	<div class="kc-elm kc-css-321065 vnt_title btn_menu">
	    <div class="thumb"><img class="img_1" src="${contextPath }/images/menu-icon.png" alt="Menu Icon"></div>
		<button type="button" class="link" data-toggle="modal" data-target="#menu_header"></button>  
	</div>
	</div>
   </div>
</section>
    
<div class="kc_clfw"></div>