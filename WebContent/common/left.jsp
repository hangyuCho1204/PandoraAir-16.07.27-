<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandName = "/BookingCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByForm = contextPath + CommandName; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommand = contextPath + CommandName + "?command=";
	//out.print( MyCtrlCommand + "<br>" ); // Model2/MiniShopCtrl?command=
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.leftul{
	list-style : none;
	margin-top: 100px;
	margin-bottom: 100%;
}
.dropdown-toggle, .mpoint, .event{
	margin-top: 10px;
	margin-bottom: 10px;
	font: sans-serif;
	font-size: x-large;
}
</style>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse" style=" width: 192px; margin-top: 20px;">
		<ul class="leftul">
			<c:if test="${whologin==2 }">
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">관리 목록<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a class="allList" href="<%=MyCtrlCommand%>AirplaneList">비행기 목록</a></li>
					<li><a class="allList" href="<%=MyCtrlCommand%>CityList">도시 목록</a></li>
					<li><a class="allList" href="<%=MyCtrlCommand%>ScheduleList">스케줄 목록</a></li><!-- bookingList -->
				</ul>
			</li>
			</c:if>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">여행상품<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a class="allList" href="<%=MyCtrlCommand%>pdrCountryTour">국내 여행</a></li>
					<li><a class="allList" href="<%=MyCtrlCommand%>pdrAboardTour">해외 여행</a></li>
				</ul>
			</li>
			<c:if test="${whologin==1}">
			<li><a class="mpoint" href="<%=MyCtrlCommand%>pdrMpointUse">마일리지</a></li>
			</c:if>
			<li><a class="event" href="<%=MyCtrlCommand%>pdrEvent">이벤트</a></li>
		</ul>
	</nav>
</body>
</html>