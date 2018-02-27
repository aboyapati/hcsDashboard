<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Login</title>
	<link rel="icon" type="image/png" href="resources/images/favicon.png">
	
	<style type="text/css">
		.login_disabled{
			pointer-events: none;
   			cursor: default;
		}
		.login_icon{
			color:rgb(162,162,162) !important;
		}
		.scroll {
			/*background: #000;*/
			color: red;
		    height: 30px;
		    padding: 169px;
		    width: 1185px;
		    padding-left: 40px;
		    float: left;
		}	
		.errorblock{
			float:left;
			width:250px;			
			color:#DA2128;
			font-size:15px;
		}	
	</style>

</head>
<body class="baseContainer">

<div id="wrapper">
<%@include file="mainheader.jsp" %>

<div id="content">
	<ul class="header_pane">
		<a href="home"><li class="back_button"></li></a>
		<li class="page_name_text">Log in</li>
	</ul>

	<div class="input_form">

		<form id="login" action="j_spring_security_check" method="POST" name="f" onsubmit="javascript:adddate()">

			<script type="text/javascript">
				function adddate() {
				$("#jdate").attr("value", new Date());
				}
			</script>
	
			<label class="form_text">Login ID:</label>
				<input type="text" id="j_username" name="j_username" class="form_input_box">
						
			<label class="form_text">Password:</label>
				<input type="password" id="j_password" name="j_password" class="form_input_box">
							
			<input class="login_button" type="submit">
		<!-- 	<a style="text-decoration: none;" href="changepassword" class="change_password">Change Password?</a> -->
			<!-- <a href="forgot" style="text-decoration: none;" class="change_password">Forgot Password?</a> -->
			<input id="jdate" type="hidden" name="jdate" value="" />
			<%
				Object param = request.getAttribute("loginError");
				if(param != null && param == "true"){
				%>
					<div class="errorblock">
						Invalid Username or Password
					</div>
				<%}
			%>
		</form>
	</div>
			<div id="scroll" class="scroll"> </div> 
</div>

<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>


</div>
</body>
<script>
function forgetPassword() {
	 document.getElementById('forgotPassword').style.display='block';
}

$(".login_button").on('click',function(){
	$("body").addClass("wait");
})

msg = "";
pos = 0;
/* $(document).ready(function(){
	$.ajax({
		url : "getAllMaintenanceNotifications",
		  data : data,  
		type : "GET",
		data : {
			notificationId  : "123456", 
		},
		success : function(maintenanceNotificationDetails) {							
			if(maintenanceNotificationDetails['status']=="availableToScroll"){
				msg = maintenanceNotificationDetails['data'] + msg;
			}

		},
		error : function(xhr, status, error) {
		}
	});
}); */
function ScrollMessage() {
	   var newtext = msg.substring(pos, msg.length) + msg.substring(0, pos);
	   var div = document.getElementById("scroll");
	   div.firstChild.nodeValue = newtext;
	   pos++;
	   if (pos > msg.length) pos = 0;
	   window.setTimeout(ScrollMessage,200);
}
ScrollMessage();

</script>
</html>
