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
                <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Product List</h4>
                        <p class="mb-0">The product list effectively dictates product presentation and provides space<br> to list your products and offering in the most appealing way.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/add-product" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Product</a>
                    <div>
                    	<form id="form-search" action="${pageContext.request.contextPath}/admin/search" method="post">
                    	<p id="error-input"></p>
                    		<div class="input-group">
                    			<input type="text" id="key_search" name="key-search" required="required"><input style="display: none;" id="key" name="key" value="1"><button type="button" id="button_search"><i class="ri-search-line"></i></button>
                    		</div>
                    	</form>
                    </div>
                </div>
            </div>
            <c:if test="${not empty param['success'] }">
        		<p style="color: green; font-style: italic;">${param['success'] }</p>
        	</c:if>
        	<c:if test="${not empty param['unsuccess'] }">
        		<p style="color: red; font-style: italic;">${param['unsuccess'] }</p>
        	</c:if>
            <div class="col-lg-12 ajax-display-search">
                <div class="table-responsive rounded mb-3">
                <table class="table mb-0">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                            <th>Product</th>
                            <th>Code</th>
                            <th>Category</th>
                            <th>Cost</th>
                            <th>Price</th>   
                            <th>Quantity</th>                      
                            <th>Suppliers</th>
                            <!-- <th>The Product Set Includes</th>
                            <th>Product Information</th>
                            <th>Shipping Policy</th>
                            <th>Return And Warranty</th> -->
                            <th>Picture</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                   <c:if test="${not empty listPro }">
                   		<c:forEach items="${listPro }" var="pro">
                   			<tr>
                            <!-- <td>
                                <div class="checkbox d-inline-block">
                                    <input type="checkbox" class="checkbox-input" id="checkbox2">
                                    <label for="checkbox2" class="mb-0"></label>
                                </div>
                            </td> -->
                            <td>
                               ${pro.name }
                            </td>
                            <td>${pro.product_sku }</td>
                            <td>${pro.categories.name }</td>
                            <td>${pro.cost }</td>
                            <td>${pro.price }</td>
                            <td>${pro.amount }</td>
                            <td>${pro.suppliers.supplier_name }</td>
                           <%--  <td>${pro.the_product_set_includes }</td>
                            <td>${pro.product_information }</td>
                            <td>${pro.shipping_policy}</td>
                            <td>${pro.return_warranty}</td> --%>
                            <td>
                            	<ul style="list-style-type: none; display: flex!important;">
                            		<c:forTokens items="${pro.images }" delims="[], " var="pic">
                            			<li><img src="${imagePath}/product/${pic}" class="img-fluid rounded float-left avatar-50 mr-3" alt="image"></li>
                            		</c:forTokens>
                               </ul>
                            </td>
                            <td>
                                <div class="d-flex align-items-center list-action">
                                    <a href="${pageContext.request.contextPath }/admin/product-detail?id=${pro.id}&page=${page}" class="badge badge-info mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="View"> 
                                    	<i class="ri-eye-line mr-0"></i>
                                    </a>
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="${pageContext.request.contextPath }/admin/edit-product?id=${pro.id}&page=${page}">
							         	<i class="ri-pencil-line mr-0"></i>
							    	</a>
	                             	<a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="${pageContext.request.contextPath}/admin/delete-product?id=${pro.id}&page=${page}" onclick="return confirm(' Bạn thật sự muốn xóa ?')">
	                                	<i class="ri-delete-bin-line mr-0"></i>
	                             	</a> 
                                </div>
                            </td>
                        </tr>
                   		</c:forEach>
                   </c:if>
                    <c:if test="${empty listPro }">
                    	<tr><td colspan="8">Không có danh sách nào cả.</td></tr>
                    </c:if> 	
                    </tbody>
                </table>
                </div>
                <div class="row">
                            	
                                <div class="col-sm-4">
                                    <div class="dataTables_info" id="dataTables-example_info" style="margin:27px 0px;">Hiển thị từ ${(page-1)*rowcount+1 } đến ${numPro } của ${listAllPro.size() } sản phẩm</div>
                                </div>
                                <div class="col-sm-8" style="text-align: right; margin:27px 0px">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                    
                                        <ul class="pagination justify-content-end">
                                        	<c:if test="${page > 1 }">
                                        		<li class="page-item previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=1">Về trang 1</a></li>
                                            	<li class="page-item previous" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${page-1}">Trang trước</a></li>
                                        	</c:if>
                                        	<c:choose>
                                        		<c:when test="${maxPage<numOfPage }">
                                        			<c:choose>
                                        				<c:when test="${numcur<=numOfPage }">
                                        					<c:forEach  begin="${page }" end="${numcur }" var="index" >
                                        						<li class="page-item " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${index}">${index }</a></li>
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
                                        					<li class="page-item " aria-controls="dataTables-example" tabindex="0"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${index}">${index }</a></li>
                                        				</c:forEach>
                                        			</c:if>
                                        		</c:otherwise>
                                        	</c:choose>
                                        	<c:if test="${page>=1 and page<numOfPage  }">
                                        		<li class="page-item next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${page+1 }">Trang tiếp</a></li>
                                            	<li class="page-item next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${numOfPage}">Đến trang cuối</a></li>
                                            
                                        	</c:if>   
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
            </div>
            			<script type="text/javascript">
                            
                    		$('#button_search').on('click', function(){
                    			if($('#key_search').val()!=""){
                    				var key = $('#key').val();
                        			var key_search = $('#key_search').val();
                        			var index = 1;
                        			 $.ajax({
    										url: '${pageContext.request.contextPath}/admin/search',
    										type: 'POST',
    										cache: false,
    										data: {
    												key: key,
    												'key-search': key_search,
    												index: index,
    											},
    										success: function(data){
    											$('.ajax-display-search').html(data);
    											$('#indexs1').addClass('active');
    										},
    										error: function (){
    											alert('Có lỗi xảy ra');
    										}
    									});
                    			}else{
                    				$( "#error-input" ).text( "Nhập vào từ khóa!" ).show().fadeOut( 1000 );
                    			}
                    		});
                    	</script>
        </div>
        <!-- Page end  -->
    </div>
      </div>
    </div>
    <!-- Wrapper End-->