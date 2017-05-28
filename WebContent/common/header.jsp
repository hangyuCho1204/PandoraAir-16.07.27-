<%@ page import="mypkg.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String pattern = "###,###";
	DecimalFormat df = new DecimalFormat(pattern);
	int twelve = 12; //그리드 시스템의 숫자 값
%>
<%
	String contextPath1 = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandName1 = "/BookingCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByForm1 = contextPath1 + CommandName1; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommand1 = contextPath1 + CommandName1 + "?command=";
	//out.print( MyCtrlCommand + "<br>" ); // Model2/MiniShopCtrl?command=
%>
<%
	//가정 : 현재 어플리케이션 이름이 SpringShop이고,./common/top 이미지 업로드 폴더가 upload라고 가정하면
	//웹 서버의 이미지를 올릴 경로는 다음과 같이 구한다.
	//변수 url은 여러 군대에서 사용되고 있어서 사용하지 못함
	String myurl = request.getRequestURL().toString(); //url = http://localhost:8888/ShoppingLab/main.jsp
	String uri = request.getRequestURI(); //uri=/ShoppingLab/main.jsp
	int idx = myurl.indexOf(uri); //http://localhost:8888의 길이
	//out.print("idx = " + idx + "<br>");
	//웹서버의 이미지를 올릴 경로
	String uploadPath = "/upload/";
	String uploadedFolder = myurl.substring(0, idx) + contextPath1 + uploadPath; //위의 3가지 변수를 가지고 짜집기.
	//out.print("url = " + myurl + "<br>");
	//out.print("uri=" + uri + "<br>");
	//out.print("uploadedFolder = " + uploadedFolder + "<br>");

	String realPath = application.getRealPath(uploadPath);
	//out.print("realPath = " + realPath + "<br>");
	//밑에 것은 이전 방식
	//String realPath = request.getRealPath(uploadPath);
	//out.print("realPath = " + realPath + "<br>");

	Member loginfo = (Member) session.getAttribute("loginfo");
	String log = "", mem = "";
	int whologin = 0; // 0 : 미로그인,  1 : 회원 로그인, 2 : 관리자 로그인

	if (loginfo == null) {
		whologin = 0;

	} else { //관리자는 아이디가 admin이라고 가정한다.
		if (loginfo.getId().equals("admin")) {
			whologin = 2;
		} else {
			whologin = 1; //일반 사용자 로그인 
		}
	}
	//out.println("whologin : " + whologin);
	session.setAttribute("whologin", whologin);
%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style type="text/css">
	.logoloc{
		margin-top: -30px;
	}
	#nn-i1{
	height: 103px;
	margin-bottom: 0px;
	}

</style>

<script type="text/javascript">
	function logout(){
		location.href="<%=MyCtrlCommand1%>pdrLogout";
	}
	function insert(){
		location.href="<%=MyCtrlCommand1%>pdrInsertForm";
	}

</script>

</head>
<body>
	<nav class="navbar navbar-inverse" id="nn-i1">
	<div class="container-fluid" style=" padding-left: 0px;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			
			<a href="<%=MyCtrlCommand1%>pdrmain"><img src="<%=contextPath1%>/image/pandora2.jpg"></a>
		</div>
		
			
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">	
						<c:if test="${whologin==1}">
						<li class="dropdown-toggle"><a href="" class="dropdown-toggle" data-toggle="dropdown"><font size="6">회원 정보 <b class="caret"></b></font></a>
					    <ul class="dropdown-menu">
						<li><a class="allList" href="<%=MyCtrlCommand1%>bookingList">예매정보 확인</a></li>
						<li><a class="allList" href="<%=MyCtrlCommand1%>pdrMemberUpdateForm&id=<%=loginfo.getId()%>">회원정보 수정</a></li>
						<li><a class="allList" href="<%=MyCtrlCommand1%>pdrMemberDeleteForm">회원정보 탈퇴</a></li>
						</c:if>
						<c:if test="${whologin==2}">
						<li class="dropdown-toggle"><a href="" class="dropdown-toggle" data-toggle="dropdown"><font size="6">회원 정보 <b class="caret"></b></font></a>
					    <ul class="dropdown-menu">
						<li><a class="allList" href="<%=MyCtrlCommand1%>bookingList">예매정보 확인</a></li>
						<li><a class="allList" href="<%=MyCtrlCommand1%>pdrMemberList">전체 회원정보</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
			<c:if test="${whologin!=0}">
			<ul class="nav navbar-nav" style="padding-top: 10px;">
					<li class="navbar">
						<a href="#" class="dropdown-toggle">
							<font color='white'>
								
									안녕하세요 <font color="#ffffb3"><b>${sessionScope.loginfo.name}(${sessionScope.loginfo.id})</b></font> 님 
								
							</font>
						</a>
					</li>
			</ul>
			</c:if>
			<ul class="nav navbar-nav">
				<li class="navbar" style="height: 82px;">
					<form role="form" action="<%=MyCtrlByForm1%>" method="post" style="padding-top: 30px;">
					<input type="hidden" name="command" value="pdrLogin">
						<!-- <ul> -->
						<li class="navbar">
  						<div class="row" >
  							<c:if test="${whologin==0 }">
  							<div class="col-sm-1" align="right" style="padding-top: 5px;"><label for="id" ><font color="white" >ID :  </font></label></div>
  							<div class="col-xs-3"><input type="text" class="form-control input-sm" id="id" name="id" value="Aasd1212"></div>
  							<div class="col-sm-2"  align="right" style="padding-top: 5px;"><label for="password"><font color="white">Password: </font></label></div>
  							<div class="col-xs-3"><input type="password" class="form-control input-sm" id="password" name="password" value="1234"></div>
  							</c:if>
  							<div class="col-sm-3" style=" padding-top: 5px;">
  								<div class="btn-group-xs">
  									<c:if test="${whologin==0}">
  									<button type="submit" class="btn btn-nav"><b>로그인</b></button>
  									</c:if>
  									<c:if test="${whologin!=0}">
  									<button type="button" class="btn btn-nav"  onclick="logout()"><b>로그아웃</b></button>
  									</c:if>
  									<c:if test="${whologin==0}">
 									<button type="button" class="btn btn-nav" onclick="insert()"><b>회원가입</b></button>
 									</c:if>
 								</div>
 							</div>
						</div>
    						
   							
   							
  						</li>
  						<!-- <li> -->
  						</li>
 						</ul>
 						
					</form>

				</li>
			
			</ul>
			
			<%-- <ul class="nav navbar-nav navbar-right">
				<li class="navbar-toggle"><a href="" class="dropdown-toggle" data-toggle="dropdown">로그인 </a>
					<ul class="dropdown-menu">
						<li><%@ include file="./Login.jsp"%></li>
					</ul>
				</li>
			</ul> --%>
			
			
			
			
			<%-- <ul class="nav navbar-nav navbar-right">
				<li class="navbar-toggle"><a href="<%=MyCtrlCommand%>main.jsp">회원 가입</a></li>
			</ul> --%>
			
			
			
		</div>			
		
	</div>

	</nav>
	
	<c:if test="${not empty requestScope.errmsg }">
		<script type="text/javascript">
			alert('${requestScope.errmsg}');
		</script>
	</c:if>


</body>
</html>