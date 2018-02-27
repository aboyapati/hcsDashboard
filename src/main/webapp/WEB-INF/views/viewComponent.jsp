<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>View Component</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/edit_connection.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>"/>
	<style>
		.edit_connection_table tr{ 
			outline:0px!important;
		}
		.editconnection {
			height: 293px !important;
		} 
	</style>

</head>
<body>
<div class="editconnection">
	<input type="hidden" id="component_dataCenterId" value="${dataCenterId}" />   
	<form id="view_component_form" style="color: #7694b7">
		<h3 class="edit_title">View Component</h3>
	
		<table class="view_connection_table">
			<col width="300px">
			<col width="400px">

			<tr>
				<td>
					<p>Name</p>
				</td>
				<td>
					<input type="hidden" id="view_componentId" class="projectName" maxlength="100">
					<input type="text" id="view_componentName"   class="nonEditable" disabled="disabled">
					
				</td>
			</tr>
			<tr>
				<td>
					<p>Type</p>
				</td>
				<td>
					<select id="view_componentType" class="nonEditable" disabled="disabled">
						<option value="--select--">--select--</option>
						<c:forEach var="componenttype" items="${componentTypesList}">
							<option value="${componenttype.id}">${componenttype.componentType}</option>
						</c:forEach>
					</select>	
				</td>
			</tr>
			<tr>
				<td>
					<p>Version</p>
				</td>
				<td>
					<select id="view_componentTypeVersion" class="nonEditable" disabled="disabled">
						<option value="--select--">--select--</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td>
					<p>IP</p>
				</td>
				<td>
					<input type="text" id="view_componentIPAddress" class="nonEditable" disabled="disabled" maxlength="100">
				</td>
			</tr>
			 <tr>
				<td>
					<p>User Name</p>
				</td>
				<td>
					<input type="text" id="view_componentUserName" class="nonEditable" disabled="disabled" maxlength="100">
				</td>
			</tr>
			 <tr>
				<td>
					<p>Password</p>
				</td>
				<td>
					<input type="text" id="view_componentPassword" class="nonEditable" disabled="disabled" maxlength="100">
				</td>
			</tr>
			 
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px; width: 80px;height: 35px;" type="reset" class="edit_cancel_button" data-dismiss="modal"></button>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$(".component_view").click(function(){
		var tr = $(this).closest('tr');
		var id= tr.find('td').eq(0).text();
		var name = tr.find('td').eq(1).text();
		var type = tr.find('td').eq(2).text();
		var dataCenterId = tr.find('td').eq(4).text();
		var version = tr.find('td').eq(5).text();
		 
		var ipAddress = tr.find('td').eq(6).text();
		var userName = tr.find('td').eq(7).text();
		var password = tr.find('td').eq(8).text();
		
		$("#view_componentId").val($.trim(id));
		$("#view_componentName").val($.trim(name));
		/* $("#view_componentType").val($.trim(type)); */
		$("#view_componentType").html("<option value='"+$.trim(type)+"'>"+$.trim(type)+"</option>");
		$("#component_dataCenterId").val($.trim(dataCenterId));
		$("#view_componentTypeVersion").html("<option value='"+$.trim(version)+"'>"+$.trim(version)+"</option>");
		$("#view_componentIPAddress").val($.trim(ipAddress));
		$("#view_componentUserName").val($.trim(userName));
		$("#view_componentPassword").val($.trim(password));
		 
		
	}); 
	
	$(".view_cancel_button").click(function(){
		$('#view_component_form').trigger("reset");
	});
	
	 
});

 
</script>
</html>