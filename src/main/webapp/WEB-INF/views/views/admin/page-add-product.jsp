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
                            <h4 class="card-title">Add Product</h4>
                        </div>
                    </div>
                    <c:if test="${not empty success }">
							<p style="color: green; font-style: italic">${success }</p>
						</c:if>
						<c:if test="${not empty unsuccess }">
							<p style="color: red; font-style: italic">${success }</p>
						</c:if>
                    <div class="ajax-data2"></div>
                    <div class="card-body">
                        <form id="form" action="${pageContext.request.contextPath}/admin/add-product" method="post" enctype="multipart/form-data">
                            
                            	<div class="row">
                            	<div class="col-md-6">
	                                    <div class="form-group">
	                                        <label>Category level 1 *</label>
	                                        <select name="cat_lv1_id" id="catLV1">
	                                        	<option value="" >--Chọn Category level 1 --</option>
	                                        	<c:if test="${not empty categoryService.getListCatByPrId(0) }">
	                                        		<c:forEach items="${categoryService.getListCatByPrId(0) }" var="catPr">
	                                        		<option value="${catPr.id }">${catPr.name }</option>
	                                        		</c:forEach>
	                                        	</c:if>
	                                        </select>
	                                        <label for="cat_lv1_id" class="error"></label>
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                    <script type="text/javascript">
	                                    $(function() {
                                        	
                                		    $("#catLV1").on("change", function() {
                                		        var changedField = $(this);
                                		        var parent_id = $("#catLV1").val();
                                		        if(parent_id!=""){
                                		        	$.ajax({
                                    					url: '${pageContext.request.contextPath}/admin/get-cat-chil',
                                    					type: 'POST',
                                    					cache: false,
                                    					data: {
                                    						parent_id: parent_id,
                                    					},
                                    					
                                    					success: function(data){
                                    						if(data.length>0){
    	                                						html='<label>Category level 2 *</label>';
    	                                						html+='<select name="cat_lv2_id">';
    	                                						html+='<option value="">--Chọn Category level 2 --</option>';
    	                                						for(i=0; i<data.length; i++){
    	                                							html+='<option value="'+data[i].id+'">'+data[i].name+'</option>';
    	                                						}
    	                                						html+='</select>';
    	                                						html+='<label for="cat_lv2_id" class="error"></label>';
    	                                						html+=' <div class="help-block with-errors"></div>';
    	                                						$("#catLV2").html(html);
                                    						}else{
                                    							$("#catLV2").html("");
                                    						}
                                    					},
                                    					error: function (){
                                    						alert('Có lỗi xảy ra');
                                    					},
                                    				});
                                    				return false;
                                		        }else{
                                		        	$("#catLV2").html("");
                                		        }
                                		        
                                		    });
                                		});
	                                    </script> 
                                	</div>  
                                	<div class="col-md-6">
	                                    <div class="form-group" id="catLV2">
	                                        
	                                    </div> 
                                	</div>  
                            		<div class="col-md-6">
	                                    <div class="form-group">
	                                        <label>Product SKU *</label>
	                                        <div id="dataMess"></div>
	                                        <input id="sku" name="product_sku" class="selectpicker form-control" placeholder="Enter SKU" value="" data-style="py-0" data-errors="Please Enter Name.">
	                                        <label for="product_sku" class="error"></label>
	                                        <div class="help-block with-errors"></div>
	                                    </div> 
                                	</div>  
	                                <div class="col-md-6">                      
	                                    <div class="form-group">
	                                        <label>Name *</label>
	                                        <input id="name" type="text" class="form-control" placeholder="Enter Name" value="" name="name" data-errors="Please Enter Name.">
	                                        <label for="name" class="error"></label>
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                </div> 
                            	</div>
                                   <script type="text/javascript">
	                                        $(function() {
	                                        	
	                                		    $('#sku').on('blur', function() {
	                                		        var changedField = $(this);
	                                		        var sku = $("#sku").val(); 
	                                		        
	                                		        
	                                		        $.ajax({
	                                					url: '${pageContext.request.contextPath}/admin/handel_productSku',
	                                					type: 'POST',
	                                					cache: false,
	                                					data: {
	                                						sku: sku,
	                                					},
	                                					
	                                					success: function(data){
	                                						if(data=="1"){
	                                							$("#dataMess").html("<p style='color: red; font-style: italic;'>Mã sản phẩm đã tồn tại.</p>");
	                                							$("#errorData").html("<p style='color: red; font-style: italic;'>Vui lòng kiểm tra lại mã sản phẩm.</p>");
	                                							$("#btnHd").attr('disabled', 'disabled');
	                                						}else{
	                                							
	                                						}
	                                						if(data=="2"){
	                                							$("#dataMess").html("");
	                                							$("#errorData").html("");
	                                							$("#btnHd").removeAttr("disabled");
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
                                <div class="row ajax-handel">

                                </div>
                                <div class="row">                            
                                </div>
                                 <div class="row">
                                 	<!-- <div class="col-md-6">
                                		<div class="form-group">
	                                        <label>Colour *</label>
	                                        <select id="color" name="color" class="form-select form-control color-group" data-style="py-0">
	                                        	<option value="">--Chọn Màu--</option>
	                                        	
	                                            <option value="name">color</option>
	                                            
	                                        </select>
	                                        <label for="color" class="error"></label><br>
	                                        
                                    	</div>
                                	</div> 
	                              <div class="col-md-6"> 
	                                    <div class="form-group">
	                                        <label>Size *</label>
	                                        <select id="size" name="size" class="form-select form-control size-group" data-style="py-0">
	                                        <option value="">--Chọn Size--</option>
	                                                                 
	                                            <option value="">size</option>
	                                           
	                                        </select>
	                                        <label for="size" class="error"></label><br>
	                                    </div>
	                                </div>  -->
	                                <div class="col-md-12">                                    
	                                    <div class="form-group">
	                                        <label>Quantity *</label>
	                                        <input type="text" class="form-control" name ="amount" value="" placeholder="Enter Quantity" required>
	                                        <label for="amount" class="error"></label>
	                                        <div class="help-block with-errors"></div>
	                                    </div>
	                                </div>
	                                <div class="ajax-display-img-input row col-sm-12">
	                                	<div class="col-md-6">
		                                    <div class="form-group">
		                                        <label>Cost *</label>
		                                        <input type="text" class="form-control" name="cost" value="" placeholder="Enter Cost" data-errors="Please Enter Cost.">
		                                        <label for="cost" class="error"></label>
		                                        <div class="help-block with-errors"></div>
		                                    </div>
		                                </div>
		                                <div class="col-md-6">
		                                    <div class="form-group">
		                                        <label>Price *</label>
		                                        <input type="text" class="form-control" name="price" value="" placeholder="Enter Price" data-errors="Please Enter Price.">
		                                        <label for="price" class="error"></label>
		                                        <div class="help-block with-errors"></div>
		                                    </div>
		                                </div>
		                                <!-- <div class="col-md-12">
		                                    <div class="form-group">
		                                        <label>Tax Method *</label>
		                                        <select name="type" class="form-select form-control" data-style="py-0">
		                                            <option>Exclusive</option>
		                                            <option>Inclusive</option>
		                                        </select>
		                                    </div>
		                                </div> -->
	                                	<div class="col-md-12">
		                                    <div class="form-group">
		                                        <label>Suppliers *</label>
		                                        <select name="suppliers_id" class="form-select form-control" data-style="py-0">
		                                        	<option value="">--Chọn Supplier--</option>
		                                        <c:if test="${not empty supplierService.getListSupplier() }">
		                                        	<c:forEach items="${supplierService.getListSupplier() }" var="sup">
			                                        <option value="${sup.id }">${sup.supplier_name }</option>
			                                        </c:forEach>
		                                        </c:if>
		                                        </select>
		                                    </div>
		                                </div>
		                             	 <div class="col-md-12">
		                                    <div class="form-group">
		                                        <label>Image</label>
		                                        <input type="file" class="form-control image-file" name="picture" multiple="multiple" accept="image/*">
		                                    	<label for="pic" class="error"></label>
		                                    </div>
		                                </div>
		                                <div class="col-md-12">
		                                    <div class="form-group">
		                                        <label>The Product Set Includes</label>
		                                        <textarea id="the_product_set_includes" class="form-control" name="the_product_set_includes" rows="4"></textarea>
		                                    	<label for="the_product_set_includes" class="error"></label>
		                                    </div>
		                                </div>
		                                 <div class="col-md-12">
		                                    <div class="form-group">
		                                        <label>
		                                        Product Information</label>
		                                        <textarea id="product_information" class="form-control" name="product_information" rows="4"></textarea>
		                                   		<label for="product_information" class="error"></label>
		                                    </div>
		                                </div> 
		                                <div class="col-md-12">
		                                    <div class="form-group">
		                                        <label>
		                                        Shipping Policy</label>
		                                        <textarea class="form-control ckeditor" name="shipping_policy" rows="4">
		                                        	<p style="font-family: verdana, geneva, sans-serif; font-size: 13pt;"><span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>CHÍNH SÁCH VẬN CHUYỂN</strong></span></p>
		                                        	<p style="font-family: verdana, geneva, sans-serif; font-size: 10pt;"><span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;">Thông thường sau khi nhận được thông tin đặt hàng chúng tôi sẽ xử lý đơn hàng trong vòng 24h và phản hồi lại thông tin cho khách hàng về việc thanh toán và giao nhận. Thời gian giao hàng thường trong khoảng từ 3-5 ngày kể từ ngày chốt đơn hàng hoặc theo thỏa thuận với khách khi đặt hàng. Tuy nhiên, cũng có trường hợp việc giao hàng kéo dài hơn nhưng chỉ xảy ra trong những tình huống bất khả kháng như sau:</span></p>
		                                        	<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Nhân viên công ty sẽ liên lạc với khách hàng qua điện thoại không được nên không thể giao hàng.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Địa chỉ giao hàng bạn cung cấp không chính xác hoặc khó tìm.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Số lượng đơn hàng của công ty tăng đột biến khiến việc xử lý đơn hàng bị chậm.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Đối tác cung cấp cho công ty chậm hơn dự kiến khiến việc giao hàng bị chậm lại hoặc đối tác vận chuyển giao hàng bị chậm chỉ vận chuyển phân phối cho đại lý hoặc khách hàng có nhu cầu lớn, lâu dài.&nbsp;</span></li>
													</ul>
													<p style="font-family: verdana, geneva, sans-serif; font-size: 10pt;"><span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;">Vì thế công ty đa phần sẽ hỗ trợ chi phí vận chuyển như một cách chăm sóc đại lý cua mình. Đối với khách lẻ nếu có nhu cầu sử dụng lớn vui lòng liên hệ trực tiếp để thỏa thuận hợp đồng cũng như phí vận chuyển.</span></p>
		                                        </textarea>
		                                   		<label for="shipping_policy" class="error"></label>
		                                    </div>
		                                </div> 
		                                <div class="col-md-12">
		                                    <div class="form-group">
		                                        <label>
		                                        Return And Warranty</label>
		                                        <textarea class="form-control ckeditor" name="return_warranty" rows="4">
		                                        	<p style="font-family: verdana, geneva, sans-serif; font-size: 13pt;"><span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>CHẾ ĐỘ BẢO HÀNH</strong></span></p>
													<p style="font-family: verdana, geneva, sans-serif; font-size: 10pt;"><span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>Tất cả các đồng hồ khi bán ra đều kèm theo 2 phiếu bảo hành:</strong></span></p>
													<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">1 Phiếu Bảo Hành (hoặc Thẻ Bảo Hành/Sổ Bảo Hành) của hãng có giá trị bảo hành Quốc tế (Thời gian bảo hành tùy theo quy định của từng hãng).</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">1 Phiếu Bảo Hành của G-Watch (Sử dụng để được thay pin miễn phí vĩnh viễn &amp; Hưởng chế độ bảo hành tăng thêm từ 1-4 năm của G-Watch).</span></li>
													</ul>
													<span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;"><strong>Ví dụ:</strong> Đồng Hồ Citizen có chế độ bảo hành chính hãng: máy = 12 tháng, Pin = 12 tháng.</span>
													<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Khi mua tại G-Watch, Khách hàng sẽ được tặng thêm thời gian bảo hành từ 4 năm về máy. Pin = Vĩnh Viễn.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Tổng cộng: Khi mua tại G-Watch, đồng hồ Citizen&nbsp;sẽ được bảo hành máy = 05 năm, Pin = Vĩnh Viễn.</span></li>
													</ul>
													<span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>Lưu ý:</strong></span>
													<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Đối với sản phẩm còn trong thời gian bảo hành Quốc Tế: Quý khách có thể đem tới G-Watch hoặc bất kỳ nhà trung tâm bảo hành nào của hãng được ghi trên phiếu để yêu cầu được kiểm tra đồng hồ.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Đối với sản phẩm hết thời gian bảo hành Quốc Tế nhưng vẫn trong thời gian bảo hành tại G-Watch: Quý khách đem đồng hồ kèm Phiếu Bảo Hành của G-Watch tới bất kỳ chi nhánh nào của G-Watch để được hướng dẫn và kiểm tra đồng hồ.</span></li>
													</ul>
													<span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>Điều Kiện Được Bảo Hành</strong></span>
													<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Bảo hành chỉ có giá trị khi đồng hồ có Phiếu bảo hành của hãng &amp; Phiếu bảo hành của G-Watch đi kèm, điền chính xác, đầy đủ các thông tin.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Phiếu bảo hành phải còn nguyên vẹn, không rách, chấp vá, hoen ố, mờ nhạt.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Còn trong thời gian bảo hành. Thời gian bảo hành được tính từ ngày mua có ghi trên Phiếu Bảo Hành.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Chỉ bảo hành thay thế mới cho những linh kiện, phụ tùng bị hỏng – không thay thế bằng một chiếc đồng hồ khác.</span></li>
													</ul>
													<span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>Điều Kiện Không Được Bảo Hành</strong></span>
													<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Đồng hồ không có Phiếu bảo hành của hãng và Phiếu bảo hành của G-Watch đi kèm.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Các loại dây đeo, khoá, vỏ, màu xi, mặt số, mặt kiếng bị hỏng hóc, vỡ do sử dụng không đúng, tai nạn, lão hóa tự nhiên, va đập, … trong quá trình sử dụng.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Hỏng hóc do hậu quả gián tiếp của việc sử dụng sai hướng dẫn của hãng có kèm theo đồng hồ.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Trầy xước về dây hoặc mặt kiếng bị trầy xước, vỡ do va chạm trong quá trình sử dụng.&nbsp;</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Tự ý thay đổi máy móc bên trong, mở ra can thiệp sửa chữa trong thời gian còn bảo hành –&nbsp;Tại những nơi không phải là trung tâm của hãng</span></li>
													</ul>
													<span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>Chế Độ Bảo Hành RED GUARANTEE</strong></span>
													<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Tăng thêm 1-2 năm bảo hành tại G-Watch ngoài chế độ bảo hành Quốc Tế của hãng để có tổng thời gian là 4 năm.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Ưu tiên bảo hành – Đồng hồ sẽ được xếp vào danh sách ưu tiên bảo hành để nhanh chóng quay lại với Quý khách.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Giao nhận đồng hồ bảo hành ngay tại nhà Quý khách.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Cập nhật tình trạng đồng hồ qua điện thoại tới Quý khách. Quý khách được tư vấn, cập nhật tình trạng đồng hồ trong quá trình đồng hồ được bảo hành.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">4 năm đánh bóng đồng hồ miễn phí.</span></li>
													</ul>
													<span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;"><strong>CHÍNH SÁCH ĐỔI HÀNG</strong></span>
													<p style="font-family: verdana, geneva, sans-serif; font-size: 10pt;"><span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;">Trong vòng 7 ngày kể từ ngày mua hàng từ Đồng Hồ G-Watch, Quý khách có thể yêu cầu đổi hàng hoàn toàn miễn phí. Thời hạn 7 ngày được tính theo dấu bưu điện khi Quý khách gửi sản phẩm về cho chúng tôi hoặc thời gian chúng tôi tiếp nhận yêu cầu trực tiếp (tại cửa hàng) của Quý khách.</span></p>
													<ul style="list-style-type: square;">
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Yêu cầu đổi hàng cần được thực hiện trong vòng 7 ngày kể từ ngày Quý khách nhận được hàng.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Sản phẩm không có dấu hiệu đã qua sử dụng (còn đầy đủ keo dán bảo vệ chống trầy xước mặt đồng hồ, nắp đáy, dây..)</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Sản phẩm không bị dây bẩn, trầy xước, hư hỏng, dính hoá chất hoặc có dấu hiệu cạy mở.</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Các bộ phận, linh kiện, phụ kiện, tài liệu hướng dẫn sử dụng, tài liệu kỹ thuật, quà tặng kèm theo (nếu có), …&nbsp;</span></li>
														<li><span style="font-family: 'times new roman', times, serif; font-size: 12pt; line-height: 2.5;">Hộp đựng, bao bì đóng gói sản phẩm còn nguyên vẹn, không bị móp, rách, ố vàng, …</span></li>
														<li><span style="font-size: 12pt; line-height: 2.5; font-family: 'times new roman', times, serif;">Chỉ chấp nhận đổi 1 lần duy nhất tính từ ngày mua sản phẩm.</span></li>
													</ul>
		                                        </textarea>
		                                   		<label for="return_warranty" class="error"></label>
		                                    </div>
		                                </div> 
	                                </div>
                                 </div>
                             <div id="errorData"></div>                        
                            <button id="btnHd" type="submit" class="btn btn-primary mr-2">Add Product</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%-- <script type="text/javascript">
		
  		 $(function() {
   		    $('#suk ).on('blur', function() {
   		        var changedField = $(this);
   		        var suk = $("#suk").val();
   		     	var name = $("#name").val(); 
   		        $.ajax({
   					url: '${pageContext.request.contextPath}/admin/handel_product_ajax',
   					type: 'POST',
   					cache: false,
   					data: {
   						asuk: suk,
   						aname: name,
   						
   					},
   					success: function(data){
   						$('.ajax-handel').html(data);
   					},
   					error: function (){
   						alert('Có lỗi xảy ra');
   					},
   				});
   				return false;
   		    });
   		   
   		});
  		
			 $('#color ,#color-text').on('blur', function(){
				var color_text = $('#color-text').val();
				var color = $('#color').val();
		    	var sku = $('#suk').val();
		    	$.ajax({
					url: '<%=request.getContextPath()%>/admin/handel-color',
					type: 'POST',
					cache: false,
					data: {
						asku: sku,
						acolor: color,
						bcolor: color_text,
						
					},
					success: function(data){
						$('.ajax-display-img-input').html(data);
					},
					error: function (){
						alert('Có lỗi xảy ra');
					},
				});
		    	return false;
		    });
         </script> --%>
        <!-- Page end  -->
    </div>
      </div>
    </div>
    <script>
    var editor1 = CKEDITOR.replace('the_product_set_includes');
	CKFinder.setupCKEditor(editor1, "${pageContext.request.contextPath}/libraries/ckfinder/" )
	var editor = CKEDITOR.replace('product_information');
	CKFinder.setupCKEditor(editor, "${pageContext.request.contextPath}/libraries/ckfinder/" )
</script>
<script>
    	jQuery.validator.setDefaults({
    	  success: "valid"
    	});
    	$('#form').validate({
    		ignore:[],
    		rules:{
    			cat_lv1_id:{
    				required: true,
    			},
    			cat_lv2_id:{
    				required: true,
    			},
    			product_sku:{
    				required: true,
    			},
    			name:{
    				required: true,
    			},
    			/* color:{
    				require_from_group: [1,".color-group"],
    			},
    			'color-text':{
    				require_from_group: [1,".color-group"],
    			},
    			size:{
    				require_from_group: [1,".size-group"],
    			},
    			'size-text':{
    				require_from_group: [1,".size-group"],
    			}, */
    			cost:{
    				required: true,
    			},
    			price:{
    				required: true,
    			},
    			amount:{
    				required: true,
    			},
    			picture:{
    				required: true,
    			},
    			
    			the_product_set_includes:{
    				required: true,
    			},
    			product_information:{
    				required: true,
    			},
    			shipping_policy:{
    				required:true,
    			},
    			return_warranty:{
    				required: true,
    			}
    		},
    		messages:{
    			cat_lv1_id:{
    				required: "Vui lòng Chọn.",
    			},
    			cat_lv2_id:{
    				required: "Vui lòng Chọn.",
    			},
    			product_sku:{
    				required: 'Nhập vào mã sản phẩm.',
    			},
    			name:{
    				required: 'Nhập vào tên sản phẩm.',
    			},
    			/* color:{
    				require_from_group: "Chọn màu.",
    			},
    			'color-text':{
    				require_from_group: "Chọn màu.",
    			},
    			size:{
    				require_from_group: "Chọn size.",
    			},
    			'size-text':{
    				require_from_group: "Chọn size.",
    			}, */
    			cost:{
    				required: "Nhập vào chi phí.",
    			},
    			price:{
    				required: "Nhập giá bán.",
    			},
    			amount:{
    				required: "Nhập số lượng.",
    			},
    			picture:{
    				required: "Chọn file.",
    			},
    			
    			the_product_set_includes:{
    				required: 'Hãy nhập vào sản phẩm kèm theo.',
    			},
    			product_information:{
    				required: 'Hãy nhập vào thông tin sản phẩm.',
    			},
    			
    			shipping_policy:{
    				required: 'Hãy nhập vào chính sách vận chuyển',
    			},
    			return_warranty:{
    				required: "Hãy nhập vào chính sách đổi trả và bảo hành.",
    			}
    			
    		},
    	});
    	CKEDITOR.on('instanceReady', function () {
    	    $.each(CKEDITOR.instances, function (instance) {
    	        CKEDITOR.instances[instance].document.on("keyup", CK_jQ);
    	        CKEDITOR.instances[instance].document.on("paste", CK_jQ);
    	        CKEDITOR.instances[instance].document.on("keypress", CK_jQ);
    	        CKEDITOR.instances[instance].document.on("blur", CK_jQ);
    	        CKEDITOR.instances[instance].document.on("change", CK_jQ);
    	    });
    	});

    	function CK_jQ() {
    	    for (instance in CKEDITOR.instances) {
    	        CKEDITOR.instances[instance].updateElement();
    	    }
    	}
    	CKEDITOR_CONFIGS = {
    		    'default': {
    		        'skin': 'moono',
    		        'toolbar': 'basic',
    		        'height': 'full',
    		        'width': 'full',
    		        'removePlugins': 'exportpdf',
    		        'toolbarCanCollapse':'true'
    		    },
    		}
    </script>
    <!-- Wrapper End-->