<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
     <div class="container-fluid fluid_order ">
     <div class="row">
  		<div>
    		<a class="btn btn-lg text-center" href="${pageContext.request.contextPath }/admin/order?page=${page}" ><span><i style="font-size: 1em;" title="Go to back" class="fa fa-arrow-left fa-3x"></i>Go To Back</span></a>
  		</div>
	</div>
        <div class="body-order row">
            <div class="body-order-head col-lg-12">
                <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Order List Detail</h4>
                    </div>
                </div>
            </div>
           <c:if test="${not empty listOrder }">
           	<div class="body-order-body col-lg-12">
                <div class="body_body_main mb-3">
		            <c:forEach items="${listOrder }" var = "order">
           			<div class="body_body_head mb-3 col-sm-12 row">
			             <div class="body_body_left col-sm-4">
			             	<c:forTokens items="${order.images }" delims="[ ]," var="image" begin="0" end="0">
			             		<img src="${imagePath }/product/${image}" alt="${order.product_detail }" title="${order.product_detail }">
			             	</c:forTokens>
			             </div>
			            <div class="body_body_right col-sm-8">
				            <p class="text-left product-name">${order.product_detail }</p>
				            <span class="text-left color_size">${order.product_sku }</span>
				            <p class="quantity_order">${order.qty }</p>
				            
				            <span class="text-left price_order">
         						<fmt:formatNumber value = "${order.price}"/> đ 
				            </span>
				            <span class="text-left subtotal_one">
				            	<span class="subtotal_two">
				            		Subtotal:
         							<fmt:formatNumber value = "${order.subtotal}"/>
				            	</span>
				            	<span>đ</span>
				            </span>
			            </div>
		            </div>    
           			</c:forEach>
		       </div>
		       <div class="col-sm-12">
		                    <table class="table">
		                      <tbody>
		                        <tr>
		                        	<td class="text-right">Discount</td>
		                        	<td class="text-right">
         								<fmt:formatNumber value = "${listOrder[0].discount }"/> đ
		                        	</td>
		                        	<td class="text-right">Transports</td>
		                        	<td class="text-right"> 
         								<fmt:formatNumber value = "${listOrder[0].transports }"/> đ
		                        	</td>
		                          <td class="text-right"><strong>Total</strong></td>
		                          <td class="text-right">
         							<fmt:formatNumber value = "${listOrder[0].total }"/> đ
         							 <c:if test="${listOrder[0].status_payment==0 }">
                            			<span>(Chưa thanh toán)</span>
                            		</c:if>
                            		<c:if test="${listOrder[0].status_payment==1 }">
                            			<span>(Đã thanh toán)</span>
                            		</c:if>
		                          </td>
		                        </tr>
		                         <tr>
		                        	<th class="text-center" colspan="6">
		                        	<form action="${pageContext.request.contextPath }/admin/confirm?id=">
		                        		<button type="submit" id="confirm_order">Confirm Order</button>
		                        	</form>
		                        	</th>
		                        </tr>
		                      </tbody>
		                </table>
                </div>
        	</div>
           
           </c:if>
            
        <script type="text/javascript">
        	$('#confirm_order').on('click', function(){
        		var orderCode = ${listOrder[0].order_code };
        	});
        </script>
        <!-- Page end  -->
    </div>
    <!-- Modal Edit -->
    <!--<div class="modal fade" id="edit-note" tabindex="-1" role="dialog" aria-hidden="true">
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
    </div>-->
      </div>
    </div>
    <!-- Wrapper End-->