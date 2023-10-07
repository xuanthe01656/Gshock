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
                        <h4 class="mb-3">Suppliers List</h4>
                        <p class="mb-0">Create and manage your vendor list, send and receive purchase orders – your online<br>
                         Dashboard is your new back of house.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/add-supplier" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Supplier</a>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                <table class="data-table table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                            <th>Company Code</th>
                            <th>Company Name</th>
                            <th>Email</th>
                            <th>Phone No.</th>
                            <th>Address</th>
                            <th>Tax Code</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                    <c:if test="${not empty listSup }">
                    	<c:forEach items="${listSup }" var="sup">
                    		<tr>
                            <td>${sup.supplier_code }</td>
                            <td>${sup.supplier_name }</td>
                            <td>${sup.supplier_email }</td>
                            <td>${sup.supplier_phone }</td>
                            <td>${sup.supplier_addr }</td>
                            <td>${sup.tax_code }</td>
                            <td>
                                <div class="d-flex align-items-center list-action">
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                                        href="${pageContext.request.contextPath}/admin/edit-supplier?id=${sup.id }"><i class="ri-pencil-line mr-0"></i></a>
                                    <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"
                                        href="${pageContext.request.contextPath}/admin/del-supplier?id=${sup.id }" onclick="return confirm('Bạn có thật sự muốn xóa?');"><i class="ri-delete-bin-line mr-0"></i></a>
                                </div>
                            </td>
                        </tr>
                    	</c:forEach>
                    </c:if>
                        <!-- <tr>
                            <td colspan="7">Không có list nào cả.</td>
                            
                        </tr> -->
                    </tbody>
                </table>
                </div>
            </div>
        </div>
        <%-- <div class="row">
            <div class="col-lg-12">
                <div class="d-flex flex-wrap align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="mb-3">Country List</h4>
                        <p class="mb-0">Create and manage your vendor list, send and receive purchase orders – your online<br>
                         Dashboard is your new back of house.</p>
                    </div>
                    <a href="${pageContext.request.contextPath}/admin/add-country" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Add Country</a>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="table-responsive rounded mb-3">
                <table class="data-table table mb-0 tbl-server-info">
                    <thead class="bg-white text-uppercase">
                        <tr class="ligth ligth-data">
                            <th>Numerical Order</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody class="ligth-body">
                    <c:if test="${not empty listCountry }"> 
                    	<c:set value="1" var="stt"/>
                    	<c:forEach items="${listCountry }" var="country">
                    	<tr>
                            <td>${stt }</td>
                            <td>${country.name }</td>
                            <td>
                                <div class="d-flex align-items-center list-action">
                                    <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"
                                        href="${pageContext.request.contextPath}/admin/edit-country?id=${country.id }"><i class="ri-pencil-line mr-0"></i></a>
                                    <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"
                                        href="${pageContext.request.contextPath}/admin/del-country?id=${country.id }" onclick="return confirm('Bạn có thật sự muốn xóa?');"><i class="ri-delete-bin-line mr-0"></i></a>
                                </div>
                            </td>
                        </tr>
                        <c:set value="${stt+1}" var="stt"/>
                    	</c:forEach>
                    </c:if>
                       <!--  <tr>
                            <td colspan="7">Không có list nào cả.</td>
                            
                        </tr> -->
                    </tbody>
                </table>
                </div>
            </div>
        </div> --%>
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