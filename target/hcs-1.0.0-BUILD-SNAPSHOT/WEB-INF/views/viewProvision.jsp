<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>View Provisioning</title>
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
	
	<form id="view_provisioning_form">
		<h3 class="edit_title">View Provisioning</h3>
	
		<table class="edit_connection_table">
			<col width="300px">
			<col width="400px">
			 
			<tr>
				<td>
					<p>Name</p>
				</td>
				<td>
					<input type="text" id="view_provisingName" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>
					<p>Country</p>
				</td>
				<td>
					<select id="view_country"  class="nonEditable" disabled="disabled">
						<option value="--select--">--select--</option>
						<%@include file="countries.jsp" %>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<p>State</p>
				</td>
				<td>
					<input type="text" id="view_state" class="nonEditable" disabled="disabled">
				</td>
			</tr>

			<tr>
				<td>
					<p>City</p>
				</td>
				<td>
					<input type="text" id="view_city" class="nonEditable" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>
					<p>TimeZone</p>
				</td>
				<td>
					<select id="view_siteTimeZone"  class="nonEditable" disabled="disabled">
						<option value="--select--">--select--</option>
						<c:forEach var="timeZone" items="${timeZoneList}">
							<option value="${timeZone.id}">${timeZone.name} - ${timeZone.description}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			 	  <!-- Ticket: 373 -->
		 		  <!-- Desc: Need to remove customer number text box from View Customer pop up -->
		 		  <!-- Fix: Removed the row of Customer number from the form -->
		 		  <!-- Author: Kaushik -->
			
			<tr>
				<td>
				</td>	
				<td class="editconnection_buttons">
					<button style="background-color: transparent;border: 0px" type="reset" class="view_cancel_button" data-dismiss="modal"></button>
				</td>
			</tr>				
		</table>
	</form>
</div>	
</body>
<script>
$(document).ready(function(){
	
	$(".project_view").click(function(){
		
		var tr = $(this).closest('tr');
		var name = tr.find('td').eq(1).text();
		var country = tr.find('td').eq(2).text();
		var state = tr.find('td').eq(3).text();
		var city = tr.find('td').eq(4).text();
		var timezone = tr.find('td').eq(5).text();
	  
		$("#view_provisingName").val($.trim(name));
		$("#view_country").val($.trim(country));
		$("#view_state").val($.trim(state));
		$("#view_city").val($.trim(city));
		$("#view_siteTimeZone").val($.trim(timezone));
		 
	});
	
	$(".view_cancel_button").click(function(){
	$('#view_provisioning_form').trigger("reset");
	});
});
</script>
</html>