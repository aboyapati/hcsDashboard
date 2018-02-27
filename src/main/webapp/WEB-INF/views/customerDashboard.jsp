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

	<title>Dashboard</title>

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
		

		
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
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
	
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	
	<%@include file="header.jsp" %>
	
	<div id="content" style="margin-top: 16px;">
	
	 <div class="project_pane">
			<table style="float: right;">
			  <tbody>
				<tr>
					 <td class="table_header">Provider </td>
					  <td>
						<div class="project_name">
							<p>${customer.provider.name}</p>
						</div>
						
					  </td>
					  <td class="table_header">Customer </td>
					  <td>
						<div class="project_name">
							<p>${customer.name}</p>
						</div>
						
					  </td>
				  </tr>			
			  </tbody>	
			</table>
			<a href="dashboard" class="back_button spinWheel"></a>
		  </div>

		<!-- Ticket: 350 -->
		<!-- Desc: Call state KPI header link leads to dashboard-->
		<!-- Fix: The URL of the hyper link is changed to point the current page-->
		<!-- Author: Knalla --> 
			
		  <ul class="table_tabs" style="margin-left: -7px; margin-top: 14px;">		
				<li class="table_tab_selected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66" class="table_tab_data" href="customerDashboard?customerId=${customer.id}">
			  			<b>KPI</b>
					</a>
				</li>
		  </ul>
	
		  <div class="outline_border outline_border_oneTab" style=" margin-top:-1px;">
	    		
				<%-- <%@include file="customer_KPIList.jsp" %> --%>
		  </div>
	</div>
	

	
	
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>