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

	<title>Admin</title>

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
	
	
	
	$(document).ready(function(){
		
			
		
	}); 
	</script>
</head>

<body class="baseContainer" id="customers">
  <div id="wrapper">
	
	<%@include file="header.jsp" %>
	
	<div id="content" style="margin-top: 20px;">
		<div class="editconnection">
	<c:if test="${userRole=='ROLE_ADMIN'}">
	<form id="add_customer_form">
		<h3 class="edit_title">Reset Project</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			
			<tr>
				<td>
					<p>Customer<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="customer" class="testplan_select" onchange="onCustomerChange()">
						<option value="--select--">--select--</option>
						<c:forEach var="customer" items="${customerList}">
						<option value="${customer.id}">${customer.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Site<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="site" class="testplan_select" onchange="onSiteChange()">
						<option value="--select--">--select--</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Project<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="project" class="testplan_select" onchange="onProjectChange()">
						<option value="--select--">--select--</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>Run<text style="color:red">*</text></p>
				</td>
				<td>
					<select id="run" class="testplan_select" >
						<option value="--select--">--select--</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<a onclick="resetProject()" style="font-size: 18px; font-weight: 600; color: #ff0000; cursor: pointer;">RESET</a>
				</td>
			</tr>				
		</table>
	</form>
	</c:if>
</div>	
	
	</div>
	<script type="text/javascript">
	
	function onCustomerChange(){
		var customerId = $('#customer').val();
		var data = 	'customerId='+ encodeURIComponent($.trim(customerId));
		$.ajax({
			url : "site/listByCustomer",
			data : data,
			type : "POST",
	
			success : function(result) {
				$("#site").empty();
				$("#site").append("<option value=\"--select--\">--select--</option>");
				$("#site").append(result);
			}
		});
	}
	
	function onSiteChange(){
		var siteId = $('#site').val();
		var data = 	'siteId='+ encodeURIComponent($.trim(siteId));
		$.ajax({
			url : "getProjectList",
			data : data,
			type : "GET",
	
			success : function(result) {
				$("#project").empty();
				$("#project").append("<option value=\"--select--\">--select--</option>");
				$("#project").append(result);
			}
		});
	}
	
	function onProjectChange(){
		var projectId = $('#project').val();
		var data = 	'projectId='+ encodeURIComponent($.trim(projectId));
		$.ajax({
			url : "getRunInstanceList",
			data : data,
			type : "GET",
	
			success : function(result) {
				$("#run").empty();
				$("#run").append("<option value=\"--select--\">--select--</option>");
				$("#run").append(result);
			}
		});
	}
	
	function resetProject(){
		var runId = $('#run').val();
		var data = 	'runId='+ encodeURIComponent($.trim(runId));
		$.ajax({
			url : "resetProject",
			data : data,
			type : "POST",
	
			success : function(result) {
				if(result=="success"){
					bootbox.alert("Project Updated...!",function(){window.location = "admin";
					}).find("div.modal-content").addClass("modalsuccess");
				}else{
					bootbox.alert(result).find("div.modal-content").addClass("modalfailure");
				}
			}
		});
	}
	
	</script>
	
	
	
	<div id="footer">| <a target="_blank" style="cursor:pointer" onclick="javascript:var w = window.open('./privacy-policy', 'Print preview : Privacy Policy', 'width=760,height=690,scrollbars=yes,top=0,left=0');w.focus();">PRIVACY POLICY, YOUR PRIVACY RIGHTS</a></div>
      
  </div>

</body>
</html>