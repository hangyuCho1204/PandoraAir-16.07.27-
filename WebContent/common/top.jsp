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
	String contextPath = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandName = "/BookingCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByForm = contextPath + CommandName; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommand = contextPath + CommandName + "?command=";
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
	String uploadedFolder = myurl.substring(0, idx) + contextPath + uploadPath; //위의 3가지 변수를 가지고 짜집기.
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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">

			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Pandora Air</a>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<c:if test="${not empty sessionScope.loginfo}">
						<a href="<%=MyCtrlCommand%>meLogout"><span class="glyphicon glyphicon-log-in"> 로그 아웃 </span> </a>
					</c:if>
				</li>
			</ul>
		</div>

	</nav>
	
	<c:if test="${not empty requestScope.errmsg }">
		<script type="text/javascript">
			alert('${requestScope.errmsg}');
		</script>
	</c:if>


</body>
</html>