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
                            <h4 class="card-title">Add Supplier </h4>
                        </div>
                    </div>
                    <div class="card-body">
                    <c:if test="${not empty successSup }">
                	<p style="color:green; font-style: italic;">${successSup }</p>
	                </c:if>
	                <c:if test="${not empty unsuccessCntry }">
	                	<p style="color:red; font-style: italic;">${unsuccessSup }</p>
	                </c:if>
                        <form action="${pageContext.request.contextPath}/admin/add-supplier" method="post" data-toggle="validator">
                            <div class="row"> 
                            <div class="col-md-6">                      
                                    <div class="form-group">
                                        <label>Supplier Code *</label>
                                        <input type="text" class="form-control" name="supplier_code" placeholder="Enter Suppliers Code" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>  
                                <div class="col-md-6">                      
                                    <div class="form-group">
                                        <label>Name *</label>
                                        <input type="text" class="form-control" name="supplier_name" placeholder="Enter Name" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>    
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email *</label>
                                        <input type="text" class="form-control" name="supplier_email"  placeholder="Enter Email" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Phone Number *</label>
                                        <input type="text" class="form-control" name="supplier_phone"  placeholder="Enter Phone Number" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Tax Code *</label>
                                        <input type="text" class="form-control" name="tax_code"  placeholder="Enter Tax Code" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Notes</label>
                                        <textarea class="form-control" name="notes"  rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Address</label>
                                        <textarea class="form-control" name="supplier_addr"  rows="4"></textarea>
                                    </div>
                                </div>
                               <!--  <div class="col-md-12">
                                    <div class="form-group">
                                        <label>City *</label>
                                        <input type="text" class="form-control" placeholder="Enter City" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> 
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Country *</label>
                                        <input type="text" class="form-control" placeholder="Enter Country" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div> -->
                            </div>                            
                            <button type="submit" class="btn btn-primary mr-2">Add Supplier</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
         <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between">
                        <div class="header-title">
                            <h4 class="card-title">Add Country </h4>
                        </div>
                    </div>
                    <div class="card-body">
                    <c:if test="${not empty successCntry }">
                	<p style="color:green; font-style: italic;">${successCntry }</p>
	                </c:if>
	                <c:if test="${not empty unsuccessCntry }">
	                	<p style="color:red; font-style: italic;">${unsuccessCntry }</p>
	                </c:if>
                        <form action="${pageContext.request.contextPath}/admin/add-country" method="post" data-toggle="validator">
                            <div class="row"> 
                                <div class="col-md-6">                      
                                    <div class="form-group">
                                        <label>Name *</label>
                                        <input type="text" class="form-control" name="name" placeholder="Enter Name" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>    
                            </div>                            
                            <button type="submit" class="btn btn-primary mr-2">Add Country</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
      </div>
    </div>
    <!-- Wrapper End-->