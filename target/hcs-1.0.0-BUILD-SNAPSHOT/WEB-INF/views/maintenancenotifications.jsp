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

	<title>System Maintenance</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/reserveLab.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/lablist.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/labs.css"/>"/>
	
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery.timepicker.min.css"/>"/>
	
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
		angular.bootstrap(document.getElementById("appId"), ['lablist_App']);
		
		 $("#maintenancenotifications_create_modal #expected_start_date").datepicker({
				minDate: 0,
		        dateFormat: 'mm/dd/yy',
		        numberOfMonths: [1, 2],
		        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		       	showOn: "button",
		   		buttonImage: "/epam/resources/images/reservelab_product/calendar_icon.png",
		   		buttonText:"StartDate",
	   			buttonImageOnly: true,
	   			onSelect: function( selectedDate ) {
	   				var daily = 0;

					$( "#maintenancenotifications_create_modal #expected_end_date" ).datepicker( "option", "minDate", selectedDate );
	   		}
		 }); 
		
		 $("#maintenancenotifications_create_modal #expected_end_date").datepicker({
			 	dateFormat: 'mm/dd/yy',
		        numberOfMonths: [1, 2],
		        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		       	showOn: "button",
		   		buttonImage: "/epam/resources/images/reservelab_product/calendar_icon.png",
		   		buttonText:"EndDate",
	  			buttonImageOnly: true,
	  			onSelect: function( selectedDate ) {
					//$( "#endDate" ).datepicker( "option", "minDate", selectedDate );
	  		}
		 }); 
		
		 $("#maintenancenotifications_create_modal #expected_start_time").timepicker({ 'step': 15 });
		 
		 $("#maintenancenotifications_create_modal #expected_end_time").timepicker({ 'step': 15 });
		 
/* 		 $("#maintenancenotifications_edit_modal #edit_expected_start_date").datepicker({
				minDate: 0,
		        dateFormat: 'mm/dd/yy',
		        numberOfMonths: [1, 2],
		        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		       	showOn: "button",
		   		buttonImage: "/epam/resources/images/reservelab_product/calendar_icon.png",
		   		buttonText:"StartDate",
	   			buttonImageOnly: true,
	   			onSelect: function( selectedDate ) {
	   				var daily = 0;

					$( "#provider_view_modal #edit_expected_end_date" ).datepicker( "option", "minDate", selectedDate );
	   		}
		 }); 
		
		 $("#maintenancenotifications_edit_modal #edit_expected_end_date").datepicker({
			 	dateFormat: 'mm/dd/yy',
		        numberOfMonths: [1, 2],
		        dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		       	showOn: "button",
		   		buttonImage: "/epam/resources/images/reservelab_product/calendar_icon.png",
		   		buttonText:"EndDate",
	  			buttonImageOnly: true,
	  			onSelect: function( selectedDate ) {
					//$( "#endDate" ).datepicker( "option", "minDate", selectedDate );
	  		}
		 }); 
		
		 $("#maintenancenotifications_edit_modal #edit_expected_start_time").timepicker({ 'step': 15 });
		 
		 $("#maintenancenotifications_edit_modal #edit_expected_end_time").timepicker({ 'step': 15 }); */		 
		 		 
		 $(document).on("mouseenter" ,".vlab_inner_table_body tbody tr .lab_scheduleDates_td",function (e) {
				$('.lab_info_hover .vendor_hover').text("StartDate - "+$(this).closest('tr').children('.scheduleStartDate').text()+$(this).closest('tr').children('.timezone').text());
				$('.lab_info_hover .equip_hover').text("EndDate - "+$(this).closest('tr').children('.scheduleEndDate').text()+$(this).closest('tr').children('.timezone').text());
				$('.lab_info_hover').css('top', e.pageY -$(document).scrollTop() +5 +'px').css('left', e.pageX -$(document).scrollLeft() +60 +'px').show();
			}).on("mouseleave" ,".vlab_inner_table_body tbody tr .lab_scheduleDates_td",function () {
				$('.lab_info_hover').hide();
			});
		 
	});
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	
	<%@include file="header.jsp" %>
	
	
	
	<div id="content" style="margin-top: 33px;">

		  <ul class="table_tabs" style="margin-left: -7px; margin-top: 11px;">		
				
				<li class="table_tab_unselected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66" class="table_tab_data" href="licensing">
			  			<b>Licensing</b>
					</a>
				</li>
				<li class="table_tab_unselected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66" class="table_tab_data" href="packages">
			  			<b>Packages</b>
					</a>
				</li>
				<li class="table_tab_unselected"><a style="text-decoration: none;font-weight: normal;color:#203c66"
					class="table_tab_data" href="document"><b>Documents</b></a>
				</li>
				<li class="table_tab_selected"><a style="text-decoration: none;font-weight: normal;color:#203c66"
					class="table_tab_data" href="maintenancenotifications"><b>Schedule Maintenance</b></a>
				</li>	
				<li class="table_tab_unselected" ><a style="text-decoration: none;font-weight: normal;color:#203c66"
					class="table_tab_data" href="onPOINTLinkBuild"><b>OnPOINTLinkBuilds</b></a>
				</li>								
				
		  </ul>
	
		<div class="outline_border outline_border_fourTabs" style=" margin-top:-4px;">
	    		<c:if test="${userRole == 'ROLE_ADMIN'}">
			  		<ul class="inter_createButton">
				 		 <a data-target="#maintenancenotifications_create_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false"><li class="add_Maintenance_icon" style="width: 170px; margin-right: 10px"></li></a>
			 		</ul>			
			  	</c:if>
				<%@include file="maintenancenotifications_list.jsp" %>
		  </div>
	</div>
	
	
	<div class="modal fade" id="maintenancenotifications_create_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height: 370px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			  <%@include file="maintenancenotifications_add.jsp" %>
			</div>
		  </div>
		</div>
	</div>

	<div class="modal fade" id="maintenancenotifications_edit_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height: 400px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			 	 <%@include file="maintenancenotifications_edit.jsp" %>
			</div>
		  </div>
 	 </div>
  </div>
  <div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>