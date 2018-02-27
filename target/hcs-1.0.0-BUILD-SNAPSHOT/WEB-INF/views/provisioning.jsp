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

	<title>Data Centers</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/reserveLab.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/lablist.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/labs.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/connection.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/edit_connection.css"/>"/>
	

	
	<script src="<c:url value='/resources/js/metro/jquery.multi-open-accordion-1.5.3.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery-ui-1.10.3.custom.peppergrinder.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.dataTables.js'/>"></script>

	<style type="text/css">
	
	.edit_connection_table tr{ 
			outline:0px!important;
		}
		.edit_connection_table tr td{ 
			width:70px! important;
		}
		.editconnection {
			height: 230px !important;
		} 
		.editconnection{
		background-image: none !important;
		}		
		
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
			width: 990px !important;
		}
		
		.displayVirtualLab .scrollArea {
		 	height: 540px !important;
		}
		
		.displayVirtualLab .scrollArea table{
			width: 990px !important;	
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
	});
	 
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	
	<%@include file="header.jsp" %>
	
	<div id="content" style="margin-top: 20px;">
		<div style="height:40px;">
		  <div class="connectionHeader" style="padding-left: 15px !important;">
		  	Data Centers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </div>
		   
		  <div style="width: 80%; float: left;">
		  	<a data-target="#provisioning_intro_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="add_Data_Center_icon">
		  	</a>
		  </div>
		   
	  	</div>
	  	 <%@include file="provisioningList.jsp" %>
	</div>
	
	<div class="modal fade" id="provisioning_intro_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height:420px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			  <%@include file="createDataCenter.jsp" %>
			</div>
		  </div>
		</div>
	</div>

	<div class="modal fade" id="provisioning_edit_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height: 420px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			 	 <%@include file="editDataCenter.jsp" %>
			</div>
		  </div>
	     
  		</div>
  </div>
  
  <div class="modal fade" id="provisioning_view_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height:420px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			 	 <%@include file="viewDataCenter.jsp" %>
			</div>
		  </div>
  	</div>
  </div>
	
	
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>