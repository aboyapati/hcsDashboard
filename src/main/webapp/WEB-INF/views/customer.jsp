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

	<title>Customer</title>

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
	
	
	function provierFilterChange(){
		//var customerId = $("#customerId").val();
		var providerId = $("#filter_provider").val();
		var data = "pId="+encodeURIComponent($.trim(providerId));
		//alert(data);
		if (providerId.trim()!="" ) {
			
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
			
			window.location = "customer?"+data;
		}
	}
	
	$(document).ready(function(){
		var providerId = $("#customer_providerId").val();
		//var siteId = $("#siteId").val();
		var data = "providerId="+encodeURIComponent($.trim(providerId));
		//alert(data);
		if (${userRole=='ROLE_ADMIN'}) {
			$.ajax({
				url : "customer/providerList",
				data : data,
				type : "POST",

				success : function(result) {
					$("#filter_provider").empty();
					$("#filter_provider").append("<option value=\"All\">All</option>");
					$("#filter_provider").append(result);
					 $("#filter_provider").val($.trim(providerId==""?"All":providerId)); 
					 $("#add_customerProvider").empty();
					$("#add_customerProvider").append("<option value=\"--select--\">--select--</option>");
					$("#add_customerProvider").append(result);
					 $("#edit_customerProvider").empty();
					$("#edit_customerProvider").append("<option value=\"--select--\">--select--</option>");
					$("#edit_customerProvider").append(result); 
				}
			});
		}
		
	}); 
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	
	<%@include file="header.jsp" %>
	
	<div id="content" style="margin-top: 20px;">
	
	<%--  <div class="project_pane" >
			
			<c:choose>
						<c:when test="${userRole=='ROLE_ADMIN'}">
					<div class="editconnection" style="height: 0px !important; margin-top: 2px; margin-bottom: 10px; margin-left: 579px; width: 65px;">
					<table >
			  		<tbody>
						<tr>
						 <td class="table_header">Provider </td>
					  <td>
						<select id="filter_provider" class="testplan_select" onchange="provierFilterChange()">
										<option value="All">All</option>
									</select> 
						<input type="hidden" id="customer_providerId" value="${providerId}" />
					  </td>
				  	</tr>			
			 	 	</tbody>	
					</table>
					</div>
						</c:when>
						<c:otherwise>
							<table style="float: right;">
			  <tbody>
				<tr>
					 <td class="table_header">Provider </td>
					  <td>
						<div class="project_name">
							<p>${providerName}</p>
						</div>
						<input type="hidden" id="customer_providerId" value="${providerId}" />
					  </td>
				  </tr>			
			  </tbody>	
			</table>
						</c:otherwise>
					</c:choose>
		  </div> --%>
		<div style="height:40px;">
		  <div class="connectionHeader" style="padding-left: 15px !important;">
		  	Customers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  </div>
		  <!--   Ticket: 533
			Desc: Not able to create the customer using provider user credentials.
			Fix: Hide the create customer button when login the normal user.
			Author: Bala -->
		  <c:if test="${userRole!='ROLE_CUSTOMER_USER' && userRole!='ROLE_CUSTOMER_ADMIN' && userRole!='ROLE_PROVIDER_USER' && userRole!='ROLE_RESELLER_USER'}">	
		  <div style="width: 80%; float: left;">
			
		  	<!-- <a href="addconnection" data-target="#add_connection_modal" data-toggle="modal" class="add_connection" data-backdrop="static" data-keyboard="false"> -->
		  	<a data-target="#createCustomer_intro_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="add_Customer_icon">
		  	</a>
		  	
		  </div>
		  </c:if>
	  	</div>
	  	<!--   <ul class="table_tabs" style="margin-left: -7px; margin-top: 14px;">		
				<li class="table_tab_selected">
					<a style="text-decoration: none;font-weight: normal;color:#203c66" class="table_tab_data" href="customer">
			  			<b>Customers</b>
					</a>
				</li>
				
		  </ul> -->
		 <!--  <div class="outline_border outline_border_oneTab" style=" margin-top:-1px;"> -->
		  		<c:if test="${userRole=='ROLE_ADMIN'}">
		    		<div class="editconnection" style="height: 40px !important; margin-top: 2px; margin-left: -15px; width: 65px; float:left; ">
						<table>
					  		<tbody>
								<tr>
									<td>
										<input type="hidden" id="customer_providerId" name="customer_providerId" value="${providerId}"/>
										<select id="filter_provider" class="testplan_select" onchange="provierFilterChange()">
											<option value="All">All</option>
											<c:forEach var="provider" items="${providerList}">
												<option value="${provider.id}">${provider.name}</option>
											</c:forEach>
										</select>
							  		</td>
					  			</tr>			
				 	 		</tbody>	
						</table>
					</div>
				</c:if>
	    		<c:if test="${userRole!='ROLE_CUSTOMER_USER' && userRole!='ROLE_CUSTOMER_ADMIN' && userRole!='ROLE_PROVIDER_USER' && userRole!='ROLE_RESELLER_USER'}">
	    				<ul class="inter_createButton">
<!-- 					 		 <a data-target="#createCustomer_intro_modal" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="add_Customer_icon"><li class="add_Customer_icon"></li></a> -->
				 		</ul>			
			  	</c:if>
				<%@include file="customerList.jsp" %>
		  <!-- </div> -->
	</div>
	
	<div class="modal fade" id="createCustomer_intro_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height:510px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			  <%@include file="createCustomer.jsp" %>
			</div>
		  </div>
		</div>
	</div>

	<div class="modal fade" id="customer_edit_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height: 510px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			 	 <%@include file="editCustomer.jsp" %>
			</div>
		  </div>
	     
  		</div>
  </div>
  
  <div class="modal fade" id="customer_view_modal" role="dialog">
	  <div class="modal-dialog" style="margin-top: 160px;position:relative;width: 489px;height:510px;margin-bottom: 0px;">
	 	<!-- Modal content-->
	 	  <div class="modal-content" style="height: inherit;">
			<div class="modal-body" style="padding:0px;">
			 	 <%@include file="viewCustomer.jsp" %>
			</div>
		  </div>
  	</div>
  </div>
	
	
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>