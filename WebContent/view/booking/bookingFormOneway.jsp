
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@page import="java.text.DecimalFormat"%>
	<%
	String patternBF = "###,###";
	DecimalFormat BF = new DecimalFormat(patternBF);
	int twelveBF = 12; //그리드 시스템의 숫자 값
	%>
    <%
	int myoffsetBF = 0 ;
	int mywidthBF = 12;
	int formleftBF = 2 ;
	int formrightBF = 9 - formleftBF ; //값 입력창 크기 변경
	%>
	
	
	<%
	String contextPathBF = request.getContextPath(); //현재 진행 중인 프로젝트 이름 
	String CommandNameBF = "/BookingCtrl"; //요청을 위한 url 패턴 이름
	String MyCtrlByFormBF = contextPathBF + CommandNameBF; //폼이 있는 경우에 사용된다. 
	String MyCtrlCommandBF = contextPathBF + CommandNameBF + "?command=";
	//out.print( MyCtrlCommand + "<br>" ); // Model2/MiniShopCtrl?command=
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width: 500px;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <script src="./common/js/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="./templates/default/js/ui.datepicker/css/smoothness/jquery-ui-1.7.2.custom.css">
<script type="text/javascript" src="./templates/default/js/ui.datepicker/jquery-ui-1.8.16.custom.min.js"></script>
<script src="./templates/default/js/kr.validate.js" language="javascript" type="text/javascript"></script>
<script src="./templates/default/js/formValidate.js" language="javascript" type="text/javascript"></script>
<script type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="./view/css/button1.css"><!-- button css -->

<style type="text/css">

.opera { 

border : 1px solid #69A6E4; 

color : #505050; 

font-size : 15px; 

font-weight : bold; 

background-color : #e9e9e9; 

} 

.opera-hover { 

border-color: #69A6E4; color: #505050; 

} 

.opera .current { 

background-color: #808080 !important; 

color: #fff !important; 

} 

.opera .menu { border: 1px solid #494949; } 





</style>
</script>
</head>
<body>
 			

			<div class="panel-body sub_container">
				<form id="myform" name="myform" class="form-horizontal" action="<%=MyCtrlByFormBF%>" method="post">
					<input type="hidden" name="command" value="#">
					
					<div class="form-group">
	        			<div class="col-xs-<%=formrightBF-3%> col-lg-<%=formrightBF-3%>">
	            			<select class="opera" name="section1-1" id="section1-1" style=" width: 352px; height: 32px;">
								<option value="인천" selected="selected">인천
								<option value="김해">김해
								<option value="제주">제주
							</select>
	        			</div>
	        		</div>
	        		
	        		<div class="form-group">
	        		<div class="col-xs-<%=formrightBF-3%> col-lg-<%=formrightBF-3%>">
	            			<select class="opera" name="section1-2" id="section1-2" style=" width: 352px; height: 32px;">
								<option value="도쿄" selected="selected">도쿄
								<option value="베이징">베이징
								<option value="마닐라">마닐라
							</select>
	        			</div>
	        		</div>
	        		
	        		<div class="form-group">
	        			<%@ include file="./calOne.jsp"%>
	        		</div>
					
					<div class="form-group">
	        		<div class="col-xs-<%=formrightBF-3%> col-lg-<%=formrightBF-3%>">
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
						<div class="col-xs-<%=twelveBF%> col-lg-<%=twelveBF%>" align="center">
							<button type="submit" class="btn btn-default"><b>다음 페이지</b></button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-default">초기화</button>
						</div>
					</div>
				</form>
			</div>

</body>
</html>