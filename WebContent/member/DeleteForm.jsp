<%@ include file="./../../common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int myoffset = 3;
	int mywidth = 12 - (2 * myoffset);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function toMain(){
		location.href="<%=MyCtrlCommand1%>pdrmain";
	}
	function memberDelete(){
		location.href="<%=MyCtrlCommand1%>pdrMemberDelete&id=<%=loginfo.getId()%>";
	}
</script>
<body>

	<div class="col-sm-2 sidenav">
		<%@ include file="./../../common/left.jsp"%>
		<br>
	</div>

	<div class="col-sm-10 bgset">

		<div class="container">
			<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
				<div class="panel panel-default panel-primary">
					<div class="panel-heading">회원 탈퇴</div>
					<div class="panel-body">
							<div align="center">
								<h4>정말로 회원을 탈퇴하시겠습니까?</h4>
							</div>
							<div>&nbsp;</div>
							<div>
								<div class="col-sm-offset-4 col-sm-10">
									<button type="button" class="btn btn-default" onclick="memberDelete()">확인</button>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-default" onclick="toMain()">취소</button>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>