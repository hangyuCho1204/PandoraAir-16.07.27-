
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  		StringBuffer geturl = request.getRequestURL();
  	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="width: 500px;">
<head>
<title>Insert title here</title>

<style type= "text/css" >
		#mytab{
			width:100px;
		}
         /* div {
               width: 100px ;
               height: 100px ;
               background-color : red ;
                position: absolute ; 
       }  */
        #mydiv {
               text-align :center ;
               line-height : 100px ;
               top: 100px ;
               left: 100px ;
               width: 300px ;
               height: 300px ;
               background-color : aqua ;
               border: 10px solid red ;
       }
        .test1 {
               text-align :center
              top : 20px;
               margin-left : -70px ;
               background-color : fuchsia ;
       }
        .test2 {
               top: 20px ;
               margin-left : 270px ;
               background-color : gray ;
       }
        .test3 {
               top: 180px ;
               margin-left : -70px ;
               background-color : maroon ;
       }
        .test4 {
               top: 180px ;
               margin-left : 270px ;
               background-color : purple ;
       }
</style>
 <script type="text/javascript">
	/* function test1(){
		var img = document.getElementById('test1');

		if(img.src.indexOf('localOff') == -1) {
			img.src = img.src.replace('localOn','localOff');
		} else {
			img.src = img.src.replace('localOff','localOn');
		}
	}
	
	function test2(){
		var img = document.getElementById('test2');
		
		if(img.src.indexOf('grobalOn') == -1) {
			img.src = img.src.replace('grobalOff', 'grobalOn');
		}else{
			img.src = img.src.replace('grobalOn', 'grobalOff');
		}
	}
	
	$("on_layer").click(function(e){
		showHide();
	});
	
	function ShowHide(){
		
	var div = document.all.hiddenDiv;
	
	if(div.style.visibility == "hidden"){
		
		div.style.visibility = "visible";
	}else{
		
		div.style.visibility = "hidden";
	}
} */
	
	
	function goto1(){
		
		location.href="<%=geturl%>?menu1=1&menu2=1";
	}
	function goto2(){
		location.href="<%=geturl%>?menu1=2&menu2=1";
	}
	
</script>
<style type="text/css">

    .mw-ui-button {
        font-family: inherit;
        font-size: 1em;
        display: inline-block;
        padding: .5em 1em;
        margin: 0;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-appearance: none;
        *display: inline;
        zoom: 1;
        background: #FFF;
        color: #555;
        border: 1px solid #CCC;
        border-radius: 2px;
        min-width: 4em;
        vertical-align: middle;
        text-align: center;
        font-weight: 700;
        cursor: pointer;
        -webkit-transition: background .1s ease-in-out, color .1s ease-in-out, box-shadow .1s ease-in-out;
        -moz-transition: background .1s ease-in-out, color .1s ease-in-out, box-shadow .1s ease-in-out;
        -o-transition: background .1s ease-in-out, color .1s ease-in-out, box-shadow .1s ease-in-out;
        transition: background .1s ease-in-out, color .1s ease-in-out, box-shadow .1s ease-in-out
    }
    
    .mw-ui-button:hover,
    .mw-ui-button:focus {
        box-shadow: 0 1px rgba(0, 0, 0, .1), inset 0 -3px rgba(0, 0, 0, .2);
        border-bottom-color: #ccc;
        outline: 0
    }
    
    .mw-ui-button:hover::-moz-focus-inner,
    .mw-ui-button:focus::-moz-focus-inner {
        border-color: transparent
    }
    
    .mw-ui-button:active,
    .mw-ui-button.mw-ui-checked {
        background: #ccc;
        box-shadow: none
    }
    
    .mw-ui-button:hover,
    .mw-ui-button:active,
    .mw-ui-button:visited {
        color: #555
    }
    
    .mw-ui-button:disabled {
        color: #CCC
    }
    
    .mw-ui-button:disabled:hover,
    .mw-ui-button:disabled:active {
        background: #FFF;
        box-shadow: none
    }
    
    .mw-ui-button:disabled {
        text-shadow: none;
        cursor: default
    }
    
    .mw-ui-button.mw-ui-block {
        display: block;
        width: 100%
    }
    
    .mw-ui-button.mw-ui-progressive,
    .mw-ui-button.mw-ui-primary {
        background: #347bff;
        color: #fff;
        border: 1px solid #347bff;
        text-shadow: 0 1px rgba(0, 0, 0, .1)
    }
    
    .mw-ui-button.mw-ui-progressive:hover,
    .mw-ui-button.mw-ui-progressive:focus,
    .mw-ui-button.mw-ui-primary:hover,
    .mw-ui-button.mw-ui-primary:focus {
        box-shadow: 0 1px rgba(0, 0, 0, .1), inset 0 -3px rgba(0, 0, 0, .2);
        border-bottom-color: #2a62cc;
        outline: 0
    }
    
    .mw-ui-button.mw-ui-progressive:hover::-moz-focus-inner,
    .mw-ui-button.mw-ui-progressive:focus::-moz-focus-inner,
    .mw-ui-button.mw-ui-primary:hover::-moz-focus-inner,
    .mw-ui-button.mw-ui-primary:focus::-moz-focus-inner {
        border-color: transparent
    }
    
    .mw-ui-button.mw-ui-progressive:active,
    .mw-ui-button.mw-ui-progressive.mw-ui-checked,
    .mw-ui-button.mw-ui-primary:active,
    .mw-ui-button.mw-ui-primary.mw-ui-checked {
        background: #2a62cc;
        box-shadow: none
    }
    
    .mw-ui-button.mw-ui-progressive:disabled,
    .mw-ui-button.mw-ui-primary:disabled {
        background: #DDD;
        border-color: #DDD
    }
    
    .mw-ui-button.mw-ui-progressive:disabled:hover,
    .mw-ui-button.mw-ui-progressive:disabled:active,
    .mw-ui-button.mw-ui-progressive:disabled.mw-ui-checked,
    .mw-ui-button.mw-ui-primary:disabled:hover,
    .mw-ui-button.mw-ui-primary:disabled:active,
    .mw-ui-button.mw-ui-primary:disabled.mw-ui-checked {
        box-shadow: none
    }

    .mw-ui-button.mw-ui-constructive {
        background: #00af89;
        color: #fff;
        border: 1px solid #00af89;
        text-shadow: 0 1px rgba(0, 0, 0, .1)
    }
    
    .mw-ui-button.mw-ui-constructive:hover,
    .mw-ui-button.mw-ui-constructive:focus {
        box-shadow: 0 1px rgba(0, 0, 0, .1), inset 0 -3px rgba(0, 0, 0, .2);
        border-bottom-color: #008c6e;
        outline: 0
    }
    
    .mw-ui-button.mw-ui-constructive:hover::-moz-focus-inner,
    .mw-ui-button.mw-ui-constructive:focus::-moz-focus-inner {
        border-color: transparent
    }
    
    .mw-ui-button.mw-ui-constructive:active,
    .mw-ui-button.mw-ui-constructive.mw-ui-checked {
        background: #008c6e;
        box-shadow: none
    }
    
    .mw-ui-button.mw-ui-constructive:disabled {
        background: #DDD;
        border-color: #DDD
    }
    
    .mw-ui-button.mw-ui-constructive:disabled:hover,
    .mw-ui-button.mw-ui-constructive:disabled:active,
    .mw-ui-button.mw-ui-constructive:disabled.mw-ui-checked {
        box-shadow: none
    }
    
    .mw-ui-button.mw-ui-destructive {
        background: #d11d13;
        color: #fff;
        border: 1px solid #d11d13;
        text-shadow: 0 1px rgba(0, 0, 0, .1)
    }
    
    .mw-ui-button.mw-ui-destructive:hover,
    .mw-ui-button.mw-ui-destructive:focus {
        box-shadow: 0 1px rgba(0, 0, 0, .1), inset 0 -3px rgba(0, 0, 0, .2);
        border-bottom-color: #a7170f;
        outline: 0
    }
    
    .mw-ui-button.mw-ui-destructive:hover::-moz-focus-inner,
    .mw-ui-button.mw-ui-destructive:focus::-moz-focus-inner {
        border-color: transparent
    }
    
    .mw-ui-button.mw-ui-destructive:active,
    .mw-ui-button.mw-ui-destructive.mw-ui-checked {
        background: #a7170f;
        box-shadow: none
    }
    
    .mw-ui-button.mw-ui-destructive:disabled {
        background: #DDD;
        border-color: #DDD
    }
    
    .mw-ui-button.mw-ui-destructive:disabled:hover,
    .mw-ui-button.mw-ui-destructive:disabled:active,
    .mw-ui-button.mw-ui-destructive:disabled.mw-ui-checked {
        box-shadow: none
    }
    
    a.mw-ui-button {
        text-decoration: none
    }
    
    a.mw-ui-button:hover,
    a.mw-ui-button:focus {
        text-decoration: none
    }
    
    .on{
    background-color: #cccccc;
    
    }
	

</style>
</head>
<body>  
   <div >
   <div  style=" width: 430px;">
  		<ul  style=" margin-top: 5px;">
  		<input class="mw-ui-button" type="button" onclick="goto1()" id="b1" value="국내선" style="">
		<input class="mw-ui-button" type="button" onclick="goto2()" id="b2" value="국제선">
		
		
	<%
		String menu1 = request.getParameter("menu1");

		if(menu1 != null) {
			if(menu1.equals("1")) {
	%>
				<%@ include file="bookingFormLocal.jsp"%>
	<%
			} else if(menu1.equals("2")) {
	%>
				<%@ include file="bookingFormGrobal.jsp"%>
	<%
			}
		}
	%>
	</ul>
	</div>
	</div>
</body>
</html>