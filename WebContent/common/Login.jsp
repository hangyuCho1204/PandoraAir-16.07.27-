<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int myoffset = 3;
	int mywidth = 12 - (2 * myoffset);
	String contextPath2 = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandName2 = "/BookingCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByForm2 = contextPath2 + CommandName2; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommand2 = contextPath2 + CommandName2 + "?command=";
%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="container">
		<div class="col-sm-offset-<%=myoffset%> col-sm-<%=mywidth%>">
			<div class="panel panel-default panel-primary">
				<div class="panel-heading">로그인 페이지</div>
				<div class="panel-body">
				    <form class="form-horizontal" role="form" action="<%=MyCtrlByForm2%>" method="post">
					<input type="hidden" name="command" value="pdrLoginForm">
						<div class="form-group">
							<label class="control-label col-sm-3" for="ID">ID:</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="id" name="id"
									data-toggle="tooltip" title="아이디는 3글자 이상 10글자 이하로 넣어 주세요"
									placeholder="Enter ID" value="${requestScope.id}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="pwd">Password:</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="password" name="password"
									placeholder="Enter password" value="${requestScope.password}">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-10">
								<button type="submit" class="btn btn-success">확인</button>
								&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>
	<!-- JQuery 문법 : 모든 문서가 로딩되고 나면 실행되는 문장. -->
</body>