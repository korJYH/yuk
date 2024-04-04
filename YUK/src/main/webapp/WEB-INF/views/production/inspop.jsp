<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요기육</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.svg" type="image/x-icon">
    
	<!-- Required meta tags -->
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

	<!-- sweetalert2 -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
	
	<!-- 	jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
<section id="multiple-column-form" >
        <div class="row match-height" >
            <div class="col-12" >
                <div class="card" style="box-shadow: none;">
		  			<div class="card-header" style="margin-top: 30px;">
                        <h3 class="card-title">생산실적 등록</h3>
                    <hr>
                    </div>
                    <div class="card-content">
                      <form class="form" id="insForm" action="${pageContext.request.contextPath}/production/insertInstruction" method="post">
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="first-name-column">작업지시코드</label>
                                            <input type="text" id="instructionCode" class="form-control" value="${productionDTO.instructionCode }" name="instructionCode" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="country-floating">수량</label>
                                            <input type="text" id="insVol" class="form-control" name="insVol" placeholder="0">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">지시일자</label>
                                            <input type="DATE" id="instructionDate" class="form-control" name="instructionDate" placeholder="2024-00-00">
                                        </div>
                                    </div>
						</div></div>
                        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="city-column">품목코드</label>
                                            <input type="text" id="productCode" class="form-control" onclick="openProductPopup()" placeholder="PRO" name="productCode">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <label for="email-id-column">라인코드</label>
                                            <input type="text" id="lineCode" class="form-control" name="lineCode" onclick="openLinePopup()" placeholder="Line">
                                        </div>
                                    </div>
						</div></div>

<!--                             ------------------------------------------- -->
<!-- 품목 소요량 테이블 -->
		  <div class="card-header" style="margin-top: 30px;">
	        <h3 class="card-title" style="text-align: left;">소요량</h3>
	      <hr>
	      </div>
		<div class="card-body">
	      <div class="card-content">
	        <div class="card-body" style="padding: 5px;">
	          <!-- Table with outer spacing -->
	          <div class="table-responsive">
	            <table class="table" id="reqTable">
	              <thead>
	                <tr>
	                  <th>품목코드</th>
	                  <th>품명</th>
	                  <th>수량</th>
	                  <th>재고량</th>
	                </tr>
	              </thead>
	              <tbody>
	              </tbody>
	            </table>
	          </div>
	        </div>
	      </div>
	      </div>
	      
<!--	품목 소요량 테이블 끝 -->


							<div class="col-12 d-flex justify-content-end">
							    <button type="submit" class="btn btn-primary mr-1 mb-1" onclick="submitForm()">Submit</button>
							    <button type="reset" class="btn btn-light-secondary mr-1 mb-1">Reset</button>
							</div>
						</form>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <script src="${pageContext.request.contextPath}/resources/assets/js/feather-icons/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    
	<script>
// 	  // 인풋 창을 클릭하면 팝업을 엽니다.
// 	  function openPopup() {
// 	    var popup = window.open("${pageContext.request.contextPath}/popup/contractpop", "popup", "width=800,height=600");
	    
// 	    if (popup === null || typeof(popup) === 'undefined') {
// 	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
// 	    } else {
// 	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
// 	      $(popup.document).on('click', '.popup-option', function() {
// 	        var selectedValue = $(this).text();
// 	        var selectedValue1 = $(this).text();
// 	        var selectedValue2 = $(this).text();
// 	        var selectedValue3 = $(this).text();
	        
// 	        $('#contractCode').val(selectedValue);
// 	        $('#productCode').val(selectedValue1);
// 	        $('#productName').val(selectedValue2);
// 	        $('#contractDate').val(selectedValue3);
// 	        popup.close();
// 	      });
// 	    }
// 	  }
	</script>
	
	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function openProductPopup() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/productpop", "openProductPopup", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#productCode').val(selectedValue);
	        window.opener.receiveValueFromPopup(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	<script>
	  // 인풋 창을 클릭하면 팝업을 엽니다.
	  function openLinePopup() {
	    var popup = window.open("${pageContext.request.contextPath}/popup/linepop", "openLinePopup", "width=800,height=600");
	    
	    if (popup === null || typeof(popup) === 'undefined') {
	      alert('팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.');
	    } else {
	      // 팝업에서 선택한 값을 가져와서 인풋 필드에 설정합니다.
	      $(popup.document).on('click', '.popup-option', function() {
	        var selectedValue = $(this).text();
	        $('#lineCode').val(selectedValue);
	        popup.close();
	      });
	    }
	  }
	</script>
	
<script>
  // 팝업으로부터 값을 받는 함수
  function receiveValueFromPopup(selectedValue) {
    // AJAX 요청을 보냅니다.
    $.ajax({
      url: '${pageContext.request.contextPath}/production/getReq', // 서버의 URL을 지정하세요.
      type: 'POST',
      contentType: 'application/json',
      dataType: 'json',
      data: JSON.stringify({ productCode: selectedValue }),
      success: function(response) {
    	  alert("성공");
        // 성공적으로 데이터를 받았을 때 테이블 업데이트
        updateTable(response);
      },
      error: function(xhr, status, error) {
        // 오류 처리
        console.error("Error occurred: " + error);
      }
    });
  }

  // 응답으로 받은 데이터로 테이블 업데이트
  function updateTable(data) {
    var table = $('#reqTable'); // 테이블의 ID를 지정하세요.
    table.empty(); // 기존 테이블 내용을 비웁니다.

    // 데이터로 테이블 채우기
    $.each(data, function(i, item) {
      var row = $('<tr>').append(
        $('<td>').text(item.column1), // 실제 데이터 구조에 맞게 수정하세요.
        $('<td>').text(item.column2)  // 실제 데이터 구조에 맞게 수정하세요.
        // 필요한 만큼 td 추가
      );
      table.append(row);
    });
  }
</script>

	
	<script>
		// 현재 날짜 생성/입력
		document.getElementById('instructionDate').valueAsDate = new Date();
	</script>
	
	
	<script>
	$(document).ready(function() {
	    // 폼의 'submit' 이벤트에 대한 이벤트 리스너 등록
	    $("#insForm").submit(function(event) {
	        // 기본 폼 제출 동작을 방지
	        event.preventDefault();
	
	        // AJAX 요청
	        $.ajax({
	            url: "${pageContext.request.contextPath}/production/insertInstruction", // 실제 요청 URL로 변경해야 함
	            type: "post", // 메소드 타입
	            data: $(this).serialize(), // 현재 폼 데이터 직렬화
	            success: function(response) {
	                // 데이터베이스 저장 성공 후
	                alert("등록 성공!");
	                window.opener.location.reload(); // 부모 창 새로고침
	                window.close(); // 팝업 창 닫기
	            },
	            error: function(xhr, status, error) {
// 	                alert("등록 실패: " + error);
	            }
	        });
	    });
	});
	</script>
	
	<script>
	// 빈칸이 있을 때 알림
	document.addEventListener('DOMContentLoaded', function() {
	    var form = document.getElementById('insForm');
	
	    if (form) { // 폼이 존재하는지 확인
	        form.addEventListener('submit', function(e) {
	            // 모든 'form-control' 클래스를 가진 입력 필드 검사
	            var inputFields = document.querySelectorAll('.form-control');
	            var isEmptyFieldPresent = Array.from(inputFields).some(function(input) {
	                return input.value.trim() === ''; // 비어있는 입력 필드가 있는지 확인
	            });
	
	            if (isEmptyFieldPresent) { // 하나라도 비어있는 입력 필드가 있으면
	                Swal.fire({
	                	  title: "빈칸을 채워주세요.",
	                	  width: 600,
	                	  padding: "3em",
	                	  color: "#00ff0000",
	                	  background: "#fff",
	                	  backdrop: `
	                	    rgba(ff,ff,ff,0)
	                	    left top
	                	    no-repeat
	                	  `
	                	});
	                e.preventDefault(); // 폼 제출 중단
	            }
	        });
	    }
	});
	</script>
	
</body>
</html>