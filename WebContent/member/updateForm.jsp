<%@ include file="./../../common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 3;
	int formright = twelve - formleft;
%>
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
<style type="text/css">
.form-group {
	margin-bottom: 3px;
}
</style>
<script type="text/javascript">
     
    function checkForm(){
      var isCheck = document.myform.isCheck.value ;
      var email = document.myform.email.value ;
      var lnum =  document.myform.lnum.value;
      var name = document.myform.name.value ;
      var password = document.myform.password.value ;
     var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      if(name.length == 0){
         alert('이름을 입력해 주세요') ;
          document.myform.name.focus() ; 
          return false ;
      }else if(password.length == 0){
         alert('비밀번호를 입력해 주세요') ;
          document.myform.password.focus() ; 
          return false ;
      }else if( regex.test(email) === false) {
         alert("잘못된 이메일 형식입니다.");
          document.myform.email.focus() ; 
          return false ;
      }
	}
    function toMain(){
		location.href="<%=MyCtrlCommand1%>pdrmain";
	}
</script>
</head>
<body>
	<div class="col-sm-2 sidenav">
		<%@ include file="./../../common/left.jsp"%>
		<br>
	</div>

	<div class="col-sm-10 bgset">

		<div id="main_container" align="center"
			class="container col-xs-offset-<%=myoffset%> col-lg-offset-<%=myoffset%> col-xs-<%=mywidth%> col-lg-<%=mywidth%>">
			<h2>회원 수정 하기</h2>
			<div class="panel panel-primary sub_container">
				<div class="panel-heading" align="left">
					<font color="red"><b>회원 정보 수정</b></font> 페이지입니다.
				</div>
				<div class="panel-body sub_container">
					<form id="myform" name="myform" class="form-horizontal" role="form"
						action="<%=MyCtrlByForm1%>" method="post">
						<input type="hidden" name="command" value="pdrMemberUpdate">
						<input type="hidden" name="isCheck" value="true"> <input
							type="hidden" name="mpoint" value="5">
						<div class="form-group">
							<label for="id"
								class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">아이디</label>
							<div class="col-xs-<%=formright - 2%> col-lg-<%=formright - 2%>">
								<input type="text" name="id" id="id" class="form-control"
									value="${requestScope.bean.id}" readonly="readonly"> <span
									class="err">${errid}</span> <input type="hidden" name="id"
									id="id" class="form-control" value="${requestScope.bean.id}">
							</div>
						</div>
						<div class="form-group">
							<label for="name"
								class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">이름</label>
							<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
								<input type="text" name="name" id="name" class="form-control"
									value="${requestScope.bean.name}"> <span class="err">${errname}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="password"
								class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">비밀
								번호</label>
							<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
								<input type="password" name="password" id="password"
									class="form-control" placeholder="비밀 번호를 넣어 주셔요"
									value="${requestScope.bean.password}"> <span
									class="err">${errpassword}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="lnum"
								class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">주민
								번호</label>
							<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
								<input type="text" name="lnum" id="lnum" class="form-control"
									value="${requestScope.bean.lnum}"> <span class="err">${errlnum}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="phone"
								class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">전화
								번호</label>
							<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
								<input type="text" name="phone" id="phone" class="form-control"
									value="${requestScope.bean.phone}"> <span class="err">${errphone}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="email"
								class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">이메일</label>
							<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
								<input type="text" name="email" id="email" class="form-control"
									value="${requestScope.bean.email}"> <span class="err">${erremail}</span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-xs-<%=twelve%> col-lg-<%=twelve%>" align="center">
								<button type="submit" class="btn btn-default"
									onclick="checkForm()">
									<b>수정하기</b>
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-default" onclick="toMain()">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			//alert('dd') ;
			$('#myform').validate({
				rules : {
					id : {
						required : true,
						rangelength : [ 4, 8 ]
					}
				}, //end rules
				messages : {
					id : {
						required : '아이디는 필수 입력 사항입니다.',
						rangelength : '아이디는 4자리 이상 8자리 이하입니다.'
					}
				}
			});
		});
	</script>
</body>
</html>