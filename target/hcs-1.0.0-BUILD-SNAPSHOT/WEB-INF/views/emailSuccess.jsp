<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
<link rel="icon" type="image/png" href="resources/images/favicon.png">
<style type="text/css">
.contentBox
{
  width: 900px;
  margin-left: 50px;
  margin-right: 50px;
  margin-top: 50px;
  height: 600px;
  float: left;
  overflow: scroll;
  padding: 10px 0px 0px 10px;
  
}
.contentHeading
{
  font-weight: bold;
  font-size: 15px;
}
.control-label
{
	font-size: 10px;
	color: red;
	float: right;
	width: 190px;
}
.green{
font-size: 16px;
color: #238f23;
}
</style>

</head>

<body class="baseContainer">

<div id="wrapper">
<%@include file="mainheader.jsp" %>

<div id="content">


	<center class="green">Password successfully changed! Check your email for the new password.</center>

</div>
<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
</div>

</body>