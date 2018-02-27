<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Login</title>
	<link rel="icon" type="image/png" href="resources/images/favicon.png">
</head>
<body class="baseContainer">
<div id="wrapper">
<%@include file="mainheader.jsp" %>
<style>
.red{
	font-size: 16px;
	color: red;
    margin-left:166px;
}
</style>
<div id="content">
	<ul class="header_pane">
		<a href="login"><li class="back_button"></li></a>
		<li class="page_name_text">Enter email </li>
	</ul>
	<div class="input_form">

		<form id="forgot" action="/epam/forgot" method="POST" name="f" onsubmit="func1()">
	
			<label class="form_text">Email:</label>
				<input type="text" id="emailId" name="emailId" class="form_input_box">
			<label class="form_text">Provider / Customer:</label>
				<input type="text" id="providerName" name="providerName" class="form_input_box">
			<input class="submit_button" type="submit">
		</form>
	 <c:choose>
	  <c:when test="${test == 0}">
	  <p class="red"><c:out value="${message}"/><p>
	  </c:when>
	</c:choose>
		
	</div>
</div>
<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
</div>
</body>

</html>
