<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-26183{width: 70%;}body.kc-css-system .kc-css-939157{width: 30%;}}body.kc-css-system .kc-css-900236{padding-top: 30px;padding-bottom: 30px;}body.kc-css-system .kc-css-751984{text-align: center;}body.kc-css-system .kc-css-720299 .type{font-size: 30px;line-height: 42px;font-weight: 600;text-align: center;}body.kc-css-system .kc-css-720299{;margin-top: 30px;}body.kc-css-system .kc-css-498031 .icon{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-498031{position: fixed;display: none;width: 36px;height: 36px;background: #f97e6c;border-top-left-radius: 5px;border-bottom-left-radius: 5px;justify-content: center;align-items: center;top: 40%;right: 0;z-index: 10;}body.kc-css-system .kc-css-448206{background: #f7f7f7;display: flex;width: 100%;margin-top: 30px;margin-right: 0px;margin-left: 0px;padding-right: 15px;border-radius: 4px 4px 4px 4px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-26183{display: flex;width: 100%;padding-left: 0px;flex: 1;}body.kc-css-system .kc-css-541136 .icon{color: #dd3333;font-size: 24px;}body.kc-css-system .kc-css-541136{position: absolute;display: none;width: 36px;height: 36px;justify-content: center;align-items: center;top: 10px;right: 10px;z-index: 10;}body.kc-css-system .kc-css-940477 .widgettitle:hover{color: #ee1a26;}body.kc-css-system .kc-css-940477 .widgettitle{font-size: 16px;line-height: 46px;font-weight: 600;padding-top: 0px;padding-bottom: 0px;margin: 0px 0px 0px 0px;}body.kc-css-system .kc-css-940477{margin-right: 30px;padding-right: 15px;padding-left: 15px;width: auto;}body.kc-css-system .kc-css-137267 .widgettitle:hover{color: #ee1a26;}body.kc-css-system .kc-css-137267 .widgettitle{font-size: 16px;line-height: 46px;font-weight: 600;padding-top: 0px;padding-bottom: 0px;margin: 0px 0px 0px 0px;}body.kc-css-system .kc-css-137267{display: none;margin-right: 30px;padding-right: 15px;padding-left: 15px;width: auto;}body.kc-css-system .kc-css-492227{width: auto;}body.kc-css-system .kc-css-803886 .title{width: 100%;font-size: 16px;font-weight: 500;text-align: center;margin-top: 10px;margin-bottom: 5px;}body.kc-css-system .kc-css-803886 .price{display: flex;width: 100%;color: #ee1a26;font-size: 16px;font-weight: 600;padding-right: 5px;padding-left: 5px;flex-flow: wrap;justify-content: center;align-items: center;}body.kc-css-system .kc-css-803886 .price del{color: #aeaeae;font-size: 12px;font-weight: 400;margin-right: 10px;margin-left: 10px;}body.kc-css-system .kc-css-803886 .item{display: flex;background: #ffffff;padding-bottom: 8px;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-803886{display: grid;margin-top: 30px;grid-template-columns: repeat(4, 1fr);grid-gap: 15px;grid-row-gap: 30px;}body.kc-css-system .kc-css-716495{display: flex;padding-top: 30px;padding-bottom: 30px;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-994671 .type{width: 100%;font-size: 30px;line-height: 42px;font-weight: 600;text-transform: uppercase;text-align: center;}body.kc-css-system .kc-css-994671 .sub{width: 90px;height: 2px;background: #ee1a26;margin-top: 15px;}body.kc-css-system .kc-css-994671 .cont{width: 100%;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-994671{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-391273{width: 100%;max-width: 1170px;padding-right: 15px;padding-left: 15px;margin-top: 30px;}body.kc-css-system .kc-css-391273 .slick-list{margin-right: -10px;margin-left: -10px;}body.kc-css-system .kc-css-391273 .slick-slide{margin-right: 10px;margin-left: 10px;}body.kc-css-system .kc-css-979947 .icon{color: #ee1a26;}body.kc-css-system .kc-css-979947 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-979947 .thumb img,body.kc-css-system .kc-css-979947 .thumb svg{display: block;}body.kc-css-system .kc-css-979947:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-979947 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-979947{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-9262 .icon{color: #ee1a26;}body.kc-css-system .kc-css-9262 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-9262 .thumb img,body.kc-css-system .kc-css-9262 .thumb svg{display: block;}body.kc-css-system .kc-css-9262:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-9262 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-9262{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-390209 .icon{color: #ee1a26;}body.kc-css-system .kc-css-390209 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-390209 .thumb img,body.kc-css-system .kc-css-390209 .thumb svg{display: block;}body.kc-css-system .kc-css-390209:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-390209 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-390209{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-73527 .icon{color: #ee1a26;}body.kc-css-system .kc-css-73527 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-73527 .thumb img,body.kc-css-system .kc-css-73527 .thumb svg{display: block;}body.kc-css-system .kc-css-73527:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-73527 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-73527{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-683255 .icon{color: #ee1a26;}body.kc-css-system .kc-css-683255 .thumb{width: 100%;margin-bottom: 10px;}body.kc-css-system .kc-css-683255 .thumb img,body.kc-css-system .kc-css-683255 .thumb svg{display: block;}body.kc-css-system .kc-css-683255:hover .type{color: #ee1a26;}body.kc-css-system .kc-css-683255 .type{font-weight: 600;margin-right: 10px;}body.kc-css-system .kc-css-683255{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-87768{background: #fcf8f4;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-376027 .type{width: 100%;font-size: 30px;line-height: 42px;font-weight: 600;text-transform: uppercase;text-align: center;}body.kc-css-system .kc-css-376027 .sub{width: 90px;height: 2px;background: #ee1a26;margin-top: 15px;}body.kc-css-system .kc-css-376027 .cont{width: 100%;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-376027{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-191378{margin-top: 20px;}body.kc-css-system .kc-css-191378 .slick-list{margin-right: -8px;margin-left: -8px;}body.kc-css-system .kc-css-191378 .slick-slide{margin-right: 8px;margin-left: 8px;}body.kc-css-system .kc-css-166268 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-166268 .desc{text-align: center;}body.kc-css-system .kc-css-250101 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-250101 .desc{text-align: center;}body.kc-css-system .kc-css-287593 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-287593 .desc{text-align: center;}body.kc-css-system .kc-css-491352 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-491352 .desc{text-align: center;}body.kc-css-system .kc-css-355450 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-355450 .desc{text-align: center;}body.kc-css-system .kc-css-340932 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-340932 .desc{text-align: center;}body.kc-css-system .kc-css-114557 .title{font-weight: 600;text-align: center;}body.kc-css-system .kc-css-114557 .desc{text-align: center;}@media only screen and (max-width: 900px){body.kc-css-system .kc-css-803886 .item{width: calc(100vw/3 - 21px);}body.kc-css-system .kc-css-803886{overflow-x: auto;}}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-498031{display: flex;}body.kc-css-system .kc-css-541136{display: flex;}body.kc-css-system .kc-css-87768{padding-right: 10px;padding-left: 10px;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-720299 .type{font-size: 24px;line-height: 30px;}body.kc-css-system .kc-css-448206{margin-top: 0px;padding-right: 0px;padding-bottom: 15px;flex-flow: wrap;}body.kc-css-system .kc-css-26183{padding-right: 0px;flex-flow: wrap;flex: inherit;}body.kc-css-system .kc-css-940477{width: 100%;margin-right: 0px;}body.kc-css-system .kc-css-137267{width: 100%;margin-right: 0px;}body.kc-css-system .kc-css-492227{padding-left: 15px;margin-top: 15px;}body.kc-css-system .kc-css-803886 .item{width: 100%;}body.kc-css-system .kc-css-803886{grid-template-columns: repeat(2, 1fr);}body.kc-css-system .kc-css-994671 .type{font-size: 24px;}body.kc-css-system .kc-css-994671 .sub{margin-top: 5px;}body.kc-css-system .kc-css-376027 .type{font-size: 24px;}body.kc-css-system .kc-css-376027 .sub{margin-top: 5px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-376027 .type{font-size: 20px;}}</style>
    	<div class="kc-elm kc-css-801333 vnt_editor">
</div>




    <section id="main_product_archive" class="kc-elm kc-css-900236 kc_row vnt_section hide_col">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-751984 vnt_editor">
<span><span><a href="https://gshockvn.net/">Trang chủ</a></span> » <span><a href="https://gshockvn.net/danh-muc-san-pham/dong-ho-nam/">Đồng hồ nam</a></span> » <span class="breadcrumb_last" aria-current="page">G-Shock</span></span></div>

<div class="kc-elm kc-css-720299 vnt_title">
        
        <h1 class="type">G-Shock</h1>
        
    
    </div>
<style type="text/css">body.kc-css-system .kc-css-85203{max-width: 1170px;border: 1px solid #dcdcdc;border-radius: 5px 5px 5px 5px;padding: 10px 15px 10px 15px;margin-top: 20px;}body.kc-css-system .kc-css-448774 .thumb img,body.kc-css-system .kc-css-448774 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-448774 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-448774 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-448774{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-441933 .thumb img,body.kc-css-system .kc-css-441933 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-441933 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-441933 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-441933{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-271215 .thumb img,body.kc-css-system .kc-css-271215 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-271215 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-271215 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-271215{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-576134 .thumb img,body.kc-css-system .kc-css-576134 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-576134 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-576134 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-576134{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-577071 .thumb img,body.kc-css-system .kc-css-577071 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-577071 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-577071 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-577071{display: flex;flex-flow: wrap;justify-content: center;}body.kc-css-system .kc-css-846483 .thumb img,body.kc-css-system .kc-css-846483 .thumb svg{max-height: 36px;}body.kc-css-system .kc-css-846483 .type{width: 100%;font-size: 16px;font-weight: 600;text-align: center;margin-top: 10px;}body.kc-css-system .kc-css-846483 .sub{font-size: 13px;line-height: 16px;}body.kc-css-system .kc-css-846483{display: flex;flex-flow: wrap;justify-content: center;}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-448774 .type{font-size: 13px;}body.kc-css-system .kc-css-441933 .type{font-size: 13px;}body.kc-css-system .kc-css-271215 .type{font-size: 13px;}body.kc-css-system .kc-css-576134 .type{font-size: 13px;}body.kc-css-system .kc-css-577071 .type{font-size: 13px;}body.kc-css-system .kc-css-846483 .type{font-size: 13px;}}</style>
    	<div class="kc-elm kc-css-85203 kc_col-sm-12 vnt_slick slick-initialized slick-slider" data-slick="{&quot;slidesToShow&quot;: 6,  &quot;slidesToScroll&quot;: 3, &quot;centerMode&quot;: false, &quot;variableWidth&quot;: false, &quot;dots&quot;: false, &quot;arrows&quot;: true, &quot;autoplay&quot;: true,  &quot;autoplaySpeed&quot;: 10000, &quot;infinite&quot;: true, &quot;adaptiveHeight&quot;: false ,  &quot;rows&quot;: 0, &quot;responsive&quot;:[{&quot;breakpoint&quot;: 1024, &quot;settings&quot;:{&quot;slidesToShow&quot;: 5, &quot;slidesToScroll&quot;: 1}}, {&quot;breakpoint&quot;: 767, &quot;settings&quot;:{&quot;slidesToShow&quot;: 4, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: false, &quot;fade&quot;: false}}, {&quot;breakpoint&quot;: 480, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1}}]}">
    <div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 1110px; transform: translate3d(0px, 0px, 0px);"><div class="kc-elm kc-css-744250 slick_item slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 185px;">
<div class="kc-elm kc-css-448774 vnt_title current">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/genuine-casio-g-shock-limited-quantity-offer-price-netpay-davis-1509-25-davis-1.jpeg" alt="ĐỒNG HỒ G-SHOCK"></div>
<div class="type">ĐỒNG HỒ G-SHOCK</div>
<span class="sub">100+ sản phẩm</span>
<a href="https://gshockvn.net/danh-muc-san-pham/g-shock/" class="link " title="" tabindex="0"></a>        
    
    </div>
</div><div class="kc-elm kc-css-201289 slick_item slick-slide slick-active" data-slick-index="1" aria-hidden="false" style="width: 185px;">
<div class="kc-elm kc-css-441933 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/casio-babyg-logo-e76e96dd75-seeklogo-com.png" alt="ĐỒNG HỒ BABY-G"></div>
<div class="type">ĐỒNG HỒ BABY-G</div>
<span class="sub">100+ sản phẩm</span>
<a href="https://gshockvn.net/danh-muc-san-pham/baby-g/" class="link " title="" tabindex="0"></a>        
    
    </div>
</div><div class="kc-elm kc-css-344414 slick_item slick-slide slick-active" data-slick-index="2" aria-hidden="false" style="width: 185px;">
<div class="kc-elm kc-css-271215 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/edifice-logo-e0ca37ee91-seeklogo-com.png" alt="ĐỒNG HỒ CASIO EDIFICE"></div>
<div class="type">ĐỒNG HỒ CASIO EDIFICE</div>
<span class="sub">80+ sản phẩm</span>
<a href="https://gshockvn.net/danh-muc-san-pham/edifice/" class="link " title="" tabindex="0"></a>        
    
    </div>
</div><div class="kc-elm kc-css-670876 slick_item slick-slide slick-active" data-slick-index="3" aria-hidden="false" style="width: 185px;">
<div class="kc-elm kc-css-576134 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/casio-logo.png" alt="ĐỒNG HỒ CASIO"></div>
<div class="type">ĐỒNG HỒ CASIO</div>
<span class="sub">50+ sản phẩm</span>
        
    
    </div>
</div><div class="kc-elm kc-css-358529 slick_item slick-slide slick-active" data-slick-index="4" aria-hidden="false" style="width: 185px;">
<div class="kc-elm kc-css-577071 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/244546245-170977515194108-9009002479648063934-n.jpeg" alt="PHỤ KIỆN G-SHOCK"></div>
<div class="type">PHỤ KIỆN G-SHOCK</div>
<span class="sub">30+ sản phẩm</span>
        
    
    </div>
</div><div class="kc-elm kc-css-692360 slick_item slick-slide slick-active" data-slick-index="5" aria-hidden="false" style="width: 185px;">
<div class="kc-elm kc-css-846483 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/tai-xuong.png" alt="ĐỒNG HỒ NỮ"></div>
<div class="type">ĐỒNG HỒ NỮ</div>
<span class="sub">100+ sản phẩm</span>
        
    
    </div>
</div></div></div></div>




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
<div class="widget woocommerce widget_product_categories kc-elm kc-css-940477 pcat_filter"><h2 class="widgettitle">Bộ sưu tập</h2><ul class="product-categories"><li class="cat-item cat-item-19"><a href="https://gshockvn.net/danh-muc-san-pham/phu-kien-nu/">Phụ kiện nữ</a> <span class="count">(5)</span></li>
<li class="cat-item cat-item-23"><a href="https://gshockvn.net/danh-muc-san-pham/mudmaster/">Mudmaster</a> <span class="count">(14)</span></li>
<li class="cat-item cat-item-24"><a href="https://gshockvn.net/danh-muc-san-pham/baby-g/">Baby-G</a> <span class="count">(105)</span></li>
<li class="cat-item cat-item-26"><a href="https://gshockvn.net/danh-muc-san-pham/edifice/">Edifice</a> <span class="count">(37)</span></li>
<li class="cat-item cat-item-28"><a href="https://gshockvn.net/danh-muc-san-pham/g-steel/">G-Steel</a> <span class="count">(61)</span></li>
<li class="cat-item cat-item-29"><a href="https://gshockvn.net/danh-muc-san-pham/gravity-master/">Gravity Master</a> <span class="count">(19)</span></li>
<li class="cat-item cat-item-32"><a href="https://gshockvn.net/danh-muc-san-pham/ga-2100-ap-royal-oak/">GA-2100 AP Royal Oak</a> <span class="count">(121)</span></li>
<li class="cat-item cat-item-33"><a href="https://gshockvn.net/danh-muc-san-pham/vintage-casio/">Vintage Casio</a> <span class="count">(0)</span></li>
<li class="cat-item cat-item-16 cat-parent current-cat-parent"><a href="https://gshockvn.net/danh-muc-san-pham/dong-ho-nam/">Đồng hồ nam</a> <span class="count">(299)</span><ul class="children">
<li class="cat-item cat-item-27 current-cat"><a href="https://gshockvn.net/danh-muc-san-pham/dong-ho-nam/g-shock/">G-Shock</a> <span class="count">(299)</span></li>
</ul>
</li>
<li class="cat-item cat-item-34"><a href="https://gshockvn.net/danh-muc-san-pham/day-vo-ga-2100-ap-royal-oak/">Dây vỏ GA-2100 AP Royal Oak</a> <span class="count">(8)</span></li>
<li class="cat-item cat-item-17"><a href="https://gshockvn.net/danh-muc-san-pham/dong-ho-nu/">Đồng hồ nữ</a> <span class="count">(0)</span></li>
</ul></div>	</div>
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
        
    <div class="kc-elm product item item_1 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2100-1a-ap-royal-oak-diamond/" title="GA-2100-1A AP ROYAL OAK (DIAMOND)"><img src="${contextPath }/images/278842780_739629647050549_6791209416866595518_n-300x300.jpg" alt="GA-2100-1A AP ROYAL OAK (DIAMOND)"></a><a href="https://gshockvn.net/san-pham/ga-2100-1a-ap-royal-oak-diamond/" data-product_id="3529" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3529" data-product_id="3529" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>1.800.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2100-1A AP ROYAL OAK (DIAMOND)"><a href="https://gshockvn.net/san-pham/ga-2100-1a-ap-royal-oak-diamond/" title="GA-2100-1A AP ROYAL OAK (DIAMOND)">GA-2100-1A AP ROYAL OAK (DIAMOND)</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>7.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>6.199.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-23%</div></div>		    </div>
        
    <div class="kc-elm product item item_2 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2100hc-4a/" title="GA-2100HC-4A"><img src="${contextPath }/images/GA-2100HC-4A-300x300.png" alt="GA-2100HC-4A"></a><a href="https://gshockvn.net/san-pham/ga-2100hc-4a/" data-product_id="3509" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3509" data-product_id="3509" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>748.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2100HC-4A"><a href="https://gshockvn.net/san-pham/ga-2100hc-4a/" title="GA-2100HC-4A">GA-2100HC-4A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.637.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.889.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-21%</div></div>		    </div>
        
    <div class="kc-elm product item item_3 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2100hc-2a/" title="GA-2100HC-2A"><img src="${contextPath }/images/GA-2100HC-2A-300x300.png" alt="GA-2100HC-2A"></a><a href="https://gshockvn.net/san-pham/ga-2100hc-2a/" data-product_id="3504" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3504" data-product_id="3504" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>748.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2100HC-2A"><a href="https://gshockvn.net/san-pham/ga-2100hc-2a/" title="GA-2100HC-2A">GA-2100HC-2A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.637.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.889.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-21%</div></div>		    </div>
        
    <div class="kc-elm product item item_4 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2100vb-1a/" title="GA-2100VB-1A"><img src="${contextPath }/images/GA-2100VB-1A-300x300.png" alt="GA-2100VB-1A"></a><a href="https://gshockvn.net/san-pham/ga-2100vb-1a/" data-product_id="3499" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3499" data-product_id="3499" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>748.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2100VB-1A"><a href="https://gshockvn.net/san-pham/ga-2100vb-1a/" title="GA-2100VB-1A">GA-2100VB-1A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.637.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.889.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-21%</div></div>		    </div>
        
    <div class="kc-elm product item item_5 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2110et-8a/" title="GA-2110ET-8A"><img src="${contextPath }/images/GA-2110ET-8A-300x300.png" alt="GA-2110ET-8A"></a><a href="https://gshockvn.net/san-pham/ga-2110et-8a/" data-product_id="3495" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3495" data-product_id="3495" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>848.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2110ET-8A"><a href="https://gshockvn.net/san-pham/ga-2110et-8a/" title="GA-2110ET-8A">GA-2110ET-8A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.937.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>3.089.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-22%</div></div>		    </div>
        
    <div class="kc-elm product item item_6 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2110et-2a/" title="GA-2110ET-2A"><img src="${contextPath }/images/GA-2110ET-2A-300x300.png" alt="GA-2110ET-2A"></a><a href="https://gshockvn.net/san-pham/ga-2110et-2a/" data-product_id="3489" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3489" data-product_id="3489" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>848.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2110ET-2A"><a href="https://gshockvn.net/san-pham/ga-2110et-2a/" title="GA-2110ET-2A">GA-2110ET-2A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.937.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>3.089.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-22%</div></div>		    </div>
        
    <div class="kc-elm product item item_7 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2100ca-8a/" title="GA-2100CA-8A"><img src="${contextPath }/images/GA-2100CA-8A-300x300.png" alt="GA-2100CA-8A"></a><a href="https://gshockvn.net/san-pham/ga-2100ca-8a/" data-product_id="3484" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3484" data-product_id="3484" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>748.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2100CA-8A"><a href="https://gshockvn.net/san-pham/ga-2100ca-8a/" title="GA-2100CA-8A">GA-2100CA-8A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.737.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.989.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-20%</div></div>		    </div>
        
    <div class="kc-elm product item item_8 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gma-s2100-7a/" title="GMA-S2100-7A"><img src="${contextPath }/images/GMA-S2100-7A-300x300.png" alt="GMA-S2100-7A"></a><a href="https://gshockvn.net/san-pham/gma-s2100-7a/" data-product_id="3478" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3478" data-product_id="3478" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>458.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GMA-S2100-7A"><a href="https://gshockvn.net/san-pham/gma-s2100-7a/" title="GMA-S2100-7A">GMA-S2100-7A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.357.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.899.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-14%</div></div>		    </div>
        
    <div class="kc-elm product item item_9 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gma-s2100-1a/" title="GMA-S2100-1A"><img src="${contextPath }/images/GMA-S2100-1A-300x300.png" alt="GMA-S2100-1A"></a><a href="https://gshockvn.net/san-pham/gma-s2100-1a/" data-product_id="3473" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3473" data-product_id="3473" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>458.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GMA-S2100-1A"><a href="https://gshockvn.net/san-pham/gma-s2100-1a/" title="GMA-S2100-1A">GMA-S2100-1A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.357.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.899.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-14%</div></div>		    </div>
        
    <div class="kc-elm product item item_10 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gma-s2100-4a2/" title="GMA-S2100-4A2"><img src="${contextPath }/images/GMA-S2100-4A2-300x300.png" alt="GMA-S2100-4A2"></a><a href="https://gshockvn.net/san-pham/gma-s2100-4a2/" data-product_id="3467" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3467" data-product_id="3467" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>458.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GMA-S2100-4A2"><a href="https://gshockvn.net/san-pham/gma-s2100-4a2/" title="GMA-S2100-4A2">GMA-S2100-4A2</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.357.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.899.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-14%</div></div>		    </div>
        
    <div class="kc-elm product item item_11 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gma-s2100-4a/" title="GMA-S2100-4A"><img src="${contextPath }/images/GMA-S2100-4A-300x300.png" alt="GMA-S2100-4A"></a><a href="https://gshockvn.net/san-pham/gma-s2100-4a/" data-product_id="3461" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3461" data-product_id="3461" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>458.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GMA-S2100-4A"><a href="https://gshockvn.net/san-pham/gma-s2100-4a/" title="GMA-S2100-4A">GMA-S2100-4A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>3.357.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>2.899.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-14%</div></div>		    </div>
        
    <div class="kc-elm product item item_12 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gwg-2000-1a1/" title="GWG-2000-1A1"><img src="${contextPath }/images/Casio-G-Shock-GWG-200-1A1-Black-300x300.jpg" alt="GWG-2000-1A1"></a><a href="https://gshockvn.net/san-pham/gwg-2000-1a1/" data-product_id="3457" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3457" data-product_id="3457" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>6.500.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GWG-2000-1A1"><a href="https://gshockvn.net/san-pham/gwg-2000-1a1/" title="GWG-2000-1A1">GWG-2000-1A1</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>26.498.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>19.998.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-25%</div></div>		    </div>
        
    <div class="kc-elm product item item_13 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2100-1a-ap-royal-oak-diamond-2/" title="GA-2100-1A AP ROYAL OAK DIAMOND"><img src="${contextPath }/images/273025905_1836153479912799_1751933967538058891_n-300x300.jpg" alt="GA-2100-1A AP ROYAL OAK DIAMOND"></a><a href="https://gshockvn.net/san-pham/ga-2100-1a-ap-royal-oak-diamond-2/" data-product_id="3361" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3361" data-product_id="3361" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>1.000.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2100-1A AP ROYAL OAK DIAMOND"><a href="https://gshockvn.net/san-pham/ga-2100-1a-ap-royal-oak-diamond-2/" title="GA-2100-1A AP ROYAL OAK DIAMOND">GA-2100-1A AP ROYAL OAK DIAMOND</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>7.199.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>6.199.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-14%</div></div>		    </div>
        
    <div class="kc-elm product item item_14 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/ga-2100-1a1-ap-royal-oak-diamond/" title="GA-2100-1A1 AP ROYAL OAK (DIAMOND)"><img src="${contextPath }/images/272827433_1836152373246243_61879198662350425_n-300x300.jpg" alt="GA-2100-1A1 AP ROYAL OAK (DIAMOND)"></a><a href="https://gshockvn.net/san-pham/ga-2100-1a1-ap-royal-oak-diamond/" data-product_id="3359" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=3359" data-product_id="3359" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>1.000.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GA-2100-1A1 AP ROYAL OAK (DIAMOND)"><a href="https://gshockvn.net/san-pham/ga-2100-1a1-ap-royal-oak-diamond/" title="GA-2100-1A1 AP ROYAL OAK (DIAMOND)">GA-2100-1A1 AP ROYAL OAK (DIAMOND)</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>7.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>6.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-13%</div></div>		    </div>
        
    <div class="kc-elm product item item_15 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b400ad-1a4dr/" title="GST-B400AD-1A4DR"><img src="${contextPath }/images/gst-b400ad-1a4dr_c27cf29ccc9c4e0bbb28cd0d7eea9ffb_master-1-300x300.png" alt="GST-B400AD-1A4DR"></a><a href="https://gshockvn.net/san-pham/gst-b400ad-1a4dr/" data-product_id="2957" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=2957" data-product_id="2957" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>3.829.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B400AD-1A4DR"><a href="https://gshockvn.net/san-pham/gst-b400ad-1a4dr/" title="GST-B400AD-1A4DR">GST-B400AD-1A4DR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>13.818.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>9.989.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-28%</div></div>		    </div>
        
    <div class="kc-elm product item item_16 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b400bd-1a2dr/" title="GST-B400BD-1A2DR"><img src="${contextPath }/images/gst-b400bd-1a2dr_c087c44b0e224bffa71d8b9cabcdf5dc_master-300x300.png" alt="GST-B400BD-1A2DR"></a><a href="https://gshockvn.net/san-pham/gst-b400bd-1a2dr/" data-product_id="2951" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=2951" data-product_id="2951" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>4.066.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B400BD-1A2DR"><a href="https://gshockvn.net/san-pham/gst-b400bd-1a2dr/" title="GST-B400BD-1A2DR">GST-B400BD-1A2DR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>15.564.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>11.498.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-26%</div></div>		    </div>
        
    <div class="kc-elm product item item_17 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b400d-1adr/" title="GST-B400D-1ADR"><img src="${contextPath }/images/gst-b400d-1adr_b9e0eb06216143f3ab025b4765f2a4d4_master-300x300.png" alt="GST-B400D-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-b400d-1adr/" data-product_id="2950" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=2950" data-product_id="2950" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>3.656.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B400D-1ADR"><a href="https://gshockvn.net/san-pham/gst-b400d-1adr/" title="GST-B400D-1ADR">GST-B400D-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>12.955.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>9.299.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-28%</div></div>		    </div>
        
    <div class="kc-elm product item item_18 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b400mv-5adr/" title="GM-2100-1A"><img src="${contextPath }/images/GM-2100-1A_l-300x300.png" alt="GM-2100-1A"></a><a href="https://gshockvn.net/san-pham/gst-b400mv-5adr/" data-product_id="2944" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=2944" data-product_id="2944" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>466.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GM-2100-1A"><a href="https://gshockvn.net/san-pham/gst-b400mv-5adr/" title="GM-2100-1A">GM-2100-1A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>6.265.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.799.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-7%</div></div>		    </div>
        
    <div class="kc-elm product item item_19 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b400-1adr/" title="GST-B400-1ADR"><img src="${contextPath }/images/gst-b400-1adr_181f2e0c3e274f519054e554068dbd45_master-300x300.png" alt="GST-B400-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-b400-1adr/" data-product_id="2940" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=2940" data-product_id="2940" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.166.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B400-1ADR"><a href="https://gshockvn.net/san-pham/gst-b400-1adr/" title="GST-B400-1ADR">GST-B400-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>10.364.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>8.198.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-21%</div></div>		    </div>
        
    <div class="kc-elm product item item_20 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b400cd-1a3dr/" title="GST-B400CD-1A3DR"><img src="${contextPath }/images/gst-b400cd-1a3dr_f58d675408a14a1ab24a15c17b1967ed_master-300x300.png" alt="GST-B400CD-1A3DR"></a><a href="https://gshockvn.net/san-pham/gst-b400cd-1a3dr/" data-product_id="2934" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=2934" data-product_id="2934" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>3.379.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B400CD-1A3DR"><a href="https://gshockvn.net/san-pham/gst-b400cd-1a3dr/" title="GST-B400CD-1A3DR">GST-B400CD-1A3DR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>13.878.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>10.499.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-24%</div></div>		    </div>
        
    <div class="kc-elm product item item_21 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b200x-1a2dr/" title="GST-B200X-1A2DR"><img src="${contextPath }/images/gst-b200x-1a2-00-2-300x300.jpg" alt="GST-B200X-1A2DR"></a><a href="https://gshockvn.net/san-pham/gst-b200x-1a2dr/" data-product_id="1898" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1898" data-product_id="1898" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>6.342.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B200X-1A2DR"><a href="https://gshockvn.net/san-pham/gst-b200x-1a2dr/" title="GST-B200X-1A2DR">GST-B200X-1A2DR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>19.341.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>12.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-33%</div></div>		    </div>
        
    <div class="kc-elm product item item_22 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b200g-2adr/" title="GST-B200G-2ADR"><img src="${contextPath }/images/gst-b200g-2adr-300x300.png" alt="GST-B200G-2ADR"></a><a href="https://gshockvn.net/san-pham/gst-b200g-2adr/" data-product_id="1893" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1893" data-product_id="1893" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.677.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B200G-2ADR"><a href="https://gshockvn.net/san-pham/gst-b200g-2adr/" title="GST-B200G-2ADR">GST-B200G-2ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>11.170.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>8.493.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-24%</div></div>		    </div>
        
    <div class="kc-elm product item item_23 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b200d-1adr/" title="GST-B200D-1ADR"><img src="${contextPath }/images/gst-b200d-1adr_0f7f898e900746c3908df2ed42903067_master-300x300.png" alt="GST-B200D-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-b200d-1adr/" data-product_id="1888" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1888" data-product_id="1888" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.164.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B200D-1ADR"><a href="https://gshockvn.net/san-pham/gst-b200d-1adr/" title="GST-B200D-1ADR">GST-B200D-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>10.663.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>8.499.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-20%</div></div>		    </div>
        
    <div class="kc-elm product item item_24 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b200-1adr/" title="GST-B200-1ADR"><img src="${contextPath }/images/gst-b200-1adr_877508829ffa4b98933af020bfac209a_master-300x300.png" alt="GST-B200-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-b200-1adr/" data-product_id="1883" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1883" data-product_id="1883" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>1.049.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B200-1ADR"><a href="https://gshockvn.net/san-pham/gst-b200-1adr/" title="GST-B200-1ADR">GST-B200-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>9.048.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>7.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-12%</div></div>		    </div>
        
    <div class="kc-elm product item item_25 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b100d-2adr/" title="GST-B100D-2ADR"><img src="${contextPath }/images/gst-b100d-2adr_4ae84ccef38f431f950299e38d8caf71_master-300x300.png" alt="GST-B100D-2ADR"></a><a href="https://gshockvn.net/san-pham/gst-b100d-2adr/" data-product_id="1879" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1879" data-product_id="1879" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>4.084.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B100D-2ADR"><a href="https://gshockvn.net/san-pham/gst-b100d-2adr/" title="GST-B100D-2ADR">GST-B100D-2ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>13.583.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>9.499.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-30%</div></div>		    </div>
        
    <div class="kc-elm product item item_26 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s130bc-1adr/" title="GST-S130BC-1ADR"><img src="${contextPath }/images/gst-s130bc-1adr_master-300x300.png" alt="GST-S130BC-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-s130bc-1adr/" data-product_id="1874" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1874" data-product_id="1874" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>3.961.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S130BC-1ADR"><a href="https://gshockvn.net/san-pham/gst-s130bc-1adr/" title="GST-S130BC-1ADR">GST-S130BC-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>9.660.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.699.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-41%</div></div>		    </div>
        
    <div class="kc-elm product item item_27 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s130bc-1a3dr/" title="GST-S130BC-1A3DR"><img src="${contextPath }/images/gst-s130bc-1a3dr_master-300x300.png" alt="GST-S130BC-1A3DR"></a><a href="https://gshockvn.net/san-pham/gst-s130bc-1a3dr/" data-product_id="1869" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1869" data-product_id="1869" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>3.961.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S130BC-1A3DR"><a href="https://gshockvn.net/san-pham/gst-s130bc-1a3dr/" title="GST-S130BC-1A3DR">GST-S130BC-1A3DR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>9.660.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.699.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-41%</div></div>		    </div>
        
    <div class="kc-elm product item item_28 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s120l-1bdr/" title="GST-S120L-1BDR"><img src="${contextPath }/images/gst-s120l-1bdr_master-300x300.png" alt="GST-S120L-1BDR"></a><a href="https://gshockvn.net/san-pham/gst-s120l-1bdr/" data-product_id="1864" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1864" data-product_id="1864" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.949.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S120L-1BDR"><a href="https://gshockvn.net/san-pham/gst-s120l-1bdr/" title="GST-S120L-1BDR">GST-S120L-1BDR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>8.648.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.699.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-34%</div></div>		    </div>
        
    <div class="kc-elm product item item_29 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s120l-1adr/" title="GST-S120L-1ADR"><img src="${contextPath }/images/gst-s120l-1adr_master-300x300.png" alt="GST-S120L-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-s120l-1adr/" data-product_id="1859" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1859" data-product_id="1859" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.765.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S120L-1ADR"><a href="https://gshockvn.net/san-pham/gst-s120l-1adr/" title="GST-S120L-1ADR">GST-S120L-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>8.464.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.699.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-33%</div></div>		    </div>
        
    <div class="kc-elm product item item_30 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s110d-1adr/" title="GST-S110D-1ADR"><img src="${contextPath }/images/gst-s110d-1adr_d8b18bd2e0aa42bab33b16be092101b2_grande-300x300.png" alt="GST-S110D-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-s110d-1adr/" data-product_id="1854" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1854" data-product_id="1854" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>3.268.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S110D-1ADR"><a href="https://gshockvn.net/san-pham/gst-s110d-1adr/" title="GST-S110D-1ADR">GST-S110D-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>9.767.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>6.499.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-33%</div></div>		    </div>
        
    <div class="kc-elm product item item_31 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s110-1adr/" title="GST-S110-1ADR"><img src="${contextPath }/images/gst-s110-1adr_master-300x300.png" alt="GST-S110-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-s110-1adr/" data-product_id="1849" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1849" data-product_id="1849" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.728.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S110-1ADR"><a href="https://gshockvn.net/san-pham/gst-s110-1adr/" title="GST-S110-1ADR">GST-S110-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>8.027.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.299.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-34%</div></div>		    </div>
        
    <div class="kc-elm product item item_32 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s100g-1bdr/" title="GST-S100G-1BDR"><img src="${contextPath }/images/gst-s100g-1bdr_master-300x300.png" alt="GST-S100G-1BDR"></a><a href="https://gshockvn.net/san-pham/gst-s100g-1bdr/" data-product_id="1844" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1844" data-product_id="1844" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.728.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S100G-1BDR"><a href="https://gshockvn.net/san-pham/gst-s100g-1bdr/" title="GST-S100G-1BDR">GST-S100G-1BDR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>8.027.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.299.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-34%</div></div>		    </div>
        
    <div class="kc-elm product item item_33 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s100g-1adr/" title="GST-S100G-1ADR"><img src="${contextPath }/images/gst-s100g-1adr_master-300x300.png" alt="GST-S100G-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-s100g-1adr/" data-product_id="1839" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1839" data-product_id="1839" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.728.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S100G-1ADR"><a href="https://gshockvn.net/san-pham/gst-s100g-1adr/" title="GST-S100G-1ADR">GST-S100G-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>8.027.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.299.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-34%</div></div>		    </div>
        
    <div class="kc-elm product item item_34 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b300s-1adr/" title="GST-B300S-1ADR"><img src="${contextPath }/images/gst-b300s-1adr_c6bb0229b8f5439ea3100bc03df4d7fb_master-300x300.png" alt="GST-B300S-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-b300s-1adr/" data-product_id="1836" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1836" data-product_id="1836" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>1.914.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B300S-1ADR"><a href="https://gshockvn.net/san-pham/gst-b300s-1adr/" title="GST-B300S-1ADR">GST-B300S-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>9.213.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>7.299.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-21%</div></div>		    </div>
        
    <div class="kc-elm product item item_35 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b300e-5a/" title="GST-B300E-5A"><img src="${contextPath }/images/gst-b300e-5a-300x300.png" alt="GST-B300E-5A"></a><a href="https://gshockvn.net/san-pham/gst-b300e-5a/" data-product_id="1833" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1833" data-product_id="1833" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>5.114.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B300E-5A"><a href="https://gshockvn.net/san-pham/gst-b300e-5a/" title="GST-B300E-5A">GST-B300E-5A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>14.613.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>9.499.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-35%</div></div>		    </div>
        
    <div class="kc-elm product item item_36 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b300-1a/" title="GST-B300-1A"><img src="${contextPath }/images/gst-b300-1a-300x300.png" alt="GST-B300-1A"></a><a href="https://gshockvn.net/san-pham/gst-b300-1a/" data-product_id="1830" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1830" data-product_id="1830" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.214.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B300-1A"><a href="https://gshockvn.net/san-pham/gst-b300-1a/" title="GST-B300-1A">GST-B300-1A</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>9.213.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>6.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-24%</div></div>		    </div>
        
    <div class="kc-elm product item item_37 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-b200x-1a9dr/" title="GST-B200X-1A9DR"><img src="${contextPath }/images/gst-b200x-1a9dr_8d7c1a84cb254dba9be19338d3277bf9_5a7832de766d4cd69207d8608baa8e04_master-300x300.png" alt="GST-B200X-1A9DR"></a><a href="https://gshockvn.net/san-pham/gst-b200x-1a9dr/" data-product_id="1826" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1826" data-product_id="1826" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>6.342.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-B200X-1A9DR"><a href="https://gshockvn.net/san-pham/gst-b200x-1a9dr/" title="GST-B200X-1A9DR">GST-B200X-1A9DR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>19.341.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>12.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-33%</div></div>		    </div>
        
    <div class="kc-elm product item item_38 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s310bdd-1adr/" title="GST-S310BDD-1ADR"><img src="${contextPath }/images/gst-s310bdd-1adr-300x300.png" alt="GST-S310BDD-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-s310bdd-1adr/" data-product_id="1821" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1821" data-product_id="1821" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>4.117.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S310BDD-1ADR"><a href="https://gshockvn.net/san-pham/gst-s310bdd-1adr/" title="GST-S310BDD-1ADR">GST-S310BDD-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>11.116.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>6.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-37%</div></div>		    </div>
        
    <div class="kc-elm product item item_39 odd ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s310-7adr/" title="GST-S310-7ADR"><img src="${contextPath }/images/gst-s310-7adr_master-300x300.png" alt="GST-S310-7ADR"></a><a href="https://gshockvn.net/san-pham/gst-s310-7adr/" data-product_id="1816" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1816" data-product_id="1816" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>1.649.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S310-7ADR"><a href="https://gshockvn.net/san-pham/gst-s310-7adr/" title="GST-S310-7ADR">GST-S310-7ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>8.648.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>6.999.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-19%</div></div>		    </div>
        
    <div class="kc-elm product item item_40 even ">
		<div class="kc-elm thumb"><a class="kc-elm permalink" href="https://gshockvn.net/san-pham/gst-s310-1adr/" title="GST-S310-1ADR"><img src="${contextPath }/images/gst-s310-1adr_master-300x300.png" alt="GST-S310-1ADR"></a><a href="https://gshockvn.net/san-pham/gst-s310-1adr/" data-product_id="1811" data-action="quick-view" class="wc-quick-view-button no-text button btn alt shortcode"></a><a href="https://gshockvn.net/danh-muc-san-pham/g-shock/?add-to-cart=1811" data-product_id="1811" class="add_to_cart_button ajax_add_to_cart">Mua ngay</a><span class="saleup">Giảm <span class="woocommerce-Price-amount amount"><bdi>2.903.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></span></div>
<div class="kc-elm title" data-tooltip="GST-S310-1ADR"><a href="https://gshockvn.net/san-pham/gst-s310-1adr/" title="GST-S310-1ADR">GST-S310-1ADR</a></div>
<div class="price"><del aria-hidden="true"><span class="woocommerce-Price-amount amount"><bdi>8.202.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></del> <ins><span class="woocommerce-Price-amount amount"><bdi>5.299.000<span class="woocommerce-Price-currencySymbol">₫</span></bdi></span></ins><div class="vntp_sale">-35%</div></div>		    </div>
    </div>
<div class="kc-elm vnt_pagenavi"><span aria-current="page" class="page-numbers current">1</span>
<a class="page-numbers" href="https://gshockvn.net/danh-muc-san-pham/g-shock/page/2/">2</a>
<a class="page-numbers" href="https://gshockvn.net/danh-muc-san-pham/g-shock/page/3/">3</a>
<span class="page-numbers dots">…</span>
<a class="page-numbers" href="https://gshockvn.net/danh-muc-san-pham/g-shock/page/8/">8</a>
<a class="next page-numbers" href="https://gshockvn.net/danh-muc-san-pham/g-shock/page/2/"><i class="fa-chevron-right"></i></a></div>

        </div>
    </section>


    <section id="pcat_bst" class="kc-elm kc-css-716495 kc_row vnt_section hide_col_cont">
    	
<div class="kc-elm kc-css-994671 vnt_title">
            
        <h2 class="type">Bộ sưu tập</h2>
<span class="sub"></span>
        
    
    </div>
<div class="kc-elm kc-css-391273 kc_col-sm-12 vnt_slick slick-initialized slick-slider slick-dotted" data-slick="{&quot;slidesToShow&quot;: 3,  &quot;slidesToScroll&quot;: 3, &quot;centerMode&quot;: false, &quot;variableWidth&quot;: false, &quot;dots&quot;: true, &quot;arrows&quot;: false, &quot;autoplay&quot;: true,  &quot;autoplaySpeed&quot;: 10000, &quot;infinite&quot;: true, &quot;adaptiveHeight&quot;: false ,  &quot;rows&quot;: 0, &quot;responsive&quot;:[{&quot;breakpoint&quot;: 1024, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1}}, {&quot;breakpoint&quot;: 767, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: false, &quot;fade&quot;: false}}, {&quot;breakpoint&quot;: 480, &quot;settings&quot;:{&quot;slidesToShow&quot;: 1, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: true}}]}">
    <div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 5031px; transform: translate3d(-1935px, 0px, 0px);"><div class="kc-elm kc-css-930437 slick_item slick-slide slick-cloned" data-slick-index="-3" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-390209 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/gshock-baby-g-370x250xc.jpeg" alt="Baby-G"></div>
<div class="type">Baby-G</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/baby-g/" class="link " title="Baby-G" tabindex="-1">Baby-G</a>        
    
    </div>
</div><div class="kc-elm kc-css-799097 slick_item slick-slide slick-cloned" data-slick-index="-2" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-73527 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/Picture1-1-370x250xc.png" alt="Vintage Casio"></div>
<div class="type">Vintage Casio</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/vintage-casio/" class="link " title="Vintage Casio" tabindex="-1">Vintage Casio</a>        
    
    </div>
</div><div class="kc-elm kc-css-480482 slick_item slick-slide slick-cloned" data-slick-index="-1" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-683255 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/G-WATCH-SIGNATURE-370x250xc.png" alt="GA-2100 AP Royal Oak"></div>
<div class="type">GA-2100 AP Royal Oak</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/ga-2100-ap-royal-oak/" class="link " title="GA-2100 AP Royal Oak" tabindex="-1">GA-2100 AP Royal Oak</a>        
    
    </div>
</div><div class="kc-elm kc-css-53094 slick_item slick-slide" data-slick-index="0" aria-hidden="true" role="tabpanel" id="slick-slide10" style="width: 367px;" aria-describedby="slick-slide-control10" tabindex="-1">
<div class="kc-elm kc-css-979947 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/Picture12-370x250xc.png" alt="G-Shock "></div>
<div class="type">G-Shock </div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/dong-ho-nam/g-shock/" class="link " title="G-Shock" tabindex="-1">G-Shock</a>        
    
    </div>
</div><div class="kc-elm kc-css-758160 slick_item slick-slide" data-slick-index="1" aria-hidden="true" role="tabpanel" id="slick-slide11" style="width: 367px;" tabindex="-1">
<div class="kc-elm kc-css-9262 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/home_EQB-1000-1-370x250xc.jpeg" alt="Edifice "></div>
<div class="type">Edifice </div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/edifice/" class="link " title="Edifice" tabindex="-1">Edifice</a>        
    
    </div>
</div><div class="kc-elm kc-css-930437 slick_item slick-slide slick-active" data-slick-index="2" aria-hidden="false" role="tabpanel" id="slick-slide12" style="width: 367px;" tabindex="-1">
<div class="kc-elm kc-css-390209 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/gshock-baby-g-370x250xc.jpeg" alt="Baby-G"></div>
<div class="type">Baby-G</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/baby-g/" class="link " title="Baby-G" tabindex="0">Baby-G</a>        
    
    </div>
</div><div class="kc-elm kc-css-799097 slick_item slick-slide slick-current slick-active" data-slick-index="3" aria-hidden="false" role="tabpanel" id="slick-slide13" style="width: 367px;" aria-describedby="slick-slide-control11">
<div class="kc-elm kc-css-73527 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/Picture1-1-370x250xc.png" alt="Vintage Casio"></div>
<div class="type">Vintage Casio</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/vintage-casio/" class="link " title="Vintage Casio" tabindex="0">Vintage Casio</a>        
    
    </div>
</div><div class="kc-elm kc-css-480482 slick_item slick-slide slick-active" data-slick-index="4" aria-hidden="false" role="tabpanel" id="slick-slide14" style="width: 367px;">
<div class="kc-elm kc-css-683255 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/G-WATCH-SIGNATURE-370x250xc.png" alt="GA-2100 AP Royal Oak"></div>
<div class="type">GA-2100 AP Royal Oak</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/ga-2100-ap-royal-oak/" class="link " title="GA-2100 AP Royal Oak" tabindex="0">GA-2100 AP Royal Oak</a>        
    
    </div>
</div><div class="kc-elm kc-css-53094 slick_item slick-slide slick-cloned" data-slick-index="5" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-979947 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/Picture12-370x250xc.png" alt="G-Shock "></div>
<div class="type">G-Shock </div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/dong-ho-nam/g-shock/" class="link " title="G-Shock" tabindex="-1">G-Shock</a>        
    
    </div>
</div><div class="kc-elm kc-css-758160 slick_item slick-slide slick-cloned" data-slick-index="6" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-9262 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/home_EQB-1000-1-370x250xc.jpeg" alt="Edifice "></div>
<div class="type">Edifice </div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/edifice/" class="link " title="Edifice" tabindex="-1">Edifice</a>        
    
    </div>
</div><div class="kc-elm kc-css-930437 slick_item slick-slide slick-cloned" data-slick-index="7" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-390209 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/gshock-baby-g-370x250xc.jpeg" alt="Baby-G"></div>
<div class="type">Baby-G</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/baby-g/" class="link " title="Baby-G" tabindex="-1">Baby-G</a>        
    
    </div>
</div><div class="kc-elm kc-css-799097 slick_item slick-slide slick-cloned" data-slick-index="8" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-73527 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/Picture1-1-370x250xc.png" alt="Vintage Casio"></div>
<div class="type">Vintage Casio</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/vintage-casio/" class="link " title="Vintage Casio" tabindex="-1">Vintage Casio</a>        
    
    </div>
</div><div class="kc-elm kc-css-480482 slick_item slick-slide slick-cloned" data-slick-index="9" id="" aria-hidden="true" tabindex="-1" style="width: 367px;">
<div class="kc-elm kc-css-683255 vnt_title">
            
        <div class="thumb"><img class="img_1" src="${contextPath }/images/G-WATCH-SIGNATURE-370x250xc.png" alt="GA-2100 AP Royal Oak"></div>
<div class="type">GA-2100 AP Royal Oak</div> <i class="icon fa-long-arrow-right"></i>
<a href="https://gshockvn.net/danh-muc-san-pham/ga-2100-ap-royal-oak/" class="link " title="GA-2100 AP Royal Oak" tabindex="-1">GA-2100 AP Royal Oak</a>        
    
    </div>
</div></div></div><ul class="slick-dots" style="" role="tablist"><li class="" role="presentation"><button type="button" role="tab" class="dots" id="slick-slide-control10" aria-controls="slick-slide10" aria-label="1 of 2" tabindex="-1"></button></li><li role="presentation" class="slick-active"><button type="button" role="tab" class="dots" id="slick-slide-control11" aria-controls="slick-slide13" aria-label="2 of 2" tabindex="-1"></button></li></ul></div>


    </section>


    <section id="pcat_khachhang" class="kc-elm kc-css-87768 kc_row vnt_section hide_col_cont">
    	
<div class="kc-elm kc-css-376027 vnt_title">
            
        <h2 class="type">KHÁCH HÀNG CỦA CHÚNG TÔI</h2>
<span class="sub"></span>
<div class="cont">Ai nói bạn không thể tỏa sáng?</div>
        
    
    </div>
<div class="kc-elm kc-css-191378 kc_col-sm-12 vnt_slick slick-initialized slick-slider slick-dotted" data-slick="{&quot;slidesToShow&quot;: 5,  &quot;slidesToScroll&quot;: 3, &quot;centerMode&quot;: false, &quot;variableWidth&quot;: false, &quot;dots&quot;: true, &quot;arrows&quot;: false, &quot;autoplay&quot;: true,  &quot;autoplaySpeed&quot;: 10000, &quot;infinite&quot;: true, &quot;adaptiveHeight&quot;: false ,  &quot;rows&quot;: 0, &quot;responsive&quot;:[{&quot;breakpoint&quot;: 1024, &quot;settings&quot;:{&quot;slidesToShow&quot;: 4, &quot;slidesToScroll&quot;: 1}}, {&quot;breakpoint&quot;: 767, &quot;settings&quot;:{&quot;slidesToShow&quot;: 3, &quot;slidesToScroll&quot;: 1, &quot;adaptiveHeight&quot;: false, &quot;fade&quot;: false}}, {&quot;breakpoint&quot;: 480, &quot;settings&quot;:{&quot;slidesToShow&quot;: 2, &quot;slidesToScroll&quot;: 1}}]}">
    <div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 6325px; transform: translate3d(-1375px, 0px, 0px);"><div class="kc-elm kc-css-298864 slick_item slick-slide slick-cloned" data-slick-index="-5" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-491352 vnt_image ">
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
    </div></div><div class="kc-elm kc-css-387364 slick_item slick-slide slick-cloned" data-slick-index="-1" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="item"></div></div><div class="kc-elm kc-css-78721 slick_item slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" role="tabpanel" id="slick-slide20" style="width: 259px;" aria-describedby="slick-slide-control20"><div class="kc-elm kc-css-166268 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/eddc4f45d7b618e841a7-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sự Hài Lòng Của Quý Khách Hàng</div>    <div class="desc">Giá cả phải chăng - Tư vấn tận tâm
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/eddc4f45d7b618e841a7.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-727647 slick_item slick-slide slick-active" data-slick-index="1" aria-hidden="false" role="tabpanel" id="slick-slide21" style="width: 259px;"><div class="kc-elm kc-css-250101 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/bedb5e8b421d8d43d40c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Giao hàng tận nơi !! </div>    <div class="desc"><p>Check hàng, hướng dẫn sự dụng chi tiết&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/bedb5e8b421d8d43d40c.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-913559 slick_item slick-slide slick-active" data-slick-index="2" aria-hidden="false" role="tabpanel" id="slick-slide22" style="width: 259px;"><div class="kc-elm kc-css-193201 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/d958ad2db1bb7ee527aa.jpg" alt="">
    </div>
        <div class="title">Mẫu Mã Đa Dạng</div>    <div class="desc"><p>Đáp ưng mọi nhu cầu của quý khách hàng&nbsp;</p>
</div>        	
    <a data-fancybox="" href="${contextPath }/images/d958ad2db1bb7ee527aa.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-684814 slick_item slick-slide slick-active" data-slick-index="3" aria-hidden="false" role="tabpanel" id="slick-slide23" style="width: 259px;" aria-describedby="slick-slide-control21"><div class="kc-elm kc-css-287593 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/ae8833d6a4226b7c3233-370x210xc.jpg" alt="">
    </div>
        <div class="title">Chính Sách Ưu Đãi Số 1 </div>    <div class="desc"><p>Mức giá tuyệt vời cho khách hàng của G-Watch</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/ae8833d6a4226b7c3233.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-298864 slick_item slick-slide slick-active" data-slick-index="4" aria-hidden="false" role="tabpanel" id="slick-slide24" style="width: 259px;"><div class="kc-elm kc-css-491352 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/0a5ca41d33e9fcb7a5f8-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độ Hoàn Thiện Sản Phẩm Tuyệt Đối </div>    <div class="desc"><p>Cam kết chất lượng vượt trội, bền bỉ</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/0a5ca41d33e9fcb7a5f8.jpg" title="" class="link" tabindex="0"></a>
    </div></div><div class="kc-elm kc-css-234051 slick_item slick-slide" data-slick-index="5" aria-hidden="true" role="tabpanel" id="slick-slide25" style="width: 259px;" tabindex="-1"><div class="kc-elm kc-css-355450 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/a23be679718dbed3e79c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Độc - Lạ - Chất</div>    <div class="desc">Sản phẩm phù hợp với cá tính của riêng bạn 
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/a23be679718dbed3e79c.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-799257 slick_item slick-slide" data-slick-index="6" aria-hidden="true" role="tabpanel" id="slick-slide26" style="width: 259px;" aria-describedby="slick-slide-control22" tabindex="-1"><div class="kc-elm kc-css-340932 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/IMG-7969-scaled-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sản Phẩm Cực Chất</div>    <div class="desc"><p>Chỉ có tại G-Watch</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/IMG-7969-scaled.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-240427 slick_item slick-slide" data-slick-index="7" aria-hidden="true" role="tabpanel" id="slick-slide27" style="width: 259px;" tabindex="-1"><div class="kc-elm kc-css-114557 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/12fd4db3da4715194c56-370x210xc.jpg" alt="">
    </div>
        <div class="title">Địa Điểm Mua Hàng Tin Cậy</div>    <div class="desc"><p>Showroom tại TP.HCM luôn sẵn lòng phục vụ quý khách hàng&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/12fd4db3da4715194c56.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-387364 slick_item slick-slide" data-slick-index="8" aria-hidden="true" role="tabpanel" id="slick-slide28" style="width: 259px;" tabindex="-1"><div class="item"></div></div><div class="kc-elm kc-css-78721 slick_item slick-slide slick-cloned" data-slick-index="9" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-166268 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/eddc4f45d7b618e841a7-370x210xc.jpg" alt="">
    </div>
        <div class="title">Sự Hài Lòng Của Quý Khách Hàng</div>    <div class="desc">Giá cả phải chăng - Tư vấn tận tâm
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/eddc4f45d7b618e841a7.jpg" title="" class="link" tabindex="-1"></a>
    </div></div><div class="kc-elm kc-css-727647 slick_item slick-slide slick-cloned" data-slick-index="10" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="kc-elm kc-css-250101 vnt_image ">
        <div class="thumb">
        <img src="${contextPath }/images/bedb5e8b421d8d43d40c-370x210xc.jpg" alt="">
    </div>
        <div class="title">Giao hàng tận nơi !! </div>    <div class="desc"><p>Check hàng, hướng dẫn sự dụng chi tiết&nbsp;</p>
</div>        	
    <a data-fancybox="" href="https://gshockvn.net/wp-content/uploads/bedb5e8b421d8d43d40c.jpg" title="" class="link" tabindex="-1"></a>
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
    </div></div><div class="kc-elm kc-css-387364 slick_item slick-slide slick-cloned" data-slick-index="17" id="" aria-hidden="true" tabindex="-1" style="width: 259px;"><div class="item"></div></div></div></div><ul class="slick-dots" style="" role="tablist"><li class="slick-active" role="presentation"><button type="button" role="tab" class="dots" id="slick-slide-control20" aria-controls="slick-slide20" aria-label="1 of 2" tabindex="0" aria-selected="true"></button></li><li role="presentation" class=""><button type="button" role="tab" class="dots" id="slick-slide-control21" aria-controls="slick-slide23" aria-label="2 of 2" tabindex="-1"></button></li><li role="presentation" class=""><button type="button" role="tab" class="dots" id="slick-slide-control22" aria-controls="slick-slide26" aria-label="3 of 2" tabindex="-1"></button></li></ul></div>


    </section>




<style type="text/css">@media only screen and (min-width: 1000px) and (max-width: 5000px){body.kc-css-system .kc-css-542146{width: 50%;}body.kc-css-system .kc-css-383299{width: 50%;}body.kc-css-system .kc-css-183404{width: 40%;}body.kc-css-system .kc-css-8168{width: 20%;}body.kc-css-system .kc-css-681413{width: 20%;}body.kc-css-system .kc-css-567871{width: 20%;}}body.kc-css-system .kc-css-294102{background: #ee1a26;padding-top: 10px;padding-bottom: 10px;}body.kc-css-system .kc-css-294102 >.kc-container{display: flex;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-652455 .type{color: #ffffff;font-size: 14px;font-weight: 600;text-transform: uppercase;}body.kc-css-system .kc-css-652455{width: 50%;}body.kc-css-system .kc-css-874180{width: 50%;}body.kc-css-system .kc-css-921585{background: #000000;padding-top: 50px;padding-bottom: 50px;}body.kc-css-system .kc-css-921585 >.kc-container{padding-right: 0px;padding-left: 0px;}body.kc-css-system .kc-css-229334 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-229334 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-229334{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-217143 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-217143 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-217143{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-494534 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-494534 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-494534{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-820481 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-820481 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-820481{display: flex;margin-top: 30px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-224882 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-224882 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-224882 .sub{color: #ee1a26;font-size: 24px;font-weight: 700;}body.kc-css-system .kc-css-224882{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-133168 .icon{display: flex;width: 36px;height: 36px;background: #ee1a26;color: #ffffff;font-size: 24px;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-133168 .type{color: #aeaeae;flex: 1;}body.kc-css-system .kc-css-133168{display: flex;margin-top: 15px;flex-flow: wrap;align-items: center;}body.kc-css-system .kc-css-270365 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-767782{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-767782 a{color: #aeaeae;}body.kc-css-system .kc-css-767782 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-767782 p{margin-bottom: 10px;}body.kc-css-system .kc-css-273605 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-908476{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-908476 a{color: #aeaeae;}body.kc-css-system .kc-css-908476 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-908476 p{margin-bottom: 10px;}body.kc-css-system .kc-css-330280 .type{color: #ffffff;font-size: 16px;line-height: 30px;font-weight: 600;}body.kc-css-system .kc-css-217626{color: #aeaeae;font-size: 14px;margin-top: 20px;}body.kc-css-system .kc-css-217626 a{color: #aeaeae;}body.kc-css-system .kc-css-217626 a:hover{color: #ee1a26;}body.kc-css-system .kc-css-217626 p{margin-bottom: 10px;}body.kc-css-system .kc-css-261744 i{color: #ffffff;font-size: 24px;}body.kc-css-system .kc-css-261744 .item{display: flex;width: 36px;height: 36px;background: #ee1a26;margin-right: 10px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-261744{display: flex;}body.kc-css-system .kc-css-42241 .icon{display: flex;width: 40px;height: 40px;background: #ffffff;border-radius: 100% 100% 100% 100%;color: #ee1a26;font-size: 24px;justify-content: center;align-items: center;}body.kc-css-system .kc-css-42241:hover .icon{color: #ee1a26;}body.kc-css-system .kc-css-42241 .type{font-weight: 600;margin-left: 10px;}body.kc-css-system .kc-css-42241{position: fixed;display: flex;background: rgba(238, 26, 38, 0.75);border-radius: 25px 25px 25px 25px;padding: 3px 3px 3px 3px;align-items: center;width: auto;bottom: 40px;left: 10px;z-index: 99;box-shadow: 0 0 5px #ddd;animation-duration: 500ms; animation-name: calllink; animation-iteration-count: infinite; animation-direction: alternate;}body.kc-css-system .kc-css-130685 .thumb img{height: 80px;}body.kc-css-system .kc-css-130685{position: fixed;width: auto;bottom: 120px;right: 10px;z-index: 89;}body.kc-css-system .kc-css-235194 i{color: #ffffff;font-size: 24px;line-height: 24px;}body.kc-css-system .kc-css-235194 .thumb img{height: 80px;}body.kc-css-system .kc-css-235194 .item{padding: 9px 15px 9px 15px;margin-bottom: 1px;}body.kc-css-system .kc-css-235194 .item:hover{background: #000000;}body.kc-css-system .kc-css-235194 .item:first-child{border-top-right-radius: 10px;}body.kc-css-system .kc-css-235194 .item:last-child{border-bottom-right-radius: 10px;}body.kc-css-system .kc-css-235194{position: fixed;background: #ee1a26;border-top-right-radius: 10px;border-bottom-right-radius: 10px;width: auto;bottom: 120px;left: 0;z-index: 89;}@media only screen and (max-width: 1024px){body.kc-css-system .kc-css-42241{bottom: 120px;}body.kc-css-system .kc-css-130685{bottom: 90px;}body.kc-css-system .kc-css-235194{display: none;}}@media only screen and (max-width: 767px){body.kc-css-system .kc-css-652455{width: 100%;}body.kc-css-system .kc-css-874180{width: 100%;margin-top: 15px;}body.kc-css-system .kc-css-8168{margin-top: 20px;}body.kc-css-system .kc-css-681413{margin-top: 20px;}body.kc-css-system .kc-css-567871{margin-top: 20px;}body.kc-css-system .kc-css-261744{margin-top: 20px;}body.kc-css-system .kc-css-130685 .thumb img{height: 60px;}body.kc-css-system .kc-css-235194 .thumb img{height: 60px;}}@media only screen and (max-width: 479px){body.kc-css-system .kc-css-229334 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-217143 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-494534 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-820481 .type{font-size: 14px;line-height: 20px;}body.kc-css-system .kc-css-133168 .type{font-size: 14px;line-height: 20px;}}</style>
    