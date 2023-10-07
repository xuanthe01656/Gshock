<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
     <div class="container-fluid add-form-list">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Add Category</h4>
                        </div>
                    </div>
                    
                    <div class="card-body">
                    <c:if test="${not empty success }">
                    	<p style="color: red; font-style: italic;">${success }</p>
                    </c:if>
                    <div class="row">
                    		<button type="button" id="btn-add" class="btn btn-primary my-2">Add Category Parent</button>
                    		<div class="col-md-12" id="form-show" style="display: none;">
                    		<form class="form" id="form" action="<%=request.getContextPath() %>/admin/add-cat?parent_id=0" method="post" enctype="multipart/form-data" data-toggle="validator">
                            <div class="row">  
                            	<div class="col-md-12">
                                    <div class="form-group">
                                        <label>Category *</label>
                                        <div class="ajax-dataname"></div>
                                        <input type="text" id="menucategory" class="form-control" name ="name" value="" placeholder="Enter your category">
                                        <label for="menucategory" class="error" style="color: red;"></label>
                                    </div>
                                </div>                                
                                <script type="text/javascript">
                                  $(".form").validate({
                        			
                        			rules:{
                        				name:{
                        					required: true,
                        					minlength: 2,
                        					maxlength: 50,
                        				}	
                        			},
                          		messages:{
                          			name: {
                        					required: " Hãy nhập vào category.",
                        					minlength: " Hãy nhập vào nhiều hơn 2 ký tự và ít hơn 50 ký tự.",
                        					maxlength: " Hãy nhập vào ít hơn 50 ký tự.",
                        				}
                          		},
                          	});
                                $(function() {
                                	jQuery('#menucategory').keyup(function() {
                                		$(this).val($(this).val().toUpperCase());
                                	});
                        		    $('#menucategory').on('input', function() {                      		    	
                            		        var changedField = $(this);
                            		        var name = $("#menucategory").val();
                            		        var parent_id = 1;                           		                    
                            		        $.ajax({
                            					url: '<%=request.getContextPath()%>/admin/handel_name_cat_add',
                            					type: 'POST',
                            					cache: false,
                            					data: {
                            						parent_id: parent_id,
                            						name: name},
                            					success: function(data){
                            						if(data=="1"){
                            							$('.ajax-dataname').html("<p style='color:red; font-style: italic'>Tên danh mục đã tồn tại.</p>");
                            						}
                            						if(data=="2"){
                            							$('.ajax-dataname').html("<p style='color:green; font-style: italic'>Tên danh mục được phép dùng.</p>");
                            						}
                            					},
                            					error: function (){
                            						alert('Có lỗi xảy ra');
                            					},
                            				});
                            				return false;
                            		    });
                        		});
                                
                                </script>                                               
                            </div>                            
                            <button type="submit" class="btn btn-primary mr-2">Add category</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                        </div>
                        
                        
                            <button type="button" id="btn-add2" class="btn btn-danger my-2">Add Category Chil</button>
                            <div class="col-md-12" id="form-show2" style="display: none;">
                           
                            <form class="form1" id="form2" action="<%=request.getContextPath() %>/admin/add-cat" method="post" enctype="multipart/form-data" data-toggle="validator">
                            <div class="row">                              
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Category Parent</label>
                                        
                                        <select id="catPr" name="parent_id" class="form-select" data-style="py-0">
	                                        	<option value="">--Chọn Category--</option>
	                                        	<c:if test="${not empty listCatPr }">
	                                        		<c:forEach items="${listCatPr }" var="catPr">
	                                        		<option value="${catPr.id }">${catPr.name }</option>
	                                        		</c:forEach>
	                                        	</c:if>
	                                        </select>
	                                        <label for="catPr" class="error" style="color: red;"></label>
                                    </div>
                                    
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Category Chil*</label>
                                        <div class="ajax-dataname2"></div>
                                        <input id="catChil" name="name" value="" class="form-control" data-style="py-0" placeholder="Input your category">
                                        <label for="name" class="error" style="color: red;"></label>
                                    </div>
                                    <script type="text/javascript">
                                    $(".form1").validate({
                            			
                            			rules:{
                            				name:{
                            					required: true,
                            					minlength: 2,
                            					maxlength: 50,
                            				},
                            				parent_id:{
                            					required: true,
                            				}
                            			},
                              		messages:{
                              			name: {
                            					required: " Hãy nhập vào category.",
                            					minlength: " Hãy nhập vào nhiều hơn 2 ký tự và ít hơn 50 ký tự.",
                            					maxlength: " Hãy nhập vào ít hơn 50 ký tự.",
                            				},
                            				parent_id:{
                            					required: "Vui lòng chọn",
                            				}
                              		},
                              	});
                                $(function() {
                                	jQuery('#catChil').keyup(function() 
                                        	{
                                        		var str = jQuery('#catChil').val();
                                        		var spart = str.split(" ");
                                        		for ( var i = 0; i < spart.length; i++ )
                                        		{
                                        			var j = spart[i].charAt(0).toUpperCase();
                                        			spart[i] = j + spart[i].substr(1);
                                        		}
                                              jQuery('#catChil').val(spart.join(" "));
                                        	
                                       	});
                        		    $('#catChil').on('keyup', function() {                      		    	
                            		        var changedField = $(this);
                            		        var name = $("#catChil").val();
                            		        var parent_id = $("#catPr").val();                           		                    
                            		        $.ajax({
                            					url: '${pageContext.request.contextPath}/admin/handel_name_cat_add',
                            					type: 'POST',
                            					cache: false,
                            					data: {
                            						parent_id: parent_id,
                            						name: name},
                            					success: function(data){
                            						if(data=="1"){
                            							$('.ajax-dataname').html("<p style='color:red; font-style: italic'>Tên danh mục đã tồn tại.</p>");
                            						}
                            						if(data=="2"){
                            							$('.ajax-dataname').html("<p style='color:green; font-style: italic'>Tên danh mục được phép dùng.</p>");
                            						}
                            					},
                            					error: function (){
                            						alert('Có lỗi xảy ra');
                            					},
                            				});
                            				return false;
                            		    });
                        		});
                                </script>             
                                </div>  
                                <div class="col-md-12">
		                             <div class="form-group">
		                                <label>Image</label>
		                                <input type="file" class="form-control image-file" name="picture" accept="image/*">
		                                <label for="picture" class="error"></label>
		                             </div>
		                        </div>    
		                        <div class="col-md-12">
		                             <div class="form-group">
		                                <label>Logo</label>
		                                <input type="file" class="form-control image-file" name="pic" accept="image/*">
		                                <label for="pic" class="error"></label>
		                             </div>
		                        </div>                                                    
                            </div>                            
                            <button type="submit" class="btn btn-primary mr-2">Add category</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                        </div>
                    </div> 
                    </div>
                </div>
                <script>
                $(document).ready(function(){
                	$( "#btn-add" ).click(function() {
                		$( "#form-show" ).toggle();
                		$( "#form-show2" ).hide();
                		
                	});
                	$( "#btn-add2" ).click(function() {
                		$( "#form-show" ).hide();
                		$( "#form-show2" ).toggle();
                		
                  	});
                	});
                	
                </script>
            </div>
        </div>
        <!-- Page end  -->
    </div>
     </div>
    </div>
    <!-- Wrapper End-->