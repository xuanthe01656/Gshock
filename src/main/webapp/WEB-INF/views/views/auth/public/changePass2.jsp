<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!-- header -->
<!DOCTYPE html>
<html>
  <head>
    <title>Change Password</title>
    <c:url value="/resources/cland/admin" var="contextPath" scope="application"></c:url>
    <link rel="shortcut icon" type="image/ico" href="${contextPath}/images/icon-180x180.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <link href="${contextPath}/css/style1.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/custom.js"></script>
  </head>
  <body>
  	<!-- <div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              Logo
	              <div class="logo">
	                 <h1><a href="index">VNE-Admin</a></h1>
	              </div>
	           </div>
	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12"></div>
	              </div>
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                    <ul class="nav navbar-nav">
	                      <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                          <li><a href="profile">Profile</a></li>
	                          <li><a href="login">Logout</a></li>
	                        </ul>
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div>
	</div> -->
<!-- /.header -->
<%-- <security:authorize access="isAuthenticated()">
	<c:redirect url="${pageContext.request.contextPath }/admin"/>
</security:authorize> --%>
	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			            	<img width="100px" height="100px" class="img-circle" src="${contextPath}/images/icon-180x180.png">
			                <h6>Check User</h6>
			                <c:if test="${not empty success }">
								<p style="color: red; font-style: italic">${success }</p>
							</c:if>
			                <form id="getPass" action="${pageContext.request.contextPath}/auth/change-password" method="Post">
			                <div class="form-group">
			                	<label class="text-left pull-left" for="username">Code <small>(Kiểm tra hòm thư bao gồm cả thư rác)</small> </label>
			                	<form:errors path="loginError.code" cssStyle="color: red; font-style: italic"></form:errors><br>
			               		<input class="form-control" type="text" name="code" placeholder="Code">
			                </div>
			                
			                <div class="form-group">
			                	<label class="text-left pull-left" for="password">Mật Khẩu Mới</label>
			                	<input class="form-control" id="password" name="password" type="password" placeholder="Email">
			                </div>
			                <div class="form-group">
			                	<label class="text-left pull-left" for="repassword">Nhập Lại Mật Khẩu</label>
			                	<input class="form-control" name="repassword" type="password" placeholder="re-Password">
			                </div>
			                <div class="action">
			                    <input type="submit" class="btn btn-primary signup btn-block" value="Xác Nhận">
			                </div>
			                </form>                
			            </div>
			        </div>
					
			        <div class="already">
			            <p>Don't have an account yet?</p>
			            <a href="${pageContext.request.contextPath}/auth/public/sign-up">Sign Up</a>
			        </div>
			    </div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	jQuery(document).ready(function () {
	 $("#getPass").validate({
		 rules: {
				"code": {
					required: true,
					minlength: 8,
				},
				"password": {
					required: true,
					minlength: 6,
					maxlength: 13,
				},
				"repassword": {
					equalTo: "#password",
					minlength: 6,
					maxlength: 13,
				}
			},
	 	messages:{
	 		"code": {
				required: "Nhập vào code.",
				minlength: "Nhập vào 8 ký tự",
			},
			"password": {
				required: "Nhập vào mật khẩu.",
				minlength: "Nhập vào tối thiểu 6 ký tự",
				maxlength: "Nhập vào tối đa 13 ký tự",
			},
			"repassword": {
				required: "Nhập vào mật khẩu.",
				minlength: "Nhập vào tối thiểu 6 ký tự",
				maxlength: "Nhập vào tối đa 13 ký tự",
			},
	 	}
	 });
	});
	</script>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
  </body>
</html>