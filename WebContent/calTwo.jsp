<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./common/js/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="./templates/default/js/ui.datepicker/css/smoothness/jquery-ui-1.7.2.custom.css">
<script type="text/javascript" src="./templates/default/js/ui.datepicker/jquery-ui-1.8.16.custom.min.js"></script>
<script src="./templates/default/js/kr.validate.js" language="javascript" type="text/javascript"></script>
<script src="./templates/default/js/formValidate.js" language="javascript" type="text/javascript"></script>

<link type="text/css" rel="stylesheet" href="./view/css/button1.css">
<!-- button css -->

<script type="text/javascript">
$(function(e){
		$('#btnSave').click(function() {
		});

		$("#startTerm").datepicker({
			dateFormat:'yy-mm-dd'
			,showOn:'both'
		});

		$("#endTerm").datepicker({
			dateFormat:'yy-mm-dd'
			,showOn:'both'
		});
      

 } );
</script>
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
</head>
<body>
<input type="label" class="it validate-req opera" style="margin-left: 15px; height: 32px; width: 142px;" name="startTerm" id="startTerm" value="" />
<input type="babep" class="it validate-req opera" style="margin-left: 15px; height: 32px; width: 142px;" name="endTerm" id="endTerm" value="" />
</body>
</html>