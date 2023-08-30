<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cri" value="${pageMaker.cri }"/>

<div class="content-wrapper">
	<div style="height: 40px"></div>

	<section class="content container-fluid">
		<div class="card">
		<div class="card card-outline card-info">
			<div class="card-header with-border">
				<button type="button" class="btn btn-danger" id="" onclick="OpenWindow('registForm.do','글등록',800,700)">글등록</button>
				<div class="card-tools" style="width: 300px;">
					<div class="input-group row" style="width: 90%; margin-left: 50%;" >
						<select class="form-cotrol col-md-2" name="searchType" id="searchType">
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected' : '' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected' : '' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected' : '' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected' : '' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected' : '' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected' : '' }>작성자+내용</option>
						</select>
						<input class="form-cotrol" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }">
						<span class="input-group-append col-md-3">
							<button class="btn btn-dark" type="button" onclick="searchList_go();">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-borderd text-center">
						<tr style="font-size: 0.8em;">
							<th>번 호</th>
							<th style="width: 50%;">제 목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						<c:if test="${empty boardList }">
							<tr>
								<td colspan="5">
									<strong>해당 내용이 없습니다.</strong>
								</td>
						</c:if>
						<input type="text" id="sample5_address" placeholder="주소">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
						<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
								</a>
							</td>
							<td>${board.writer }</td>
							<td>
							<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/>
							</td>
							<td><span class="badge bg-red">${board.viewcnt }</span></td>
						</tr>
						
					</table>
				</div>
				<div class="card-footer">
					<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
				</div>
			</div>
	</section>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a570ffe6a09630285496d806545d985&libraries=services"></script>
<script type="text/javascript">

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	mapOption = {
		center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.537187, 127.005476),
		map : map
	});

	function sample5_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = data.address; // 최종 주소 변수

				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("sample5_address").value = addr;
				// 주소로 상세 정보를 검색
				geocoder.addressSearch(data.address, function(results, status) {
					// 정상적으로 검색이 완료됐으면
					if (status === daum.maps.services.Status.OK) {

						var result = results[0]; //첫번째 결과의 값을 활용

						// 해당 주소에 대한 좌표를 받아서
						var coords = new daum.maps.LatLng(result.y, result.x);
						// 지도를 보여준다.
						mapContainer.style.display = "block";
						map.relayout();
						// 지도 중심을 변경한다.
						map.setCenter(coords);
						// 마커를 결과값으로 받은 위치로 옮긴다.
						marker.setPosition(coords)
					}
				});
			}
		}).open();
	}
</script>

<!-- jQuery -->

<script
	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<%@ include file="../include/footer_js.jsp"%>

