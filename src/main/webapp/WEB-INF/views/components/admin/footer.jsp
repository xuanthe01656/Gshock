<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url value="/resources/gshock/admin" var="contextPath" scope="application"></c:url>
<footer class="iq-footer">
            <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-inline mb-0">
                                <li class="list-inline-item"><a href="../backend/privacy-policy.jsp">Privacy Policy</a></li>
                                <li class="list-inline-item"><a href="../backend/terms-of-service.jsp">Terms of Use</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-6 text-right">
                            <span class="mr-1"><script>document.write(new Date().getFullYear())</script>©</span> <a href="#" class="">G-WATCH</a>.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
  <script src="${contextPath }/js/backend-bundle.min.js"></script>
   <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>-->
    <!-- Table Treeview JavaScript-->
    <script src="${contextPath }/js/table-treeview.js"></script> 
    <!-- Chart Custom JavaScript 
    <script src="${contextPath }/js/customizer.js"></script>-->
    <script async src="${contextPath }/js/chart-custom.js"></script>
    <!-- app JavaScript -->
    <script src="${contextPath }/js/app.js"></script> 
   
  </body>
</html>     