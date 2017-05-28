
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
	int myoffsetBF = 1 ;
	int mywidthBF = 5 * myoffsetBF;
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
	function checkboxCre(seatQty){
		var myf = document.getElementById("myform");
		
		var a = new Array();
		
		var pos = "position:absolute;top:";
		var top = 160;
		var left = 300;
		
		/* var seatQty = 43 */
		var sqr = seatQty / 5;
				
		var j = 0;
		for (var i = 1; i <= seatQty; i++) {
			a[i] = document.createElement("input");
			val = i-(5*j);
			switch(val){
			case 1:
				a[i].value=j+1+"A";
				break;
			case 2:
				a[i].value=j+1+"B";
				break;
			case 3:
				a[i].value=j+1+"C";
				break;
			case 4:
				a[i].value=j+1+"D";
				break;
			case 5:
				a[i].value=j+1+"E";
				break;
			}
			/* a[i].value=i; */
			a[i].name="seat";
			a[i].type="checkbox";
			a[i].onclick=function(){
				var str = "";
				  for (var k = 0; k < myform.seat.length; k++) {
					if(myform.seat[k].checked){
						str = str+myform.seat[k].value+",";
						
					}
				}
				  str=str.substring(0,str.length-1);
				  document.getElementById("seatlist1").value=str;
	   
			}
			myf.appendChild(a[i]);
			
			
			//style 적용 부분
			
			if(i%5==0){
				j++;
			}
		}
		var i = 1;
		for (var j = 0; j < sqr; j++) {
			for (var k = 0; k < 5; k++) {
				a[i].style.position="absolute";
				a[i].style.left=(left+(30*j))+"px";
				a[i].style.top=(top+(30*k))+"px";
				i++
				}
			
			}
			
		}
	
	
	  
/*     function selectValue(){
        
        var requestValue = document.getElementById("Name").value;                   // 전송 파라미터 값
        var theURL = "/servlet/servlet.ExampleCloseUrl?requestValue="+requestValue; // 전송 URL
  // 호출 한 부모 페이지에서 URL 호출
        opener.window.location = url;
        // 호출 한 뒤 현재 팝업 창 닫기 이벤트
        close();
} */

	  
	    function gogo1(){
		   
	    	<%-- var seats = document.getElementById("seatlist1").value;
	    	
		    window.opener.window.location.href = "<%=contextPathBF%>/view/booking/bookingForm2.jsp?seat="+seats;
		   
		   window.close(); --%>
		  
		   
		   opener.myform.seatlist.value = document.myform.seatlist1.value;
			self.close();
}
	

</script>
<style type="text/css">

	#bu1{
		position: absolute;
		
   		top: 120px;
    	left: 300px;
		
	}
	
	#sub1{
		position: absolute;
		top: 320px;
    	left: 300px;
		
		
	}
	#seatlist1{
		position: absolute;
		top: 320px;
    	left: 120px;

	}
	#clo{
		position: absolute;
		
    top: 350px;
    left: 300px;


	}

</style>
</head>
<body>
 		
 		<img alt="비행기 사진^^" src="<%=contextPathBF%>/image/seatLocation.jpg">
 		<form name="myform" id="myform" action="<%=CommandNameBF%>/view/booking/bookingForm2.jsp" method="post">
 		<input type="hidden" name="bu">
 		<input type="button" id="bu1" value="좌석 보여줘" onclick="checkboxCre(40)">
 		<input id="sub1" type="button" value="확인" onclick="gogo1()">
		<input id="seatlist1">
 		<input type="button" id="clo" value="취소" onclick="window.close()">
 		</form>
 		
 		
 		        
        

</body>
</html>