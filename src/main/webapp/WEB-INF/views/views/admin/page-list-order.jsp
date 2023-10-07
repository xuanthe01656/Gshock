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
     <div class="container-fluid">
     <div class="row">
  <div>
  
  </div>
	</div>
        <div class="row">
            <div class="col-lg-12">
                <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Order List</h4>
                    </div>
                    <div>
                    	<form action="${pageContext.request.contextPath }/admin/order" method="post">
                    		<div class="input-group">
                    			<input type="text" name="key" required="required"><button type="submit"><i class="ri-search-line"></i></button>
                    		</div>
                    	</form>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                 <div class="row" style="padding-bottom: 10px;">
                 	<div class="col-sm-2" style="padding-right:0;">
                 		<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/export-excel">Export Excel</a>
                 	</div>
                 	<div class="col-sm-2" style="padding-right:0;">
                 		<a class="btn btn-primary" href="${pageContext.request.contextPath }/admin/export-pdf">Export PDF</a>
                 	</div>
                    </div>
                <table class="table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                            <!-- <th>
                                <div class="checkbox d-inline-block">
                                    <input type="checkbox" class="checkbox-input" id="checkbox1">
                                    <label for="checkbox1" class="mb-0"></label>
                                </div>
                            </th> -->
                            <th>Code</th>
                            <th>Product ID</th>
                            <th>Product</th>
                            <th>Qty</th>
                            <th>Total</th>
                            <th>User ID</th>
                            <th>Status Payment</th>
                            <!-- <th>Status</th> -->
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                   	<c:if test="${not empty listOrder }">
                        		<c:forEach items="${listOrder }" var ="order">
                        <tr>
                        		<!-- <td>
                                <div class="checkbox d-inline-block">
                                    <input type="checkbox" class="checkbox-input" id="checkbox2">
                                    <label for="checkbox2" class="mb-0"></label>
                                </div>
                            </td> -->
                            <td><a href="<%=request.getContextPath()%>/admin/order-detail/${order.order_code }/${page}">${order.order_code }</a></td>
                            <td>${order.product_id}</td>
                            <td>${order.product_name }</td>
                            <td>${order.qty }</td>
                            <td>${order.total }</td>
                            <td>${order.user_id }</td>
                            <c:if test="${order.status_payment==0 }">
                            	<td>Chưa thanh toán</td>
                            </c:if>
                            <c:if test="${order.status_payment==1 }">
                            	<td>Đã thanh toán</td>
                            </c:if>
                            <!-- <td>
                            	<select>
                            		
                            		<option >status</option>
                            		
                            	</select>
                            </td> -->
                            <td>
                                <div class="d-flex align-items-center list-action">
                                
                                	<a class="badge badge-info mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="View"
                                        href="${pageContext.request.contextPath }/admin/order-detail/${order.order_code }/${page}"><i class="ri-eye-line mr-0"></i></a>
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Confirm"
                                        href="${pageContext.request.contextPath }/admin/confirm-order/${order.order_code }/${page}"><i class="ri-check-line mr-0"></i></a>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                        	</c:if>
                        <c:if test="${empty listOrder }">
                        	<tr><td colspan="9">Không có danh sách nào cả.</td></tr>
                        </c:if>
                    </tbody>
                </table>
                </div>
                <div class="row">
                            	
                                <div class="col-sm-4">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin:27px 0px;">Hiển thị từ ${(page-1)*rowcount+1 } đến ${numOrder } của ${listAllOrder.size() } sản phẩm</div>
                                </div>
                                <div class="col-sm-8" style="text-align: right; margin:27px 0px">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                    
                                        <ul class="pagination justify-content-end">
                                        	<c:if test="${page > 1 }">
                                        		<li class="page-item previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=1">Về trang 1</a></li>
                                            	<li class="page-item previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${page-1}">Trang trước</a></li>
                                        	</c:if>
                                        	<c:choose>
                                        		<c:when test="${maxPage<numOfPage }">
                                        			<c:choose>
                                        				<c:when test="${numcur<=numOfPage }">
                                        					<c:forEach  begin="${page }" end="${numcur }" var="index" >
                                        						<li class="page-item " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${index}">${index }</a></li>
                                        					</c:forEach>
                                        				</c:when>
                                        				<c:otherwise>
                                        					<c:forEach  begin="${page-2 }" end="${numOfPage }" var="index" >
                                        						<li class="page-item " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${index}">${index }</a></li>
                                        					</c:forEach>
                                        				</c:otherwise>
                                        			</c:choose>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:if test="${maxPage>=numOfPage }">
                                        				<c:forEach  begin="1" end="${numOfPage }" var="index">
                                        					<li class="page-item " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${index}">${index }</a></li>
                                        				</c:forEach>
                                        			</c:if>
                                        		</c:otherwise>
                                        	</c:choose>
                                        	<c:if test="${page>=1 and page<numOfPage  }">
                                        		<li class="page-item next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${page+1 }">Trang tiếp</a></li>
                                            	<li class="page-item next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${numOfPage}">Đến trang cuối</a></li>
                                            
                                        	</c:if>   
                                            
                                        </ul>
                                    </div>
                                </div>
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
    </div>
    <!-- Wrapper End-->