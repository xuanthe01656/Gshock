<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      </div>      
      <div class="content-page">
     <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="d-flex flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Category List</h4>
                        <p class="mb-0">Use category list as to describe your overall core business from the provided list.</p>
                    </div>
                    <a href="${pageContext.request.contextPath }/admin/add-cat" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Category</a>
                </div>
            </div>
        </div>
        <div class="row">
        	<c:if test="${not empty param['success'] }">
        		<p style="color: green; font-style: italic;">${param['success'] }</p>
        	</c:if>
        	<c:if test="${not empty param['unsuccess'] }">
        		<p style="color: red; font-style: italic;">${param['unsuccess'] }</p>
        	</c:if>
            <div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                <table class="table table-bordered mb-0">
                 <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                        	<th scope="col">#</th>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Picture</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                    <c:if test="${not empty categoryService.getListCatByPrId(0) }">
                    	<c:forEach items="${categoryService.getListCatByPrId(0) }" var="cat">
                    	<tr>
                    		<td scope="row">Cat Parent</td>
                            <td>${cat.id }</td>
                            <td>
                            	<p id="text${cat.id }" class="fw-bold text-dark">${cat.name }</p>
                            	<Input id="text${cat.id }_input" style="display:none"/>
                            	<div>
	                        	<script type="text/javascript">
	                             $( "#text${cat.id}" ).dblclick(function() {
										
							    	  $( "#text${cat.id}").hide();
							    	  $( "#text${cat.id}_input" ).val($( "#text${cat.id}" ).html()); // Copies the text of the span to the input box.
							    	  $( "#text${cat.id}_input" ).show();
							    	  $( "#text${cat.id}_input" ).focus();
							    	  
							    	});
							
							    	// What to do when user changes the text of the input
							    	function textChanged(){
							
							    	  $( "#text${cat.id}_input" ).hide();
							    	  $( "#text${cat.id}").html($( "#text${cat.id}_input" ).val()); // Copies the text of the input box to the span.
							    	  $( "#text${cat.id}" ).show();
							    	  	var id=${cat.id};
							    	  	var name = $( "#text${cat.id}_input" ).val();
							    	  // Here update the database
							    	  $.ajax({
                        					url: '<%=request.getContextPath()%>/admin/handel_name_cat_edit',
                        					type: 'POST',
                        					cache: false,
                        					data: {
                        						id: id,
                        						name: name
                        					},
                        					
                        					success: function(data){
                        						$('.ajax-data1').html(data);
                        					},
                        					error: function (){
                        						alert('Có lỗi xảy ra');
                        					},
                        				});
							    	      
							    	}
							
							    	// On blur and on enter pressed, call the textChanged function
							    	$( "#text${cat.id}_input" ).blur(textChanged);
							    	$( "#text${cat.id}_input" ).keypress(function (e) {
							    	 var key = e.which;
							    	 if(key == 14)  // the enter key code
							    	  {
							    	    textChanged();
							    	    return false;  
							    	  }
							    	});
							    	
	                         </script>
                            	</div>
                            </td>
                            <td>
                            <c:if test="${not empty cat.image}">
                            	<img src="${imagePath }/category/${cat.image}" class="img-fluid rounded avatar-50 mr-3" alt="image">
                            </c:if>
                            </td>
                            <td>
                                <div class="d-flex align-items-center list-action">
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="${pageContext.request.contextPath }/admin/edit-cat?id=${cat.id}">
							         <i class="ri-pencil-line mr-0"></i>
							    </a>
	                             <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="<%=request.getContextPath()%>/admin/delete-cat?id=${cat.id}" onclick="return confirm('Nếu xóa danh mục này sẽ xóa toàn bộ danh mục có liên quan. Bạn thật sự muốn xóa ?')">
	                                 <i class="ri-delete-bin-line mr-0"></i>
	                             </a> 
                                </div>
                            </td>
                        </tr>
                        <c:if test="${not empty categoryService.getListCatByPrId(cat.id) }">
                        	<c:forEach items="${categoryService.getListCatByPrId(cat.id) }" var="catChil">
                        		<tr>
                    		<td <%-- rowspan="${fn:length(categoryService.getListCatByPrId(cat.id)) }" --%> scope="row">Cat Chil</td>
                            <td>${catChil.id }</td>
                            <td>
                            	<p id="text${catChil.id }" class="fw-bold text-dark">${catChil.name }</p>
                            	<Input id="text${catChil.id }_input" style="display:none"/>
                            	<div>
	                        	<script type="text/javascript">
	                             $( "#text${catChil.id}" ).dblclick(function() {
										
							    	  $( "#text${catChil.id}").hide();
							    	  $( "#text${catChil.id}_input" ).val($( "#text${catChil.id}" ).html()); // Copies the text of the span to the input box.
							    	  $( "#text${catChil.id}_input" ).show();
							    	  $( "#text${catChil.id}_input" ).focus();
							    	  
							    	});
							
							    	// What to do when user changes the text of the input
							    	function textChanged(){
							
							    	  $( "#text${catChil.id}_input" ).hide();
							    	  $( "#text${catChil.id}").html($( "#text${catChil.id}_input" ).val()); // Copies the text of the input box to the span.
							    	  $( "#text${catChil.id}" ).show();
							    	  	var id=${catChil.id};
							    	  	var name = $( "#text${catChil.id}_input" ).val();
							    	  // Here update the database
							    	  $.ajax({
                        					url: '<%=request.getContextPath()%>/admin/handel_name_cat_edit',
                        					type: 'POST',
                        					cache: false,
                        					data: {
                        						id: id,
                        						name: name
                        					},
                        					
                        					success: function(data){
                        						$('.ajax-data1').html(data);
                        					},
                        					error: function (){
                        						alert('Có lỗi xảy ra');
                        					},
                        				});
							    	      
							    	}
							
							    	// On blur and on enter pressed, call the textChanged function
							    	$( "#text${catChil.id}_input" ).blur(textChanged);
							    	$( "#text${catChil.id}_input" ).keypress(function (e) {
							    	 var key = e.which;
							    	 if(key == 14)  // the enter key code
							    	  {
							    	    textChanged();
							    	    return false;  
							    	  }
							    	});
							    	
	                         </script>
                            	</div>
                            
                            </td>
                            <td>
                            	<img src="${imagePath }/category/${catChil.image}" class="img-fluid rounded avatar-50 mr-3" alt="image">
                            </td>
                            <td>
                                <div class="d-flex align-items-center list-action">
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="${pageContext.request.contextPath }/admin/edit-cat?id=${catChil.id}">
							         <i class="ri-pencil-line mr-0"></i>
							    </a>
	                             <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="<%=request.getContextPath()%>/admin/delete-cat?id=${catChil.id}" onclick="return confirm('Nếu xóa danh mục này sẽ xóa toàn bộ danh mục có liên quan. Bạn thật sự muốn xóa ?')">
	                                 <i class="ri-delete-bin-line mr-0"></i>
	                             </a> 
                                </div>
                            </td>
                        </tr>
                        	</c:forEach>
                        </c:if>
                    	</c:forEach>
                    </c:if>
                    	
                    </tbody>
                    <%-- <tbody class="ligth-body">
                        <tr>                      	
							 <th >
							 	<div class="row">
							 	
								 	<div id="target2" class="col-sm-12 my-2 py-2 text-center border text-bg-primary">
								 		<div class="ajax-data1"></div>
								 		<p id="text1" class="text-dark">name</p>
								 		<Input id="text1_input" style="display:none"/>
								 		
								         <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="<%=request.getContextPath()%>/admin/edit-categories?id=1">
								            <i class="ri-pencil-line mr-0"></i>
								          </a>
		                                  <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="<%=request.getContextPath()%>/admin/delete-categories?id=1" onclick="return confirm('Nếu xóa danh mục này sẽ xóa toàn bộ danh mục có liên quan. Bạn thật sự muốn xóa ?')">
		                                    <i class="ri-delete-bin-line mr-0"></i>
		                                  </a> 
		                                  
		                                  	<a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="<%=request.getContextPath()%>/admin/edit-categories?id=1">
								            <i class="ri-pencil-line mr-0"></i>
								          </a>
		                                  
		                                  <script type="text/javascript">
		                                  $( "#text"+1 ).dblclick(function() {
												
									    	  $( "#text1" ).hide();
									    	  $( "#text1_input" ).val($( "#text1" ).html()); // Copies the text of the span to the input box.
									    	  $( "#text1_input" ).show();
									    	  $( "#text1_input" ).focus();
									    	  
									    	});
									
									    	// What to do when user changes the text of the input
									    	function textChanged(){
									
									    	  $( "#text1_input" ).hide();
									    	  $( "#text1").html($( "#text1_input" ).val()); // Copies the text of the input box to the span.
									    	  $( "#text1" ).show();
									    	  	var id = 1;
									    	  	var name = $( "#text1_input" ).val(); 
									    	  // Here update the database
									    	  $.ajax({
                              					url: '<%=request.getContextPath()%>/admin/handel-name-categories',
                              					type: 'POST',
                              					cache: false,
                              					data: {
                              						aid: id,
                              						aname: name
                              					},
                              					success: function(data){
                              						$('.ajax-data1').html(data);
                              					},
                              					error: function (){
                              						alert('Có lỗi xảy ra');
                              					},
                              				});
									    	      
									    	}
									
									    	// On blur and on enter pressed, call the textChanged function
									    	$( "#text1_input" ).blur(textChanged);
									    	$( "#text1_input" ).keypress(function (e) {
									    	 var key = e.which;
									    	 if(key == 14)  // the enter key code
									    	  {
									    	    textChanged();
									    	    return false;  
									    	  }
									    	});
		                                  </script>
								 	</div>
								 	
								 	<div id="target3" class="col-sm-4 px-2 border fw-normal">
								 		<div class="row">
								 			<div class="col-sm-6">
								 				<div class="ajax-data2"></div>
								 				<p id="text2" class="pt-3" >name</p>
								 				<Input id="text2_input" name="pic" style="display:none"/>
								 			</div>
								 			<div class="col-sm-3 pt-2">
								 				<Input class="pt-3" type="file" id="image2_input" name="pic" style="display:none"/>	
								 			</div>
								 			<div class="col-sm-3 pt-3">
								 				
								         <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="<%=request.getContextPath()%>/admin/edit-categories?id=1">
								            <i class="ri-pencil-line mr-0"></i>
								          </a>
		                                  <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="<%=request.getContextPath()%>/admin/delete-categories?id=1" onclick="return confirm('Nếu xóa danh mục này sẽ xóa toàn bộ danh mục có liên quan. Bạn thật sự muốn xóa ?')">
		                                    <i class="ri-delete-bin-line mr-0"></i>
		                                  </a> 
		                                  
		                                  	<a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="<%=request.getContextPath()%>/admin/edit-categories?id=1">
								            <i class="ri-pencil-line mr-0"></i>
								          </a>
								 			</div>
								 			<script type="text/javascript">
												    	$( "#text2" ).dblclick(function() {
													    	  $( "#text2" ).hide();
													    	  $( "#text2_input" ).val($( "#text2" ).html()); // Copies the text of the span to the input box.
													    	  $( "#text2_input" ).show();
													    	  $( "#text2_input" ).focus();
													    	  
													    	});
													
													    	// What to do when user changes the text of the input
													    	function textChanged(){
													
													    	  $( "#text2_input" ).hide();
													    	  $( "#text2" ).html($( "#text2_input" ).val()); // Copies the text of the input box to the span.
													    	  $( "#text2" ).show();
													    	      var id = 2;
													    	      var name = $("#text2_input" ).val();
													    	  // Here update the database
													    	  $.ajax({
					                              					url: '<%=request.getContextPath()%>/admin/handel-name-categories',
					                              					type: 'POST',
					                              					cache: false,
					                              					data: {
					                              						aid: id,
					                              						aname: name
					                              					},
					                              					success: function(data){
					                              						$('.ajax-data2').html(data);
					                              					},
					                              					error: function (){
					                              						alert('Có lỗi xảy ra');
					                              					},
					                              				});     
													    	}
													    	// On blur and on enter pressed, call the textChanged function
													    	$( "#text2_input" ).blur(textChanged);
													    	$( "#text2_input" ).keypress(function (e) {
													    	 var key = e.which;
													    	 if(key == 14)  // the enter key code
													    	  {
													    	    textChanged();
													    	    return false;  
													    	  }
													    	});

													    	$( "#image2" ).dblclick(function() {
													    			$( "#image2" ).hide();  
														    	  $( "#image2_input" ).show();
														    	  $( "#image2_input" ).focus(); 
														    	});
														    	// What to do when user changes the text of the input

														    	$( "input[type=file]#image2_input" ).change(function(e) {
														    		var filename_input = e.target.files[0].name;
														    		var src = $("#image2").attr("src");
															    	var path = src.substring(0,src.lastIndexOf('/'));									    		
															    	var filename = src.split("/").pop();
															    	var newSrc = path+"/"+filename_input;
															    	$("#image2").attr("src",newSrc);
														    		
															    	  var formData = new FormData();
															    	  	formData.append('aid', 2);
															    		formData.append("pic", image2_input.files[0]);
															    	  $.ajax({	
							                              					url: '<%=request.getContextPath()%>/admin/handel-images-categories',
							                              					type: 'POST',
							                              					cache: false,
							                              					contentType: false,
							                              					data: formData,
							                              					processData: false,
							                              					success: function(data){
							                              						$('.ajax-data2').html(data);
							                              						
							                              					},
							                              					error: function (){
							                              						alert('Có lỗi xảy ra');
							                              					},
							                              				});
															    	  $( "#image2_input" ).hide();
															    	  $( "#image2" ).show();
															    	  
														    	});
														    	
														    	
										</script>						
								 		</div>	
								 		 <script type="text/javascript">
								 		$(window).load(function () {
								            var aid = id;
								            var amsg = msg;
								            if(aid==1&&amsg=1){
								            	$('body').scrollTo('#target1');
								            }else{
								            	if(aid==1&&amsg=2){
								            		$('body').scrollTo('#target1');
								            	}
								            }
								            if(aid==1&&amsg=1){
								            	$('body').scrollTo('#target2');
								            }else{
								            	if(aid==1&&amsg=2){
								            		$('body').scrollTo('#target2');
								            	}
								            }
								            if(aid==1&&amsg=1){
								            	$('body').scrollTo('#target3');
								            }else{
								            	if(aid==1&&amsg=2){
								            		$('body').scrollTo('#target3');
								            	}
								            }
								        });
								 		 </script>											     
	                              </div>
							    </div>  
	                                  
							 </th>
							 
                        </tr>                                                                  	                      
                    </tbody> --%>
                </table>
            </div>        
        </div>
    </div>
    
        <!-- Page end  -->
    </div>
    <!-- Modal Edit -->
      </div>
    </div>
    <!-- Wrapper End-->