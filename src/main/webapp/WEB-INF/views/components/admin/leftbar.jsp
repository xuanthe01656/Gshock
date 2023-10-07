<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
    <!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>G-WATCH | Admin Dashboard</title>
      <c:url value="/resources/gshock/admin" var="contextPath" scope="application"></c:url>
      <c:url value="/resources/gshock/image" var="imagePath" scope="application"></c:url>
      <%-- <c:url value="/libraries" var="ck" scope="application"></c:url> --%>
      <!-- Favicon -->
     	<link rel="shortcut icon" href="${contextPath }/images/LOGO-GWACH-e1638010196607.png" />
      	<link rel="stylesheet" href="${contextPath }/css/backend-plugin.min.css">
      	<link rel="stylesheet" href="${contextPath }/css/backend.css?v=1.0.0">
      	<link rel="stylesheet" href="${contextPath }/vendor/@fortawesome/fontawesome-free/css/all.min.css">
      	<link rel="stylesheet" href="${contextPath }/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css">
      	<link rel="stylesheet" href="${contextPath }/vendor/remixicon/fonts/remixicon.css">
      	<link rel="stylesheet" href="${contextPath }/css/bootstrap/bootstrap.css">
      	<link rel="stylesheet" href="${contextPath }/css/bootstrap/bootstrap.min.css.map">
      	<link rel="stylesheet" href="${contextPath }/css/stylebackend.css">
      	<link rel="stylesheet" href="${contextPath }/css/style_order.css">
      	<link rel="dns-prefetch" href="https://stats.wp.com/">
		<link rel="dns-prefetch" href="https://pc.baokim.vn/">
		<link rel="dns-prefetch" href="https://fonts.googleapis.com/">
		<link rel="stylesheet" id="wc-blocks-vendors-style-css" href="${contextPath }/css/wc-blocks-vendors-style.css" type="text/css" media="all">
		<link rel="stylesheet" id="wc-blocks-style-css" href="${contextPath }/css/wc-blocks-style.css" type="text/css" media="all">
      	<link rel="stylesheet" id="contact-form-7-css" href="${contextPath }/css/styles.css" type="text/css" media="all">
      	<link rel="stylesheet" id="contact-form-7-css" href="${contextPath }/css/kingcomposer.min.css" type="text/css" media="all">
		<link rel="stylesheet" id="woocommerce-layout-css" href="${contextPath }/css/woocommerce-layout.css" type="text/css" media="all">
		<link rel="stylesheet" id="woocommerce-smallscreen-css" href="${contextPath }/css/woocommerce-smallscreen.css" type="text/css" media="only screen and (max-width: 768px)">
		<link rel="stylesheet" id="woocommerce-general-css" href="${contextPath }/css/woocommerce.css" type="text/css" media="all">
      	<link rel="stylesheet" id="dgwt-wcas-style-css" href="${contextPath }/css/style.min.css" type="text/css" media="all">
		<link rel="stylesheet" id="select2-css" href="${contextPath }/css/select2.css" type="text/css" media="all">
		<link rel="stylesheet" id="xoo-wsc-fonts-css" href="${contextPath }/css/xoo-wsc-fonts.css" type="text/css" media="all">
		<link rel="stylesheet" id="xoo-wsc-style-css" href="${contextPath }/css/xoo-wsc-style.css" type="text/css" media="all">
 	 
 	 
  
 	 <script src="${contextPath }/js/jquery/jquery-3.6.1.min.js"></script>
 	 <script src="${contextPath }/js/jquery-validation-1.19.5/dist/jquery.validate.min.js"></script>
 	 <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js" ></script>
 	 
     <!--<script src="${contextPath }/js/jQuery_v3.1.1.min.js"></script><script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>-->
    <script src="${contextPath }/js/bootstrap.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" ></script>
    
    <script src="${contextPath }/js/apps.js"></script> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/libraries/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/libraries/ckfinder/ckfinder.js"></script>
    <script src="${contextPath }/js/ckeditor/config.js"></script>
    <script src="${contextPath }/js/jquery.MultiFile.min.js"></script>
   	
     
    
     
   </head>
  <body class="  ">
    <!-- loader Start -->
    <div id="loading">
          <div id="loading-center">
          </div>
    </div>
    <!-- loader END -->
    <!-- Wrapper Start -->
    <div class="wrapper">
    
	<div class="iq-sidebar  sidebar-default ">
          <div class="iq-sidebar-logo d-flex align-items-center justify-content-between">
              <a href="${pageContext.request.contextPath}/admin/index" class="header-logo">
                  <img src="${contextPath }/images/LOGO-GWACH-e1638010196607.png" class="img-fluid rounded-normal light-logo" alt="logo"><h5 class="logo-title light-logo ml-3"></h5>
              </a>
              <div class="iq-menu-bt-sidebar ml-0">
                  <i class="las la-bars wrapper-menu" style=" margin-left: 85px; "></i>
              </div>
          </div>
          <div class="data-scrollbar" data-scroll="1">
              <nav class="iq-sidebar-menu">
                  <ul id="iq-sidebar-toggle" class="iq-menu">
                      <li class="active">
                          <a href="${pageContext.request.contextPath}/admin/index" class="svg-icon">                        
                              <svg  class="svg-icon" id="p-dash1" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"></path><polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline><line x1="12" y1="22.08" x2="12" y2="12"></line>
                              </svg>
                              <span class="ml-4">Dashboards</span>
                          </a>
                      </li>
                      <li class=" ">
                          <a href="#product" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <svg class="svg-icon" id="p-dash2" width="20" height="20"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle>
                                  <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                              </svg>
                              <span class="ml-4">Products</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="product" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                              <li class="">
                                  <a href="${pageContext.request.contextPath}/admin/product">
                                      <i class="las la-minus"></i><span>List Product</span>
                                  </a>
                              </li>
                              
                              <li class="">
                                  <a href="${pageContext.request.contextPath}/admin/add-product">
                                      <i class="las la-minus"></i><span>Add Product</span>
                                  </a>
                              </li>
                              
                          </ul>
                      </li>
                      <security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EDITOR')">
                      <li class=" ">
                          <a href="#category" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <svg class="svg-icon" id="p-dash3" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect>
                                  <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path>
                              </svg>
                              <span class="ml-4">Categories</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="category" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                          			<li class="">
                                          <a href="${pageContext.request.contextPath}/admin/cat">
                                              <i class="las la-minus"></i><span title="List Menu Categories">List Categories</span>
                                          </a>
                                  </li>
                                  
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/add-cat">
                                              <i class="las la-minus"></i><span title="Add Menu">Add Category</span>
                                          </a>
                                  </li>
                                  
                          </ul>
                      </li>
                      </security:authorize>
                      <li class=" ">
                          <a href="#order" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <svg class="svg-icon" id="p-dash4" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path><path d="M22 12A10 10 0 0 0 12 2v10z"></path>
                              </svg>
                              <span class="ml-4">Order</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="order" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/order">
                                              <i class="las la-minus"></i><span>List Order</span>
                                          </a>
                                  </li>
                                  
                          </ul>
                      </li>
                      <security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EDITOR')">
                      <li class=" ">
                          <a href="#sale" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <svg class="svg-icon" id="p-dash4" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path><path d="M22 12A10 10 0 0 0 12 2v10z"></path>
                              </svg>
                              <span class="ml-4">Sale</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="sale" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/sale">
                                              <i class="las la-minus"></i><span>List Sale</span>
                                          </a>
                                  </li>
                                  
                          </ul>
                      </li>
                      <li class=" ">
                          <a href="#return" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <svg class="svg-icon" id="p-dash6" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="4 14 10 14 10 20"></polyline><polyline points="20 10 14 10 14 4"></polyline><line x1="14" y1="10" x2="21" y2="3"></line><line x1="3" y1="21" x2="10" y2="14"></line>
                              </svg>
                              <span class="ml-4">Returns</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="return" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/returns">
                                              <i class="las la-minus"></i><span>List Returns</span>
                                          </a>
                                  </li>
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/add-return">
                                              <i class="las la-minus"></i><span>Add Return</span>
                                          </a>
                                  </li>
                          </ul>
                      </li>
                      </security:authorize>
                      <security:authorize access="hasRole('ROLE_ADMIN')">
                      <li class=" ">
                          <a href="#user" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <svg class="svg-icon" id="p-dash8" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                              </svg>
                              <span class="ml-4">User</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="user" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/user">
                                              <i class="las la-minus"></i><span>Users</span>
                                          </a>
                                  </li>
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/add-user">
                                              <i class="las la-minus"></i><span>Add Users</span>
                                          </a>
                                  </li>
                                 
                          </ul>
                      </li>
                       <li class=" ">
                          <a href="${pageContext.request.contextPath}/admin/customer" >
                              <svg class="svg-icon" id="p-dash8" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                              </svg>
                              <span class="ml-4">Customers</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                      </li>
                        </security:authorize>
                        <security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EDITOR')">
                      <li class=" ">
                          <a href="#suppliers" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <svg class="svg-icon" id="p-dash8" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                              </svg>
                              <span class="ml-4">Suppliers And Country</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="suppliers" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                   <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/supplier">
                                              <i class="las la-minus"></i><span>Suppliers</span>
                                          </a>
                                  </li>
                                   <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/country">
                                              <i class="las la-minus"></i><span>Country</span>
                                          </a>
                                  </li>
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/add-supplier">
                                              <i class="las la-minus"></i><span>Add Suppliers</span>
                                          </a>
                                  </li>
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/add-country">
                                              <i class="las la-minus"></i><span>Add Country</span>
                                          </a>
                                  </li>
                          </ul>
                      </li> 
                      </security:authorize> 
                      <security:authorize access="hasRole('ROLE_ADMIN')">
                      <li class=" ">
                          <a href="#payment_management" class="collapsed" data-toggle="collapse" aria-expanded="false">
                              <img class="svg-icon" src="${contextPath }/images/bank_2830155.png" id="p-dash8" width="20" height="20" />
                              <span class="ml-4">Payment Management</span>
                              <svg class="svg-icon iq-arrow-right arrow-active" width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                  <polyline points="10 15 15 20 20 15"></polyline><path d="M4 4h7a4 4 0 0 1 4 4v12"></path>
                              </svg>
                          </a>
                          <ul id="payment_management" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                          			<li class="">
                                          <a href="${pageContext.request.contextPath}/admin/depositwithdrawal">
                                              <i class="las la-minus"></i><span>Deposit And Withdrawal Management</span>
                                          </a>
                                  </li>
                                   <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/atmadmin">
                                              <i class="las la-minus"></i><span>Account ATM Admin</span>
                                          </a>
                                  </li>
                                   <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/atmcustomer">
                                              <i class="las la-minus"></i><span>Account ATM Customer</span>
                                          </a>
                                  </li>
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/lockxu">
                                              <i class="las la-minus"></i><span>Account LOCKXU</span>
                                          </a>
                                  </li>
                                  <li class="">
                                          <a href="${pageContext.request.contextPath}/admin/add-atmadmin">
                                              <i class="las la-minus"></i><span>Add ATM Admin</span>
                                          </a>
                                  </li>
                          </ul>
                      </li> 
                      </security:authorize>               
                    </ul>
              </nav>
              <div id="sidebar-bottom" class="position-relative sidebar-bottom">
                  <div class="card border-none">
                      <div class="card-body p-0">
                          <div class="sidebarbottom-content">
                              <div class="image"><img src="${contextPath }/images/layouts/side-bkg.png" class="img-fluid" alt="side-bkg"></div>
                              <h6 class="mt-4 px-4 body-title">Get More Feature by Upgrading</h6>
                              <button type="button" class="btn sidebar-bottom-btn mt-4">Go Premium</button>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="p-3"></div>
          </div>
          </div>