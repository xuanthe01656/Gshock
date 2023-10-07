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
      </div>     
      <div class="content-page">
     <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="d-flex flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Danh Sách Khách Hàng</h4>
                        <p class="mb-0">A customer dashboard lets you easily gather and visualize customer data from optimizing <br>
                         the customer experience, ensuring customer retention. </p>
                    </div>
                    <div>
                    	<form action="${pageContext.request.contextPath}/admin/search" method="post">
                    		<div class="input-group">
                    			<input type="text" id="key_search" name="key-search" required="required"><input style="display: none;" id="key" name="key" value="3"><button type="button" id="button_search"><i class="ri-search-line"></i></button>
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
                            <th>Username</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone No.</th>
                            <th>Country</th>
                            <th>Order</th>
                            <th>Status</th>
                            <th>Last Order</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                   <c:if test="${not empty listUs }">
                   	<c:forEach items="${listUs }" var="user">
                   		 <tr>
                            <td>${user.username }</td>
                            <td>${user.name }</td>
                            <td>${user.email }</td>
                            <td>${user.phone }</td>
                            <td>${user.city }</td>
                            <td>2</td>
                            <td><div class="badge badge-warning">Pending</div></td>
                            <td>1</td>
                            <td>
                                <div class="d-flex align-items-center list-action">
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                                        href="${pageContext.request.contextPath}/admin/edit-customer?id=${user.id}"><i class="ri-pencil-line mr-0"></i></a>
                                </div>
                            </td>
                        </tr>
                   	</c:forEach>
                   </c:if>
                    </tbody>
                </table>
                </div>
                <%-- <div class="row">
                            	
                                <div class="col-sm-4">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin:27px 0px;">Hiển thị từ 1 đến 2 của 2 User</div>
                                </div>
                                <div class="col-sm-8" style="text-align: right; margin:27px 0px">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                    
                                        <ul class="pagination justify-content-end">
                                        	
                                        	<li class="page-item previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a class="page-link" href="${pageContext.request.contextPath}/admin/list-product?index=1">Về trang 1</a></li>
                                            <li class="page-item previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a class="page-link" href="${pageContext.request.contextPath}/admin/list-product?index=1">Trang trước</a></li>
                                            
                                            	
                                                        <li class="page-item " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/list-product?index=1">1</a></li>
                                                       
                                            			
                                                        <li class="page-item  " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/list-product?index=1">1</a></li>
                                                                                         	
                                                   				 <li class="page-item " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/list-product?index=1">1</a></li>                                                    
                                                   
                                            <li class="page-item next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a class="page-link" href="${pageContext.request.contextPath}/admin/list-product?index=1">Trang tiếp</a></li>
                                            <li class="page-item next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a class="page-link" href="${pageContext.request.contextPath}/admin/list-product?index=1">Đến trang cuối</a></li>
                                           
                                        </ul>
                                    </div>
                                </div>
                            </div> --%>
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
    </div>
    <!-- Wrapper End-->