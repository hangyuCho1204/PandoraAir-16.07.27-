<%@ include file="./../../common/header.jsp"%>
<%@page import="mypkg.model.CityDao"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath2 = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandName2 = "/BookingCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByForm2 = contextPath2 + CommandName2; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommand2 = contextPath2 + CommandName2 + "?command=";
	//out.print( MyCtrlCommand + "<br>" ); // Model2/MiniShopCtrl?command=
%>
<%
	String pattern2 = "###,###";
	DecimalFormat df2 = new DecimalFormat(pattern2);
	int twelve2 = 12; //그리드 시스템의 숫자 값
%>
<%
	int myoffset = 2;
	int mywidth = twelve2 - 2 * myoffset;
	int formleft = 3;
	int formright = twelve2 - formleft;
	int mysearch = 2;
	//int label = 3 ; //양식의 왼쪽에 보여지는 라벨의 너비 
	//int content = twelve - label ; //우측의 내용 입력(input, select, textarea)의 너비
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Insert title here</title>
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
			location.href='<%=MyCtrlCommand2%>boInsertForm';
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
		location.href='<%=MyCtrlCommand2%>boList';
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
						<h2>운항 도시</h2>
					</form>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>도시코드</th>
							<th>출발지</th>
							<th>도착지</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tr>

					</tr>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td>${bean.city_code}</td>
							<td>${bean.local}</td>
							<td>${bean.destination}</td>
							<td><a
								href="<%=MyCtrlCommand2%>boUpdateForm&no=${bean.city_code}&${requestScope.parameters}">
									수정 </a></td>
							<td><a
								href="<%=MyCtrlCommand2%>boDeleteForm&no=${bean.city_code}&${requestScope.parameters}">
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