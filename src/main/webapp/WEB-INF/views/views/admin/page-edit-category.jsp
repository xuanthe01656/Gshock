<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                            <h4 class="card-title">Edit category</h4>
                        </div>
                    </div>
                    <div class="card-body">
                    <c:if test="${not empty unsuccess }">
                    	<p style="color:red; font-style: italic;">${unsuccess }</p>
                    </c:if>
                        <form id="form" class="form" action="${pageContext.request.contextPath}/admin/edit-cat?id=${cat.id }" method="post" enctype="multipart/form-data">
                            <div class="row"> 
                            	
                            
                            	<div class="col-md-12">
                                    <div class="form-group">
                                        <label>Old Category</label>
                                        <p>${cat.name }</p>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                     <div class="form-group">
                                     <div class="ajax-dataname"></div>
                                       	<label for="newcat">New Category</label>
                                       	<%-- <form:errors path="catError.name" cssStyle="color: red; font-style: italic"/> --%>
                                        <input type="text" id="newcat" class="form-control"  name="name"> 
                                        <label for="name" class="error" style="color: red;"></label>
                                	</div>
                                	<script type="text/javascript">
                                	$(function() {
                            		    $('#newcat').on('input', function() {
                            		        var changedField = $(this);
                            		        var name = $("#newcat").val();
                            		        var parent_id = ${cat.parent_id}; 
                            		                    
                            		        $.ajax({
                            					url: '<%=request.getContextPath()%>/admin/handel_name_cat_edit',
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
		                                 <input type="file" class="form-control image-file" name="picture"  accept="image/*">
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
                             	<script type="text/javascript">
                             	
                             	jQuery(document).ready(function() {
                             		var id = 1;
                             		if(id==0){
                             			 // Capitalize string - convert textbox user entered text to uppercase
                                    	jQuery('#newcat').keyup(function() {
                                    		$(this).val($(this).val().toUpperCase());
                                    	});
                             		}else{
                             		// Capitalize string every 1st chacter of word to uppercase
                             			jQuery('#newcat').keyup(function() 
                                            	{
                                            		var str = jQuery('#newcat').val();
                                                   
                                            		
                                            		var spart = str.split(" ");
                                            		for ( var i = 0; i < spart.length; i++ )
                                            		{
                                            			var j = spart[i].charAt(0).toUpperCase();
                                            			spart[i] = j + spart[i].substr(1);
                                            		}
                                                  jQuery('#newcat').val(spart.join(" "));
                                            	
                                           	});
                                       
                             		}
                            
                            	
                            	// Capitalize string first character to uppercase
                            	//jQuery('#txtcapital').keyup(function() {
                            		//var caps = jQuery('#txtcapital').val(); 
                            		//caps = caps.charAt(0).toUpperCase() + caps.slice(1);
                                    //jQuery('#txtcapital').val(caps);
                            	//});
                             		
                            	
                             	});
                             
                             	
                            	
                             	</script>                           
                                <%-- <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Image</label>
                                        
                                        <img id="image" src="${contextPath}/images/table/category/fsdfsdf" class="img-fluid rounded-circle avatar-50 mr-3" style="max-width: 30px; max-height: 45px;" alt="image">
                                        
                                        <input type="file" class="form-control image-file" name="pic" accept="image/*">
                                    </div>
                                </div>   --%>                                              
                            </div>                            
                            <button type="submit" class="btn btn-primary mr-2">Edit Category</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
     </div>
    <script>
    <!--  $(".form").validate({
			
			rules:{
				newcat:{
					required: true,
					minlength: 2,
					maxlength: 50,
				}	
			},
  		messages:{
				newcat: {
					required: " Hãy nhập vào category.",
					minlength: " Hãy nhập vào nhiều hơn 2 ký tự và ít hơn 50 ký tự.",
					maxlength: " Hãy nhập vào ít hơn 50 ký tự.",
				}
  		},
  	}); -->
  	
     </script>
    </div>
    <!-- Wrapper End--> 