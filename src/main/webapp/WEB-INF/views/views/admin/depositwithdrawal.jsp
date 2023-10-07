<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            <div class="col-lg-12">
                <div class="d-flex flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Deposit And Withdrawal</h4>
                    </div>
                    <div>
                    	<form action="${pageContext.request.contextPath }/admin/depositwithdrawal" method="post">
                    		<div class="input-group">
                    			<input type="text" name="key" required="required"><button type="submit"><i class="ri-search-line"></i></button>
                    		</div>
                    	</form>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                
                <table class="data-table table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                            <th>No.</th>
                            <th>Username</th>
                            <th>Method</th>
                            <th>Bank Name Receive</th>
                            <th>Account Number</th>
                            <th>Deposit Amount</th>
                            <th>Bank Name Withdraw</th>
                            <th>Account Number Withdraw</th>
                            <th>Withdrawal Amount</th>
                            <th>Transfer Content</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                    <c:if test="${not empty listManagement }">
                    <c:set value="1" var="index"/>
                    	<c:forEach items="${listManagement }" var="manager">
                    	 <tr>
                            <td>${index}</td>
                            <td>${manager.users.username }</td>
                            <td>${manager.method }</td>
                            <td>${manager.accountATMAdmin.bank_name }</td>
                            <td>${manager.accountATMAdmin.account_number }</td>
                            <td><fmt:formatNumber value = "${manager.payment_amount }"/></td>
                            <td>${manager.accountATM.bank_name }</td>
                            <td>${manager.accountATM.account_number }</td>
                            <td><fmt:formatNumber value = "${manager.withdrawal_amount }"/></td>
                            <td>${manager.content_payment }</td>
                            <c:if test="${manager.status==0 }">
                            	<td>Chờ Xác Nhận</td>
                            </c:if>
                            <c:if test="${manager.status==1 }">
                            	<td>Thành Công</td>
                            </c:if>
                            <c:if test="${manager.status==2 }">
                            	<td>Thất Bại</td>
                            </c:if>
                            <td>
                                <div class="d-flex align-items-center list-action">
                                    
                                    <a id="confirm-pay" class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Confirm"
                                        href="javaScript: void(0)" onclick="popupFormConfirm(${manager.id })"><i class="ri-check-line mr-0"></i></a>
                                    <a id="cancel-pay" class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Cancel"
                                        href="javaScript: void(0)" onclick="popupFormCancel(${manager.id })"><i class="ri-close-circle-line"></i></a>
                                </div>
                            </td>
                        </tr>
                        <c:set value="${index+1 }" var="index"/>
                    	</c:forEach>
                    </c:if>
                    </tbody>
                </table>
                </div>
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
      <style>

		/* The Modal (background) */
		.modal {
		  display: none; /* Hidden by default */
		  position: fixed; /* Stay in place */
		  z-index: 1000; /* Sit on top */
		  padding-top: 100px; /* Location of the box */
		  left: 0;
		  top: 0;
		  width: 100%; /* Full width */
		  height: 100%; /* Full height */
		  overflow: auto; /* Enable scroll if needed */
		  background-color: rgb(0,0,0); /* Fallback color */
		  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		/* Modal Content */
		.modal-content {
		  background-color: #fefefe;
		  margin: auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 30%;
		}
		
		/* The Close Button */
		.close {
		  position: relative;
		  left:98%;
		  color: #aaaaaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
		</style>
		<div>
			 <div id="myModal-confirm" class="modal">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span onclick="cancelConfirm()" class="close">&times;</span>
		    <form id="form_confirm" method="post">
		    	 <div class="col-md-12">                      
	                <div class="form-group">
	                    <label>Notes *</label>
	                    <div class="row">
		                    <div class="col-lg-8">
		                        <input type="text" name="notes" id="notes_info_confirm" class="form-control field__input" value="" placeholder="Enter Notes" required>
		                    </div>
		                    <div class="col-lg-4">
		                         <button class="form-control field__input" type="submit">Confirm</button>
		                    </div>
	                    </div>
	                 </div>
	           </div> 
		    </form>
		  </div>
	  </div>
	  <div id="myModal-cancel" class="modal">
		  <!-- Modal content -->
		  <div class="modal-content">
		    <span onclick="cancelCancel()" class="close">&times;</span>
		    <form id="form_cancel" method="post">
		    	 <div class="col-md-12">                      
	                <div class="form-group">
	                    <label>Notes *</label>
	                    <div class="row">
		                    <div class="col-sm-8">
		                        <input type="text" name="notes" id="notes_info_cancel" class="form-control field__input" value="" placeholder="Enter Notes" required>
		                    </div>
		                    <div class="col-sm-4">
		                         <button class="form-control field__input" type="submit">Confirm</button>
		                    </div>
	                    </div>
	                 </div>
	           </div> 
		    </form>
		  </div>
	  </div>
		</div>
     
	  <script>
	// Get the modal
	var modal_confirm = document.getElementById("myModal-confirm");
	var modal_cancel = document.getElementById("myModal-cancel");
	
	// Get the <span> element that closes the modal
	
	// When the user clicks the button, open the modal 
	function popupFormConfirm(id)  {
	  modal_confirm.style.display = "block";
	  $('#form_confirm').attr('action','${pageContext.request.contextPath }/admin/confirm-pay?id='+id+'');
	  
	}
	function popupFormCancel(id)  {
		modal_cancel.style.display = "block";
		 $("#form_cancel").attr('action','${pageContext.request.contextPath }/admin/cancel-pay?id='+id+'');
	}
	
	// When the user clicks on <span> (x), close the modal
	 function cancelConfirm() {
	  modal_confirm.style.display = "none";
	}
	function cancelCancel() {
		modal_cancel.style.display = "none";
	}
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal_confirm||event.target == modal_cancel) {
	    modal_confirm.style.display = "none";
	    modal_cancel.style.display = "none";
	  }
	}
</script>
    </div>
    <!-- Wrapper End-->