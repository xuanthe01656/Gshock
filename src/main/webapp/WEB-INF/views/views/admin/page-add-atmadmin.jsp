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
                            <h4 class="card-title">Add ATM Admin</h4>
                        </div>
                    </div>
                    <div class="card-body">
                     <c:if test="${not empty success }">
                    	<p style="color: red; font-style: italic;">${success }</p>
                    </c:if>
                        <form action="${pageContext.request.contextPath }/admin/add-atmadmin" method="post" enctype="multipart/form-data" data-toggle="validator">
                            <div class="row"> 
                                <div class="col-md-6">                      
                                    <div class="form-group">
                                        <label>Bank Name *</label>
                                        <select name="bank_name" id="link_bank" class="form-control" required>
                                        </select>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>    
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Fullname *</label>
                                        <input type="text" name="name" class="form-control" placeholder="Enter Fullname" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Account Number *</label>
                                        <input type="text" name="account_number" class="form-control" placeholder="Enter Account Number" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Picture QR *</label>
                                        <input type="file" name="picQr" class="form-control" accept="image/*" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>                            
                            <button type="submit" class="btn btn-primary mr-2">Add ATM</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        $.ajax({
    		url: 'https://api.vietqr.io/v2/banks',
    		type: 'GET',
    		cache: false,
    		success: function(data){
    			console.log(data.data);
    			if(data.data.length>0){
    				html2 = "<option value=\"\">--Chọn ngân hàng -- </option>";
    				for(var i=0; i<data.data.length; i++ ){
    					html2+="<option value=\""+data.data[i].shortName+"\" data-bin=\""+data.data[i].bin+"\">"+data.data[i].shortName+"</option>";
    				}
    				$('#link_bank').html(html2);
    			}
    		},
    		error: function (){
    			alert('Có lỗi xảy ra');
    		},
    	});
        </script>
        <!-- Page end  -->
    </div>
      </div>
    </div>
    <!-- Wrapper End-->