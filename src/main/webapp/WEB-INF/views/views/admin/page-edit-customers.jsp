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
                            <h4 class="card-title">Edit Customers</h4>
                        </div>
                    </div>
                    <div class="card-body">
                  
                        <form id="form-add-user" action="<%=request.getContextPath() %>/admin/edit-customers" method="Post" data-toggle="validator">
                            <div class="row"> 
                                <div class="col-md-6">                      
                                    <div class="form-group">
                                        <label>Name *</label>
                                        <input type="text" name="fullname" class="form-control" value="namne" placeholder="Enter Name" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>    
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Phone Number *</label>
                                        <input type="text" name="phone" class="form-control" value="phone" placeholder="Enter Phone No" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                
								<div class="col-sm-6">
									 <div class="form-group">
									 	<label for="housenumber_street" class="label_field">Địa chỉ </label>
									 	<input type="text" class="form-control field__input" value="1" id="housenumber_street" aria-describedby="textHelp" placeholder="">
									</div>
								</div> 
								<div class="col-sm-6">
									 <div class="form-group">
									  <label for="province" class="label_field">Tỉnh thành</label>
									   	<select class="form-control field__input" id="province">
									    	<option value="">--Chọn tỉnh thành--</option>
									    	
									    	<option  value="" >name</option>
									    					
									   	</select>
									 </div>
								</div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email *</label>
                                        <input type="text" id="emailU" name="email" class="form-control" value="ưadas" placeholder="Enter Email" required>
                                    	<div class="ajax-emailU"></div>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <select name="gender" class="selectpicker form-control" data-style="py-0">
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>
                                </div> 
                                
                                <div class="col-md-12">                      
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="text" name="password" class="form-control" value="adasdasd" placeholder="Enter Password" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>   
                                </div>              
                            <button type="submit" class="btn btn-primary mr-2">Edit Customers</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
            $('#form-add-user').validate({
            	ignore:[], //validate cho Textarea.
    			rules:{
    				
    				email:{
    					required: true,
    					email: true,
    					},
    				
    			},
    			
    			messages:{
    				email:{
    					required: " Hãy nhập vào email",
    					email:" Hãy nhập đúng định dạng.",
    				},
    			},
            	
            });
            	$('#emailU').on('input', function(){
            		 var changedField = $(this);
				     var email = $("#emailU").val();   
				        $.ajax({
							url: '<%=request.getContextPath()%>/admin/edit-customers',
							type: 'POST',
							cache: false,
							data: {
									aemail: email,
								},
							success: function(data){
								$('.ajax-emailU').html(data);
							},
							error: function (){
								alert('Có lỗi xảy ra');
							},
						});
						return false;
            	});
            	$('#province').on('change', function(){
              		var changedField = $(this);
            	  var code = $('#province').val();
            	  $.ajax({
            			url: '<%=request.getContextPath()%>/address-lb',
            			type: 'POST',
            			cache: false,
            			data: {province_code: code, },
            			success: function(data){
            				$('.ajax-districts').html(data);
            			},
            			error: function (){
            				alert('Có lỗi xảy ra');
            			}
            		});
            		return false;
              	});
              	
            	$('#districts').on('change', function(){
            		var changedField = $(this);
            		 var code1 = $('#districts').val();
            		 $.ajax({
            				url: '<%=request.getContextPath()%>/address-lb',
            				type: 'POST',
            				cache: false,
            				data: {district_code: code1, },
            				success: function(data){
            					$('.ajax-wards').html(data);
            				},
            				error: function (){
            					alert('Có lỗi xảy ra');
            				}
            			});
            			return false;
              });
            </script>
        </div>
        <!-- Page end  -->
    </div>
      </div>
    </div>
    <!-- Wrapper End-->