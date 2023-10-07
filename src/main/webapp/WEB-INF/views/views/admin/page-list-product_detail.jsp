<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
	
            @media only screen and (min-width: 1000px) and (max-width: 5000px) {
                body.kc-css-system .kc-css-299681 {
                    width: 15%;
                }

                body.kc-css-system .kc-css-243795 {
                    width: 60%;
                }

                body.kc-css-system .kc-css-745639 {
                    width: 25%;
                }
            }

            body.kc-css-system .kc-css-842145 {
                background: #000000;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 99;
            }

            body.kc-css-system .kc-css-842145 >.kc-container {
                display: flex;
                padding-right: 0px;
                flex-flow: wrap;
                justify-content: center;
                align-items: center;
            }

            body.kc-css-system .kc-css-133662 .thumb img {
                max-height: 60px;
            }

            body.kc-css-system .kc-css-133662 {
                margin-right: auto;
                width: auto;
            }

            body.kc-css-system .kc-css-427078 .vnt_nav {
                display: flex;
            }

            body.kc-css-system .kc-css-427078 .vnt_nav>li {
                display: flex;
                flex-flow: wrap;
                align-items: center;
            }

            body.kc-css-system .kc-css-427078 .vnt_nav>li>a {
                color: #ffffff;
                line-height: 70px;
                font-weight: 500;
                display: block;
                width: 100%;
                height: 70px;
                padding-right: 15px;
                padding-left: 15px;
            }

            body.kc-css-system .kc-css-427078 .vnt_nav>li>a:hover {
                color: #ee1a26;
            }

            body.kc-css-system .kc-css-427078 .vnt_nav>li.current-menu-item>a,body.kc-css-system .kc-css-427078 .vnt_nav>li.current-menu-ancestor>a {
                color: #ee1a26;
            }

            body.kc-css-system .kc-css-427078 .sub-menu li:hover>a {
                color: #ee1a26;
            }

            body.kc-css-system .kc-css-427078 .sub-menu li.current-menu-item>a,body.kc-css-system .kc-css-427078 .sub-menu li.current-menu-ancestor>a {
                color: #ee1a26;
            }

            body.kc-css-system .kc-css-427078 {
                width: auto;
            }

            body.kc-css-system .kc-css-44370 {
                background: #f8f8f8;
                position: absolute;
                display: flex;
                padding: 10px 10px 10px 10px;
                flex-flow: wrap;
                justify-content: center;
                top: 100%;
                left: 0;
            }

            body.kc-css-system .kc-css-745639 {
                display: flex;
                margin-left: auto;
                flex-flow: wrap;
                width: auto;
            }

            body.kc-css-system .kc-css-677951 .thumb img,body.kc-css-system .kc-css-677951 .thumb svg {
                display: block;
                height: 25px;
            }

            body.kc-css-system .kc-css-677951 {
                width: auto;
            }

            body.kc-css-system .kc-css-817499 .thumb img,body.kc-css-system .kc-css-817499 .thumb svg {
                display: block;
                height: 25px;
            }

            body.kc-css-system .kc-css-817499 {
                margin-right: 20px;
                margin-left: 20px;
                width: auto;
            }

            body.kc-css-system .kc-css-493724 .thumb img,body.kc-css-system .kc-css-493724 .thumb svg {
                display: block;
                height: 25px;
            }

            body.kc-css-system .kc-css-493724 {
                width: auto;
            }

            body.kc-css-system .kc-css-321065 .thumb img,body.kc-css-system .kc-css-321065 .thumb svg {
                display: block;
                height: 25px;
            }

            body.kc-css-system .kc-css-321065 {
                display: none;
                width: auto;
            }

            @media only screen and (max-width: 1024px) {
                body.kc-css-system .kc-css-842145 {
                    padding-top: 15px;
                    padding-bottom: 15px;
                }

                body.kc-css-system .kc-css-427078 .vnt_nav {
                    flex-flow: wrap;
                }

                body.kc-css-system .kc-css-427078 .vnt_nav>li {
                    width: 100%;
                    border-top: 1px solid #303030;
                    ;}

                body.kc-css-system .kc-css-427078 .vnt_nav>li>a {
                    line-height: 50px;
                    height: 50px;
                }

                body.kc-css-system .kc-css-427078 .toggler {
                    color: #ffffff;
                    font-size: 18px;
                    display: flex;
                    width: 50px;
                    height: 50px;
                    border-left: 1px solid #303030;
                    ;justify-content: center;
                    align-items: center;
                }

                body.kc-css-system .kc-css-427078 {
                    background: #000000;
                    position: fixed;
                    ;overflow-y: auto;
                }

                body.kc-css-system .kc-css-493724 {
                    display: none;
                }

                body.kc-css-system .kc-css-321065 {
                    display: flex;
                }
            }

            @media only screen and (max-width: 767px) {
                body.kc-css-system .kc-css-133662 .thumb img {
                    max-height: 50px;
                }
            }

            @media only screen and (max-width: 479px) {
                body.kc-css-system .kc-css-677951 .thumb img,body.kc-css-system .kc-css-677951 .thumb svg {
                    height: 20px;
                }

                body.kc-css-system .kc-css-817499 .thumb img,body.kc-css-system .kc-css-817499 .thumb svg {
                    height: 20px;
                }

                body.kc-css-system .kc-css-817499 {
                    margin-right: 15px;
                    margin-left: 15px;
                }

                body.kc-css-system .kc-css-321065 .thumb img,body.kc-css-system .kc-css-321065 .thumb svg {
                    height: 20px;
                }
            }
                                body.kc-css-system .kc-css-658506 {
                                    background: rgba(5, 5, 6, 0.60);
                                    padding-top: 15px;
                                    padding-bottom: 15px;
                                }

                                body.kc-css-system .kc-css-7603 .title {
                                    color: #ffffff;
                                }

                                body.kc-css-system .kc-css-7603 .title a {
                                    color: #ffffff;
                                }

                                body.kc-css-system .kc-css-7603 .item:hover .title {
                                    color: #ee1a26;
                                }

                                body.kc-css-system .kc-css-7603 {
                                    display: grid;
                                    grid-template-columns: repeat(6, 1fr);
                                    grid-gap: 10px;
                                }

                                @media only screen and (max-width: 1024px) {
                                    body.kc-css-system .kc-css-658506 {
                                        background: #191919;
                                        padding-top: 0px;
                                        padding-bottom: 0px;
                                    }

                                    body.kc-css-system .kc-css-658506 >.kc-container {
                                        padding-right: 0px;
                                        padding-left: 0px;
                                    }

                                    body.kc-css-system .kc-css-7603 .title {
                                        line-height: 50px;
                                    }

                                    body.kc-css-system .kc-css-7603 .item {
                                        border-top: 1px solid #303030;
                                        ;padding-left: 45px;
                                    }

                                    body.kc-css-system .kc-css-7603 {
                                        grid-template-columns: repeat(3, 1fr);
                                        grid-gap: 0;
                                    }
                                }

                                @media only screen and (max-width: 767px) {
                                    body.kc-css-system .kc-css-7603 {
                                        grid-template-columns: repeat(2, 1fr);
                                    }
                                }

                                @media only screen and (max-width: 479px) {
                                    body.kc-css-system .kc-css-7603 {
                                        grid-template-columns: 1fr;
                                    }
                                }
                @media only screen and (min-width: 1000px) and (max-width: 5000px) {
                    body.kc-css-system .kc-css-483988 {
                        width: 50%;
                    }

                    body.kc-css-system .kc-css-630873 {
                        width: 50%;
                    }

                    body.kc-css-system .kc-css-65068 {
                        width: 100%;
                    }
                }

                body.kc-css-system .kc-css-327134 {
                    margin-top: 15px;
                    margin-bottom: 15px;
                }

                body.kc-css-system .kc-css-327134 >.kc-container {
                    background: #ffffff;
                    padding-right: 0px;
                    padding-left: 0px;
                }

                body.kc-css-system .kc-css-483988 {
                    position: relative;
                }

                body.kc-css-system .kc-css-304239 {
                    position: relative;
                    margin-top: 15px;
                }

                body.kc-css-system .kc-css-254845 {
                    font-size: 12px;
                    font-weight: 600;
                }

                body.kc-css-system .kc-css-599149 .type {
                    color: #054f56;
                    font-size: 30px;
                    line-height: 36px;
                    font-weight: 700;
                }

                body.kc-css-system .kc-css-66721 .thumb {
                    margin-right: 5px;
                }

                body.kc-css-system .kc-css-66721 .title {
                    font-size: 12px;
                    font-weight: 500;
                }

                body.kc-css-system .kc-css-66721 .item {
                    display: flex;
                    align-items: center;
                }

                body.kc-css-system .kc-css-66721 {
                    display: grid;
                    grid-template-columns: repeat(2, 1fr);
                    grid-gap: 10px;
                    border-top: 1px solid #e5e5e5;
                    border-bottom: 1px solid #e5e5e5;
                    padding-top: 10px;
                    padding-bottom: 10px;
                }

                body.kc-css-system .kc-css-282402 {
                    margin-top: 10px;
                }

                body.kc-css-system .kc-css-541547 >.kc-container {
                    background: #ffffff;
                    padding-top: 30px;
                    padding-bottom: 30px;
                }

                .vntabs_nav {
                    display: flex;
                    align-items: center;
                }

                .vntabs_item:hover {
                    color: #ffffff;
                    background: #000000;
                }

                .vntabs_item.is-active {
                    color: #ffffff;
                    background: #000000;
                }

                .vntabs_item {
                    text-align: center;
                    border-radius: 5px 5px 5px 5px;
                    padding: 10px 20px 10px 20px;
                    margin-right: 2px;
                    margin-left: 2px;
                    justify-content: center;
                }

                body.kc-css-system .kc-css-10501 {
                    margin-top: 10px;
                    overflow: hidden;
                }

                body.kc-css-system .kc-css-357613 {
                    background: #fcf8f4;
                    padding-top: 30px;
                    padding-bottom: 30px;
                }

                body.kc-css-system .kc-css-661155 .type {
                    width: 100%;
                    font-size: 30px;
                    line-height: 42px;
                    font-weight: 600;
                    text-transform: uppercase;
                    text-align: center;
                }

                body.kc-css-system .kc-css-661155 .sub {
                    width: 90px;
                    height: 2px;
                    background: #f97e6c;
                    margin-top: 15px;
                }

                body.kc-css-system .kc-css-661155 .cont {
                    width: 100%;
                    text-align: center;
                    margin-top: 10px;
                }

                body.kc-css-system .kc-css-661155 {
                    display: flex;
                    flex-flow: wrap;
                    justify-content: center;
                }

                body.kc-css-system .kc-css-638453 {
                    margin-bottom: 15px;
                }

                body.kc-css-system .kc-css-638453 >.kc-container {
                    background: #ffffff;
                    padding-top: 15px;
                    padding-bottom: 15px;
                }

                body.kc-css-system .kc-css-206016 .type {
                    width: 100%;
                    color: #105056;
                    font-size: 18px;
                    line-height: 40px;
                    font-weight: 700;
                    text-transform: uppercase;
                }

                body.kc-css-system .kc-css-206016 .sub {
                    width: 60px;
                    height: 2px;
                    background: #a92c38;
                    margin-bottom: -1px;
                }

                body.kc-css-system .kc-css-206016 {
                    display: flex;
                    border-bottom: 1px solid #dcdcdc;
                    ;flex-flow: wrap;
                }

                body.kc-css-system .kc-css-17996 .title {
                    width: 100%;
                    font-size: 16px;
                    font-weight: 500;
                    text-align: center;
                }

                body.kc-css-system .kc-css-17996 .price {
                    display: flex;
                    color: #ee1a26;
                    font-size: 16px;
                    font-weight: 600;
                    flex-flow: wrap;
                    justify-content: center;
                    align-items: center;
                }

                body.kc-css-system .kc-css-17996 .price del {
                    color: #aeaeae;
                    font-size: 12px;
                    font-weight: 400;
                    margin-right: 10px;
                    margin-left: 10px;
                }

                body.kc-css-system .kc-css-17996 .item {
                    display: flex;
                    background: #ffffff;
                    padding: 5px 5px 5px 5px;
                    flex-flow: wrap;
                    justify-content: center;
                }

                body.kc-css-system .kc-css-17996 {
                    max-width: 1170px;
                    padding-right: 15px;
                    padding-left: 15px;
                    margin-top: 30px;
                }

                body.kc-css-system .kc-css-17996 .slick-list {
                    margin-right: -10px;
                    margin-left: -10px;
                }

                body.kc-css-system .kc-css-17996 .slick-slide {
                    margin: 10px 10px 10px 10px;
                }

                body.kc-css-system .kc-css-17996 .slick-dots {
                    margin-top: 15px;
                }

                body.kc-css-system .kc-css-478378 {
                    background: rgba(0, 0, 0, 0.50);
                    display: flex;
                    width: 100%;
                    height: 100%;
                    margin-right: 0px;
                    margin-left: 0px;
                    justify-content: center;
                    align-items: center;
                }

                body.kc-css-system .kc-css-65068 {
                    background: #ffffff;
                    position: relative;
                    width: 96%;
                    max-width: 480px;
                    padding: 0px 0px 0px 0px;
                    border-radius: 10px 10px 10px 10px;
                    max-height: 86vh;
                    overflow-y: auto;
                }

                body.kc-css-system .kc-css-317584 .icon {
                    color: #dd3333;
                    font-size: 24px;
                }

                body.kc-css-system .kc-css-317584 {
                    position: absolute;
                    display: flex;
                    width: 36px;
                    height: 36px;
                    justify-content: center;
                    align-items: center;
                    top: 10px;
                    right: 10px;
                    z-index: 10;
                }

                body.kc-css-system .kc-css-262370 .type {
                    color: #ffffff;
                    font-size: 16px;
                    font-weight: 600;
                    text-transform: uppercase;
                }

                body.kc-css-system .kc-css-262370 .sub {
                    color: #ffffff;
                }

                body.kc-css-system .kc-css-262370 {
                    display: grid;
                    background: #000000;
                    border-top-left-radius: 10px;
                    border-top-right-radius: 10px;
                    padding: 10px 50px 10px 15px;
                }

                body.kc-css-system .kc-css-467875 {
                    padding: 15px 15px 15px 15px;
                }

                body.kc-css-system .kc-css-84231 {
                    padding: 15px 15px 15px 15px;
                }

                @media only screen and (max-width: 1024px) {
                    body.kc-css-system .kc-css-327134 {
                        margin-top: 0px;
                        margin-bottom: 0px;
                    }

                    body.kc-css-system .kc-css-317584 {
                        display: flex;
                    }
                }

                @media only screen and (max-width: 767px) {
                    body.kc-css-system .kc-css-66721 {
                        grid-template-columns: 1fr;
                    }

                    body.kc-css-system .kc-css-661155 .type {
                        font-size: 24px;
                    }

                    body.kc-css-system .kc-css-661155 .sub {
                        margin-top: 5px;
                    }

                    body.kc-css-system .kc-css-17996 {
                        margin-top: 15px;
                    }
                }
</style>
<c:url value="/resources/gshock/image" var="imagePath" scope="application"></c:url>
      <div class="modal fade" id="new-order" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                  <div class="modal-body">
                      <div class="popup text-left">
                          <h4 class="mb-3">New Order</h4>
                          <div class="content create-workform bg-body">
                              <div class="pb-3">
                                  <label class="mb-2">Email</label>
                                  <input type="text" class="form-control" placeholder="Enter Name or Email">
                              </div>
                              <div class="col-lg-12 mt-4">
                                  <div class="d-flex flex-wrap align-items-ceter justify-content-center">
                                      <div class="btn btn-primary mr-4" data-dismiss="modal">Cancel</div>
                                      <div class="btn btn-outline-primary" data-dismiss="modal">Create</div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>      <div class="content-page">
     <div class="container-fluid">
     <div class="row">
  <div>
	<a class="btn btn-lg text-center" href="<%=request.getContextPath()%>/admin/product?page=${page}" ><span><i style="font-size: 1em;" title="Go to back" class="fa fa-arrow-left fa-3x"></i>Go To Back</span></a>
  </div>
	</div>
        <div class="row">
            <div class="col-lg-12">
                <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Product List</h4>
                        <p class="mb-0">The product list effectively dictates product presentation and provides space<br> to list your products and offering in the most appealing way.</p>
                    </div>
                    <a href="${pageContext.request.contextPath }/admin/add-product" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Product</a>
                </div>
            </div>
            <div class="col-lg-12">
      <section id="main_single_product" class="kc-elm kc-css-327134 kc_row product vnt_section hide_col" style="padding-bottom: 50px;">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-483988 kc_col-sm-6 kc_column kc_col-sm-6">
				<div class="kc-elm kc-css-304239 vnt_editor product-gallery">
					<div class="woocommerce-product-gallery images" style="opacity: 1;">
					    <div class="vntwp_gallery vntsp_gallery slick-initialized slick-slider">
					    	<!-- <button type="button" class="slick-prev slick-arrow" style=""><i class="sl-arrow-left"></i></button> -->
					        <div class="slick-list draggable  row" style="height: 100%;">
					        	<c:forTokens items="${proById.images }" delims="[ ]," var="img">
					        		<div class="slick-track col-sm-6" style="opacity: 1; ">
							        <div class="woocommerce-product-gallery__image vntp_image slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style=" position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;">
								        <a class="fancybox" data-fancybox="vntsp_gallery" href="https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master.png" data-caption="gst-s110-1adr_master" tabindex="0">
								        	<img width="200px" height="200px" src="${imagePath }/product/${img}" class="wp-post-image img-attr " alt="" title="gst-s110-1adr_master" style="padding-bottom: 20px;">
								        </a>
							        </div>
						        </div>
					        	</c:forTokens>
					        </div>    
					       <!--  <button type="button" class="slick-next slick-arrow" style=""><i class="sl-arrow-right"></i></button>-->
						</div> 
						<%-- <div class="vntwp_gallery vntsp_gallery_thumb slick-initialized slick-slider">
							<div class="slick-list draggable">
								<div class="slick-track" style="opacity: 1; width: 448px; transform: translate3d(0px, 0px, 0px);">
									<div class="woocommerce-product-gallery__image vntp_image slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 107px;">
										<img width="100" height="100" src="${contextPath }/image/gst-s110-1adr_master-100x100.png" class="wp-post-image img-attr" alt="" decoding="async" loading="lazy" title="gst-s110-1adr_master" data-large_image="https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master.png" srcset="https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master-100x100.png 100w, https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master-768x768.png 768w, https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master-300x300.png 300w, https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master-600x600.png 600w, https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master-64x64.png 64w, https://gshockvn.net/wp-content/uploads/gst-s110-1adr_master.png 800w" sizes="(max-width: 100px) 100vw, 100px" data-xoowscfly="fly" style="opacity: 1;">
									</div>
								</div>
							</div>
						</div> --%>
					</div>
				</div>
			</div>
	<div class="kc-elm kc-css-630873 kc_col-sm-6 kc_column kc_col-sm-6">
	<div class="kc-elm kc-css-254845 vnt_editor">
		<span><span><a href="${pageContext.request.contextPath }/admin/product">Product</a></span> » <span><a href="#">Product Detail</a></span> » <span class="breadcrumb_last" aria-current="page">${proById.product_sku }</span></span></div>
		<div class="kc-elm kc-css-599149 vnt_title">
			<h1 class="type1">${proById.name}</h1>
		    <h3 class="type2">${proById.product_sku}</h3>
	</div>
<div class="kc-elm kc-css-410538 vnt_editor">
	<!-- <div class="woocommerce-product-rating">
		<div class="star-rating" role="img" aria-label="Được xếp hạng 5.00 5 sao"><span style="width:100%"><strong class="rating">5.00</strong> trên 5 dựa trên <span class="rating">1</span> đánh giá</span></div>								
		<a href="https://gshockvn.net/san-pham/gst-s110-1adr/#reviews" class="woocommerce-review-link" rel="nofollow">(<span class="count">1</span> đánh giá của khách hàng)</a>
	</div> -->

<p class="price"><ins><span class="woocommerce-Price-amount amount"><bdi id="price_format"></bdi><span class="woocommerce-Price-currencySymbol">₫</span></span></ins></p>
<script type="text/javascript">
const number = ${proById.price};
	document.getElementById("price_format").innerHTML = formatPrice(number);
	function formatPrice(price){
		intl = new Intl.NumberFormat('vn-IN', { maximumSignificantDigits: price.legnth }).format(price);
		return intl;
	}
</script>
<div >
	<label class="text" for="quantity_64ae98cebaafb">Số lượng: ${proById.amount}</label>
</div>
<div class="woocommerce-product-details__short-description">
	<div class="woocommerce-product-details__short-description">
<div class="grid-1 grid--1 narrow-wrap">
<div class="narrow-layout">
<div class="narrow-contents">
<div class="header-grid grid-1 grid-n--1 bg-ultra-light-grey bg--white frame">
<div class="column bg-white">
<h2><b>Bộ sản phẩm gồm:</b></h2>
${proById.the_product_set_includes}
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="row" style="padding-left: 130px;">
	<a class="btn btn-primary col-sm-6" href="${pageContext.request.contextPath}/admin/edit-product?id=${proById.id}&page=${page }" role="button">Edit Product</a>
	<a class="btn btn-danger col-sm-6" href="${pageContext.request.contextPath}/admin/delete-product?id=${proById.id}&page=${page }" role="button">Delete Product</a>
</div>
	</div>
        </div>
    </section>
    <section id="single_content" class="kc-elm kc-css-541547 kc_row vnt_section hide_col">
        <div class="kc-row-container kc-container vnt_col">
        	<div class="kc-elm kc-css-610913 vntabs">
    <ul class="vntabs_nav" style="list-style-type: none;">  
    	<li id="detail_pro" class="vntabs_item vntabs_nav_item is-active items-group">
    		<div class="title" >Thông tin sản phẩm</div>
    	</li>
    	<li id="shipping_polyci" class="vntabs_item vntabs_nav_item">
    		<div class="title">Chính sách vận chuyển</div>
    	</li>
    	<li id="return_w" class="vntabs_item vntabs_nav_item">
    		<div class="title">Đổi trả &amp; Bảo hành</div>
    	</li>
    	<li id="pay" class="vntabs_item vntabs_nav_item">
    		<div class="title">Hình thức thanh toán</div>
    	</li>
    </ul>
<div class="kc-elm vntabs_content">
    <div class="kc-elm kc-css-714457 vntabs_cont active">
	    <div id="detailPro" class="kc-elm kc-css-10501 woocommerce vnt_the_content" data-readmore="" aria-expanded="false" id="rmjs-1" style="max-height: none; /* height: 600px; */">
			<div class="accordion_content_inner">
				<div class="grid-1 grid--1 narrow-wrap">
					<div class="narrow-layout">
						<div class="narrow-contents">
							<div class="header-grid grid-1 grid-n--1 bg-ultra-light-grey bg--white frame">
								<div class="column bg-white">
									${proById.product_information}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- </div><a class="xem_them" href="https://gshockvn.net/san-pham/gst-s110-1adr/#" data-readmore-toggle="rmjs-1" aria-controls="rmjs-1"><span>Xem thêm <i title="fa-angle-down" class="fa-angle-down" style=""></i></span></a> -->
	</div>
	<div id="shippingPolyci" class="kc-elm kc-css-263157 vntabs_cont" style="display: none;">
		<div class="kc-elm kc-css-586820 vnt_editor">
		${proById.shipping_policy}
		</div>
	</div>
	<div id="returnW" class="kc-elm kc-css-758010 vntabs_cont" style="display: none;">
		<div class="kc-elm kc-css-937626 vnt_editor">
			${proById.return_warranty }
		</div>
	</div>
	<div id="payMents" class="kc-elm kc-css-157699 vntabs_cont" style="display: none;">
		<div class="kc-elm kc-css-582641 vnt_editor">
			${proById.payments }
		</div>
	</div>
</div>
	</div>
        </div>
    </section>
            </div>
        </div>
        <!-- Page end  -->
    </div>
    <!-- Modal Edit -->
    <div class="modal fade" id="edit-note" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="popup text-left">
                        <div class="media align-items-top justify-content-between">                            
                            <h3 class="mb-3">Product</h3>
                            <div class="btn-cancel p-0" data-dismiss="modal"><i class="las la-times"></i></div>
                        </div>
                        <div class="content edit-notes">
                            <div class="card card-transparent card-block card-stretch event-note mb-0">
                                <div class="card-body px-0 bukmark">
                                    <div class="d-flex align-items-center justify-content-between pb-2 mb-3 border-bottom">                                                    
                                        <div class="quill-tool">
                                        </div>
                                    </div>
                                    <div id="quill-toolbar1">
                                        <p>Virtual Digital Marketing Course every week on Monday, Wednesday and Saturday.Virtual Digital Marketing Course every week on Monday</p>
                                    </div>
                                </div>
                                <div class="card-footer border-0">
                                    <div class="d-flex flex-wrap align-items-ceter justify-content-end">
                                        <div class="btn btn-primary mr-3" data-dismiss="modal">Cancel</div>
                                        <div class="btn btn-outline-primary" data-dismiss="modal">Save</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
      </div>
    </div>
    <script>
    $(function() {
    	$("#detail_pro").on('click', function () {
    		$("#detail_pro").addClass("is-active");
			$("#detailPro").show();
			$("#shippingPolyci").hide();
			$("#returnW").hide();
			$("#payMents").hide();
			$("#shipping_polyci").removeClass("is-active");
			$("#return_w").removeClass("is-active");
			$("#pay").removeClass("is-active");
		});
		$('#shipping_polyci').on('click', function () {
			$("#shipping_polyci").addClass("is-active");	
			$("#shippingPolyci").show();
			$("#detailPro").hide();
			$("#returnW").hide();
			$("#payMents").hide();
			$("#detail_pro").removeClass("is-active");
			$("#return_w").removeClass("is-active");
			$("#pay").removeClass("is-active");
		});
		$('#return_w').on('click', function () {
			$('#returnW').show();
			$('#return_w').addClass("is-active");
			$('#shippingPolyci').hide();
			$('#detailPro').hide();
			$('#payMents').hide();
			$('#shipping_polyci').removeClass("is-active");
			$('#detail_pro').removeClass("is-active");
			$('#pay').removeClass("is-active");
		});
		 $('#pay').on('click', function () {
			$('#payMents').show();
			$('#pay').addClass("is-active");
			$('#shippingPolyci').hide();
			$('#detailPro').hide();
			$('#returnW').hide();
			$('#shipping_polyci').removeClass("is-active");
			$('#detail_pro').removeClass("is-active");
			$('#return_w').removeClass("is-active");
		});
		 
    });
   
    </script>
    <!-- Wrapper End-->