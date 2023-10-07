<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-26183{width: 70%;}body.kc-css-system .kc-css-939157{width: 30%;}}body.kc-css-system .kc-css-900236{padding-top: 30px;padding-bottom: 30px;}body.kc-css-system .kc-css-751984{text-align: center;}body.kc-css-system .kc-css-720299 .type{font-size: 30px;line-height: 42px;font-weight: 600;text-align: center;}body.kc-css-system .kc-css-720299{;margin-top: 30px;}body.kc-css-system .kc-css-498031 .icon{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-498031{position: fixed;display: none;width: 36px;height: 36px;background: #f97e6c;border-top-left-radius: 5px;border-bottom-left-radius: 5px;justify-content: center;align-items: center;top: 40%;right: 0;z-index: 10;}body.kc-css-system .kc-css-448206{background: #f7f7f7;display: flex;width: 100%;margin-top: 30px;margin-right: 0px;margin-left: 0px;padding-right: 15px;border-radius: 4px 4px 4px 4px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-26183{display: flex;width: 100%;padding-left: 0px;flex: 1;}body.kc-css-system .kc-css-541136 .icon{color: #dd3333;font-size: 24px;}body.kc-css-system .kc-css-541136{position: absolute;display: none;width: 36px;height: 36px;justify-content: center;align-items: center;top: 10px;right: 10px;z-index: 10;}body.kc-css-system .kc-css-940477 .widgettitle:hover{color: #ee1a26;}body.kc-css-system .kc-css-940477 .widgettitle{font-size: 16px;line-height: 46px;font-weight: 600;padding-top: 0px;padding-bottom: 0px;margin: 0px 0px 0px 0px;}body.kc-css-system .kc-css-940477{margin-right: 30px;padding-right: 15px;padding-left: 15px;width: auto;}body.kc-css-system .kc-css-137267 .widgettitle:hover{color: #ee1a26;}body.kc-css-system .kc-css-137267 .widgettitle{font-size: 16px;line-height: 46px;font-weight: 600;padding-top: 0px;padding-bottom: 0px;margin: 0px 0px 0px 0px;}body.kc-css-system .kc-css-137267{display: none;margin-right: 30px;padding-right: 15px;padding-left: 15px;width: auto;}body.kc-css-system .kc-css-492227{width: auto;}body.kc-css-system .kc-css-803886 .title{width: 100%;font-size: 16px;font-weight: 500;text-align: center;margin-top: 10px;margin-bottom: 5px;}body.kc-css-system .kc-css-803886 .price{display: flex;width: 100%;color: #ee1a26;font-size: 16px;font-weight: 600;padding-right: 5px;padding-left: 5px;flex-flow: wrap;justify-content: center;align-items: center;}body.kc-css-system .kc-css-803886 .price del{color: #aeaeae;font-size: 12px;font-weight: 400;margin-right: 10px;margin-left: 10px;}body.kc-css-system .kc-css-803886 .item{display: flex;background: #ffffff;padding-bottom: 8px;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-803886{display: grid;margin-top: 30px;grid-template-columns: repeat(4, 1fr);grid-gap: 15px;grid-row-gap: 30px;}body.kc-css-system .kc-css-716495{display: flex;padding-top: 30px;padding-bottom: 30px;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-994671 .type{width: 100%;font-size: 30px;line-height: 42px;font-weight: 600;text-transform: uppercase;text-align: center;}body.kc-css-system .kc-css-994671 .sub{width: 90px;height: 2px;background: #ee1a26;margin-top: 15px;}body.kc-css-system .kc-css-994671 .cont{width: 100%;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-994671{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-391273{width: 100%;max-width: 1170px;padding-right: 15px;padding-left: 15px;margin-top: 30px;}body.kc-css-system .kc-css-391273 .slick-list{margin-right: -10px;margin-left: -10px;}body.kc-css-system .kc-css-391273 .slick-slide{margin-right: 10px;margin-left: 10px;}body.kc-css-system .kc-css-979947 .icon{color: #ee1a26;}body.kc-css-system .kc-css-979947 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-979947 .thumb img,body.kc-css-system .kc-css-979947 .thumb svg{display: block;}body.kc-css-system .kc-css-979947:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-979947 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-979947{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-9262 .icon{color: #ee1a26;}body.kc-css-system .kc-css-9262 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-9262 .thumb img,body.kc-css-system .kc-css-9262 .thumb svg{display: block;}body.kc-css-system .kc-css-9262:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-9262 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-9262{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-390209 .icon{color: #ee1a26;}body.kc-css-system .kc-css-390209 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-390209 .thumb img,body.kc-css-system .kc-css-390209 .thumb svg{display: block;}body.kc-css-system .kc-css-390209:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-390209 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-390209{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-73527 .icon{color: #ee1a26;}body.kc-css-system .kc-css-73527 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-73527 .thumb img,body.kc-css-system .kc-css-73527 .thumb svg{display: block;}body.kc-css-system .kc-css-73527:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-73527 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-73527{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-683255 .icon{color: #ee1a26;}body.kc-css-system .kc-css-683255 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-683255 .thumb img,body.kc-css-system .kc-css-683255 .thumb svg{display: block;}body.kc-css-system .kc-css-683255:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-683255 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-683255{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-87768{background: #fcf8f4;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-376027 .type{width: 100%;font-size: 30px;line-height: 42px;font-weight: 600;text-transform: uppercase;text-align: center;}body.kc-css-system .kc-css-376027 .sub{width: 90px;height: 2px;background: #ee1a26;margin-top: 15px;}body.kc-css-system .kc-css-376027 .cont{width: 100%;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-376027{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-191378{margin-top: 20px;}body.kc-css-system .kc-css-191378 .slick-list{margin-right: -8px;margin-left: -8px;}body.kc-css-system .kc-css-191378 .slick-slide{margin-right: 8px;margin-left: 8px;}body.kc-css-system .kc-css-166268 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-166268 .desc{text-align: center;}body.kc-css-system .kc-css-250101 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-250101 .desc{text-align: center;}body.kc-css-system .kc-css-287593 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-287593 .desc{text-align: center;}body.kc-css-system .kc-css-491352 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-491352 .desc{text-align: center;}body.kc-css-system .kc-css-355450 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-355450 .desc{text-align: center;}body.kc-css-system .kc-css-340932 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-340932 .desc{text-align: center;}body.kc-css-system .kc-css-114557 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-114557 .desc{text-align: center;}@media only screen and (max-width: 900px){body.kc-css-system .kc-css-803886 .item{width: calc(100vw/3 - 21px);}body.kc-css-system .kc-css-803886{overflow-x: auto;}}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-498031{display: flex;}body.kc-css-system .kc-css-541136{display: flex;}body.kc-css-system .kc-css-87768{padding-right: 10px;padding-left: 10px;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-720299 .type{font-size: 24px;line-height: 30px;}body.kc-css-system .kc-css-448206{margin-top: 0px;padding-right: 0px;padding-bottom: 15px;flex-flow: wrap;}body.kc-css-system .kc-css-26183{padding-right: 0px;flex-flow: wrap;flex: inherit;}body.kc-css-system .kc-css-940477{width: 100%;margin-right: 0px;}body.kc-css-system .kc-css-137267{width: 100%;margin-right: 0px;}body.kc-css-system .kc-css-492227{padding-left: 15px;margin-top: 15px;}body.kc-css-system .kc-css-803886 .item{width: 100%;}body.kc-css-system .kc-css-803886{grid-template-columns: repeat(2, 1fr);}body.kc-css-system .kc-css-994671 .type{font-size: 24px;}body.kc-css-system .kc-css-994671 .sub{margin-top: 5px;}body.kc-css-system .kc-css-376027 .type{font-size: 24px;}body.kc-css-system .kc-css-376027 .sub{margin-top: 5px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-376027 .type{font-size: 20px;}}</style>
    	<div class="kc-elm kc-css-801333 vnt_editor">
<img width="1920" height="397" src="${contextPath }/images/ga-100-banner-zps2d312xp7-1-3.jpeg" class="attachment-full size-full wp-post-image" alt="" decoding="async" loading="lazy" srcset="https://gshockvn.net/wp-content/uploads/ga-100-banner-zps2d312xp7-1-3.jpeg 1920w, https://gshockvn.net/wp-content/uploads/ga-100-banner-zps2d312xp7-1-3-768x159.jpeg 768w, https://gshockvn.net/wp-content/uploads/ga-100-banner-zps2d312xp7-1-3-1170x242.jpeg 1170w, https://gshockvn.net/wp-content/uploads/ga-100-banner-zps2d312xp7-1-3-300x62.jpeg 300w, https://gshockvn.net/wp-content/uploads/ga-100-banner-zps2d312xp7-1-3-600x124.jpeg 600w, https://gshockvn.net/wp-content/uploads/ga-100-banner-zps2d312xp7-1-3-64x13.jpeg 64w" sizes="(max-width: 1920px) 100vw, 1920px" data-xoowscfly="fly"></div>
    <section id="main_product_archive" class="kc-elm kc-css-900236 kc_row vnt_section hide_col">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-751984 vnt_editor">
<span><span><a href="${pageContext.request.contextPath }/public/index">Trang chủ</a></span> » <span class="breadcrumb_last" aria-current="page">Cửa hàng</span></span></div>
<div class="kc-elm kc-css-720299 vnt_title">
      <h1 class="type">${catName }</h1>
</div>
<style type="text/css">body.kc-css-system .kc-css-85203{max-width: 1170px;border: 1px solid #dcdcdc;border-radius: 5px 5px 5px 5px;padding: 10px 15px 10px 15px;margin-top: 20px;}body.kc-css-system .kc-css-448774 .thumb img,body.kc-css-system .kc-css-448774 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-448774 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-448774 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-448774{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-441933 .thumb img,body.kc-css-system .kc-css-441933 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-441933 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-441933 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-441933{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-271215 .thumb img,body.kc-css-system .kc-css-271215 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-271215 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-271215 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-271215{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-576134 .thumb img,body.kc-css-system .kc-css-576134 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-576134 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-576134 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-576134{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-577071 .thumb img,body.kc-css-system .kc-css-577071 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-577071 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-577071 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-577071{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-846483 .thumb img,body.kc-css-system .kc-css-846483 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-846483 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-846483 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-846483{display: flex;flex-flow: wrap;justify-content: center;}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-448774 .type{font-size: 13px;}body.kc-css-system .kc-css-441933 .type{font-size: 13px;}body.kc-css-system .kc-css-271215 .type{font-size: 13px;}body.kc-css-system .kc-css-576134 .type{font-size: 13px;}body.kc-css-system .kc-css-577071 .type{font-size: 13px;}body.kc-css-system .kc-css-846483 .type{font-size: 13px;}}</style>
<div class="kc-elm kc-css-85203 kc_col-sm-12 vnt_slick slick-initialized slick-slider" data-slick="{&quot;slidesToShow&quot;: 6,  &quot;slidesToScroll&quot;: 3, &quot;centerMode&quot;: false, &quot;variableWidth&quot;: false, &quot;dots&quot;: false, &quot;arrows&quot;: true, &quot;autoplay&quot;: true,  &quot;autoplaySpeed&quot;: 10000, &quot;infinite&quot;: true, &quot;adaptiveHeight&quot;: false ,  &quot;rows&quot;: 0, &quot;responsive&quot;:[{&quot;breakpoint&quot;: 1024, &quot;settings&quot;:{&quot;slidesToShow&quot;: 5, &quot;slidesToScroll&quot;: 1}}, {&quot;breakpoint&quot;: 767, &quot;settings&quot;:{&quot;slidesToShow&quot;: 4, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: false, &quot;fade&quot;: false}}, {&quot;breakpoint&quot;: 480, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1}}]}">
    <div class="slick-list draggable">
    	<div class="slick-track" style="opacity: 1; width: 1110px; transform: translate3d(0px, 0px, 0px);">
		    <c:if test="${not empty listCat1 }">
		    	<c:forEach items="${listCat1 }" var="cat1">
		    		<div class="kc-elm kc-css-744250 slick_item slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 185px;">
						<div class="kc-elm kc-css-448774 vnt_title">
						    <div class="thumb"><img class="img_1" src="${imagePath }/category/${cat1.logo}" alt="ĐỒNG HỒ ${cat1.name }"></div>
							<div class="type">ĐỒNG HỒ ${cat1.name}</div>
							<span class="sub">
								<c:if test="${not empty productService.getListByCatName(cat1.name) }">
									<c:if test="${fn:length(productService.getListByCatName(cat1.name)) < 100 and fn:length(productService.getListByCatName(cat1.name))>0 }">${fn:length(productService.getListByCatName(cat1.name))} sản phẩm</c:if>
									<c:if test="${fn:length(productService.getListByCatName(cat1.name)) > 100}">100+ sản phẩm</c:if>
								</c:if>
								<c:if test="${empty productService.getListByCatName(cat1.name) }"> 0 sản phẩm</c:if>
							</span>
							<a href="${pageContext.request.contextPath }/public/cat?name=${cat1.name}" class="link " title="" tabindex="0"></a>
						</div>
					</div>
		    	</c:forEach>
		    </c:if>
		</div>
	</div>
</div>
<div class="kc-elm kc-css-498031 vnt_title">
    <i class="icon fa-filter"></i>
	<button type="button" class="link" data-toggle="modal" data-target="#aproduct_filter"></button>        
</div>
<div id="aproduct_filter" class="kc-elm kc-css-448206 kc_row kc_row_inner">
	<div class="kc-elm kc-css-26183 kc_col-sm-8 kc_column_inner kc_col-sm-8">
		<div class="kc-elm kc-css-541136 vnt_title">
        	<i class="icon fa-times-octagon"></i>
			<button type="button" class="link" data-toggle="modal" data-target="#aproduct_filter"></button>
    	</div>
		<div class="widget woocommerce widget_product_categories kc-elm kc-css-940477 pcat_filter">
			<h2 class="widgettitle">Bộ sưu tập</h2>
			<ul class="product-categories">
				<c:if test="${not empty categoryService.getListCatByPrId(0) }">
				<c:set value="1" var="indexPr1"/>
					<c:forEach items="${categoryService.getListCatByPrId(0) }" var="catPr1">
						<li class="cat-item cat-item-${catPr1.id }"><a href="${pageContext.request.contextPath }/public/cat?id=${catPr1.id}">${catPr1.name }</a> <span class="count">(${fn:length(productService.getListByCatId(catPr1.id))})</span>
							<ul class="" style="position: inherit;">
								<c:if test="${not empty categoryService.getListCatByPrId(catPr1.id) }">
								<c:set value="1" var="indexChil1"/>
								<c:forEach items="${categoryService.getListCatByPrId(catPr1.id)}" var="catChil1">
									<li class="cat-item cat-item-${catChil1.id }"><a href="${pageContext.request.contextPath }/public/cat?id=${catChil1.id}">${catChil1.name }</a> <span class="count">(${fn:length(productService.getListByCatId(catChil1.id))})</span></li>
								<c:set value="${indexChil1+1 }" var="indexChil1"/>
								</c:forEach>
								</c:if>
							</ul>
						</li>
						<c:set value="${indexPr1+1 }" var="indexPr1"/>
					</c:forEach>
				</c:if>
			</ul>
		</div>	
</div>
	<div class="kc-elm kc-css-492227 vnt_editor">
<form class="woocommerce-ordering" method="get">
	<select name="orderby" class="orderby" aria-label="Đơn hàng của cửa hàng">
					<option value="date" selected="selected">Sản phẩm mới</option>
					<option value="rating">Đánh giá cao</option>
					<option value="price">Giá: Thấp → Cao</option>
					<option value="price-desc">Giá: Cao → Thấp</option>
			</select>
	<input type="hidden" name="paged" value="1">
	</form>
</div>
	</div>
<div class="kc-elm kc-css-803886 vnt_archive vnt_product">
    <c:if test="${not empty listPro }">
    <c:set value="1" var="index"/>
    <c:forEach items="${listPro }" var="listPro">
    	<div class='kc-elm product item item_${index } <c:if test="${index%2!=0 }">odd</c:if><c:if test="${index%2==0 }">even</c:if> '>
			<div class="kc-elm thumb">
				<a class="kc-elm permalink" href="${pageContext.request.contextPath }/public/product?id=${listPro.id}" title="${listPro.product_sku }">
					<img src='${imagePath }/product/<c:forTokens items="${listPro.images }" delims="[ ]," begin="0" end="0" var="image">${image }</c:forTokens>' alt="${listPro.product_sku }">
				</a>
				<a href="${pageContext.request.contextPath }/public/product?id=${listPro.id}" data-product_id="${listPro.id}" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a>
				<a id="add_to_cart_${listPro.id }" data-product_id="${listPro.id}" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a>
				<!-- <span class="saleup">Giảm <span class="woocommerce-Price-amount amount">
				<bdi>1.200.000</bdi><span class="woocommerce-Price-currencySymbol">₫</span></span></span> -->
			</div>
			<div class="kc-elm title" data-tooltip="${listPro.product_sku }">
				<a href="${pageContext.request.contextPath }/public/product?id=${listPro.id}" title="${listPro.product_sku }">${listPro.product_sku }</a>
			</div>
				<div class="price">
					<!-- <del aria-hidden="true">
						<span class="woocommerce-Price-amount amount">
							<bdi>7.999.000</bdi>
							<span class="woocommerce-Price-currencySymbol">₫</span>
						</span>
					</del>  -->
					<ins>
						<span class="woocommerce-Price-amount amount">
							<bdi id="price_format${listPro.id }">6.799.000</bdi>
							<span class="woocommerce-Price-currencySymbol">₫</span>
						</span>
					</ins>
					<!-- <div class="vntp_sale">-15%</div> -->
					<script type="text/javascript">
						number = ${listPro.price};
						document.getElementById("price_format${listPro.id }").innerHTML = formatPrice(number);
						function formatPrice(price){
							intl = new Intl.NumberFormat('vn-IN', { maximumSignificantDigits: price.legnth }).format(price);
							return intl;
						}
						
					</script>
				</div>
				<script type="text/javascript">
				
						 $('#add_to_cart_${listPro.id}').on('click', function() { 
							var ip_address;
							$.getJSON("https://api.ipify.org?format=json", function(data) {
								ip_address = data.ip;
							})
             		        var changedField = $(this);
             		        var id = $("#add_to_cart_${listPro.id}").data("product_id"); 
             		        $.ajax({
             					url: '<%=request.getContextPath()%>/public/add-to-cart',
             					type: 'POST',
             					cache: false,
             					data: {
             						id: id,
             						ip: ip_address,
             						},
             					success: function(data){
             							$('.num').html(data);
             						
             					},
             					error: function (){
             						alert('Có lỗi xảy ra');
             					},
             				});
             				return false;
             		    });
					</script>		    
			</div>
    <c:set value="${index+1 }" var="index"/>
    </c:forEach>
    </c:if>
</div>
<div class="kc-elm vnt_pagenavi">
<c:if test="${page > 1 }">
	<a class="prev page-numbers" href="${pageContext.request.contextPath }/public/cat<c:choose><c:when test="${catName==name }">?name=${name }&page=${page-1 }</c:when><c:when test="${catName!=name and catName!='Danh Mục Sản Phẩm' }">?id=${catById.id }&page=${page-1 }</c:when><c:otherwise>?page=${page-1 }</c:otherwise></c:choose>"><i class="fa-chevron-left"></i></a>
	<a class="prev page-numbers" href="${pageContext.request.contextPath }/public/cat<c:choose><c:when test="${catName==name }">?name=${name }&page=1</c:when><c:when test="${catName!=name and catName!='Danh Mục Sản Phẩm' }">?id=${catById.id }&page=1</c:when><c:otherwise>?page=1</c:otherwise></c:choose>">Đầu</a>
</c:if>
<c:choose>
   <c:when test="${maxPage<numOfPage }">
      <c:choose>
        <c:when test="${numCur<=numOfPage }">
        	
           <c:forEach  begin="${page }" end="${numCur }" var="index" >
            <c:if test="${page==index }">
          		<span aria-current="page" class="page-numbers current">${page }</span>
          	</c:if>
          	<c:if test="${page!=index }">
          		 <a class="page-numbers" href="${pageContext.request.contextPath}/public/cat<c:choose><c:when test="${catName==name }">?name=${name }&page=${index }</c:when><c:when test="${catName!=name and catName!='Danh Mục Sản Phẩm' }">?id=${catById.id }&page=${index }</c:when><c:otherwise>?page=${index }</c:otherwise></c:choose>">${index}</a>
          	</c:if>
          </c:forEach>
        </c:when>
        
        <c:when test="${numCur>numOfPage }">
           <c:forEach  begin="${page-2 }" end="${numOfPage }" var="index" >
              	<c:if test="${page==index }">
          		<span aria-current="page" class="page-numbers current">${page }</span>
          	</c:if>
          	<c:if test="${page!=index }">
          		 <a class="page-numbers" href="${pageContext.request.contextPath}/public/cat<c:choose><c:when test="${catName==name }">?name=${name }&page=${index }</c:when><c:when test="${catName!=name and catName!='Danh Mục Sản Phẩm' }">?id=${catById.id }&page=${index }</c:when><c:otherwise>?page=${index }</c:otherwise></c:choose>">${index}</a>
          	</c:if>
           </c:forEach>
        </c:when>
      </c:choose>
    </c:when>
    <c:otherwise>
       <c:if test="${maxPage>=numOfPage }">
          <c:forEach  begin="1" end="${numOfPage }" var="index">
          	<c:if test="${page==index }">
          		<span aria-current="page" class="page-numbers current">${page }</span>
          	</c:if>
          	<c:if test="${page!=index }">
          		 <a class="page-numbers" href="${pageContext.request.contextPath}/public/cat<c:choose><c:when test="${catName==name }">?name=${name }&page=${index }</c:when><c:when test="${catName!=name and catName!='Danh Mục Sản Phẩm' }">?id=${catById.id }&page=${index }</c:when><c:otherwise>?page=${index }</c:otherwise></c:choose>">${index}</a>
          	</c:if>
           </c:forEach>
        </c:if>
    </c:otherwise>
</c:choose>
 <c:if test="${page>=1 and page<numOfPage  }">
	<a class="next page-numbers" href="${pageContext.request.contextPath }/public/cat<c:choose><c:when test="${catName==name }">?name=${name }&page=${numOfPage}</c:when><c:when test="${catName!=name and catName!='Danh Mục Sản Phẩm' }">?id=${catById.id }&page=${numOfPage}</c:when><c:otherwise>?page=${numOfPage }</c:otherwise></c:choose>">Cuối</i></a>
	<a class="next page-numbers" href="${pageContext.request.contextPath }/public/cat<c:choose><c:when test="${catName==name }">?name=${name }&page=${page+1 }</c:when><c:when test="${catName!=name and catName!='Danh Mục Sản Phẩm' }">?id=${catById.id }&page=${page+1 }</c:when><c:otherwise>?page=${page+1 }</c:otherwise></c:choose>"><i class="fa-chevron-right"></i></a>
</c:if>   
<!-- <span aria-current="page" class="page-numbers current">1</span>
<a class="page-numbers" href="https://gshockvn.net/cua-hang/page/2/">2</a>
<a class="page-numbers" href="https://gshockvn.net/cua-hang/page/3/">3</a>
<a class="page-numbers" href="https://gshockvn.net/cua-hang/page/14/">14</a>
<a class="next page-numbers" href=""><i class="fa-chevron-right"></i></a>
</div> -->

        </div>
    </section>


    <section id="pcat_bst" class="kc-elm kc-css-716495 kc_row vnt_section hide_col_cont">
		<div class="kc-elm kc-css-994671 vnt_title">
	        <h2 class="type">Bộ sưu tập</h2>
			<span class="sub"></span>
    	</div>
		<div class="kc-elm kc-css-391273 kc_col-sm-12 vnt_slick asd" data-slick="{&quot;slidesToShow&quot;: 3,  &quot;slidesToScroll&quot;: 3, &quot;centerMode&quot;: false, &quot;variableWidth&quot;: false, &quot;dots&quot;: true, &quot;arrows&quot;: false, &quot;autoplay&quot;: true,  &quot;autoplaySpeed&quot;: 10000, &quot;infinite&quot;: true, &quot;adaptiveHeight&quot;: false ,  &quot;rows&quot;: 0, &quot;responsive&quot;:[{&quot;breakpoint&quot;: 1024, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1}}, {&quot;breakpoint&quot;: 767, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: false, &quot;fade&quot;: false}}, {&quot;breakpoint&quot;: 480, &quot;settings&quot;:{&quot;slidesToShow&quot;: 1, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: true}}]}">    
		    
				<c:if test="${not empty listCat1 }">
					<c:forEach items="${listCat1 }" var="cat1">
					<div class="kc-elm kc-css-930437 "  id="" aria-hidden="true" tabindex="-1" style="width: 367px; height: 420px;">
						<div class="kc-elm kc-css-390209 vnt_title">
						    <div class="thumb">
						       <img class="img_1" style="width: 367px; height: 367px;" src="${imagePath }/category/${cat1.image}" alt="${cat1.name }">
						    </div>
							<div class="type">${cat1.name }</div> <i class="icon fa-long-arrow-right"></i>
							<a href="${pageContext.request.contextPath }/public/cat?name=${cat1.name}" class="link " title="${cat1.name }" tabindex="-1">${cat1.name }</a>           
				    	</div>
				    </div>
					</c:forEach>
				</c:if>
		</div>
    </section>
<script type="text/javascript">
jQuery(document).ready(function() {
	$('.asd').slick({
		rows : 2,
		dots : true,
		arrows : false,
		infinite : true,
		speed : 300,
		slidesToShow : 2,
		slidesToScroll : 2
	});
});
</script>

    <section id="pcat_khachhang" class="kc-elm kc-css-87768 kc_row vnt_section hide_col_cont">
    	
<div class="kc-elm kc-css-376027 vnt_title">
            
        <h2 class="type">KHÁCH HÀNG CỦA CHÚNG TÔI</h2>
<span class="sub"></span>
<div class="cont">Ai nói bạn không thể tỏa sáng?</div>
        
    
    </div>
<div class="kc-elm kc-css-191378 kc_col-sm-12 vnt_slick slick-initialized slick-slider slick-dotted" data-slick="{&quot;slidesToShow&quot;: 5,  &quot;slidesToScroll&quot;: 3, &quot;centerMode&quot;: false, &quot;variableWidth&quot;: false, &quot;dots&quot;: true, &quot;arrows&quot;: false, &quot;autoplay&quot;: true,  &quot;autoplaySpeed&quot;: 10000, &quot;infinite&quot;: true, &quot;adaptiveHeight&quot;: false ,  &quot;rows&quot;: 0, &quot;responsive&quot;:[{&quot;breakpoint&quot;: 1024, &quot;settings&quot;:{&quot;slidesToShow&quot;: 4, &quot;slidesToScroll&quot;: 1}}, {&quot;breakpoint&quot;: 767, &quot;settings&quot;:{&quot;slidesToShow&quot;: 3, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: false, &quot;fade&quot;: false}}, {&quot;breakpoint&quot;: 480, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1}}]}">
    <div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 6325px; transform: translate3d(-3025px, 0px, 0px);"><div class="kc-elm kc-css-298864 slick_item slick-slide slick-cloned" data-slick-index="-5" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-491352 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/0a5ca41d33e9fcb7a5f8-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độ Hoàn Thiện Sản Phẩm Tuyệt Đối </div>    <div class="desc"><p>Cam kết chất lượng vượt trội, bền bỉ</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/0a5ca41d33e9fcb7a5f8.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-234051 slick_item slick-slide slick-cloned" data-slick-index="-4" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-355450 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/a23be679718dbed3e79c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độc - Lạ - Chất</div>    <div class="desc">Sản phẩm phù hợp với cá tính của riêng bạn 
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/a23be679718dbed3e79c.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-799257 slick_item slick-slide slick-cloned" data-slick-index="-3" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-340932 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/IMG-7969-scaled-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sản Phẩm Cực Chất</div>    <div class="desc"><p>Chỉ có tại G-Watch</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/IMG-7969-scaled.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-240427 slick_item slick-slide slick-cloned" data-slick-index="-2" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-114557 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/12fd4db3da4715194c56-370x210xc.jpg" alt="">
    </div>
        <div class="title">Địa Điểm Mua Hàng Tin Cậy</div>    <div class="desc"><p>Showroom tại TP.HCM luôn sẵn lòng phục vụ quý khách hàng&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/12fd4db3da4715194c56.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-387364 slick_item slick-slide slick-cloned" data-slick-index="-1" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="item"></div></div><div class="kc-elm kc-css-78721 slick_item slick-slide" data-slick-index="0" aria-hidden="true" role="tabpanel" id="slick-slide20" style="width: 259px;" tabindex="-1" aria-describedby="slick-slide-control20"><div class="kc-elm kc-css-166268 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/eddc4f45d7b618e841a7-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sự Hài Lòng Của Quý Khách Hàng</div>    <div class="desc">Giá cả phải chăng - Tư vấn tận tâm
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/eddc4f45d7b618e841a7.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-727647 slick_item slick-slide" data-slick-index="1" aria-hidden="true" role="tabpanel" id="slick-slide21" style="width: 259px;" tabindex="-1"><div class="kc-elm kc-css-250101 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/bedb5e8b421d8d43d40c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Giao hàng tận nơi !! </div>    <div class="desc"><p>Check hàng, hướng dẫn sự dụng chi tiết&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/bedb5e8b421d8d43d40c.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-913559 slick_item slick-slide" data-slick-index="2" aria-hidden="true" role="tabpanel" id="slick-slide22" style="width: 259px;" tabindex="-1"><div class="kc-elm kc-css-193201 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/d958ad2db1bb7ee527aa.jpg" alt="">
    </div>
        <div class="title">Mẫu Mã Đa Dạng</div>    <div class="desc"><p>Đáp ưng mọi nhu cầu của quý khách hàng&nbsp;</p>
</div>        	
    <a data-fancybox="" href="./templates/css/d958ad2db1bb7ee527aa.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-684814 slick_item slick-slide" data-slick-index="3" aria-hidden="true" role="tabpanel" id="slick-slide23" style="width: 259px;" aria-describedby="slick-slide-control21" tabindex="-1"><div class="kc-elm kc-css-287593 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/ae8833d6a4226b7c3233-370x210xc.jpg" alt="">
    </div>
        <div class="title">Chính Sách Ưu Đãi Số 1 </div>    <div class="desc"><p>Mức giá tuyệt vời cho khách hàng của G-Watch</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/ae8833d6a4226b7c3233.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-298864 slick_item slick-slide" data-slick-index="4" aria-hidden="true" role="tabpanel" id="slick-slide24" style="width: 259px;" tabindex="-1"><div class="kc-elm kc-css-491352 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/0a5ca41d33e9fcb7a5f8-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độ Hoàn Thiện Sản Phẩm Tuyệt Đối </div>    <div class="desc"><p>Cam kết chất lượng vượt trội, bền bỉ</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/0a5ca41d33e9fcb7a5f8.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-234051 slick_item slick-slide" data-slick-index="5" aria-hidden="true" role="tabpanel" id="slick-slide25" style="width: 259px;" tabindex="-1"><div class="kc-elm kc-css-355450 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/a23be679718dbed3e79c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độc - Lạ - Chất</div>    <div class="desc">Sản phẩm phù hợp với cá tính của riêng bạn 
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/a23be679718dbed3e79c.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-799257 slick_item slick-slide slick-current slick-active" data-slick-index="6" aria-hidden="false" role="tabpanel" id="slick-slide26" style="width: 259px;" aria-describedby="slick-slide-control22"><div class="kc-elm kc-css-340932 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/IMG-7969-scaled-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sản Phẩm Cực Chất</div>    <div class="desc"><p>Chỉ có tại G-Watch</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/IMG-7969-scaled.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-240427 slick_item slick-slide slick-active" data-slick-index="7" aria-hidden="false" role="tabpanel" id="slick-slide27" style="width: 259px;"><div class="kc-elm kc-css-114557 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/12fd4db3da4715194c56-370x210xc.jpg" alt="">
    </div>
        <div class="title">Địa Điểm Mua Hàng Tin Cậy</div>    <div class="desc"><p>Showroom tại TP.HCM luôn sẵn lòng phục vụ quý khách hàng&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/12fd4db3da4715194c56.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-387364 slick_item slick-slide slick-active" data-slick-index="8" aria-hidden="false" role="tabpanel" id="slick-slide28" style="width: 259px;"><div class="item"></div></div><div class="kc-elm kc-css-78721 slick_item slick-slide slick-cloned slick-active" data-slick-index="9" id="" aria-hidden="false" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-166268 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/eddc4f45d7b618e841a7-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sự Hài Lòng Của Quý Khách Hàng</div>    <div class="desc">Giá cả phải chăng - Tư vấn tận tâm
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/eddc4f45d7b618e841a7.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-727647 slick_item slick-slide slick-cloned slick-active" data-slick-index="10" id="" aria-hidden="false" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-250101 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/bedb5e8b421d8d43d40c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Giao hàng tận nơi !! </div>    <div class="desc"><p>Check hàng, hướng dẫn sự dụng chi tiết&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/bedb5e8b421d8d43d40c.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-913559 slick_item slick-slide slick-cloned" data-slick-index="11" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-193201 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/d958ad2db1bb7ee527aa.jpg" alt="">
    </div>
        <div class="title">Mẫu Mã Đa Dạng</div>    <div class="desc"><p>Đáp ưng mọi nhu cầu của quý khách hàng&nbsp;</p>
</div>        	
    <a data-fancybox="" href="${contextPath }/images/d958ad2db1bb7ee527aa.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-684814 slick_item slick-slide slick-cloned" data-slick-index="12" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-287593 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/ae8833d6a4226b7c3233-370x210xc.jpg" alt="">
    </div>
        <div class="title">Chính Sách Ưu Đãi Số 1 </div>    <div class="desc"><p>Mức giá tuyệt vời cho khách hàng của G-Watch</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/ae8833d6a4226b7c3233.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-298864 slick_item slick-slide slick-cloned" data-slick-index="13" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-491352 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/0a5ca41d33e9fcb7a5f8-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độ Hoàn Thiện Sản Phẩm Tuyệt Đối </div>    <div class="desc"><p>Cam kết chất lượng vượt trội, bền bỉ</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/0a5ca41d33e9fcb7a5f8.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-234051 slick_item slick-slide slick-cloned" data-slick-index="14" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-355450 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/a23be679718dbed3e79c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độc - Lạ - Chất</div>    <div class="desc">Sản phẩm phù hợp với cá tính của riêng bạn 
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/a23be679718dbed3e79c.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-799257 slick_item slick-slide slick-cloned" data-slick-index="15" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-340932 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/IMG-7969-scaled-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sản Phẩm Cực Chất</div>    <div class="desc"><p>Chỉ có tại G-Watch</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/IMG-7969-scaled.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-240427 slick_item slick-slide slick-cloned" data-slick-index="16" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-114557 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/12fd4db3da4715194c56-370x210xc.jpg" alt="">
    </div>
        <div class="title">Địa Điểm Mua Hàng Tin Cậy</div>    <div class="desc"><p>Showroom tại TP.HCM luôn sẵn lòng phục vụ quý khách hàng&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/12fd4db3da4715194c56.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-387364 slick_item slick-slide slick-cloned" data-slick-index="17" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="item"></div></div></div></div><ul class="slick-dots" style="" role="tablist"><li class="" role="presentation"><button type="button" role="tab" class="dots" id="slick-slide-control20" aria-controls="slick-slide20" aria-label="1 of 2" tabindex="-1"></button></li><li role="presentation" class=""><button type="button" role="tab" class="dots" id="slick-slide-control21" aria-controls="slick-slide23" aria-label="2 of 2" tabindex="-1"></button></li><li role="presentation" class="slick-active"><button type="button" role="tab" class="dots" id="slick-slide-control22" aria-controls="slick-slide26" aria-label="3 of 2" tabindex="-1"></button></li></ul></div>


    </section>



<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-542146{width: 50%;}body.kc-css-system .kc-css-383299{width: 50%;}body.kc-css-system .kc-css-183404{width: 40%;}body.kc-css-system .kc-css-8168{width: 20%;}body.kc-css-system .kc-css-681413{width: 20%;}body.kc-css-system .kc-css-567871{width: 20%;}}body.kc-css-system .kc-css-294102{background: #ee1a26;padding-top: 10px;padding-bottom: 10px;}body.kc-css-system .kc-css-294102 >.kc-container{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-652455 .type{color: #ffffff;font-size: 14px;font-weight: 600;text-transform: uppercase;}body.kc-css-system .kc-css-652455{width: 50%;}body.kc-css-system .kc-css-874180{width: 50%;}body.kc-css-system .kc-css-921585{background: #000000;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-921585 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-229334 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-229334 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-229334{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-217143 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-217143 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-217143{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-494534 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-494534 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-494534{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-820481 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-820481 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-820481{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-224882 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-224882 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-224882 .sub{color: #ee1a26;font-size: 24px;font-weight: 700;}body.kc-css-system .kc-css-224882{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-133168 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-133168 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-133168{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-270365 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-767782{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-767782 a{color: #aeaeae;}body.kc-css-system .kc-css-767782 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-767782 p{margin-bottom: 10px;}body.kc-css-system .kc-css-273605 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-908476{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-908476 a{color: #aeaeae;}body.kc-css-system .kc-css-908476 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-908476 p{margin-bottom: 10px;}body.kc-css-system .kc-css-330280 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-217626{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-217626 a{color: #aeaeae;}body.kc-css-system .kc-css-217626 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-217626 p{margin-bottom: 10px;}body.kc-css-system .kc-css-261744 i{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-261744 .item{display: flex;width: 36px;height: 36px;background: #ee1a26;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-261744{display: flex;}body.kc-css-system .kc-css-42241 .icon{display: flex;width: 40px;height: 40px;background: #ffffff;border-radius: 100% 100% 100% 100%;color: #ee1a26;font-size: 24px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-42241:hover .icon{color: #ee1a26;}body.kc-css-system .kc-css-42241 .type{font-weight: 600;margin-left: 10px;}body.kc-css-system .kc-css-42241{position: fixed;display: flex;background: rgba(238, 26, 38, 0.75);border-radius: 25px 25px 25px 25px;padding: 3px 3px 3px 3px;align-items: center;width: auto;bottom: 40px;left: 10px;z-index: 99;box-shadow: 0 0 5px #ddd;animation-duration: 500ms; animation-name: calllink; animation-iteration-count: infinite; animation-direction: alternate;}body.kc-css-system .kc-css-130685 .thumb img{height: 80px;}body.kc-css-system .kc-css-130685{position: fixed;width: auto;bottom: 120px;right: 10px;z-index: 89;}body.kc-css-system .kc-css-235194 i{color: #ffffff;font-size: 24px;line-height: 24px;}body.kc-css-system .kc-css-235194 .thumb img{height: 80px;}body.kc-css-system .kc-css-235194 .item{padding: 9px 15px 9px 15px;margin-bottom: 1px;}body.kc-css-system .kc-css-235194 .item:hover{background: #000000;}body.kc-css-system .kc-css-235194 .item:first-child{border-top-right-radius: 10px;}body.kc-css-system .kc-css-235194 .item:last-child{border-bottom-right-radius: 10px;}body.kc-css-system .kc-css-235194{position: fixed;background: #ee1a26;border-top-right-radius: 10px;border-bottom-right-radius: 10px;width: auto;bottom: 120px;left: 0;z-index: 89;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-42241{bottom: 120px;}body.kc-css-system .kc-css-130685{bottom: 90px;}body.kc-css-system .kc-css-235194{display: none;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-652455{width: 100%;}body.kc-css-system .kc-css-874180{width: 100%;margin-top: 15px;}body.kc-css-system .kc-css-8168{margin-top: 20px;}body.kc-css-system .kc-css-681413{margin-top: 20px;}body.kc-css-system .kc-css-567871{margin-top: 20px;}body.kc-css-system .kc-css-261744{margin-top: 20px;}body.kc-css-system .kc-css-130685 .thumb img{height: 60px;}body.kc-css-system .kc-css-235194 .thumb img{height: 60px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-229334 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-217143 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-494534 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-820481 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-133168 .type{font-size: 14px;line-height: 20px;}}</style>