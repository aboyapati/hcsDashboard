
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="link.jsp" %>

	<title>On-demand Monitoring</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/reserveLab.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/lablist.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/labs.css"/>"/>
	
	<script src="<c:url value='/resources/js/metro/jquery.multi-open-accordion-1.5.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>

	<style type="text/css">
		
	 	select option{
	 		width :150px
	 	}
 		.displayVirtualLab td{
 			line-height: 36px;
 		}
 		.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
			 background-color: #E3E9F0;
		}
		
		.displayVirtualLab .scrollableContainer {
			height: 580px !important;
		}
		
		.displayVirtualLab .scrollArea {
		 	height: 540px !important;
		}
		
		#myReservations {
			padding-top: 25px;
		}
		
		a .glyphicon{
			margin-left: 2px;
			margin-right: 2px;
			text-align: center;
			color: #7694b7 !important;
		}
		.glyphicon {
	 		font-size: large;
		}
		.info_pbx{
			list-style: none;
			height: 55px;
			margin-top: 0px;
			margin-bottom: 0px;
			
		}
		.editconnection{
		background-image: none !important;
		}	
				
	</style>
	
	<script type="text/javascript">

	$(document).ready(function(){
		
		var userRole = "${userRole}";
		
		$('.spinWheel').click(function () {
			
			$.blockUI({ 
				 
				 message: '<img src="resources/images/epam/loading.gif" />', 
				  css: { 
		            border: 'none', 
		            padding: '15px', 
		            backgroundColor: 'none', 
		            '-webkit-border-radius': '10px', 
		            '-moz-border-radius': '10px', 
		            opacity: .5, 
		            color: '#fff',
		            display:'block',
		           	
				  },
			}); 
		}); 
		angular.bootstrap(document.getElementById("appId"), ['lablist_App']);
	});
	
	function startVMMonitoring(){

		bootbox.confirm({
			 buttons: {
			  		 confirm: {
			    		label: 'YES',
		        	},
			        cancel: {
			            label: 'NO',
			        }
			    },
		    message: 'Are you sure want to start the Monitoring process?',
			callback: function(result) {
		    	if(result) {
	    		 	$.ajax({
						url : "admin/startOnDemandMonitoring",
						type : "POST",
			
						success : function(result) {
							if(result=="success"){
								bootbox.alert("On-Demand monitoring started successfully.",function(){window.location = "onDemandMonitoring";
								}).find("div.modal-content").addClass("modalsuccess");
							}
							else{
								bootbox.alert(result).find("div.modal-content").addClass("modalfailure");
							}
						},
						error : function(xhr, status, error) {
							if(error=="Not Found"){
								bootbox.alert("Session Expired..Please Login again..",function(){window.location = "login";
								}).find("div.modal-content").addClass("modalfailure");
							}
							else{
								bootbox.alert("Unknown Error occurred. Try again later").find("div.modal-content").addClass("modalfailure");
							}
						}
					}); 
		    	}
		    },
		}).find("div.modal-content").addClass("modalalert");
	}
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	
	<%@include file="header.jsp" %>
	<div id="content" style="margin-top: 20px;">
		<div style="height:40px;">
			<c:if test="${userRole=='ROLE_ADMIN'}">	
		  		<div style="width: 80%; float: right;">		  	
		  			<a class="add_OnDemandMonitor_icon" onclick="startVMMonitoring()">
		  			</a>		  	
		  		</div>
		  </c:if>
		</div>
	</div>
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>