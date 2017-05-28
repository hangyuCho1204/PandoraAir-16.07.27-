<%@ include file="./../../common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mypkg.model.Airplane"%>
<%
	int myoffset = 1;
	int mywidth = twelve - 1 * myoffset;
	int formleft = 3;
	int formright = twelve - formleft;
	int mysearch = 2;
	//int label = 3 ; //양식의 왼쪽에 보여지는 라벨의 너비 
	//int content = twelve - label ; //우측의 내용 입력(input, select, textarea)의 너비
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>BootStrap Sample</title>
<style type="text/css">
.xxx {
	margin-left: 0px;
}

.re {
	font-size: 11px;
}
</style>
<script type="text/javascript">
	function writeForm(){
			location.href='<%=MyCtrlCommand1%>bookingForm';
	}
	function search(){
		if( $('#mode').val() == '-' ){
			alert('검색 목록을 선택해주세요') ;
			//$('#mode').focus();
		}else{
			//alert('하하') ;
		}
		//alert( $('#mode').val() );
	}
	function searchAll(){
		//$('#mode').val('-');
		//$('#keyword').val('');
		location.href='<%=MyCtrlCommand1%>bookingForm';
	}
</script>
</head>
<body>
	<div class="col-sm-2 sidenav">
		<%@ include file="./../../common/left.jsp"%>
		<br>
	</div>

	<div class="col-sm-10 bgset">


		<div class="container col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<div class="panel panel-default panel-primary">
				<div class="panel-heading">
					<form class="form-inline" role="form">
						<h2>회원예약 목록</h2>
					</form>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>편명</th>
							<th>회원ID</th>
							<th>도시코드</th>
							<th>시퀀스</th>
							<th>예매자</th>
							<th>구분</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>날짜</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>소요시간</th>
							<th>운임요금</th>
							<th>적립포인트</th>
							
						</tr>
					</thead>
					<tr>
					</tr>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td>${bean.aplane_name}</td>
							<td>${bean.m_id}</td>
							<td>${bean.c_code}</td>
							<td>${bean.s_num}</td>
							<td>${bean.name}</td>
							<td>${bean.category}</td>
							<td>${bean.local}</td>
							<td>${bean.destination}</td>
							<td>${bean.p_date}</td>
							<td>${bean.departure_tim}</td>
							<td>${bean.arrival_time}</td>
							<td>${bean.lead_time}</td>
							<td>${bean.fare}</td>
							<td>${bean.mpoint}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div align="center">
			<footer>${requestScope.pagingHtml}</footer>
		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<script type="text/javascript">
		/* 방금 전 선택한 콤보 박스를 그대로 보여 주기 */
		$('#mode option').each(function(index) {
			if ($(this).val() == '${requestScope.mode}') {
				$(this).attr('selected', 'selected');
			}
		});
		/* 이전에 넣었던 값 그대로 보존 */
		$('#keyword').val('${requestScope.keyword}');
	</script>
</body>
</html>












