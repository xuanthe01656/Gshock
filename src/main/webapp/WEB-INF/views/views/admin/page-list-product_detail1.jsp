<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url value="/resources/gshock/image/product" var="imagePath" scope="application"></c:url>
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
 
    <a class="btn btn-lg text-center" href="<%=request.getContextPath()%>/admin/list-product?index=1" ><span><i style="font-size: 1em;" title="Go to back" class="fa fa-arrow-left fa-3x"></i>Go To Back</span></a>
  </div>
	</div>
        <div class="row">
            <div class="col-lg-12">
                <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Product List</h4>
                        <p class="mb-0">The product list effectively dictates product presentation and provides space<br> to list your products and offering in the most appealing way.</p>
                    </div>
                    <a href="<%=request.getContextPath() %>/admin/add-product" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Product</a>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
               
										<div><span style="background-color: yellow; color: red; font-style: italic;">Sửa sản phẩm thành công!</span></div>
										
										<div><span style="background-color: yellow; color: red; font-style: italic;">Sửa sản phẩm không thành công!</span></div>
										
												<div><span style="background-color: yellow; color: red; font-style: italic;">Xóa sản phẩm thành công!</span></div>
												
											
												<div><span style="background-color: yellow; color: red; font-style: italic;">Xóa sản phẩm thành công!</span></div>
												
														<div><span style="background-color: yellow; color: red; font-style: italic;">Sửa sản phẩm không thành công do tên trùng!</span></div>
														
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
                            <th>Product</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Menu</th>
                            <th>Category Menu</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Cost</th>
                            <th>Brand Name</th>
                            <th>Country</th>
                            <th>Quantity</th>                         
                            <th style="text-align: center;">Picture</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                   
                        <tr>
                            <!-- <td>
                                <div class="checkbox d-inline-block">
                                    <input type="checkbox" class="checkbox-input" id="checkbox2">
                                    <label for="checkbox2" class="mb-0"></label>
                                </div>
                            </td> -->
                            <td>
                                <div class="d-flex align-items-center">                               
                                    <p>qưe </p>
                                </div>
                            </td>
                            <td>name</td>
                            <td>color</td>
                            <td>size</td>
                            <td>cat</td>
                            <td>cat1</td>
                            <td>cat2</td>
                            <td>giá</td>
                            <td>cost</td>
                            <td>nhà cung ứng</td>
                            <td>country</td>
                            <td>amount</td>
                            <td>
                            	<ul style="list-style-type: none; display: flex!important;">
                            	
                                   <li><img src="<%=request.getContextPath() %>/templates/admin/assets/images/table/product/img" class="img-fluid rounded float-left avatar-50 mr-3" alt="image"></li>
                                    
                                    	<li><img src="<%=request.getContextPath() %>/templates/admin/assets/images/table/product/no-image-png-2.png" class="img-fluid rounded avatar-50 mr-3" alt="image"></li>
                                   
                               	<li><img src="<%=request.getContextPath() %>/templates/admin/assets/images/table/product/no-image-png-2.png" class="img-fluid rounded avatar-50 mr-3" alt="image"></li>
                               
                               </ul>
                            </td>
                            
                            <td>
                                <div class="d-flex align-items-center list-action">
                                
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                                        href="<%=request.getContextPath()%>/admin/edit-product?index=1&id=123"><i class="ri-pencil-line mr-0"></i></a>
                                    <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"
                                        href="<%=request.getContextPath()%>/admin/delete-product?index=1&id=123" ><i onclick="return confirm('Bạn thật sự muốn xóa ?')" class="ri-delete-bin-line mr-0"></i></a>
                                
                                	<a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                                        href="<%=request.getContextPath()%>/admin/edit-product?index=1&id=123"><i class="ri-pencil-line mr-0"></i></a>
                                
                                </div>
                            </td>
                        </tr>
                        
                        	
                        	<tr><td colspan="14">Không có danh sách nào cả.</td></tr>
                        	
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
    </div>
    <!-- Wrapper End-->