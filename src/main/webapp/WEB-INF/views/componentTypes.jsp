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

	<title>Component Types</title>

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
		.dataCenterName_display{
			display:block;
			width:500px; 
			max-width:500px;
			padding-left:5px;
			overflow: hidden; 
			text-overflow: ellipsis;
			white-space: nowrap;
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
	
<div id="content" style="margin-top: 10px;">
		<%-- <div class="customerName">${customerName}</div> --%>
		<div class="customerName dataCenterName_display">${dataCenterName}</div>
		<br/>
		<input type="hidden" id="component_dataCenterId" value="${dataCenterId}" />   
		<ul class="table_tabs" style="margin-left: -7px; margin-top: 10px;">		
				<li class="table_tab_unselected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66" class="spinWheel table_tab_data" href="component?dataCenterId=${dataCenterId}">
			  			<b>Components</b>
			  		</a>
				</li>
				<li class="table_tab_selected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66"class="spinWheel table_tab_data" href="componentType?dataCenterId=${dataCenterId}">
						<b>Component Types</b>
					</a>
				</li>
				 
			 
		  </ul>
							
		  <div class="outline_border outline_border_twoTabs" style=" margin-top:-5px; height: 670px;">
			  		<ul class="inter_createButton">
				 		 <a data-target="#createComponet_intro_modal" data-toggle="modal" data-keyboard="false"><li class="add_componentType_icon"></li></a>
			 		</ul>			
				<%@include file="componentTypesList.jsp" %>
		  </div>
	
	</div>
	
	 <div class="modal fade" id="createComponet_intro_modal" role="dialog">
	  <div class="modal-dialog" id="createComponent_intro" style="margin-top: 160px;position:relative;width: 490px;height:315px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			  <%@include file="createComponentType.jsp" %>
			</div>
		  </div>
		</div>
	</div>

	 <div class="modal fade" id="componentType_edit_modal" role="dialog">
	  <div class="modal-dialog" id="editComponent_intro" style="margin-top: 160px;position:relative;width: 490px;height: 315px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			 	 <%@include file="editComponentType.jsp" %>
			</div>
		  </div>
 	 </div>
  </div>   
  
    <div class="modal fade" id="componentType_view_modal" role="dialog">
	  <div class="modal-dialog" id="viewComponent_intro" style="margin-top: 160px;position:relative;width: 490px;height:315px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			 	 <%@include file="viewComponentType.jsp" %>
			</div>
		  </div>
	     
  	</div>
  </div> 
		
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>