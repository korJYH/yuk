<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOGIYUK</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    <!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
</head>
<body>
<jsp:include page="../inc/sidebar.jsp" />
    


<div class="main-content container-fluid" width="1392px" height="1000px">
    <div class="page-title">
        <h3><a href="${pageContext.request.contextPath}/ordercontract/contract">수주관리</a></h3>
        <h5><a href="${pageContext.request.contextPath}/ordercontract/contract">조회페이지</a></h5>
    </div>
    <div class="card">
        <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <form action="${pageContext.request.contextPath}/ordercontract/contract" method="get" style="display: flex;">
                    <div style="margin-right: 10px;">
                        <b>수주코드</b>
                        <input type="text" id="first-name" class="form-control" name="search1" style="width: auto;">
                    </div>
                    <div style="margin-right: 10px;">
                        <b>거래처명</b>
                        <input type="text" id="first-name" class="form-control" name="search2" style="width: auto;">
                    </div>
                    <div style="margin-right: 10px;">
                        <b>품명</b>
                        <input type="text" id="first-name" class="form-control" name="search3" style="width: auto;">
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit" style="height:36px !important; margin-top:22px !important;" >조회</button>
                </form>
            </div>
            <div>
           
                <button class="btn btn-primary btn-sm" type="submit" onclick="addpopup();" style="margin-top:22px !important;">등록</button>
<!--                 <button class="btn btn-primary btn-sm" type="submit" style="margin-top:22px !important;">저장</button> -->
            </div>
        </div>
            <div class="card-body">
                <table class='table table-striped' id="table1">
                    <thead>
                        <tr>
                            <th>수주코드</th>
                            <th>거래처명</th>
                            <th>품목이름</th>
                            <th>수주량</th>
                            <th>재고수량</th>
                            <th>총금액</th>
                            <th>수주일자</th>
                            <th>납품예정일</th>
<!--                             <th>담당자</th>  -->
                            <th>상태</th>
                            <th>상세</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="OrdercontractDTO" items="${ContractList}"> 
<%--    <tr onclick="location.href='${pageContext.request.contextPath}/Admin/content?n_num=${OrderDTO.n_num}'">  --%>
<tr>
     	<td >${OrdercontractDTO.con_cd}</td> 
     	<td >${OrdercontractDTO.cli_name}</td> 
     	<td >${OrdercontractDTO.pro_name}</td> 
     	<td >${OrdercontractDTO.con_vol}</td> 
     	<td >${OrdercontractDTO.pro_vol}</td> 
     	<td >${OrdercontractDTO.pro_price*OrdercontractDTO.con_vol}</td> 
     	<td ><fmt:formatDate value="${OrdercontractDTO.con_date}" pattern="yyyy.MM.dd"/></td> 
     	<td ><fmt:formatDate value="${OrdercontractDTO.con_due_date}" pattern="yyyy.MM.dd"/></td> 
<%--     	<td >${OrdercontractDTO.user_id}</td> --%> 
    	<td >${OrdercontractDTO.con_info_status}</td>
		<td ><input type="button" value="상세" onclick="popup('${OrdercontractDTO.con_cd}');" /></td>
	</tr> 

    </c:forEach> 
                        
                        
                    </tbody>
                </table>
<!-- 			페이징 시작 -->
<nav aria-label="Page navigation example">
    <ul class="pagination pagination-primary justify-content-end">
        <c:if test="${pageDTO.startPage > 1}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/production/line?pageNum=${pageDTO.startPage - 1}">Previous</a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.startPage <= 1}">
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
            </li>
        </c:if>
        
        <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
            <li class="page-item ${pageDTO.currentPage == i ? 'active' : ''}">
                <a class="page-link" href="${pageContext.request.contextPath}/production/line?pageNum=${i}">${i}</a>
            </li>
        </c:forEach>
        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/production/line?pageNum=${pageDTO.endPage + 1}">Next</a>
            </li>
        </c:if>
        
        <c:if test="${pageDTO.endPage >= pageDTO.pageCount}">
            <li class="page-item disabled">
                <a class="page-link" href="#">Next</a>
            </li>
        </c:if>
    </ul>
</nav>
<!-- 			페이징 끝 -->
            </div>
        </div>
</div>

            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-left">
                        <p>2020 &copy; Voler</p>
                    </div>
                    <div class="float-right">
                        <p>Crafted with <span class='text-danger'><i data-feather="heart"></i></span> by <a href="http://ahmadsaugi.com">Ahmad Saugi</a></p>
                    </div>
                </div>
            </footer>
        
  
     <script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function popup(con_cd) {
		  var popup = window.open("${pageContext.request.contextPath}/ordercontract/contractdeletepopup?con_cd="+con_cd, "popup", "width=1600,height=600");
	        
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#con_cd').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function addpopup() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/contractaddpopup", "addpopup", "width=1600,height=300");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#con_cd').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/pages/dashboard.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>