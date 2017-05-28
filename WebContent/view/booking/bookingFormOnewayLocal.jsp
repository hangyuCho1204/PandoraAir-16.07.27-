
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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

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

#submit1{
	
    margin-right: 50px;
	
}



</style>
<script type="text/javascript">

	   function vil1(){
		var sec1 = document.getElementById('section1-1');
		var sec2 = document.getElementById('section1-2');
	 		
		if(sec1.value != null){ //section1-1에 값이 들어 있다면
			
			
			for(var i=0; i<sec1.length; i++){ //sec1에 항목이 3개지라면 3번 반복함
			 
				if(sec1.value != sec1.options[i].value){ //sec1에 선택된 값을 제외하고
					
					
						sec2.options[0] = new Option(sec1.options.item(i).value, sec1.options.item(i).value); 
					}
			
				}
		
			}
		}
	 
	   
	   function vil2()  //학년을 바꾸어주는 함수입니다.
	   {
	    var obj = document.getElementById('section1-2');  //Select 객체
	    while(obj.length)  //항목들이 0이 될때까지
	    obj.options.remove(0);  //지웁니다.
	   	};
	   
	 /*   function setTarget(obj)  //이 함수는 onChange 이벤트가 발생할때 호출됩니다.
	   {
	    var index = obj.selectedIndex;  //현재 선택된 옵션 인덱스값이져...
	    var number;
	    
	    switch(index)  //선택된 값에 따라 대학생은 4, 등으로 변경해야 할 학년을 결정합니다.
	    {
	     case 0:
	      number = 2;
	      break;
	     case 1:
	      number = 2;
	      break;
	     case 2:
	      number = 2;
	      break;
	    }
	    
	    myform.setSection1-1(number);  //target은 iframe의 이름이져.. 즉 iframe의 setGrade()를 호출합니다.
	   }
	    
	   function setSection1-1(grade)  //학년을 바꾸어주는 함수입니다.
	   {
	    var obj = document.all.grade;  //Select 객체
	    while(obj.length)  //항목들이 0이 될때까지
	     obj.options.remove(0);  //지웁니다.
	    
	    for(var i = 0; i < grade; i++)  //주어진 학년 크기에 따라
	    {
	     opt = document.createElement("option");  //option태그를 생성하고
	     obj.options.add(opt);  //셀렉트박스에 추가합니다.
	     opt.innerText = i + 1 + "학년";  //보여지는 텍스를 설정합니다.
	    }
	   } */
		 /* sec2.options[i] = new Option(sec1.options.item(i).value, sec1.options.item(i).value)
		 document.getElementById('section1-2').options[0] = new Option(document.getElementById('section1-1').options.item(0).value, document.getElementById('section1-1').options.item(0).value) */
	
	/* var option = new Option("INNERHTML","VALUE"); */
	
	/* var options = $("#section1-1 option");
	
	$(":select").click(function(e){
	    $("#section1-1 option").remove();
	    if($(this).attr("value") == "인천")
	        $("#section1-1").append(options[1]).append(options[2]);
	    if($(this).attr("value") == "김해")
	        $("#section1-1").append(options[0]).append(options[2]);
	});  */
	
	/* function citycode(){
		var sec1 = document.getElementById('section1-1');
		var sec2 = document.getElementById('section1-2');
		
		var ccode = document.getElementById('citycode').value = sec1.value+'_'+sec2.value;
		
		return ccode;
	} */
	
</script>
</head>
<body>
			<div class="panel-body sub_container">
				<form id="myform" name="myform" class="form-horizontal" action="<%=MyCtrlByFormBF%>" method="post">
					<input type="hidden" name="command" value="pdrBookingForm1">
					
					<div class="form-group">
					<input type="hidden" id="citycode" value="asdf">
	        			<div class="col-xs-<%=formrightBF-3%> col-lg-<%=formrightBF-3%>">
	            			<select class="opera" name="section1-1" id="section1-1" style=" width: 352px; height: 32px;" onclick="vil1()" onmousedown="vil2()">
								<option value="ICN">인천
								<option value="KIM">김해
								<option value="JEJ">제주
								
							</select>
	        			</div>
	        		</div>
	        		
	        		<div class="form-group">
	        		
	        		<div class="col-xs-<%=formrightBF-3%> col-lg-<%=formrightBF-3%>">
	            			<select class="opera" name="section1-2" id="section1-2" style=" width: 352px; height: 32px;">
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
						<div class="col-xs-<%=twelveBF%> col-lg-<%=twelveBF%>" align="right">
							<button type="submit" class="btn btn-default" id="submit1"><b>조회 하기</b></button>
						</div>
					</div>
					

					
				</form>
			</div>
	
        
        

        
        
        
        

</body>
</html>