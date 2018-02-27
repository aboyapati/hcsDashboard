<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>onPoint</title>
	<link rel="icon" type="image/png" href="resources/images/favicon.png">
</head>
<body class="baseContainer">

<div id="wrapper">
<%@include file="mainheader.jsp" %>

<div id="content">
<div class="tek_heading">
<!-- Ticket:36006
Desc: Title welcome page should be tekVizion instead of tekVizion Labs
Fixed: update text on the page
Author: Lei Song -->
	Welcome to
	<text style="font-family: 'Open Sans', sans-serif;color:red;font-size:33px">on</text>
	<text style="font-family: 'Open Sans', sans-serif;color:black;font-size:40px;margin-left:-5px;">POINT
		<text style="font-size:14px;position:absolute;color:rgb(111,111,111)">TM</text>
	</text>
	<div class="tek_intro">
	tekVizion's onPOINT is an automation platform to test endpoints in a business communications network.
	Beyond just monitoring the health of the endpoints, 
	onPOINT can automatically run test scripts to ensure functions such as 3 way calling, 
	call transfer, call hold and retrieve and so many other critical features are working.	
	<br/><br/>
	tekVizion can provide test scripts based on our many years of experience, 
	or provide a customized test plan that meets a provider's unique needs. 
	Tests can be pre-scheduled or ran on demand. In addition to testing, 
	onPOINT can provide continuous phone state and performance monitoring. 
	With consolidated reporting, an intuitive user interface and comprehensive dashboard, 
	onPOINT is also an ideal tool for providing fast identification and resolution of problems.
	<br/><br/>
	Whether using onPOINT to test all endpoints before deploying a new customer or rolling out upgrades, 
	or using it as  a means to continuously test the health of all endpoints within a mission critical network,
	we are confident onPOINT will improve the quality of your deployments, increase customer satisfaction and provide you a great return on investment.
</div>

</div>
<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>

</div>

</body>
</html>