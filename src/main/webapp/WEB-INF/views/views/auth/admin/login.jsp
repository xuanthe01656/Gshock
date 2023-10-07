<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <c:url value="/resources/gshock/admin" var="contextPath"
	scope="application"></c:url>
<c:url value="/libraries/" var="ck" scope="application"></c:url>
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>G-WATCH | Admin Dashboard</title>
      
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
    
    <script src="${contextPath }/js/ckeditor/ckeditor.js"></script> 
    <script src="${contextPath }/js/ckeditor/config.js"></script> 
    <script src="${contextPath }/js/jquery.MultiFile.min.js"></script>
 </head>
  <body class=" ">
    <!-- loader Start -->
    <div id="loading">
          <div id="loading-center">
          </div>
    </div>
    <!-- loader END -->
    
      <div class="wrapper">
      <section class="login-content">
         <div class="container">
            <div class="row align-items-center justify-content-center height-self-center">
               <div class="col-lg-8">
                  <div class="card auth-card">
                     <div class="card-body p-0">
                        <div class="d-flex align-items-center auth-content">
                           <div class="col-lg-7 align-self-center">
                              <div class="p-3">
                                 <h2 class="mb-2">Sign In</h2>
                                 <p>Login to stay connected.</p>
                                 <c:if test="${not empty param['error'] }">
								<p style="color: red; font-style: italic">Sai username hoặc password</p>
								</c:if>
								<c:if test="${not empty param['successchange'] }">
								<p style="color: red; font-style: italic">${param['successchange'] }</p>
								</c:if>
                                 <form id="form" action="${pageContext.request.contextPath }/auth/admin/login" method="post" autocomplete="off">
                                    <div class="row">
                                       <div class="col-lg-12">
                                          <div class="floating-label form-group">
                                             <input class="floating-input form-control" name="username" type="text">
                                             <label>Username</label>
                                          </div>
                                       </div>
                                       <div class="col-lg-12">
                                          <div class="floating-label form-group">
                                             <input class="floating-input form-control" name="password" type="password">
                                             <label>Password</label>
                                          </div>
                                       </div>
                                       <div class="col-lg-12">
                                          <div class="floating-label form-group row">
	                                          <div class="col-sm-6">
	                                         	 <input class="floating-input form-control captcha-input" name="code" type="text">
	                                             <label style="padding: 0;left: 31px;">Mã xác nhận</label>
	                                             <div class="status-text"></div>
	                                          </div>
	                                          <div class="col-sm-6">
	                                          	<div class="wrapper">
												    <div class="captcha-area row">
												      <div class="captcha-img col-sm-8">
												        <img src="${contextPath }/images/captcha-bg.png" style="width: 100%; height: 100%" alt="Captch Background">
												        <span class="captcha" style="position: absolute;left: 30%;top: 10%;font-size: x-large;font-style: italic;font-family: cursive;"></span>
												      </div>
												      <div class="col-sm-4">
												      	<button type="button" class="btn btn-primary reload-btn"><i class="fas fa-redo-alt"></i></button>
												      </div>
												    </div>
	                                          	</div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="col-lg-6">
                                          <div class="custom-control custom-checkbox mb-3">
                                             <input type="checkbox" class="custom-control-input" name="remember-me" id="customCheck1">
                                             <label class="custom-control-label control-label-1" for="customCheck1">Remember Me</label>
                                          </div>
                                       </div>
                                       <div class="col-lg-6">
                                          <a href="${pageContext.request.contextPath }/auth/recoverpwad" class="text-primary float-right">Forgot Password?</a>
                                       </div>
                                    </div>
                                    <button type="button" class="btn btn-primary check-btn">Sign In</button>
                                    <p class="mt-3">
                                       Create an Account <a href="${pageContext.request.contextPath }/auth/admin/sign-up" class="text-primary">Sign Up</a>
                                    </p>
                                 </form>
                              </div>
                           </div>
                           <div class="col-lg-5 content-right">
                              <img src="${contextPath }/images/login/01.png" class="img-fluid image-right" alt="">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      </div>
    <script type="text/javascript">
	    const captcha = document.querySelector(".captcha"),
	    reloadBtn = document.querySelector(".reload-btn"),
	    inputField = document.querySelector(".captcha-input"),
	    checkBtn = document.querySelector(".check-btn"),
	    statusTxt = document.querySelector(".status-text");
	    //storing all captcha characters in array
	    let allCharacters = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
	    function getCaptcha(){
	      for (let i = 0; i < 4; i++) { 
	        let randomCharacter = allCharacters[Math.floor(Math.random() * allCharacters.length)];
	        captcha.innerText += randomCharacter; 
	      }
	    }
	    getCaptcha(); 
	    
	    reloadBtn.addEventListener("click", ()=>{
	      removeContent();
	      getCaptcha();
	    });
	    checkBtn.addEventListener("click", e =>{
	      e.preventDefault(); //preventing button from it's default behaviour
	      statusTxt.style.display = "block";
	      //adding space after each character of user entered values because I've added spaces while generating captcha
	      let inputVal = inputField.value.split('').join('');
	      console.log(inputVal+",,"+captcha.innerText);
	      if(inputVal == captcha.innerText){ //if captcha matched
	        statusTxt.style.color = "#4db2ec";
	        statusTxt.innerText = "Nice! You don't appear to be a robot.";
	        setTimeout(()=>{ //calling removeContent & getCaptcha after 2 seconds
	          removeContent();
	          getCaptcha();
	        }, 2000);
	        $("#form").submit();
	      }else{
	        statusTxt.style.color = "#ff0000";
	        statusTxt.innerText = "Captcha not matched. Please try again!";
	        setTimeout(()=>{ //calling removeContent & getCaptcha after 2 seconds
		          removeContent();
		          getCaptcha();
		        }, 2000);
	      }
	    });
	    function removeContent(){
	     inputField.value = "";
	     captcha.innerText = "";
	     statusTxt.style.display = "none";
	    }
    </script>
    <!-- Backend Bundle JavaScript -->
    <script src="${contextPath }/js/backend-bundle.min.js"></script>
    
    <!-- Table Treeview JavaScript -->
    <script src="${contextPath }/js/table-treeview.js"></script>
    
    <!-- Chart Custom JavaScript -->
    
    
    <!-- Chart Custom JavaScript -->
    <script async src="${contextPath }/js/chart-custom.js"></script>
    
    <!-- app JavaScript -->
    <script src="${contextPath }/js/app.js"></script>
    <script src="${contextPath }/js/apps.js"></script>
    
  </body>
</html>