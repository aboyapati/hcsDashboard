<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@include file="link.jsp" %>

	<title>Parser</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/reserveLab.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/lablist.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/labs.css"/>"/>
	
	<link rel="stylesheet" href="<c:url value="/resources/css/edit_connection.css"/>"/>
	
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
			height: 460px !important;
		}
		
		.displayVirtualLab .scrollArea {
		 	height: 400px !important;
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
		
		.editconnection {
			border: 1px solid #B1B0B0; 
			border-bottom-left-radius: 5px; 
			border-bottom-right-radius: 5px; 
			border-top-left-radius: 5px; 
			height: 140px; 
			border-top-right-radius: 5px; 
			background: none; 
			width:710px; 
			margin-left: 115px;
		}
		
		.blockOverlay{
			opacity : 0.6 !important;
		}
		
						
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$('.add_save_button').click(function () {
			
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
	
	<div id="content" style="margin-top: 33px; ">

		  <ul class="table_tabs" style="margin-left: -7px; margin-top: 14px;">		
				<li class="table_tab_selected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66" class="table_tab_data" href="uploadProvisioningData">
			  			<b>Parser</b>
					</a>
				</li>
				<li class="table_tab_unselected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66" class="table_tab_data" href="document">
			  			<b>Documents</b>
					</a>
				</li>
		  </ul>
		  
		  
		 <div class="outline_border outline_border_twoTabs" style=" margin-top:-1px;padding-top: 30px">
    			
	    		<c:if test="${userRole == 'ROLE_ADMIN'}">
			  		
			  		<div class="editconnection" style="border: 1px solid #B1B0B0; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; border-top-left-radius: 5px; height: 140px; border-top-right-radius: 5px; background: none; width:710px; margin-left: 115px; background: none;">
			  		  <form id="fileUploader_form" name="fileUploader_form" action="uploadProvisioningData" method="post" enctype="multipart/form-data" >
							<table class="edit_connection_table" >
								<col width="500px">
								<col width="100px">
								<tr>
									<td>
										<p style="font-size: 16px;">Provisioning Data</p>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="file" name="upload_provisionFile" id="upload_provisionFile"  style="font-size: 16px; width: 500px;"/>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<c:if test="${not empty status}">
											<h5 style="color: #ff0000">${status}</h5>
										</c:if>
									</td>
									<td class="editconnection_buttons">
										<button style="background-color: transparent; float:right; margin-right: 10px; border: 0px" type="submit" class="add_save_button"></button>
									</td>
								</tr>
							</table>
						</form>
					 </div>
			  	</c:if>
			  	<c:if test="${not empty status}">
			  		<c:if test="${not empty response}">
					 	<ul class="inter_createButton">
						 		 <a href="saveErrorMessage" ><li class="download_Report"></li></a>
					 	</ul>
				 	</c:if>
					<%@include file="errorMessages.jsp" %>
				</c:if>
		 </div>
	</div>
	
  <div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
 </div>

</body>
</html>