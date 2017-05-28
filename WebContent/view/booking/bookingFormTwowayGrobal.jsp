
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@page import="java.text.DecimalFormat"%>
	<%
	String patternBF2 = "###,###";
	DecimalFormat BF2 = new DecimalFormat(patternBF2);
	int twelveBF2 = 12; //그리드 시스템의 숫자 값
	%>
    <%
	int myoffsetBF2 = 1 ;
	int mywidthBF2 = 5 * myoffsetBF2;
	int formleftBF2 = 2 ;
	int formrightBF2 = 9 - formleftBF2 ; //값 입력창 크기 변경
	%>
	
	
	<%
	String contextPathBF2 = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandNameBF2 = "/BookingCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByFormBF2 = contextPathBF2 + CommandNameBF2; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommandBF2 = contextPathBF2 + CommandNameBF2 + "?command=";
	//out.print( MyCtrlCommand + "<br>" ); // Model2/MiniShopCtrl?command=
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<link type="text/css" rel="stylesheet" href="./view/css/button1.css"><!-- button css -->
<title>Insert title here</title>


</head>
<body>
 		


	<div class="panel-body sub_container">
				<form id="myform" name="myform" class="form-horizontal" action="<%=MyCtrlByFormBF2%>" method="post">
					<input type="hidden" name="command" value="#">
					
					<div class="form-group">
	        			<div class="col-xs-<%=formrightBF2-3%> col-lg-<%=formrightBF2-3%>">
	            			<select class="opera" name="section1-1" id="section1-1" style=" width: 352px; height: 32px;">
								<option value="도쿄">도쿄
								<option value="오사카">오사카
								<option value="타이페이">타이페이
								<option value="베이징">베이징
								<option value="마닐라">마닐라
							</select>
	        			</div>
	        		</div>
	        		
	        		<div class="form-group">
	        		<div class="col-xs-<%=formrightBF2-3%> col-lg-<%=formrightBF2-3%>">
	            			<select class="opera" name="section1-2" id="section1-2" style=" width: 352px; height: 32px;">
								<option value="오사카">오사카
								<option value="타이페이">타이페이
								<option value="베이징">베이징
								<option value="마닐라">마닐라
							</select>
	        			</div>
	        		</div>
	        		
	        		<div class="form-group">
	        			<%@ include file="./calTwo.jsp"%>
	        		</div>
					
					<div class="form-group">
	        		<div class="col-xs-<%=formrightBF2-3%> col-lg-<%=formrightBF2-3%>">
	            			<select class="opera" name="persons" id="persons" style="height: 32px;">
								<option value="-" selected="selected">-
								<option value="1인">1인
								<option value="2인">2인
								<option value="3인">3인
								<option value="4인">4인
								<option value="5인">5인
							</select>
	        			</div>
	        		</div>
				
					
					<div class="form-group">
						<div class="col-xs-<%=twelveBF2%> col-lg-<%=twelveBF2%>" align="center">
							<button type="submit" class="btn btn-default" onclick="return checkForm();"><b>다음 페이지</b></button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-default">초기화</button>
						</div>
					</div>
					

					
				</form>
			</div>
        
        

        
        
        
        

</body>
</html>