
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@page import="java.text.DecimalFormat"%>
<%
  		StringBuffer geturlGro = request.getRequestURL();
		
  	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>

<meta charset="UTF-8">

<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="./view/css/button1.css"><!-- button css -->


<title>Insert title here</title>

<script type="text/javascript">

	
	
	function busw1(){
		var img1 = document.getElementById('b1');
		img1.src = img.src.replace('oneWayOff', 'oneWayOn');
		
		
				
		
	}	
	
	function gotoGro1(){
		document.getElementById('b1').className += ' on';
		
		location.href="<%=geturlGro.substring(0, 33)%>main.jsp?menu1=2&menu2=1";
	}
	function gotoGro2(){
		
		location.href="<%=geturlGro.substring(0, 33)%>main.jsp?menu1=2&menu2=2";
	}


</script>
<style type="text/css">
	#c1{
    
    margin-right: 0px;
    width: 430px;
    margin-left: 0px;
    background-color: rgba(255, 255, 255, 0.5);
    
    border-top-right-radius:0px;
    border-top-right-radius:20px;
    border-bottom-left-radius:20px;
    border-bottom-right-radius:20px;
	}
	
	#cn-c1{
	width: 430px;
	}
	#nn-t1{
	
	margin-top: 5px;border-bottom-width: 0px;
	}
	#hr1{
	margin-top: -10; 
	margin-bottom: 0px; 
	margin-top: 0px;
	
	border-top-color: #EEEEEE;
	}
</style>
</head>
<body>
	
	

 	<div class="container" id="c1">
	<div class="collapse navbar-collapse" id="cn-c1">
  		<ul class="nav nav-tabs" id="nn-t1">
  		
  		<img alt="??!" src="<%=geturlGro.substring(0, 33)%>view/booking/section_select.jpg"><br>
		<label>국제선</label><br>
  		<input class="mw-ui-button" type="button" onclick="gotoGro1()" id="b1" value="편도">
		<input class="mw-ui-button" type="button" onclick="gotoGro2()" id="b2" value="왕복">
  	
		<!-- <input type="image" src="./oneWayOn.jpg" onclick="busw1()" id="b1">
		<input type="image" src="./twoWayOff.jpg" onclick="busw1()" id="b2"> -->
		<hr size="5" noshade id="hr1">
		<%-- <a href="<%=geturl%>?menu=1">편도</a>
		<a href="<%=geturl%>?menu=2">왕복</a> --%>
		
	<%
		String menuGro = request.getParameter("menu2");

		if(menuGro != null) {
			if(menuGro.equals("1")) {
	%>
				<%@ include file="bookingFormOnewayGrobal.jsp"%>
	<%
			} else if(menuGro.equals("2")) {
	%>
				<%@ include file="bookingFormTwowayGrobal.jsp"%>
	<%
			}
		}
	%>
		</ul>
		</div>
		
		
	</div>
        

</body>
</html>