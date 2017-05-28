<%@ include file="./../../common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mypkg.model.Airplane"%>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
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
			location.href='<%=MyCtrlCommand1%>boInsertForm';
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
		location.href='<%=MyCtrlCommand1%>boList';
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
						<h2>운항스케줄 목록</h2>
					</form>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>시퀀스NO</th>
							<th>편명</th>
							<th>도시코드</th>
							<th>날짜</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>소요시간</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tr>
					</tr>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td>${bean.sequence}</td>
							<td>${bean.aplane_name}</td>
							<td>${bean.city_code}</td>
							<td>${bean.p_date}</td>
							<td>${bean.departure_time}</td>
							<td>${bean.arrival_time}</td>
							<td>${bean.lead_time}</td>
							<td><a
								href="<%=MyCtrlCommand1%>boUpdateForm&no=${bean.sequence}&${requestScope.parameters}">
									수정 </a></td>
							<td><a
								href="<%=MyCtrlCommand1%>boDelete&no=${bean.sequence}&${requestScope.parameters}">
									삭제 </a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div align="center">
				<footer>${requestScope.pagingHtml}</footer>
			</div>
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